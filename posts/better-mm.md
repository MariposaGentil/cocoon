% A Better Google Music Manager
%
% 2017-04-20

## Background

> This post delves into a simple project, but one that I wanted to write about because I explored multiple thought processes, all of which were learning experiences. It was also a good excuse to break in the blog.

I like my music. I like to listen to it everywhere, not just at home where it resides on hard drives. We all know the cloud-based ways of getting around this by now, but in 2011, Google shined a little brighter than the rest with the launch of its music _hosting_ service, Google Play Music. Anyone with a Google account can upload up to 50,000 tracks for free to be streamed to any device. The tracks are hosted as 320 kbps MP3s which is more than enough quality for mobile streaming.

The bit rate is surprising, though, given the better storage value of variable bit rate (VBR) over the constant bit rate (CBR) Google opted into[^1]. I like to think Google has their reasons, but the theme of this post is me disagreeing with some of their reasons (more ranting on codecs [at the end](#more-ranting-on-codecs)), namely for the behavior of [Google Play Music Manager](https://play.google.com/music/listen?u=0#/manager) (GPMM). GPMM is a watchdog utility that silently runs in the background of your computer, watching your music folders for new songs to automatically upload to your Google Play library.

[^1]: "CBR encoding is not efficient. VBR...can supply more bits to complex music passages and save bits on simpler ones, CBR encodes every frame at the same bitrate." - [Hydrogenaudio](http://wiki.hydrogenaud.io/index.php?title=LAME#CBR_.28constant_bitrate.29_settings)

To use it, all the user has to do is specify a music directory to sync to their Google account. This solution worked for a good while until I updated from Windows 7 to 10. Nothing about the hard drive I had music on changed, but GPMM begged to differ. It flipped a switch and told me it was about to reupload thousands of tracks. Great. I initially thought GPMM would notice the false positives, realize its mistake, and move on. This was not the case. Duplicates were being beamed up to the cloud quickly which was going to put the 50,000 song limit to the test. That was the last time I had used the utility. There had to be a better, less-decoupled way to upload the tracks in my library.

- Solutions included:
    - Drag n' drop song files into Google Play Music web interface (not autonomous enough)
    - Spotify subscription (great service, but wanted to try to stay in the $0 fun zone)
    - Sync music to phone (fast access, but storage space limitations)
    - __Create a new option__

## First Attempt

As with any first draft, the attempt was crude and inefficient. My plan was to create a local, working index of files that had been uploaded; a ledger of sorts. This index would be compared to the index Google had (that I would get with an API mentioned later) and would upload any new music in my index that wasn't in Google's, much like a set difference. Sounds simple enough, however, I was trying to create the index with song tags, not file paths. This caused problems when trying to avoid multiple releases for the same album (gotta have that remaster). I tried to use fuzzy matching rules on track names to prevent true positives from going undetected because of minor tag/metadata discrepancies between my tags and Google's. These rules proved to be too fragile and led to some control flow [triangles of death](/assets/images/callback_hell.gif) that I won't get into. Suffice it to say I was not happy with this solution and with school competing for time, I had to drop the project for a little while. Fast-forward several months, I found [dirtools](https://github.com/tsileo/dirtools), which does awesome directory state comparisons with those absolute file paths. I think had I not found a different solution, this would have sufficed.

## Second Attempt

Another method that eventually came up was to hash the files to create fingerprints. The sonic signature is _the_ definitive and most accurate metadata a track can have. Even with multiple releases from the same album, remasterings and reissues wouldn't conflict. The approach would involve using a non-cryptographic hash such as MD5. The program would build a list of hashes from the track files, compare the hashes to the previous session's hashes, and then upload the difference.

To combat coupling issues, the hashes would need to be standalone as a list, not tied to an impermanent file path as a dictionary/map. The hashing list would need to be rerun every session since a predetermined key that would help reduce searching, like a file path, would be absent. This was a short-lived idea because of the sheer processing time needed. Running a test on 700 lossless files took over 90 seconds and the hash performed at 460 MB/s at best[^2]. Take that and apply it to thousands of tracks and do that every time an update needs to happen...I'll stop there. 

[^2]: Average case: 152 MB/s, worst: 33 MB/s. Eesh.

The idea of perfect identification sounded nice, but not the cost. Note that there are [faster](https://github.com/Cyan4973/xxHash) non-cryptographic hashing algorithms than MD5 and I technically don't have to hash the _whole_ file, but the speed of what came next was hard to beat.

## Third Attempt

The concept of an anchor was one I kept coming back to: something to drastically reduce file searching upon each upload session based on the records of previous sessions. In the first attempt, it was the tag index and directory state comparison. However, people change their library organization around and file paths can change, meaning choosing paths as a unique key was risky. Making sure different releases of the same album did not conflict induced some headaches as well. But an anchor was still needed to reduce the search area, otherwise, we'd be sitting here all day searching.

Then it dawned on me to use the file modification time as the anchor. In my music player, I essentially live in the "Recently Added" playlist, which inspired the idea since it depends on file modification times. For someone who just needed more recent music uploaded, this file property could help me get there.

- Basically, all I had to look for were files in a given directory which:
    - were downloaded after a certain point
    - were music files

It turns out that Git does [something similar](https://www.kernel.org/pub/software/scm/git/docs/technical/racy-git.txt) with the `lstat()` syscall to get the status of files and the symlinks of files:

> In order to speed up this comparison between the files in the
working tree and the index entries, the index entries record the
information obtained from the filesystem via `lstat(2)` system
call when they were last updated.  When checking if they differ,
Git first runs `lstat(2)` on the files and compares the result
with this information (...). If some of these "cached
stat information" fields do not match, Git can tell that the
files are modified without even looking at their contents.
- [Use of index and Racy Git problem](https://github.com/git/git/blob/master/Documentation/technical/racy-git.txt#L23)

This would align with my laborious experience with hashing. The file contents and their size are too variable which don't act as a consistently good anchor. File metadata is easier to handle and more predictable in its size, which helps with the time complexity.

## Implementation

Luckily in Python, there is a function, [getctime()](https://docs.python.org/3/library/os.path.html#os.path.getctime), in the built-in `os.path` module that allows me to extract the file creation (read as 'date downloaded') time. File modification time is what came to mind originally, but every time a track's tags are changed, the file gets modified. I only care about basic tags (album artist, album) when browsing the Google Play Music app, so as long as those tags are there upon upload, I'm done with it, regardless of local tag changes. Because of this, creation time sounded like a more grounded data point.

By using the [gmusicapi](https://github.com/simon-weber/gmusicapi) library, which did the heavy-lifting for the Google Music API, the MVP of the project was completed. The user would specify a starting point--a date which the program would use as an anchor to find newer files--and then upload. Upon finishing, the program would reset the start time for the next upload session to the current date and time. That way, the next session could just pick up where the last one left off. I introduced a config so users could customize these start and end points to override the normal autonomous behavior.

Main logic:

```py
import os
from Typing import List

start = 1492646400.0  # 2017/04/20
end = None

def check_date(filepath: str) -> bool:

    if start and end:
        # Upload everything between start and end dates
        # If no dates were specified in setup, upload everything
        # Range: [start, end)
        return start <= os.path.getctime(filepath) < end
    else:
        if start and not end:
            # Upload everything starting from start date
            # Range: [start, inf)
            return start <= os.path.getctime(filepath)
        elif end and not start:
            # Upload everything until end date
            # Range: (inf, end)
            return os.path.getctime(filepath) < end


def get_new_files(filepath: str, exts: tuple, files: List[str] = []) -> List[str]:

    with os.scandir(filepath) as itr:
        for entry in itr:
            if entry.is_dir():
                get_new_files(os.path.join(filepath, entry.name), exts, files)
            elif entry.name.endswith(exts) and check_date(entry.path):
                    files.append(entry.path)
    return files
```

## Further Tinkering

After the MVP was completed, I wondered if I could optimize the runtime even further. Upon running the script with no new files, the search takes 20 seconds to traverse my music directory on a spinning hard drive. 20 seconds is pretty good considering it's doing a depth-first search straight for the actual tracks, but what about a breath-first search?

I have my library organized alphabetically into lettered folders so that _The Beatles_ are under the `B/` directory. I reasoned that if files were added for The Beatles, then the `B/` folder would update its modification date and I could search through the 26 folders for any updates first instead of doing a full dive for the music files. If only a few letter folders were changed, that could decrease the searching time immensely, or so I hoped.

Turns out that NTFS file system _does_ support this and I've seen it work for moving and copying files/directories into directories, however, the results were hit or miss. Sometimes the letter folder date would update its modification time, other times it wouldn't. I wouldn't want to do a rewrite/optimization based on that kind of uncertainty. It also seems [I'm not the only one](https://stackoverflow.com/questions/1025187/rules-for-date-modified-of-folders-in-windows-explorer) seeing the iffy behavior.

Oh well, it was a nice idea. One could, in practice, force update the modification dates recursively, but that's just depth-first search again. Boo.

## Closing Notes

Now I won't deny that there are assumptions (and therefore some faults) in the functionality of this approach. The `getctime()` method works based off when users copy/move folders. If someone were to move their entire library, the modification date would suddenly become set to that day and become inaccurate for the purposes of this program. However, if this were to happen, one should wait at least one day before downloading again and make sure to run the script in verbose mode to skip the migration day.

Linux and OSX, at the time of writing this, have not been supported in the functionality. OSX is possible, Linux [not so much](https://stackoverflow.com/questions/1408272/get-file-creation-time-with-python-on-linux). 

This project has been fun and the gmusicapi has been a huge help. I do wish the breadth-first approach would have worked, but I'm just glad it's semi-snappy. In any case, you can find the code on [my Github](https://github.com/cofinley/BetterMM).

### More Ranting on Codecs

Choosing a superior codec better suited for streaming such as [Vorbis](http://www.vorbis.com/faq/#what) or its successor, [Opus](https://wiki.xiph.org/OpusFAQ#What_is_Opus.3F_Who_created_it.3F), could cut their bandwidth and storage costs by two-thirds[^3]. Even using VBR over CBR with MP3 would still mean large savings while keeping the same codec. Google is not one to hold onto sacred cows, which makes me think they are sticking with their inefficient technology because the hosting arm of Google Play Music is largely unmaintained.

[^3]: 96 kbps has been [regarded](http://listening-test.coresv.net/results.htm) as Opus' sweet spot that reaches transparency when compared to original lossless music files.