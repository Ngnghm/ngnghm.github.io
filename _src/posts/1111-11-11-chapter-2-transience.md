    Title: Chapter 2: Save Our Souls
    Date: 2015-08-03T01:10:00
    Tags: Persistence, Automation, Orthogonal Persistence, Domains

[Ngnghm](/blog/2015/08/02/chapter-1-the-way-houyhnhnms-compute/), whom I call Ann,
was fascinated by our keyboards:
because of physiological differences between our races, similar devices had never been imagined
by [Houyhnhnm](http://en.wikipedia.org/wiki/Houyhnhnm) computing engineers.
Now, as she was watching me closely, Ann noticed that I was punctuating most of my typing
with recurring combinations of key chords.
I told her I had no idea what she meant;
and so she had me record and review how, after every sentence or so, or before changing activities,
I was composing the sequence <kbd>Ctrl-X Ctrl-S</kbd>, or <kbd>Command-S</kbd>,
or some other mantra that varied slightly with the application I was using.
Interestingly, I wasn't even aware that I was doing that before she told me!
What was this mantra doing, she inquired?
How could I possibly repeat it without even noticing — and why would I?
I told her that depending on the application,
each of these mantra _saved_ the current file,
and that typing it had become ingrained in me as a subconscious habit,
because I used it so often, out of necessity.
What does "_saved_" mean wondered Ann, and what made it a necessity?

<!-- more -->

### Persistence, Automated

I explained that Human computer software and hardware are prone to crashing,
or to losing battery power, and other unexpected failures
— there she sighed with sympathy, for
Houyhnhnms (pronounced "Hunams") were just as frustrated as Humans
with how unreliable their computers were.
I continued that the solution universally adopted for Human computer systems
was therefore that Humans had to explicitly _save_ each file
for its contents to be later recoverable in the event of such a crash.
Having been burned too many times by the loss of many hours of hard work,
I had grown the habit of saving often, and
doing it unconsciously at every pause in my thought process;
thus I didn't have to think hard to predict when the computer was at risk
and explicitly decide when I ought to save.
Ann was properly appalled.
Didn't the system just automatically save everything I typed?
Why was human thought and habit involved at all in a task
that could have been fully automated long ago
— and indeed had been automated in all
but the earliest and most primitive Houyhnhnm computing systems?

Although, she remarked,
considering the overall computing system containing both Sapient and Computer,
the task had been automated indeed.
Indeed, if you came to think of it, this task couldn't possibly _not_ be automated,
unless the computing system were only used
but to produce worthless data never worth keeping
— at which point it would thus itself be mostly worthless.
However, the task had been imperfectly automated at great cost
by creating a habit in my brain and hands,
rather than automated both perfectly and cheaply by having it done by the computer.
Certainly, building a physical habit that lightened the burden on the higher parts of my mind
was better than no automation at all, but what a waste of precious wetware!
At least in this instance and for this concern, the very purpose of computers had been defeated.
As went the _Sacred Motto_ of the Guild of Houyhnhnm Programmers:
[_I object to doing things that computers can do_](http://www.wanderings.net/notebook/Main/BitterAcknowledgmentsOfOlinShivers).

And then, suddenly, Ann became worried about her journal.
She had been consigning her observations on a computer
ever since she had learned to use a mouse to draw Houyhnhnm symbols in a paint application.
(Ann once remarked that a one-button mouse is an exquisite input device for a Houyhnhnm's hoof,
but that it takes a Yahoo to believe it is suited to a Yahoo's hand.)
Now, she admitted that she could never retrieve her old notes;
but she just thought that it was due to
her not understanding the Houyhnhnm-Computer Interface properly,
to said interface not having proper automated recognition for hoof-written Houyhnhnm scribblings,
and to her not knowing how to search back in time what she had previously drawn.
She assumed that Human computers were probably not geared
to properly index her observations for easy retrieval,
but that of course they would otherwise all be logged in the computer's memory.
Was I implying that all her notes were lost,
including some of the finest poetry she had ever written,
as inspired both by the suffering from her predicament and the marvel at her discoveries?
I won't claim any proficiency at judging Houyhnhnm poetry
— it all sounds like nickering and whickering to me —
but to this day, I fear that one of the greatest pieces of Houyhnhnm literature
has been lost to the world, due to the failings of Human computer systems.


### Orthogonal Persistence

Ann explained to me that Houyhnhnm computing systems
make data persistence the default, at every level of abstraction.
Whether you open the canvas of a graphical interface and start drawing freely,
or you open an interactive evaluation prompt and bind a value to a variable,
or you make any kind of modification to any document or program,
the change you made will remain in the system forever
— that is, until Civilization itself crumbles,
or you decide to delete it (a tricky operation, more below).
Everything you type remains in your automatic planet-wide backups,
providing several layers of availability and of latency —
kept private using several layers of cryptography.

Of course, you can control what does or doesn't get backed up where,
by defining domains each with its own privacy policy that may differ from the (reasonable) defaults.
The user interface is aware of these domains, and
makes it clear at all times which domain you're currently working with.
It also prevents you from inadvertently copying data from a more private domain
then pasting it into a more public one;
in particular, you only type your primary passwords but
in a very recognizable special secure domain that never stores them;
and your secondary access keys are stored in a special private domain
using stronger cryptography than usual,
and also subject to various safety rules to avoid leakage.

Deletion (as opposed to mere de-indexing), while possible,
gets more expensive as the data you want to delete gets older:
logs, backups and indexes dating back to the deleted change have to be scrubbed and rewritten;
the system must triple-check that everything is still in working order after this sweeping change;
it must also make sure that the user is ultimately happy with the results,
including with whatever might break for other users he knows
who might have depended on details of the old history (assuming he shared any of it).
Now, when deleting anything but most recent changes,
this expensive operation will leave traces that something was deleted,
though the details of what was deleted will indeed have been deleted.
Of course, deletion doesn't affect copies other people may have of the data, if you ever shared it;
therefore, thou shalt not lightly share thy data, and thou shalt never share any access keys
— but that's true anyway.
At least Houyhnhnm systems let you manage your sharing and backup policies in a systematic way,
and ensure that everyone can depend on sensible, safe, defaults.

In other words, Houyhnhnm computing systems have
[_orthogonal persistence_](http://tunes.org/wiki/orthogonal_20persistence.html)
— and have had it for [_decades_](http://tunes.org/wiki/eumel.html).
The adjective "orthogonal" means that
the persistence of data is a property of the domain you're working in, as managed by the system;
it is _not_ an aspect of data that programmers have to deal with in most ordinary programs;
unless of course they are programmers specifically working on a new abstraction for persistence,
which is after all an ordinary program, just in a narrow niche.
Regular programmers just manipulate the data with full confidence that
the inputs they consume, the code that manipulates them, and the outputs they produce
will each remain available as long as the user wants them,
with the consistency guarantees specified by the user,
as long as the user affords the associated costs.

Actually, ordinary programs don't know and can't even possibly know
which domain they will be running in,
and letting them query those details would be a breach of abstraction,
with serious security implications and performance impediments,
even assuming for a moment that it wouldn't otherwise affect program correctness.
Therefore, only programs with adequate capabilities
can manipulate the persistence and privacy levels of computing domains,
except of course to deliberately spawn a subdomain with yet strictly fewer capabilities.
The system of course can recognize privacy and performance annotations about authorized programs
and automatically distribute the many components of these programs each in a suitable domain.

It is important to maintain full abstraction when keeping the semantics of ordinary programs
orthogonal to various concrete aspects of the computing domains:
the persistence, privacy, robustness and performance
(but also machine word size, endianness, memory layout, physical location of the machine, etc.).
This abstraction allows the user to independently specify what domain he wants,
and to later change his specification, while the program keeps running.
The same abstraction allows the underlying system to independently pick
the best suited or cheapest concrete implementation,
and to migrate the program to a different underlying machine when the conditions change.
And whether migration is prompted by user request, system adaptation,
or a change of phase in the execution of the program,
the concrete code to run the program can automatically be re-generated to fit the new conditions,
so the program may continue running in a new domain implementation,
without any interruption in its semantics (though possibly with an observable pause).
Thus, the system may optimize away logging and copying
in transient computations for which speed matters more than robustness;
or it may introduce extra logging and extra copying
when debugging existing programs
(e.g. enabling [Omniscient Debugging](http://www.lambdacs.com/debugger/) for a failed computation);
it may automatically introduce synchronization steps in computations performed in lock-step
by several redundant machines based on different architectures
to ensure detection and elimination of low-level failures (or tampering);
or then again it may add layers of encryption between CPU and memory where the user feels paranoid;
or it may compile the code to FPGA where performance _really_ matters.

The possibilities are endless, as long as the system maintains
full abstraction of program semantics from the underlying implementation,
as Houyhnhnm computing systems do.
When on the contrary, as in Human computer systems,
the code is pegged to a particular implementation,
then not only is it practically impossible
to migrate a program from one domain to another at runtime,
but programs may have to be completely rewritten from scratch
before they may even be executed in a domain with slightly different constraints
regarding persistence, privacy, performance, etc.


### Fractal Transience

Interestingly, on the visible side of the system, successful Human "apps" these days
have evolved into offering to users some semblance of persistence:
configuration settings, lists of open tabs, documents you manipulate
— most user-visible application state, most of the time,
seems to be preserved from one session to the next,
without the user having to issue any explicit command to "save" anything.
Desktop apps still tend to display a counter-productive "recovery" menu at startup, though.
And more annoyingly, this apparent persistence still doesn't cover
the most frequent case these days of people typing things:
input forms and message boxes in web pages.
Also, the "catastrophic" events that may cause data loss
include perfectly predictable events,
such as the eventual death of each and every piece of hardware
and of each and every software project and service-providing business,
in a mere matter of years.
Yet, satisfied with expectations from this _apparent_ persistence,
users can easily be fooled, like Ann was initially,
into believing that Human computer systems
are just as good as Houyhnhnm computing systems in this regard;
and just like Ann, they can be led to believe that failures
are due to incompetence on their part,
rather than on the part of the computing system developers.

Well, at least, that's how the Houyhnhnm see things:
whether or not you can assign blame to any person in particular
for the situation of Human computer systems, this situation is deeply dysfunctional.
Actually, the Houyhnhnm also have something to say if you cannot assign personal blame for it
— and it doesn't look like you can:
this means that the meta-system for assigning responsibilities itself is also dysfunctional.
Why do "vendors" of Human computer systems by and large hoard all the freedom
but none of the responsibility
when it comes to modifying and maintaining their software
so it doesn't fail catastrophically and betray the customers?
This is a clearly dysfunctional process according to Houyhnhnm criteria.
Even when these vendors tout themselves as selling "software as a service",
they often hide behind their "Intellectual Property" monopolies
to actually make it "rotware as a racket" — they offer
[bitrotting](http://www.jargon.net/jargonfile/b/bitrot.html) bad expensive service,
oriented towards the vendor's interests to the detriment of the users',
with no enforceable service level agreement,
with no way to extract your data in a state usable by any competing service,
with the promise that the service _will_ grow even more inadequate
and eventually die (being cancelled, bankrupted, or bungled),
yet that you _will_ have to keep paying,
and then pay again when you have to leave or be left behind;
but you don't have much choice because patents and other monopolies
attract capital and provide disincentive to investment in any competition
(if legally allowed at all)
or in other services that don't similarly exclude competition through legal tactics.
By contrast, Houyhnhnms individually have full ultimate control over their own machines,
and it is based on this control that they enjoy division of labour
in delegating software maintenance of most (if they are programmers)
or all (if they aren't) of their systems
to competing providers who are held individually liable in case of failure,
and aren't granted monopolies by a centralized privilege-doling entity.

Now, after Ann made this painful first hoof experience
of the persistence failure of Human computer systems,
she started investigating how Human computer systems implemented persistence, or failed to.
And she discovered to her dismay that beneath the
[veneer of persistence](http://www.loper-os.org/?p=448),
there was transience at every level she was looking at — not just transience,
but [fractal transience](http://rationalwiki.org/wiki/Fractal_wrongness):
this fundamental design difference between Human and Houyhnhnm computing systems
is observable at every level of these systems.
The user, the programmer, the library developer,
the compiler writer, the operating system implementer,
everyone, all the time, has to assume the software and hardware layers below him are fragile,
supposed to work only in a single computing domain;
everyone will in turn provide a similarly fragile and non-transportable device
to the users above him.
All the manual handling of persistence costs a significant fraction of software development
(about 30% of all code written, an IBM study once counted); <!--
https://web.archive.org/web/20060813202835/http://www.st-andrews.ac.uk/services/admissions/postgrad/schleaf5.html
...Ron Morrison...
"Well, perhaps not quite so easy. Research in persistent programming systems started in the late seventies, when it was noticed that storing 'long-term' data in a different logical framework from 'short-term' data leads to all sorts of problems in large and complex applications. An analysis by IBM showed that around 30% of the code of long-lived, large scale applications was devoted to the movement of data in and out of the programming language domain. The fact that this code is notoriously susceptible to system evolution errors, coupled with the statistic that 2% of the USA's GNP is spent on software 'maintenance', leads us to believe that storing long-term data in a file or database system is expensive."

King, F. IBM report on the contents of a sample of programs surveyed. San Jose, CA: IBM, 1978.
Notably cited by Atkinson & Morrison https://dl.acm.org/citation.cfm?id=615226
-->
and if you ever want to make a significant improvement to any component at any level,
you pretty much have to rewrite the entire software "stack"
above whichever level you are hoping to improve
— in other words this requires a significant world-changing event.

And yet, it runs! Ann was in awe that Human computer systems could run at all;
they clearly demonstrated some emerging order so powerful
that it could survive despite ubiquitous design flaws
— or could it possibly be surviving _thanks_ to what to this Houyhnhnm appeared as flaws?
Ann decided to pursue her investigations…

<!-- http://j.mp/NgnghmPersist -->
