    Title: Chapter 4: Turtling down the Tower of Babel
    Date: 2015-08-24T19:51:01
    Tags: Persistence, Transience, Quality, Meta, Strategies, Turtles


Ngnghm examined how manual persistence was managed underneath Human computer systems,
and contrasted with how Houyhnhnms automated its implementation.
This led him to more general remarks about the compared architectures of
Human computer systems and Houyhnhnm computing systems:
Houyhnhnm computing systems can and do go meta,
which to them is notionally _down_ (not _up_, as some Humans would have it).
Going meta allows Houyhnhm computing systems to enjoy
qualities not found in Human computer systems, that can't go meta.

<!-- more -->

### Stacked up against Quality

Ngnghm wanted to know how Humans dealt with
[manual persistence](/blog/2015/08/03/chapter-2-save-our-souls/).
He found that we were using an large quantity of mutually incompatible and often fragile "libraries"
in each of many loose categories that each implement some aspect of persistence:
"I/O", "file formats", "serialization", "marshalling", "markup languages", "XML schemas",
"communication protocols", "interchange formats", "memory layout",
"database schema", "database servers", "query languages", "object relational mapping",
"object request brokers", "foreign function interface",
and many "wrappers", "adapters" and "glue layers" to make them work together.
Indeed, some old IBM study had estimated that 30% of all application code written
was related to the basic functions of saving data and restoring it
— and at least my experience suggests that this estimate might still be valid to this day.
Houyhnhnms, like Dijkstra, regard this as a huge cost:
[if we wish to count lines of code, we should not regard them as "lines produced" but
as "lines spent": the current conventional wisdom is so foolish as to book that count on
the wrong side of the ledger.](https://www.cs.utexas.edu/~EWD/transcriptions/EWD10xx/EWD1036.html)

Unhappily, that huge cost also comes with limited benefits, because
a program can only manipulate an object
if it gets the entire large tower of libraries, the "software stack", just right,
and thus two objects built on top of incompatible "software stacks" cannot interoperate.
Costly adapters can be written to bridge between the two towers,
but this not only requires extra copying and management by programmers,
this also loses any atomicity properties of transactions between the two object systems
— and isn't accessible to casual users, who thus pain to manage their data.

Moreover, the above estimate did not include the error handling strategies when the above failed;
meanwhile, the complexity of these baroque towers incur enormous security risks.
Indeed, a lot of "layers" in these software "stacks" are written in unsafe low-level languages
for reasons of alleged "performance" or "compatibility",
whereas another (overlapping) lot of such "layers" include some complex
[manual parsing](https://www.usenix.org/system/files/login/articles/login_aug15_02_bratus.pdf)
of data going through the layer, that are as many points where attackers may inject unwanted behavior;
these many layers further interact in ways that make it nearly impossible to assess
the overall semantics of the system, much less its security properties.
As for performance, a lot of it is wasted just crossing the layers at runtime,
rather than e.g. folding them at compile-time.

This architecture in software towers is thus detrimental not only to persistence,
but also to robustness, to security, to performance, to upgradability, to maintainability, etc.,
— all the qualities that managers of Human computer development projects
often demote as being "non-functional",
because their development processes are so deeply dysfunctional,
at least from the Houyhnhnm point of view:
by neglecting as an afterthought aspects of software development
that are not directly visible through a quick test of a software artifact,
these processes ensure that those aspects cannot be addressed properly.
By contrast, Houyhnhnm computing systems
consider as primary the processes of software development and use, not the artifacts;
they thus consider the above aspects as primary properties of the overall system,
that are important to address as part of the architecture of the softwaring process.


### Meta-level Strategies

Houyhnhnms do not have any library to manage persistence;
instead, Houyhnhnms have a number of libraries to manage transience.
Indeed, persistence is a system-wide protocol, universally provided using generic strategies,
and comes for free to users and programmers alike;
they don't have to manually flush main memory buffers to mass storage any more
than they have to manually flush memory cache lines to main memory buffers,
or to manually spill processor registers to memory cache lines.
But if they care about extra performance, they can manage these things indeed,
and escape or improve the system-provided strategies.
In other words, correctness, safety, etc., come for free, and it takes extra effort
for a variable _not_ to be saved, for infinite undo _not_ to be available, etc.,
— and for extra performance to be squeezed out of otherwise working programs.
I already mentioned in [the previous chapter](/blog/2015/08/09/chapter-3-the-houyhnhnm-version-of-salvation/)
many things that you might want not to persist altogether,
or for which to only keep episodic backups.
More interesting are the cases where you may want to extend the system to more efficiently support
some data type (say, domain-specific compression),
some consensus protocol (say, a variant of the PAXOS algorithm),
some reconciliation process (say, a new CRDT),
or some resource ownership discipline (say, a variant of linear logic).
Then you want to specify a new implementation strategy for common system protocols;
and for this you usually specify a modular incremental variant
of the openly-accessible existing strategies.

Unlike what you'd use in Human computer systems,
these strategies are not merely runtime libraries that you link to,
the APIs of which programs must explicitly call —
this would require every program to be modified
any time you change a persistence strategy
(alternatively, every program would have to use very rigid virtual machine,
with either a very slow interpreter or a very expensive compiler).
Instead, persistence strategies are meta-level software modifications
that customize the implementation of the usual programming languages.
Thus, these strategies can arbitrarily instrument the code generated for existing programs,
to automatically add any required call to suitable libraries,
but also to efficiently handle any associated bookkeeping,
depending on what strategies are in the _domain_ in which the unmodified programs are run.
Updated objects may be marked, either individually, in "cards" or in "pages"
for the sake garbage collection or persistence;
counts or sets of local or remote references may be maintained;
drawing pictures may be achieved either by blitting directly to video memory
or by issuing requests to some server;
some type system may be enforced through some combination of static inference and dynamic checks;
etc.
Of course, these implementation strategies may reject requests to create or move a process
into a domain where some incompatibility exists:
the program might not pass some static type checks;
it might fail to possess appropriate permissions, or sufficient resources, etc.
Then the user or programmer may have to modify his program or try a different strategy.

Importantly, this variety of strategies is made possible because Houyhnhnm computing systems
are first-class entities abstracted from any specific implementation strategy.
Therefore, a very same process (which includes not only source program, but also running state)
may be run with different strategies —
and indeed with strategies that vary during its execution.
When you write a program, the source language you choose completely specifies allowed behavior,
and all strategies are guaranteed to preserve this behavior, no more, no less.

Of course, either at the time you start the program or later,
you may decide to constrain the process
to only use a given subset of strategies:
this actually means that you really wanted a more specific program
in a more specific language than initially declared.
Not only is that fine, that's a common and recommended way of writing programs:
always specify the program's behavior at as high-level as you can,
to make it easier to reason about it;
yet make sure the optimization strategies you require have been applied,
so the performance profile isn't surprisingly bad.
As a trivial example, the Fibonacci function would be specified
with its usual equational definition,
but would typically be annotated with a compile-time assertion
that the linear recursion recognizer has kicked in,
at which point the system guarantees that the function will be computed
in constant time for small values, and polylog time for big ones
— rather than exponential time, with a naive implementation.

Formally speaking, if you wrote a program in abstract language _A_,
and specify a given implementation _I_ of language _A_ generating code in concrete language _C_,
then you actually specified a program in language _C_.
And as long as you don't proceed to make modifications at the lower level of language _C_
that invalidate the abstraction to language _A_, then you can remove the constraint,
go back to the level of program _A_,
and later choose a different implementation _I'_ targetting language _C'_.
That's how you migrate a process from one domain to another.
(This ability to do generalized migration
also requires having formalized the notion of an implementation
such that you can interrupt and decompile a process,
including running state, and not just source code,
from its concrete implementation back to the level of abstraction
at which the user has chosen to interact with it —
but that's a topic for a future chapter.)


### Anything You Can Do I Can Do Meta

In Houyhnhnm computing systems, programs are thus persistent by default
(as well as type-safe, and safe in many other ways);
yet they can be made faster and smaller by locally dropping to lower levels of abstraction
in structured ways that preserve higher level of semantics.
This generalizes the remark made by Paul Graham that, on Lisp, as compared to other languages,
"You can get fast programs, but you have to work for them.
In this respect, using Lisp is like living in a rich country instead of a poor one:
it may seem unfortunate that one has to work so as to stay thin, but surely this is better
than working to stay alive, and being thin as a matter of course."
This doesn't mean that the default mode of operation is especially slow or wasteful of memory:
given a fixed amount of development resources,
accumulating reusable automated strategies as in Houyhnhnm computing systems
can achieve more performance than manually implementing strategies in every program
like in Human computer systems.

Indeed, manual implementation of software strategies, known in the Human computer industry as
"design patterns", is the primary source of bad quality in software:
humans are just so much worse than machines (not to mention slower and more expensive)
at applying algorithmic strategies — which notably goes against the
[Sacred Motto of the Guild of Houyhnhnm Programmers](/blog/2015/08/03/chapter-2-save-our-souls/).
(Of course, quality is _even worse_ when the underlying design patterns have not even
been recognized and their properties haven't even been semi-formalized between sentients.)
Now, errors can be made when writing the meta-program that automates the strategy —
but it's much easier to debug one simple general meta-program once
than thousands of context-specific manual instances of the pattern
that each had to precisely match the pattern in excruciating details.
What more, without automation, it's much harder to keep these myriads of instances right
as the pattern or its parameters change,
and maintenance requires all of them to be modified accordingly.
As Rich Hickey quipped, _(Design) patterns mean "I have run out of language."_

Because software strategies ultimately preserve the safe semantics of high-level languages,
they involve less code written in unsafe low-level languages,
and what low-level code is generated
can be automatically and verifiably made to preserve high-level invariants that matter for safety.
Entire classes of bugs that commonly plague Human computer systems
thus never appear in Houyhnhnm computing systems.
Of course, Houyhnhnms make many mistakes while developing their computing systems,
and the inconsistent strategies they write can cause inconsistent behavior,
with catastrophic consequences.
But virtualization ensures that these catastrophes do not escape the narrow scope
of the sandbox in which the developer is trying them;
and catastrophic effects are actually easier to detect,
so that most such bugs are faster to fix.
Subtle meta-level bugs causing delayed catastrophes, though they exist, are quite rare.
To eliminate them, the usual combination of testing and formal methods can help.
There again, generic code is usually harder to test or formalize
than a single specific instance of the code,
but much easier to test or formalize than thousands or millions of instances,
as necessarily happens when strategies are applied manually rather than automatically.

Finally, because Houyhnhnm computing systems work at the level of abstract data types,
most messaging happens with robust system-provided pairs of printers and parsers,
rather than an ever renewed collection of _ad hoc_ manual printers and parsers
for manually designed interchange languages, each introducing a renewed layer of bugs.
Indeed, in Human computer systems, the humans who "design" these interchange languages
are often unaware that they are designing languages indeed,
or in deep denial when confronted to that fact;
they thus prefer to remain ignorant of the very basics of language design,
and ever repeat all the beginners' mistakes.
In Houyhnhnm computing systems, it is understood that whatever interactions happen
between sentient beings and/or automated processes by definition constitute a language;
and while you want the overall design interaction between sentient being and machine
to happen at the highest possible level using as expressive a language as possible,
the interactions between automated processes should happen
using the highest level but least expressive language possible, so they remain easier to analyze.

Therefore, when contrasted to Human computer systems, it appears that
Houyhnhnm computing system thus achieve _better_ quality through _meta_ programming.


### Building up vs building down

Humans can only build software but _up_. Houyhnhnms can build both up _and_ down.

All computer software has to start from a given _base_:
whatever abstractions the operating system provides,
or, in absence of operating system, the "bare metal"
— which for Human computer systems is often not quite so bare these days,
with plenty of firmware, coprocessors and virtualization layers involved.
Now, Human computer systems are built by piling layers upon layers on top of this base;
and a Human operating system itself can be already considered such a tower of layers,
on top of which to build higher towers.
One limitation of Human computer systems, though, is that
to cooperate on the same data structures,
programs typically have to reuse the very exact same tower of layers.
Because each layer adds a lot of informal underspecified details,
and it is impossible to reproduce computations or assume that programs have similar enough semantics
unless they are identical from the ground up.
With this tower architecture, as with the legendary Tower of Babel,
people are divided by a confusing diversity of languages that prevent them from communicating.

Now, it is actually important to share data between different programs.
Human software developers thus onerously build _abstractions_, without system support,
so that they may save files in one format, which will hopefully be implemented
in a compatible enough way by the other program or next version of the program.
The operating system itself is such an abstraction,
trying to present a uniform view of the computer to programs that run on top of it,
despite a wild variety of underlying computers;
so are to a point various virtual machines, or programming language specifications.
So is, more trivially, the informal promise in successive versions of the "same" program
to keep working with data saved by previous versions.
Yet, any given abstraction usually has at most one sensible implementation
on any given Human computer system.

Slightly more advanced Human computer systems, using macros,
can at compile time lift the system up and add a number of layers below.
For an extreme case, some
[Common Lisp](http://www.cliki.net/screamer)
[libraries](http://quickdocs.org/hu.dwim.delico/api)
reimplement Common Lisp in Common Lisp
to add first-class multiple-entry or even serializable continuations,
so as to enable logic programming or direct-style web programming.
Some interactive development systems also instrument the virtual machine
so as to lift execution into something that allows for debugging,
with [Omniscient Debugging](http://www.drdobbs.com/tools/omniscient-debugging/184406101)
as an extreme example.
But even then, once the program is built, once the runtime has been chosen,
once the program has started running,
the system remains forever grounded on top of the chosen basis.

Houyhnhnm computer systems, by contrast,
can dynamically add new layers below a running program:
not only can you add a layer on top of any existing tower before you start using it,
you can add or replace layers below the tower, or anywhere in the middle of it,
while you are using it.
This ability to build _down_ as well as _up_ crucially relies
on processes being specified in formally well-defined high-level languages,
so that it is always clear what are the semantics to be preserved
when modifying the underlying implementation.
Therefore, Houyhnhnms don't even have a fixed notion of ground or base.
Rather than rigid towers of stone being built up,
they have living worlds that stand on an indefinite number of other living worlds,
just like the turtles of the common joke, whereby there are
[_turtles all the way down_](https://en.wikipedia.org/wiki/Turtles_all_the_way_down).
Then Houyhnhnms can lift the stack of turtles at any desired point
and add or replace some of the turtles beneath, all while the system keeps running.
Every turtle is unique, but no turtle is special.

The superficial differences between Houyhnhnm computing systems and Human computer systems
are thus the reflection of radical differences between their underlying software architectures
— that once again, derive from the initial divergence in _point of view_:
considering the entire sentient-machine processes, rather than
focusing only on the finished machine artifacts.
