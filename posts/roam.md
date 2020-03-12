% Roam, and the Declining Value of SaaS 
%
% 2020-03-07

# Background

If you've had your ear to the ground in the software world lately, you may have seen a surge of articles surrounding productivity software. You might have also heard of Roam, which has been growing in popularity due to its purported ability to connect the dots in your brain via non-linear editing. We'll be looking at Roam and how it's positioning itself in the SaaS world, how one might model the value of a SaaS, and why Roam might be more hype than anything.

Roam is a SaaS productivity tool which allows a user to:

- Create and edit pages of text
- Create two-way references between pages using wiki-style links
    - Creates a page if one doesn't exist already when you link it
- View pages side-by-side for quick reference
- View page links in a graph
- Filter/search through pages

The service is free for now, but seems to have the following plans in mind:

$15/month

[![Pricing](/assets/images/roam/pricing.png)](https://twitter.com/Conaw/status/1233856451547824129)

$10K/life

[![Pricing](/assets/images/roam/lifetime.png)](https://twitter.com/Conaw/status/1214855473876201472)

. . . .

[![Pricing](/assets/images/roam/rationale.png)](https://twitter.com/Conaw/status/1218781020343783424)

This just seems like trolling at this point. Rationale for $10K: "it's like nothing else; we give away source code; who else does that?" Open-source software (OSS) does that.

The service is currently free, but the pricing plans are looking probable in the near future. Therefore, there is time for Roam to grow and provide more value, but the claim above seems to justify cost based on what Roam is currently offering, not necessarily its future plans.

This is a problematic trend of SaaS in which there is a large gap between value and price, especially when there is a sea of software developers who can compete with off-the-GitHub parts and some cloud savvy. In the next section, we'll take a look at how one might justify price with this reality in mind.

# Abstract and Concrete Value

Value is subjective and hard to quantify for software, but lets try. When I look at software, I look at two things: concrete value and abstract value.

**Concrete value**: the material; what a widget actually is on its own and what it's made of (includes code, data, assets, magic). I.e. what I interact with as a user.

**Abstract value**: the immaterial; the idea; the innovative potential; the character; the market share. The parts surrounding a widget that can't be recreated as easily as the concrete value.

## Examples

*High abstract value*: Steve Jobs and the iPhone. Google/Android easily copied the smartphone model, but Steve and Apple continued to innovate and surpass expectations while Android only reacted to the latest features.

*High abstract value but low concrete value*: Slack and Snapchat. Both companies have had ridiculously high valuations due to high abstract value (i.e. market share in this case, with some novel ideas) and both have been copied due to low concrete value. That being said, abstract value is hard to replicate and generally carries a business in lieu of concrete value. Snapchat happened to be copied by Facebook/Instagram who had higher abstract value with *their* market share and nearly took Snapchat out of the race.

If you see a popular widget and say, "well I could have done that," then that was a widget with little concrete value that capitalized on its abstract value to enter the market.

Abstract value garners loving (or trapped) users/customers, concrete value secures the product in the market. I've tried to illustrate this dichotomy in a matrix below:

![](/assets/images/roam/matrix-cross-section.png)

Seen in the graph, you can start to characterize the quadrants. Obviously having both abstract and concrete value is ideal as it will secure your footing in the market. This is due to the abstract value of consistent innovation and the concrete value of a difficult-to-reproduce-overnight product. 

Now lets try some examples:

![](/assets/images/roam/matrix-examples.png)

The placement of products isn't perfect, and the inclusion of the iPhone and Android phone throws the scale off, but hopefully you get the point.

Photoshop has had a strong hold on the market for some time while also being a software behemoth that isn't exactly a dorm room project. Duolingo is in the same quadrant (despite one's opinion on its efficacy) since its breadth and depth of supported languages give it more concrete value a major head start over competitors.

Seen along the outer edges of the graph are gray areas which illustrate the extremes. These extremes constitute rare or non-existent combinations of value that don't look like ordinary products:

||0% Concrete|100% Concrete|
|-|-|-|
|**0% Abstract**|No value for anyone|Lifelessly functional; bloated for no reason or business value|
|**100% Abstract**|Hype, hot air; will not last long|Rare mix that would dominate the market and never have any form of competition|

One can see that the bottom-left and top-right gray areas are smaller than the other two corners. The smaller corners are not as rare as the bigger corners; people create software with no value all the time by copying tutorials, and truly superior products that have cornered the market and have a strong lifeblood do exist.

## Price

All of this culminates into a price, shown below as a simple summation function of the two value axes:

![](/assets/images/roam/matrix-price.png)

Seen in the graph, if a product has high abstract value, but the concrete value is lacking, it would lie in the same color band as another product with reversed values. The price (theoretically) wouldn't vary wildly between the two products in the same color band. 

When there *is* a disparity in price between products in equivalent bands, demand might decrease for the more expensive product since other products in the same band provide the same value for less. In this case, the pricey product would try to improve its position and hope to jump to a new band by ramping up features and/or marketing. Clones which lack features can compete by intentionally staying at a lower price point/band, or justify similar pricing to incumbents by playing catch-up and adding features.

Now we can see where those aforementioned products fall on price:

![](/assets/images/roam/matrix-examples-with-price.png)

Looking where Roam falls on the grid, its value doesn't exactly match with other products which are also priced at or near \$15/month. 

The glaring factor in of all this is subjectivity. I am assuming Roam's concrete value from demoing it, poking it, [recreating parts of it](https://github.com/cofinley/free-roam), and comparing that to software with similar components:

-  textarea/div editor
    - some markdown-ish macros
- front-end design
- pages
- graph data structure
    - search/grep for text between unlinked nodes
- users
    - online collaboration
- and some 200K-line React boilerplate bloat to taste

I am assuming its abstract value when I see:

- what alternatives are already on the landscape (next section).
- if/how much this is differentiating itself.
- its innovative potential.
- its creator(s) and their mentality. 

Based on those factors, I don't see too much there.

By plotting over time, there is a downward trend of total value/justified price.

![](/assets/images/roam/price-over-time.png)

Again, one might argue that the scale is off with Photoshop included in the mix. It's in a different vertical (desktop software) vs. the others (web/mobile apps). That being said, the common denominator here is what I pay out of my wallet. I'm not going to pay \$20/month for Photoshop and then be okay with paying another \$20/month for a less impressive service/tool just because it's more impressive for its vertical. One might also say it's apples to oranges, but on a *technical* level, it's less so and comes down to dollars and cents.

# Alternatives

If I want to stream HD Netflix right now, it's [$13/month](https://www.digitaltrends.com/movies/netflix-cost-pricing-plan-breakdown/). Granted, Netflix is not a tool, but it does continually give fresh value, which makes sense for a subscription.

Photoshop *is* a tool and is only slightly more expensive than Roam's proposed pricing at $21/month.

Notion is a tool in the same productivity space as Roam and is $4/month for personal use. It's on the matrix above because its design and suite of widgets users can wield is impressive for the price and continues to innovate.

Dynalist, a precursor to Roam: freemium to [$8/month](https://dynalist.io/pricing).

[TiddlyWiki](https://tiddlywiki.com/), or, more specifically, [TiddlyBlink](https://giffmex.org/gifts/tiddlyblink.html), is essentially Roam:

- Pages
- Wiki links
    - Creates a page if one doesn't exist already when you link it
- Filter/search through pages
- Graph (with [TiddlyMap](http://tiddlymap.org/))
- Side-by-side mode (in TiddlyBlink)

...but also, it's:

- OSS
- Private/offline
    - Everything lives in a single HTML file
    - A long list of possible save strategies
    - People like the idea of a '[second brain](https://www.buildingasecondbrain.com/)' with Roam, but many others don't want their brain hosted elsewhere
- Feature-packed
- Well designed
- Endlessly customizable
    - Everything is a page and feels like metaprogramming; you edit the editor *using* the editor
- Mature
  - Doesn't break because of DB changes like another product we've been talking about...

The power of TiddlyWiki, and its community put it above the competition by a long shot, in my opinion. Its open-source nature fuels the fire and makes the software stronger, not weaker. I think, if you're going to make something which is a text editor at its core, you better be damn sure it's powerful enough to warrant charging. There are simply too many cats out of the bag with that type of technology.

# Benefits and Detriments of SaaS

I will grant that Roam's online-only, SaaS nature allows for easier remote collaboration. Though, after using wiki links personally, I could foresee congestion when more than one person starts trying to name things. Collaborators could easily run in circles when two people think of the same concept, but think of two different titles to refer to them by, even with autocomplete. With something like TiddlyWiki, which separates data from the application more cleanly, one could achieve synchronized collaboration by storing the wiki HTML file on something like Dropbox or Google Drive.

SaaS, in general, has other problems and has become somewhat of a runaway train lately. It seems like every software project nowadays gets a subscription pricing model slapped onto it. This helps keep one's income more consistent, but I keep seeing projects (especially tools) that would normally be one-off purchases get shoehorned into a SaaS. I have seen software developer advice blogs tell people to do whatever it takes to make the square peg fit in the SaaS hole. One could argue all you need to do is to take your idea, add a user/social component, host it on the cloud, and then you have all the ammo you need to justify charging $8/month/head.

# Conclusion

The idea of Roam is not terribly novel nor technically impressive at this time (low abstract and concrete value). That the creator is thinking it's the best thing since sliced bread and planning on charging accordingly in lieu of concrete value is insulting as a software developer. It's not the first time a company has profited from existing/free technology, nor will it be the last. I just don't want to wake up to a future of hyped, to-do list apps charging \$4.99/month.

Selling productivity is an offer that will catch attention because we are all looking to be better at working with our brain. Engineers might be even more susceptible due to their propensity to investigate and problem-solve. Some might argue this is an enduring business model since it benefits from the mystery of the mind, which we aren't close to cracking any time soon. I also think productivity software is best applied to actual work, not necessarily our daily lives which are less meaty. We are probably just throwing technology at a problem---a lack of productivity---that was caused by technology and its ability to distract us in the first place.

The creator might just be a troll or building hype by toeing the line on absurdity.  Heck, he coaxed a blog post out of my weekend, but this is a trend I've been seeing in the software world recently and Roam provided a good opportunity to write about what I've been mulling over. I also thoroughly enjoyed thinking about software in concrete and abstract terms. So overall, it was a weekend well spent.