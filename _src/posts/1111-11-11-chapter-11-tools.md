    Title: Chapter 11: A Work-Horse and its Tools
    Date: 2020-08-10T17:01:33
    Tags: Tools, Programming Language, Long Run, Long Term, Strategy, In The Large, Principles, Time Preference

When my friends and I discuss the technological choices that humans make,
we often call it "Yahoo Computing" between each other.
However, I am careful *never* to use that word in front of Ngnghm (whose name I pronounce "Ann")
by fear that she would readily view us as Yahoos indeed,
as we all yearn to qualify as Houyhnhnms in her eyes (which we pronounce "Hunams").
I have never heard Ann call any human "Yahoo", either,
not even when we describe the most irrational human behaviors;
but I strongly suspect that it might be out of politeness,
or to avoid triggering an adverse reaction if she told to our face how she really feels about humans.

One day we were discussing how
[a](https://www.pingdom.com/blog/10-historical-software-bugs-with-extreme-consequences/)
[lot](https://cve.mitre.org/)
of extremely
[costly](https://itsfoss.com/a-floating-point-error-that-caused-a-damage-worth-half-a-billion/)
mistakes,
[some](https://en.wikipedia.org/wiki/Therac-25)
of them [deadly](https://www.theverge.com/2019/5/2/18518176/boeing-737-max-crash-problems-human-error-mcas-faa),
were made in human computing. Ann was particularly interested in these failures.
She explained that failure patterns are often a great way to understand
underlying structures that are not otherwise directly observable.
What patterns were there in those failures?
What do they teach us about how humans make decisions?
She was interested as an anthropologist.
I was more interested as a practitioner:
if we can identify some defect in the way humans tend to make some decisions about computing,
some kind of myopia, then can we devise systematic ways to correct them?
Did Houyhnhnms have similar failings, and how did they address them?

<!-- more -->

### Bad Tools

I was discussing with friends, sometimes laughing, sometimes crying,
about some notable mistakes that people made while operating software,
that each time were leading to catastrophic results:
deleting a lot of data, destroying billions of dollars worth of assets,
crashing an airplane and killing people, etc.
As we laughing at the users misusing the software, Ann stopped us,
and pointed out this piece of Houyhnhnm wisdom, that isn't specific to software:
*When a casual user mistake causes a tool to fail catastrophically, fools blame the user who operated the tool; wise men blame the toolsmiths who built the tool.*

If a worker is maimed because he recklessly operated some heavy machinery, the worker is to blame.
But if a constant stream of workers end up maimed due to the not-so-uncommon co-occurrence
of several routine mistakes—then the machinery is badly designed,
and those who keep manufacturing, selling, buying and managing the operation of this unmodified machinery
are fully responsible for all the misery that ensues.

This rule obviously applies to software engineering:
*When a casual user mistake causes some software to fail catastrophically,
fools blame the user who operated the software;
wise men blame the programmers who built the software.*

In the famous incident wherein people died due to bugs in the
[Therac-25](https://en.wikipedia.org/wiki/Therac-25) control software,
the programmers who wrote that software, their managers, and their executives,
are more to blame than the medical personnel who operated the deadly radiation device.
Less deadly but cumulatively no less costly,
if a whole lot of users, like my mother, lost hours of work for failing to "save" a document,
or like my father, lost years of archives to broken disks,
or like many a novice Unix weenie, lost all his files to a typo or thinko
that made an `rm` command overly broad,
— then the professional authors and promoters of the applications, operating systems and shells
that make these errors likely are more to blame than the amateur users who hurt themselves and others.

Now, as often in programming, we can take this rule one step further (and then one more, etc.):
*when a casual programmer mistake causes some catastrophic software failure,
fools blame the programmer; wise men blame the programming language designer.*

If programs written in a *Segfault-Oriented Language* such as C or C++
produce a constant stream of crashes, data corruption, security breaches, device malfunction, etc.,
then the authors and promoters of the C and C++ programming language
are much more at fault for all those failures
than the individual programmers who use these languages, especially so the novice programmers.
And if more experienced programmers in these languages resort to
otherwise bad, expensive or limiting practices
to defend against the threat of the previous catastrophic failure,
the language authors are also to blame for the costs incurred.

Of course, the rule applies not only to programming languages, but to operating systems,
libraries, frameworks, applications, database servers, and any piece of infrastructure
used but not implemented by the programmers whose fatal mistakes partake
in a pattern that is common for that piece of infrastructure.
The expert authors of software infrastructure are responsible for the structural defects
of their software, wherein their users (who are programmers)
will constantly make the same class of mistakes.

### Bad Workmen

Now, at some point my (human) friend objected with another piece of wisdom:
*A bad workman blames his tools*.

Shouldn't a competent user take into account the potential dangers of his tool and still use it safely?
Shouldn't a good programmer do just as good a job in any programming language?
No. Not. at. all.
That's not at all what the proverb means—though the proverb is valid and applies to the situation indeed.

Certainly, a good workman will (on average at least) get better results than a bad workman,
even if provided sub-par tools.
But most importantly, the good workman will evaluate
whether the tools available to him are the most appropriate to complete the job, and if they aren't,
will remedy the situation before he even starts working on the job.
If somehow his customer, principal, boss or foreman requires him to use bad tools,
he will object and offer his expertise on how the job should better be done instead.
He will make it clear that the bad choice of tools will yield lesser results
at greater cost and significant risk compared to a better choice of tools.
He will charge the customer triple for the privilege of telling him how to do his job.
He will take extra precautions to palliate the issues with the badly chosen tool,
which will increase delays and costs.
In the end, he may even refuse to do the job if he judges the tools imposed as wholly inadequate,
and he will warn his more junior workmen of the dangers he foresees if they accept the job.

That is, bad tools would still be bad even in the hands of a good workman.
But a good workman is able to recognize them, and would not be caught dead with the bad tools,
except maybe in a life-or-death emergency where there is somehow no other choice.
If a workman makes a bad choice of tools, then he is *ipso facto* not a good workman.
At the very least, this is one important measure of his lacking in workmanship,
though he may be good or even great at other parts of the job.

Thus, whenever a catastrophe happens that could have been avoided through the use of better tools,
*inasmuch as the tool user had a say about which tool to use or not use,
then he is also culpable — not because his casual mistake caused the catastrophe,
but because his choice of a bad tool made the catastrophe likely or inevitable*.
And this culpability only increases, both (a) the more the user was an expert in the field,
and also (b) the more he had a say in the decision, at which point it was his greater responsibility
to seek from others the expertise that he didn't possess personally.

A novice at the bottom of the programming hierarchy, who lacks either knowledge or power,
has little blame (or praise) to receive in the positive or negative outcomes of the software
he partook in building.
But a seasoned programmer who, through the use of a bad programming language, partakes in a catastrophe,
is largely to blame for having accepted to write in said programming language.
Most of all, the entire hierarchy of technical leaders and business managers who made the decision
are to blame, culminating with whatever CEO or bureaucrat had executive powers.

### The Blame Game

As my human friend and I were trying to pin down blame on one person to try to exonerate the other,
Ann was astonished. She noticed that we were play the "Blame Game" as if blame were *additive*:
that is, we were supposing that blame is distributed amongst participants,
such that the sum of all shares of the blame add up to 100%.
Actually, Houyhnhnms well understand that blame is *subadditive*,
or, in a layman's terms, blame *overlaps*:
in a joint decision between the two of us,
where either of our strong objection could have had a 80% chance of averting the bad outcome,
then we are each 80% for the outcome, though our joint blame is only 100%, which is less than the sum 160%.
More generally, each participant or set of participants is assigned an amount of blame corresponding to
the probability that a good decision of theirs could have avoided the bad outcome;
then, whenever you partition a set of participants into subsets (possibly reduced to a singleton),
the amount of blame assigned to the total set is *less* than the sum of the amounts of blame of the parts.

This blame game applies as well to all decisions in all aspects of life.
But let us narrow it down to the outcome of choosing bad (software) tools.

In a corporate catastrophe, the CEO or other ultimate executive is
fully responsible at 100% for the catastrophe, as well as for everything that happens in his company.
But that does not exonerate in the least any of the workers down the chain of command.
The CTO would still be responsible at 99% or so for a software catastrophe,
the VP of the relevant branch would be responsible 98%,
the head of products at 96%, the product manager at 94%, the team lead at 92%, senior developers at 90%,
and so on, with even the most junior permanent developer having more than 50% blame,
and interns and novices having over 25% blame,
many shareholders at more than 10% each,
and millions of casual users at more than 1% each.
Anyone who could have spoken out or walked away when their action
could have had influence in averting the catastrophe, is to blame.
This blame is major or minor depending on how much influence this would have been.
The sum of all those blames is well over 100%.
The ones' greater culpability is no excuse for the others' lesser culpability.

You, who are interested enough to keep reading these writings about programming,
possess some software expertise or executive clout,
and will be responsible, partly or fully, for any successes, failures and catastrophes
that will result from the choices you either make, or accept to enact.
To what degree you're responsible will depend on how much you did know or should have known
as you were or weren't empowered in making or implementing the decisions.
Ignorance will be no excuse for giving bad or evil orders.
Impotence will be no excuse for carrying them out.

Your skill and your power won't be put forward as excuses
to dismiss your glory if you are wildly successful;
quite the contrary, this glory will rightfully reflect well on your skill and power.
Your skill and power, or lack thereof, won't be valid excuses to dismiss your responsibility
in the catastrophes you cause.
Quite the contrary, the shame will rightfully reflect on your skill and power.

### Expertise and Meta-Expertise

Now that we understand it is an important responsibility,
let us examine how to exercise it by making a good choice of tools.
What tools should you be using for your next project?
When can you tell the tools used for the current project are inadequate after all and need to be changed?
Of course there is no one-size-fits-all answer to these questions.
A good solution may depend on many criteria such as:

  - What are the goals and constraints of the project?
  - What resources will you have to complete the project?
  - What are the costs and risks involved?
  - How long do you have to find a solution? How long will the solution have to last?
    How will the costs and benefits evolve over the relevant timeline?
  - Can some off-the-shelf product help? How well do they fit the problem now?
    How will this fit itself evolve over the life-time of the desired solution?
  - How proficient are you or your team at using various potential tools?
    How proficient can you become within the deadlines considered?
    How will this proficiency and its effects evolve over the relevant timeline?
  - How easily can you find outside help in the amount required, at the skill levels required,
    within the allotted budget and the allowed risk envelope?

Yet, there are infinitely many potential such questions, and an arbitrarily high level of detail,
whereas you will have a small finite amount of information based on which to make your decisions.
You will have to restrict your attention to a few salient questions,
that you will have to answer through a judgment call,
because getting sufficient objective information, even when possible, will be unaffordable.
And so, ultimately, no one can make your decisions for you. Not I, not anyone.
You will have to consider the issue, to select the relevant questions, to estimate the answers,
to construct the most likely scenarios, and to weigh the expected costs and benefits,
to assign probabilities to various events and values to outcomes,
to establish useful models, yet to avoid following them as a substitute for observing reality
(or at best you'll run into [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law)),
etc.
Doing a good job at identifying the most relevant questions and the best answers to them
is what *expertise* is about.

But often, you will personally lack some or all of the suitable expertise.
Then your job will be to consult with proper experts to fill the gaps.
And finding experts on topics where you aren't yourself an expert is its own separate *meta-expertise*.

Titles and diplomas and low or high job positions can help you identify the best experts.
But they can also hide quacks, frauds and social climbers,
who prey on those who are too keen at deferring to authority
— or just not-so-good experts whose actual specialty is only so close
to the topic you're interested in, yet who may fail to disqualify themselves from giving you advice
and refer you to better experts.
One way to identify experts can be indeed to ask for referrals from multiple experts on close topics,
until you find people highly recommended by multiple sources;
and this can be enough in case the expertise is itself considered uncontroversial,
or you somehow trust the meta-expertise of the referrers themselves.

For important decisions on topics where the expertise ceases to be uncontroversial,
or when you can't defer your meta-expertise to other experts,
you will want to follow some meta-principles that will help you
identifying actual experts while rejecting frauds who disguise as experts.
One technique is to ask the potential expert to explain to you the issues at stake,
and counter the objections that you may have gleaned from various sources.
Lacking the expertise yourself, you may not be able to fully judge
their expert knowledge and opinion on the topic;
yet, their ability to cogently explain the issues and address objections
can show that they have thought about the topic a lot and know what they are talking about,
whereas their inability to explain, or worse, their demanding that you blindly trust them,
may be symptoms that they are not expert enough, or at all.
Thus, you can interview multiple candidate experts and each time bounce ideas
from relevant technical writings such as the discussion below, or from other candidates,
to see how well they address these issues, and can argue the pros and cons of available options.

### Time-Preference for Better Tools

As we were exploring how humans and Houyhnhnms choose tools in particular,
Ann and I came noticed that one aspect that humans often neglected,
but that Houyhnhnms seemed to care about a lot,
was to look at their choice of tools *through time*,

In an emergency, you use the best tool at hand,
even if the best tool at hand is only a piece of cut stone.
But if as a professional technologist, you find after twenty years of practice that
your best tool at hand is still cut stone, and what more,
that you are now a virtuoso at using it—then
you might not be such a great professional technologist.
Unless of course you live in a small paleolithic society with little slack left for invention,
where cut stone actually is the best and best imaginable technology for the entire duration of your life.

Thus, for an urgent, throw-away, next-day software project,
circumstantial considerations shall rightfully dominate the tactical choices made,
at which point the programmer in charge should
and will "just" use the language at hand for the project:
a language with which he is the most familiar,
a language that already solves most of the issues out of the box,
and/or a language already used by the rest of the team,
that is already known to be properly deployed in a larger production setting.
There is little reflection to be had in such a choice,
only a snap decision made as a tactical call in an emergency,
where you already have all the information you can afford to have,
completely based on local circumstances, valid for a day only.
It's too late for anyone else to help you in these cases.
The die is cast. You made your bed, and now you lie in it.
The decision was taken with what austrian economists would call
[High Time-Preference](https://wiki.mises.org/wiki/Time_preference):
you care about what you can get done *right now*,
with no regard for consequences you will experience tomorrow, much less any long-term consequence.

At the other extreme, consider a software project developed for the foreseeable future, with no emergency:
a piece of automation on which you are betting your company's future,
one that will still exist in some form or other in ten, twenty years, maybe more,
on which you and your successors shall be working for all that time and beyond.
This project won't be written once, run once, then thrown away,
but will have to be continuously deployed, maintained and updated:

  * to respond to the changing demands of an ever changing world,
  * to interface with a moving set of external systems,
  * to keep satisfying a growing number of users in ever renewed ways,
  * to withhold attacks by ever determined and sophisticated enemies,
  * to satisfy ever higher standards, whether imposed by market pressure or government regulations,
  * to fix issues that didn't use to matter much but now have become important,
  * to evolve in unforeseen ways, as new technological possibilities and constraints are discovered,
    etc.

With this larger horizon, you will have
[Low Time-Preference](https://wiki.mises.org/wiki/Time_preference),
i.e. the desire to maximize long-term value, even at the cost of
large (but affordable) short-term inconvenience.
You won't have all the information to plan the whole project for its entire duration.
You will have to discover all the particulars as time unfolds, and to continuously
be capable of acquiring this information and ready to process it.
Today, however, you must make *strategic* decisions, that will affect the chain of future choices;
along the way, you will regularly have to make new such strategic decisions or revise old ones.
As you do, you will use the best information you have here and now,
that can help you in all this future that you don't know,
yet of which you can expect that it will follow some predictable patterns.
This best information is called *general principles*,
and these principles are largely independent from whatever technology is "at hand".

And then I realized that most humans tend to have High Time-Preference,
even in the long-run choice of evolving technologies,
whereas Houyhnhnms tend to adopt the principles of Low Time-Preference,
and embrace the fact that technologies especially will evolve over the long run,
so that you must consider the arc of their future evolution, rather than only their current situation.

Yet, in the long run, the compounded consequences of the general principles you follow,
glorious or tragic, will far dominate any short-term costs and benefits
of using the closest resources at hand versus a somewhat less obvious and less comfortable solution.
The heuristics will be quite different.
Unless of course, you somehow arrange for the closest resources at hand at the time you need to pick them
to be precisely those that will provide you with the best returns in the long run;
but that will require careful thought and preparation—a long-term *strategy*.

We thus discussed software strategy with Ann, and she inquired about the life arcs
of the technologies we were considering. But that is another story...

*If you enjoy this series of writing, support me on [https://github.com/sponsors/fare](GitHub sponsors).*
