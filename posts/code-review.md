% Code Reviews: A Layered Workflow
% 
% 2019-07-25

Code reviews can be draining for reviewers. The following is a method I use which I believe can decrease overall mental strain and increase efficiency and quality. 

This is layered/triaged approach; don't move on to the next step until the previous one is completed. This alone saves a lot of time and effort.


## 1. Preliminary Checks

Don't proceed until these pass:

- Failing build
- Merge conflicts

Bring to author's attention if excessive time (~30min) has lapsed without acknowledgement.

## 2. Understanding

Understand the requirements being fulfilled by a PR before diving in:

- Intent/purpose
- Steps to get to the end-goal
- Expected result
    - For bugs: what's also expected *not* to happen

These should be clear from the PR's description, comments, and/or relation to the ticket. If not, ask for clarification from the author.

## 3. Usability Test

Confirm if the PR achieves its goal, visually and functionally.

- It's not worth looking at the code yet if it doesn't work
    - This also defers the reviewer's mental strain until it's truly required

Usually reserved for PRs that introduce sufficient changes and/or risk. When in doubt, do it.

Steps:

1. Check out branch on local
1. Keep console open to check for errors
    - Toggle "Pause on Exceptions" in dev tools ([Firefox](/assets/images/code-review/firefox-pause.png), [Chrome](/assets/images/code-review/chrome-pause.png)) to prevent missing them
1. Confirm that a story/bug's requirements are fulfilled
1. Try to break it. If it breaks:
    1. Take screenshots/recordings first
	    - Just in case the bug disappears later
		- Also easier to show vs. tell in PRs comments
    1. Figure out steps to reproduce
           - Confirm/deny bug occurs on a fresh environment too, if possible
               - It's tempting to keep testing on the same env forever
1. Compare to a usability test on an older environment (e.g. QA, prod), if possible
	- Makes sure you understand what should/shouldn't happen
	- Useful for quick A/B testing

## 4. Code Review

Look at actual code/diff in PR.

This part is obvious and necessary, but it also ensures that a passing usability test was not a façade or built on a bad foundation. The underlying code should also pass tests of quality.


Tips:

- See the forest, not the trees; prioritize design over syntax in critiques
- Be constructive
- Opt for using 'we,' not 'you' or 'I'
	- Minimize ego, maximize value (for product, team, etc.)
- Dumb questions become a lot less dumb if you do a little research and exhaust your own resources first
	- You often answer your question while also learning something on your own

---

## Reasoning

Diving right into the *code* is natural for *code* reviews, but starts out the process at the deepest 'layer' of the above flow, with the highest mental strain.

Starting out at this layer can lead to **earlier fatigue** and **more work**.

### Early Fatigue

It's like exercising. You don't start with the heaviest weight or the fastest treadmill speed, that leads to quick exhaustion and/or injury.

Code reviews can be a workout, they exhaust time and mental energy.

When starting with the code (or the heaviest weight), we can bear it for a little while, but it decreases our energy and leads to exhaustion quicker.

![](/assets/images/code-review/Strength_Over_Time_-_Without_Warmup_Weights.png)

Compare this to 'warming up' with lighter weight which leads to a bigger reserve of energy that can be used for other tasks, thus improving overall throughput/efficiency.

![](/assets/images/code-review/Strength_Over_Time_-_With_Warmup_Weights.png)

### More Work

Starting out at the deepest layer (code review) can be a problem when issues still exist and need to be addressed at the other layers.

If the code checks out but then the other layers don't, the reviewer has to work backwards. This leads to:

- more waiting.
- repeating a large part of the review workflow for the same PR.
- more mental strain.

If *only* the code review step is completed, then the potential for bugs is higher and risks QA sending the ticket back which starts the whole process over for everyone.

If no problems:

![](/assets/images/code-review/Changes_-_Perfect_World.png)

If problems are addressed early on by following the workflow, then they have a smaller impact:

![](/assets/images/code-review/Changes_-_Early_Changes.png)

If problems are addressed later by starting at the bottom of the flow and working backwards, then they have a bigger impact:

![](/assets/images/code-review/Changes_-_Later_Changes.png)

Code review is deferred to the end in this workflow because **the code is often not final**. Any problem in the steps leading up to code review can and will require code changes. Reviewing code is less useful if is unfinished. The probability of code being finished grows much higher if the steps of the workflow are completed in-order.

## Conclusion

This is aimed at the reviewers, but there are definitely things that the PR author can do to help make the reviewer's life easier, though that's best saved for another post.

With this method, hopefully more total energy will be conserved. Code reviews are crucial for progress, but the way we approach them can grind that progress to a halt. By deferring the actual review of the code, we can address other, potentially major issues first, decrease mental stress, save time, and encourage more participation from our team.