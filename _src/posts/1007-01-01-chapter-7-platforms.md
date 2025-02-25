    Title: Chapter 7: Platforms not Applications
    Date: 2015-12-25T22:33:44
    Tags: Meta, Application, Autistic, Platform, Extension, Language, Expertise, Economics, Incentives, Division of Labor, Specialization

My previous discussion with Ngnghm (or Ann as I call her) left me baffled:
I could somehow understand that
[Houyhnhnms don't have the concept of an Operating System Kernel](/blog/2015/11/28/chapter-6-kernel-is-as-kernel-does/)
(note that I pronounce "Houyhnhnm" "Hunam");
and I could vaguely guess how each of the many aspects of a Human kernel
could correspond to a family of software patterns in a Houyhnhnm computing system,
at various levels of abstractions.
But while I could visualize these patterns individually,
it was less clear to me what the big picture was
when these smaller compile-time, link-time and runtime abstractions
were put together.
So I decided to approach their software architecture from the other end:
what do end-user applications look like in Houyhnhnm computing systems?

I was baffled again, but not surprised anymore,
to find that Houyhnhnms don't have a notion of application.
Granted, there are simple cases where Human applications have
direct counterparts in Houyhnhnm computing systems.
But in the general case, Houyhnhnms don't think in terms of standalone applications;
they think in terms of platforms that they extend with new functionality.

<!-- more -->

### Autistic Applications ###

Ann was starting to get familiar with Human computer systems,
and the few end-user applications that he was using daily.
She noticed that a certain class of applications
was quite reminiscent of software that existed in Houyhnhnm computing systems,
at least superficially:
self-contained end-user applications, such as
games, interactive art, audiovisual performances,
showroom displays, news and other writings, etc.
These applications had in common that they are made to be explored by the user
but not modified in any significant way;
they mostly didn't communicate much, if at all, with any other application
in any way that the end-user cared to control;
they had no significant input and no output beside the user experience.
I dubbed the concept _autistic applications_.
But when Ann tried to translate the Houyhnhnm expression for the concept,
it sounded more like _interactive documents_.

In any case, these things look pretty much the same
in Houyhnhnm computing systems and Human computer systems:
You somehow get ahold of the software;
installing it automatically installs its dependencies, if any;
you run it in a sandbox (at least Houyhnhnms do);
and you interact with it.
It doesn't matter too much what the program does (if anything),
precisely because the information flow is essentially one way,
from the application to the user.

Still, there were a few subtle points
where even these autistic applications in Human computer systems
differ from interactive documents in Houyhnhnm computing systems.
For instance, in a Houyhnhnm computing system,
you can always copy and paste text and pictures and sounds,
search for words in registered dictionaries, or otherwise manipulate the application output;
these do not require the application developers having to do anything to enable such features.
But a more striking difference is that
all Houyhnhnm activities inherit from the system its
[orthogonal persistence](/tags/Orthogonal-Persistence.html).
You can thus always interrupt the application and save and restore its state at any point in time,
except where explicitly not desired (e.g. in the middle of a transaction).
Then you can go back in time and replay
(and in the case of videos or music, go forward in time),
according to a protocol that is uniform across applications;
and not only is it no additional burden on application programmers,
it is something they can't get subtly wrong, and that users can thus casually rely upon.
There is never any loss of any session state;
there are no disappearing tabs or windows,
no games where you can't both pause and save your game;
no messages you have to enter twice
because they were cleared between two page loads or browser crash and restart,
or that reappear because the clearing failed to be recorded.

Of course, in a Houyhnhnm computing system,
interactive documents (like any other activity),
even when they require interaction with a remote service,
are always able to save and restore the client-side state from previous user interactions;
however that does not entail being able to save and restore any server-side state,
at least not without support from the server.
And while the system typically makes it easy for the server developers
to provide that support if they want,
there are many reasons why they might not want to do it, including cost and confidentiality.
Conversely, for reasons of privacy, a user might want to replay a previous session
without telling the remote server.
Also, for regression testing or for debugging their applications, developers may want
to replay parts of the server side interactions without affecting the users.
All these behaviors are expressible in Houyhnhnm computing systems:
you can specify the scope and context in which you replay some computation,
within the resources that you control.


### Typical Applications ###

Now, most applications are not autistic;
they do involve exchanging data with other applications:
using data produced by other applications, and
producing data that will be used by other applications.
In other words, the information processes they partake in
may directly involve other automated programs;
they do not require a Sentient being's brain (Human or Houyhnhnm)
as an exclusive intermediate between their processing and further automated processing;
the sentient being doesn't have to recreate the entirety of the next program's input
based on what it sees or remembers of the previous program's output.
And there we see that even "autistic applications" are not "autistic processes":
An autistic application does not communicate with other automated programs
but does interact with sentient users;
its implementation might also interact with other programs
below the abstraction provided to the user,
though that's mostly invisible to the user.
An "autistic process" that communicates with no other process whatsoever,
not even those in a sentient being's brain, can and will be wholly optimized away.

Ann then explained that the situation differs sharply between Human and Houyhnhnm systems
regarding all these typical, non-autistic, applications —
to the point that Houyhnhnms don't really have a notion of application.
For technical reasons with historical roots in marketing,
Human computer systems tend to organize software
into neatly separated, standalone, black-box "applications";
communication between different applications is very difficult,
and must be explicitly handled by each of these applications;
every application must include an implementation
of all these modes of communication it will partake in.
Instead, Houyhnhnm computing systems consider such communication the heart of the system,
and make it comparatively easy;
they do not usually have self-contained "applications";
they start from a common platform that handles all the communication;
and they extend this platform to handle new kinds of situations,
until they include all the interesting situations that the "application" would have covered.

A first obstacle to inter-application communication in Human computer systems,
is that the only common abstractions are very low-level,
in terms of arrays of bytes.
Any higher-level objects have to be encoded into sequences of bytes,
shipped across costly runtime virtual process boundaries,
then decoded back into objects on the other side by a matching algorithm.
Applications thus have to agree on
complex, expensive, bug-prone yet inexpressive low-level communication protocols
that are big security liabilities.
Having to deal with such protocols is a huge barrier to entry
that explains why few programmers endeavour to try it.
A lot of this work can be completely automated
using type-directed code-generation;
and the better Human systems do it to a point
(see Protocol Buffers, Cap'n'Proto, piqi, etc.);
but the integration with types of actual programming languages
remains generally lackluster.
What types can be used for generally shareable data
remain very limited and inexpressive,
whereas whatever types they can use for manipulating data within a given program
remain generally oblivious of any
sharing constraints, ownership rights, access restrictions, etc.

In Houyhnhnm computing systems, communication of objects is handled
by the system at the highest level of abstraction possible:
that of whichever types and checks are being used to define and validate these objects.
Low-level encoding and decoding can be eschewed altogether for linear objects
where both processes trust each other with respect to representation invariants;
it can sometimes be reduced to mere checking when the trust is incomplete;
and where encoding or checking is actually required, it is automatically extracted
based on type information available either at compile-time or at runtime.
The programming language types _are_ the communication types,
and if foreign languages need to communicate with each other,
it's a regular matter of FFI (Foreign Function Interface)
that you need to solve anyway, and might as well solve once and for all,
rather than have each application invent its own bad incompatible partial solution.

A second obstacle to inter-application communication in Human computer systems
is that they have very poor algebras and interfaces
for users to combine processes.
For most users, sharing data between applications requires one of two things:
selecting and copying (or cutting) data from one application using a mouse,
then pasting it into another application;
or having the application save or export a file to a local disk,
then opening or importing that file in another application
(with "interesting" consequences when two applications try to modify it at the same time).
Developers can do better, but there's a large discontinuity between
the skills required to merely use the system,
and the skills required to do even the simplest things as you program the system.
Modern Human computer systems tend to allow for an intermediate layer between the two,
"scripting", with Unix shells and their pipes, or the notably more modern PowerShell on Windows.
Scripting lowers the barrier to building applications,
and when using "client" utilities and libraries,
allows programmers to share data beyond copy-pasting and files;
but it still remains quite complex to use, and often brittle and limited in expressiveness,
because it does not directly partake in either of the programs'
invariant enforcement and atomic transactions
(though a few applications offer a suitable transactional interface).


### Houyhnhnm Platforms ###

Houyhnhnm computing systems are based on the premise of small modular entities
that each do one thing well;
and these entities can be combined inside a common platform
that does its best to reduce the discontinuity between using and programming.
To Houyhnhnms, there is no difference between using and programming;
if anything,
_the difference between a programmer and a user, is that
the programmer knows there is no difference between using and programming_.
Certainly, there is a continuum of proficiency and knowledge amongst users;
but there is generally no large barrier to overcome
in order for users to generalize and automate as a script
whatever computations they know how to achieve interactively;
and there isn't a large amount of boilerplate required to write the least program,
as there is in all Human programming languages except
["scripting languages"](https://github.com/fare/asdf3-2013/blob/master/scripting-slides.rkt).
Houyhnhnm platforms are built around a high-level programming language accessible to the user;
therefore communication happens directly using objects in the system language
so no serialization or deserialization into low-level bit sequences is required
(or if it is, for the sake of network communication, it can be automated);
and the system language is available to name entities, combine and apply programs.

A few Human computer systems have historically followed this model:
Smalltalk workstations (from Xerox),
Lisp Machines (from Xerox, MIT, Symbolics, LMI or TI),
Hypercard (on old Apple Macintosh'es);
to a point, HP calculators or Mathematica.
But perhaps the most successful such platform to date is
[GNU Emacs](https://www.gnu.org/software/emacs/):
It is largely written as a set of modules in a "scripting language", Emacs Lisp.
Entities defined in a module can be freely used in another one,
and data is directly exchanged
without going through any communication or translation layer.
Emacs Lisp is antiquated, more so than Smalltalk or Lisp Machine Lisp ever were,
and its data structures are heavily biased towards text editing;
and yet it remains widely used and actively developed,
because in many ways it's still far ahead of any competition despite its limitations.

In a Houyhnhnm computing system,
programmers do not write standalone applications in non-autistic cases;
instead, they write new modules that extend
the capabilities of the platform.
Often, a new module will extend the system to handle new entities.
As long as these entities implement common interfaces,
they can be used along all previously known entities
by all existing modules that use these interfaces.
For instance, a new picture compression format is automatically usable
by each and every function that uses pictures throughout the system;
a common extensible picture editor can be used on all pictures anywhere on the system;
a common extensible text editor can handle any kind of writable text in the system; etc.
At all times, each of these modules, including all common editors,
will include all the user's customizations;
this makes writing customizations much more worthwhile than if separate customizations
had to be written for each application, each in its own language with its own learning curve,
as is the case in Human computer systems.

A new module may also define new interfaces, and how they apply to existing kinds of entities.
There is of course a problem when two modules that don't know each other
extend the system by one adding new kinds of entities and the other defining new kinds of interfaces,
the combination leading to new cases that are not handled.
Houyhnhnm systems are not magic and can't generate handlers for those cases out of thin air:
a further module may define how to handle these new combinations;
or a suitable generic fallback may have been provided with the new interface;
or lacking any of the above, the system will
fail and drop to its metasystem, that will handle the error.
In the end, it's still the job of some programmer
to ensure that the overall system works suitably
in the legitimate cases that it will actually encounter.
These issues exist in Human and Houyhnhnm systems alike —
the only difference is that Human computer systems are so difficult to extend
that programmers seldom reach the point when they can confront these problems,
whereas Houyhnhnm computing system eliminate enough
of the artificial problems in extending the system
that users are more often confronted with these extension-related issues.


### Different Shapes ###

Because of the high barrier to communication between applications in Human computer systems,
these applications tend to grow into big hulking pieces of software
that try to do everything — yet can't.
Indeed, even a picture editor will need to edit text to overlay on pictures,
to email the pictures, to browse the filesystem looking for pictures to edit,
to search pictures by date or by location, etc.
It needs to be extensible to accept new file formats, new color schemes,
new filters, new extraction tools, new analyses, new generation techniques,
new scanning sources, new social networks on which to publish pictures, etc.
Soon, it becomes a platform of its own, its own extension API, its own scripting language,
its own plugin ecosystem, its own configuration system, its own sandboxing infrastructure.
Every successful application grows this way,
until it does many of the same things as all the other applications,
all of them badly, except those within its own application core.

In a Houyhnhnm computing system, a picture editor
will handle picture editing, and picture editing only — and do it well.
It will delegate sending email, browsing the filesystem, searching for pictures, etc.,
to suitable other modules of the common platform.
Instead of extensions being available for a single application,
they will be available to all software.
Thus, whereas Human computer systems feature one unwieldy file selector for each application,
Houyhnhnm computing systems instead will have a single file selection service for the entire platform.
All the improvements ever made to file selection will be available to all activities
instead of only a single application:
preview of contents, browsing history,
restriction and search by type or by many criteria beside filename hierarchy,
relevance to context, selection or tagging of multiple files instead of one at once,
automatic refresh of search results, generation of content on demand, etc.
Security will notably be improved by each component only having access
to the capabilities it needs, containing any security breach by construction.


### Extension Languages ###

Many Human application developers eventually realize that
the growing set of predefined usage patterns they develop over time
can never cover all the cases required by all potential users.
So they eventually invent their own configuration and extension language,
so that users can define their own usage patterns.
But most application developers are no programming language specialists;
even when they are, being pressured by the application development deadlines,
they just don't possess the resources
to implement more than the strict minimum necessary for a programming language;
and they never planned in advance for adding such a language,
so it doesn't fit well in their large existing code base.
Therefore they usually end up with a very badly designed language,
very inefficiently implemented, and no tooling to support using it
besides print-debugging at the end of a long edit-compile-test cycle.
That resulting language can be very good at the few initial predefined operations,
and passable when using some limited usage patterns,
but is consistently bad at everything else.
Yet it costs a lot to develop, and even more to do without.

In contrast, Houyhnhnms will use their common platform
to configure and extend all software.
The platform comes with a variety of programming languages
each designed by the best programming language designers;
it provides an efficient implementation framework, great tooling,
all the programming paradigms users may desire.
There are also many ways for developers to control
the expressiveness of configuration languages:
domain-specific languages, type systems, contracts, etc.
Not only do such expressiveness restrictions
make it easier for domain experts to precisely express what an application requires,
in the terms that best make sense for the domain
(here using the informal meaning of "application", not the Human computer system notion);
they also enable domain-specific meta-programming:
since the configurations follow a given pattern
or can be otherwise normalized to objects of a given type,
various kinds or guarantees, queries and optimizations may apply.


### Programming Incentives ###

More generally, considering the larger computing system that includes the sentient programmers,
Human computer systems display a singular
failure of _division of labour and specialization of tasks_.
Developer talent is stretched thin, as the same tasks are done over and over,
once per application, almost never well,
by developers who are seldom specialists in those tasks.
Meanwhile, those few developers who are good at a task
cannot focus on doing it in a way that will benefit everyone,
but must instead improve a single application at a time.
And because hiring is application-based rather than specialty-based,
even specialists are seldom funded to do what they are good at,
instead being paid to badly write yet another implementation
of a feature at which they are mediocre, for whichever application they were hired about.
Cultivating a platform is an afterthought to application growth;
which platforms happen to succeed depends not at all on its good design,
but on a package deal with other aspects of which application will grow biggest.
As a result, most successful application extension platforms start as some amateur's
quick and dirty design under pressure,
with a requirement of matching the application's existing API;
platforms then have to forever deal with backward compatibility
with a bad and skewed design.
Since there is no common platform, developers must relearn
the badly designed ad hoc partial platform of each application
before they can be productive;
this increases the barrier to entry to coding,
entrenches the market fragmentation,
and adds up to a huge deadweight loss for society as a whole.

In Houyhnhnm computing systems,
experts of any given domain can focus on their domain of expertise,
contracting their services to those who require improvement for their applications.
Experts don't need to restart their work from scratch for every application,
but need only do it once per platform.
And there are only a few worthwhile platforms, and
they each are designed by experts at platform design
rather than by some random application developer.
Where a number of expertises must be integrated together toward an "application",
choosing and cultivating a well-designed platform for software growth
is not an afterthought but a prerequisite for the project manager.
Without artificial barriers to development,
the total amount of effort expanded on each feature
is much lower in Houyhnhnm computing systems than in Human computer systems,
while the average domain expertise of those who implement each feature is much higher.
Houyhnhnms thus achieve better software quality
at the cost of a lower quantity of development efforts than Humans.
They don't have an "app economy", but they do have active markets where producers sell
interactive documents and platform extensions, either as services or products.

The economic structure of software development as well as its technical architecture
is thus crucially affected by this simple change of point of view,
from _computer_ systems to _computing_ systems.
