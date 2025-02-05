    Title: Chapter 8: Inter-process Communication
    Date: 2016-01-03T14:58:27
    Tags: Implicit, Declarative, Communication, Copy-Paste, Meta, Free Software, Abstraction, Enforcement, Security, Meta

In our discussion about the difference between
[Human applications and their Houyhnhnm counterparts](/blog/2015/12/25/chapter-7-platforms-not-applications/)
(I often pronounce "Houyhnhnm" as "Hunam"),
I was intrigued by claims Ngnghm made (I usually call her "Ann")
that communication was much easier between activities of a Houyhnhnm computing system
than between applications of a Human computer system.
I asked Ann to elaborate on this topic.

It was easy to agree that Human computer systems made communication
something much lower level than it could be.
But Ann also argued that Humans had very poor algebras and interfaces
for users to combine processes.
Just what _kinds_ of communication could there even exist
besides the ones that already existed on Human computer systems?

<!-- more -->

### Implicit Communication ###

From my discussions with Ann emerged the notion of communications being explicit or implicit.

In the case of explicit communication,
a process specifically names another process,
whether an existing one or a new one to be started;
it then opens a communication channel with that other process,
and proceeds to exchange data.
Explicit communication does exactly what the programmers want
(or at least _say_: even Houyhnhnms have no AI strong enough to
[DWIM](http://www.jargon.net/jargonfile/d/DWIM.html));
thus programmers control how much complexity they will afford;
but it requires tight coupling between the programs (and thus programmers)
on all sides of the communication, and is difficult to extend or adapt
to suit the dynamic needs of the end-user.

Conversely, communication with other processes can be implicit:
something outside some process grabs data from it, and makes it available to some other process.
This is the case with copy-pasting, or with
piping the standard output of one process into the standard input of another.
Implicit communication is controlled by the users of a program
rather than by the programmers who write it, and is therefore adapted to _their_ needs.
It sometimes require complex support from the programs that partake in it
(or, we'll argue, their meta-programs);
but programmers don't have to worry about programs on the other side,
as long as they abide by some general protocol (and keep up with its updates).

Note that implicit vs explicit is a continuum rather than a clear cut distinction:
every communication is partly explicit, because it necessarily involves grabbing data
that was somehow published by the first process, the publishing of which wasn't optimized away;
and every communication is partly implicit, because it always relies
on something in its context to effect that communication, at the meta level
(as known from famous paradoxes, no consistent formal system is perfectly self-contained).
Another name for this dimension of software design is declarative vs procedural programming:
In the declarative approach, programmers describe what is being computed,
without specifying how it is going to be computed or how it will be further processed,
which will be determined by strategies at the meta level.
In the procedural approach, programmers describe the steps of the computation
without specifying what is going to be computed,
and all the operational semantics remains at the base level.

Houyhnhnms recognize the importance of both aspects of communication, implicit and explicit;
meanwhile Humans tend to be blind about the implicit aspect,
because they are habitually reluctant to seriously consider anything at the meta level.
When Humans tackle implicit communication (and they cannot not do it),
they advance reluctantly into a topic about which they are blind;
and thus they end up with implicit communication systems
simultaneously quite complex and costly for programmers to implement,
yet extremely limited in expressive power for the end-user.


### The Case of Copy-Paste ###

The kind of implicit communication most visible to end-users in Human computer systems
is copy-paste: applications interact with a graphical interface,
and may allow the user to either copy or cut part of a document being displayed;
the clipping is then stored in a global clipboard (with space for a single clip).
Another application interacting with the graphical interface may then
allow the user to paste the clipping currently in the clipboard into its own document.
The two programs may know nothing of each other;
as long as they properly partake in the protocol,
they will have communicated with each other as per the desires of the end-user.
Copy-pasting alone provides user-controllable implicit communication between most applications,
and is an essential feature in Human computer systems.

Now, on Human computer systems, copy-paste requires every participating application
to specially implement large chunks of graphical interface support.
Every application then becomes somewhat bloated, having to include large graphical libraries
(which in modern systems can happily be shared between applications);
but also having to properly initialize them, follow their protocols,
abide by the strictures of their event loop, etc.
They have to be able to negotiate with the clipboard server
the kinds of entities they can copy and paste,
and/or convert between what the server supports and what they can directly handle.
This architecture where all features are implemented at the same level of abstraction
contributes significantly to the complexity of applications;
applications are therefore hard to reason about, brittle and insecure.
The overall graphical environment will in turn inherit the unreliability
of the applications that partake in it.
And despite all this complexity, often some application will fail to support
copying for some of the information it displays (e.g. an error message);
the feature is then sorely missed as the user needs to copy said information by hand,
or falls back to some low-level means of information capture such as screen copy
(or memory dump, for more advanced developers).

An interesting exception to the rule of the above paragraph
is the case of "console" applications:
these applications display simple text to
a "terminal emulator" straight out of the 1970s,
at which point all the output can be copied for further pasting.
The terminal emulator thus serves as the meta-program responsible
for presentation of the application output, and handling copy-paste.
This comes with many limitations:
only plain text is supported, not "rich text", not images;
lines longer than the terminal size may or may not be clipped,
or have an end-of-line marker or escape character inserted;
selecting more than a screenful may be an issue,
though you can sometimes work around it by resizing the terminal or by switching to tiny fonts;
standard output and error output may be mixed, and interspersed with output from background programs;
layout artifacts may be included (such as spaces to end-of-line,
or graphic characters that draw boxes in which text is displayed); etc.
Still, the principle of a meta-program to handle display already exists
in some Human computer systems;
its protocol is just limited, baroque and antiquated.

Houyhnhnm computing systems generalize the idea that presenting data to the end-user
is the job of a meta-program separate from the activity that displays the data;
this meta-program is part of a common extensible platform,
rather than of the self-contained "application" that underlies each activity.
The display manager will thus manage a shared clipboard;
this clipboard may contain more than just one clip;
it may contain an arbitrarily long list of clips (like the Emacs `kill-ring`).
Also, clips can include source domain information, so that
the user can't unintentionally paste sensitive data into untrusted activities,
or data of an unexpected kind.
The platform manages interactive confirmations, rejection notifications, and content filters,
that are activated when users copy or paste data.
In these aspects as in all others,
the platform can be extended by modules and customized by end-users.
Other meta-programs beside the display manager can reuse the same infrastructure:
they can use their own criteria to select data from a program's output;
they can use the selected data for arbitrary computations,
and store the results into arbitrary variables or data structures, not just a common clipboard;
they may consult the history of the selected data, or watch the data continuously as it changes,
instead of merely extracting its current value.
And the base program doesn't have to do anything about it,
except properly organize its data
so that the external meta-programs may reliably search that data.


### Smoke on Your Pipe and Put That in ###

As another instance of implicit communication,
one of the great successful inventions of (the Human computer system) Unix
was the ability to combine programs through _pipes_:
regular "console" applications possess a mode of operation where
they take input from an implicit "standard input"
and yield output into an implicit "standard output",
with even a separate "error output" to issue error messages and warnings,
and additional "inherited" handles to system-managed entities.
A process usually does not know and does not care
where the input comes from and where the output is going to:
it may be connected to a communication stream with another process, to a terminal, or to a file;
the _parent process_ setup the connections before the program started to run.

The parent here plays a bit of the role of a meta level,
but this role is very limited and only influences the initial program configuration.
(Actually, advanced tools may use `ptrace`,
but it is very unwieldy, non-portable, and inefficient,
which may explain why it remains uncommon outside its intended use as a debugging tool.)
Still, even within this limitation, Unix pipes revolutionized the way software was written,
by allowing independent, isolated programs to be composed,
and the resulting compositions to be orchestrated into scripts
written in some high-level programming language.

Houyhnhnm computing systems very much acknowledge the power of composing programs;
but they are not so restricted as with Unix pipes.
They enable composition of programs of arbitrary types,
with arbitrary numbers of inputs and outputs
all of them properly typed according to some high-level object schema,
rather than always low-level sequences of bytes.
(Note that low-level sequences of bytes do constitute an acceptable type;
they are just rarely used in practice except in a few low-level programs.)
These typed inputs and outputs all provide natural communication points
that can be used to compose programs together.

Unlike the typical parent processes of Human computer systems,
the meta-programs of Houyhnhnm computing systems
can control more than the initial configuration of applications.
They can at all time control the entire behavior of the base-level program being evaluated.
In particular, side-effects as well as inputs and outputs
are typed and can be injected or captured.
Virtualization is a routine operation available to all users,
not just an expensive privileged operation reserved to system administrators.


### Explicit Communication ###

There are many obstacles to explicit communication in Human computer systems.

A first obstacle, that we already mentioned in a previous chapter,
is the low-level nature
of the data that is exchanged with their communication protocols,
which constitutes a uniform obstacle to all communications
by making them complex, error-prone, and insecure.
But these protocols are not low-level only with respect to the data;
they are also low-level with respect to communication channels.
Human programming languages do not support reflection,
and communication channels are selected by passing around _handles_,
low-level first-class objects (typically small integers);
this makes it harder to define and enforce invariants
as to how channels may or may not be used within a given process:
any function having a handle can do anything with it,
and handles are often easy to forge;
thus you can't reason about security locally.
Houyhnhnm programming languages instead support reflection;
thus while they can express the same low-level protocols as above,
they tend to (fully) abstract over them and instead expose higher-level protocols,
where the channel discipline as well as the data discipline
are expressed as part of the types of the functions that exchange data.
Communication channel names become
regular identifiers of the programming language;
the language lets programmers use dynamic binding to control these identifiers;
and the usual type-checking and verification techniques apply
to enforce protocol invariants not limited to data format.

A second obstacle specific to explicit communication is that
to be a legitimate target to such communication,
a program must specifically implement
a server that listens on a known port,
or that registers on a common "data bus";
where this becomes really hard is that to process the connections,
the server must either possess some asynchronous event loop,
or deal with hard concurrency issues.
Unhappily, Human mainstream programming languages
have no linguistic support for decentralized event loops,
and make concurrency really hard
because side-effects in threads can all too easily mess things up.
Libraries that implement a centralized event loop are _ipso facto_ incompatible with each other;
those that rely on concurrency and a locking discipline are still hard to mix and match,
and to avoid deadlocks they require an improbable global consensus
on lock order when used by multiple other libraries.

Houyhnhnm programming languages,
like the more advanced Human programming languages
(including Erlang, Racket, Haskell, OCaml, etc.)
both support decentralized event loops
(the crucial feature being [proper tail calls](http://fare.livejournal.com/142410.html),
and for even more advanced support, first-class delimited continuations),
and make it easier by supporting well-typed concurrency abstractions
on top of a functional programming core, which is a big improvement.
But Houyhnhnm computing systems also make it possible to move these servers completely
to a separate meta-program that controls the process you communicate with;
thus the base-level process can be written as a simple program,
with a very simple semantics, easy to reason about,
without any pollution by the server and its complex and possibly incompatible semantics;
yet it is possible to tell it to invoke exported functions
or otherwise run transactions on its state,
by talking to the meta-program that controls it.

A third obstacle specific to explicit communication in Human computer systems
is the difficulty of locating and _naming_
one of those target processes available to communicate with.
Indeed, inasmuch as communication is explicit,
it requires some way to _name_ the party you want to communicate with:
a named process (in e.g. Erlang),
a numbered port or a named pipe or socket on the current machine (in e.g. Unix),
a remote port on a named machine (using TCP/IP), etc.
Implicit communication only needs to distinguish between local ports:
"standard input", "standard output", "file descriptor number 9",
"the graphical display manager" (including its cut-and-paste manager), etc.,
without having to know what or whom is connected to it on the other side.
Reading (or writing to) a file is intermediate between the explicit and implicit:
you know the name of the file, but not the identity of who wrote the file (or will read it).
Naming a port can also be considered more implicit and less explicit than naming a process.

Now, Human computer systems do not have object persistence,
so all their connections and all their names are transient entities
that must be reestablished constantly.
Human computer systems also have no notion of dynamic environment;
there is a static environment, set at the start of a process,
but it doesn't adapt to dynamic changes;
or to track dynamic changes, programs can query servers,
but then the behavior is either completely unconstrained or highly non-local.
You can try to automate this communication,
but every program has to handle a vast array of error cases.
In any case, local reasoning about dynamic properties is nearly impossible.

Houyhnhnm computing systems have persistence,
which means you can give a stable name to a stable activity,
and establish a stable connection;
they also feature dynamic binding as a language feature that can be used
to control the behavior of programs or groups of programs in a structured way.
How do they deal with transience, reconnection and unreliability at lower levels of the system?
They abstract issues away by introducing a clear distinction between base level and meta level:
the base level program is written in an algebra that can assume these problems are solved,
with persistent naming and dynamic reconnection both implicitly solved;
the meta level program takes care of these issues.
Local reasoning on small simple programs (whether at the base or meta level)
keeps the overall complexity of the system in check while ensuring robustness.


### What's in a Name? ###

At the extreme end, opposite to implicit communication,
the communication is so explicit that
the system knows exactly what's on the other side of a communication portal.
The inter-process communication can then be reduced to a static function call,
and the listening function on the other side can often itself be inlined.
And in a Houyhnhnm computing system, this may indeed happen, automatically.

Indeed, when it doesn't change very frequently, whatever is on the other side
of any communication channel can be considered locally constant;
then, whichever meta-program handles connecting the communicating parties,
whether a linker or JIT, can optimize all communication into function calls,
and function calls into more specific instructions;
it can then reduce all higher-order functions and indirections to efficient loops,
until a change in the connection or in the code invalidates these optimizations.

Of course, sometimes the optimization that makes sense goes the other way,
transforming function calls into communication with another process:
a process on a CPU might delegate computations to a GPU;
an embedded device, including a mobile phone,
might rather query a server than compute itself, etc.
Thus local CPU cycles can be saved whenever
cheaper, faster and/or more energy-efficient resources are available.
And there again, a more declarative approach allows meta-programs
to automatically pick a better strategy adapted to the dynamic program context.

In the end, factoring the code in terms of base-level and meta-level
is an essential tool for division of programming labor:
The base-level programmer can focus on expressing pertinent aspects
of the program semantics;
he can write smaller programs that are
simpler, easier to reason about, easier to compose;
they can be written in a domain-specific language, or, equivalently,
in a recognizable subset of his general-purpose language
with well-defined patterns of function calls.
The meta-level programmer can focus on implementation strategies and optimizations;
he has a relatively simple, well-defined framework to prove their correctness,
whether formally or informally;
and he can focus on the patterns he is interested in,
while leveraging the common platform for all other evaluation patterns,
instead of having to reinvent the wheel.
Thus, whether the source code for some part of an application is modular or monolithic
is wholly independent of whether the implementation will be modular or monolithic at runtime.
The former is a matter of division of labor and specialization of tasks
between programmers at coding-time;
the latter is a matter of division of labor and specialization of tasks
between hardware components at runtime.

At every level, each programmer can and must use explicit names each implicitly bound to a value,
to abstract any process, function or object that belongs to another programmer.
By hypothesis, the programmer never knows for sure what the name will be bound to —
though often that other programmer may well be the same programmer
in a different role at a different time.
Yet the overall system in time can always see all the bindings and
statically or dynamically reduce them,
efficiently combining all parts of a programs into one.
Names allow to express fixed intent in an ontology where the extent will change
(the extent being the value of a variable, or the text of a function, etc.);
they are superfluous from the perspective of a computer system,
because for a computer system any name beside memory addresses and offsets
is but a costly indirection that is better done away with;
names are important precisely because programming is part of a computing system,
where the activities of programmers require abstraction and communication
across programmers, across time, across projects, etc.


### Activity Sandboxing ###

In Houyhnhnm computing systems, proper sandboxing ensures that
activities may only share or access data
according to the rules they have declared and that the system owner agreed to.
In particular, purported
[autistic applications](/blog/2015/12/25/chapter-7-platforms-not-applications/)
are ensured to actually be autistic.
Proper sandboxing also means that the system owner isn't afraid of getting
viruses, malware or data leaks via an activity.

Unlike Human computer systems, Houyhnhnm computing systems always
run all code in a fully abstract sandbox,
as controlled by a user-controlled meta-program.
There is no supported way for code to distinguish between "normal" and "virtualized" machines.
If the system owner refuses to grant an application
access rights to some or all requested resources,
the activity has no direct way to determine that
the access was denied;
instead, whenever it will access the resource,
it will be suspended, or get blank data, or fake data from a randomized honeypot,
or a notification of network delay, or whatever its meta-level is configured to provide;
the system owner ultimately controls all configuration.
If the application is well-behaved, many unauthorized accesses may be optimized away;
but even if it's not, it has no reliable way of telling whether it's running "for real",
i.e. whether it's connected to some actual resource.

Allowing code to make the difference would be a huge security failure;
and any time a monitor in a production system
recognizes the attempt by a process to probe its environment
or otherwise break the abstraction, a serious security violation is flagged;
upon detection, the process and all its associated processes are suspended,
up to the next suitably secure meta-level;
also the incident is logged, an investigation is triggered,
and the responsible software vendor is questioned.
— Unless of course, the people responsible for the break in attempt
are the system's owners themselves, or penetration testers they have hired
to assess and improve their security, which is a recommended practice
among anyone hosting computations controlling any important actual resources.

Note that proper sandboxing at heart has
[nothing whatsoever](/blog/2015/11/28/chapter-6-kernel-is-as-kernel-does/)
to do with having "kernel" support for "containers"
or hardware-accelerated "virtual machines";
rather it is all about providing _full abstraction_,
i.e. abstractions that don't leak.
For instance, a user-interface should make it impossible to break the abstraction
without intentionally going to the meta-level.
You shouldn't be able to accidentally copy and paste
potentially sensitive information from one sandbox to the next;
instead, copy and pasting from one sandbox to another
should require extra confirmation _before_ any information is transferred;
the prompt is managed by a common meta-level below the sandboxes,
and provides the user with context about which are the sandboxes
and what is the considered content;
that the user may thus usefully confirm based on useful information
— or he may mark this context or a larger context as authorized
for copying and pasting without further confirmations.


### Protocols as Meta-level Business ###

Houyhnhnm computing systems resolutely adopt the notion that
some tasks are generally the responsibility of a series of (meta)programs
that are separate from the ones computing the results; i.e.
presenting computation results, combining communicating processes,
choosing an implementation strategy for a declarative program, etc.
Factoring out the interface at the meta level means that
each level can be kept conceptually simple. The system remains
["reasonable"](http://fsharpforfunandprofit.com/posts/is-your-language-unreasonable/),
that is susceptible to be reasoned about.
It's enough to assess the security properties only once,
abstracting away the specifics of programs using the features.

Thus, in Houyhnhnm computing systems, unlike in Human computer systems,
the robustness and timeliness of the system don't have to depend
on every application partaking in the protocol being well-behaved,
nor on every programmer working on any such application
being steadfast at all times and never making any mistake.
There can be no bugs in all the lines of code that the programmers don't have to write anymore.
And updating or extending the protocol is much easier,
since it only involves updating or extending the according meta-programs,
without having to touch the base-level applications
(unless they want to explicitly take advantage of new features).

Moving features from base-level applications to meta-level layers can be justified
with all the same arguments why "preemptive multitasking" beats "cooperative multitasking"
as an interface offered to programmers:
sentient programmers are intrinsically unreliable,
any kind of "cooperation" that relies on manually written code to abide by non-trivial invariants
in all cases will result in massive system instability.
At the same time, "cooperative" beats "uncooperative" as far as implementation is concerned;
cooperation is (and actually must be) used under the hood
to preserve any non-trivial system invariants — but it can be used automatically and correctly,
through a meta-program's code-generator.


### Embracing or Fearing The Meta ###

In Human computer systems, there are few features implemented as meta-programs;
software libraries are strictly runtime entities, and
programmers must manually follow the "design patterns" required
to properly implement the protocols supported by those libraries.
In Houyhnhnm computing systems, there are plenty of meta-programs;
and though they may have a runtime component like libraries,
they most importantly include compile-time and/or link-time entities;
and they ensure that all runtime code
strictly follows all supported protocols by construction.
The meta-programs, that display, select, extract, or watch data,
use introspection of the program's state, types and variables;
and for reasons of efficiency, they do not re-do it constantly at runtime;
yet they do keep enough information available at runtime
to recompute whatever is needed when programs change.

Changes in these meta-programs may involve recompiling or otherwise reprocessing
every base program that uses them.
This meta-processing is deeply incompatible with the traditional Human notion
of "binary-only" or "closed source" distribution of software;
but that notion doesn't exist for Houyhnhnms:
Houyhnhnms understand that
[metaprogramming requires free availability of sources](http://fare.tunes.org/articles/ll99/index.en.html).
For similar reasons, Humans who sell proprietary software see
a platform based on meta-programming as the Antichrist.

A program that comes without source is crippled in terms of functionality;
it is also untrusted, to be run in a specially paranoid (and hence slower) sandbox.
Houyhnhnms may tolerate interactive documents that behave that way;
they may accept black box services where they only care about the end-result of one-time interactions,
at the periphery of their computing systems.
But they have little patience for integrating a black-box program
into critical parts of their regular platforms;
they won't put it in a position where it has access to critical information,
or make it part of any process the failure of which could threaten the integrity of the system.
If they care about what a black-box program does,
they will spend enough time to reimplement it openly.

[//]: # (http://chrisdone.com/posts/emacs-users-are-like-igor)
