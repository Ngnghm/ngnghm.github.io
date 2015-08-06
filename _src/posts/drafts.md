# Random ideas for future posts
    Title: Kitchen Sink
    Date: 2015-08-03T00:00:00
    Tags: DRAFT

<!--

Chapter 1: The Way Houyhnhnms Compute
Introduction, Point of View, Simplicity

Chapter 2: Save Our Souls
Persistence, Automated. Orthogonal Persistence. Fractal Transience.


Chapter 3: Salvation


Chapter 4: They live!


Chapter 4: Minding Your Turtles.

"Full stack" developers: yet



Chapter 5: Transformation


CRDTs.



Imaginary errors: they happen in a branch that is never merged into the "real" universe.
Or are expunged from it...
always jump into the "top" (bottom) universe and rebase reality.

Internal control vs external control.


having software run in multiple domains:
though Humans had several times invented "virtualization" which they were using heroic techniques
to implement in an awkward way that seemed to make people's life overall more miserable rather than less.



cult-of-dead


We discussed many hours, and eventually found that we could explain
the difference in approaches by a Houyhnhnm comput_ing_ system being a _live system_
based on the premise that the system stays always on
and evolves in internal interaction between machines and programmers,
whereas Human computer systems are [_cult of dead_](http://wiki.squeak.org/squeak/2950) systems
in programs never change then die taking all their data with them,
change happening as external commands from the programmer above.


Ngnghm was interested in understanding how Human computer systems were or weren't implementing computing domains.
I was more interested in understanding how users of Houyhnhnm computing systems were dealing with a system that never forgot anything.



### Many sizes fit all


Human computer systems have an inordinate amount of mutually incompatible “libraries”
meant to deal with “file formats”, “serialization protocols”, “marshalling”, “markup languages”,
“interchange formats”, “memory layout”, “database schema”, “database servers”,
“query languages”, “object relational mapping”, “foreign function interface”, etc.
In each of these categories, the offering consists in plenty of software projects,
all of them mutually incompatible and somewhat fragile.


each and every piece of data will remain forever accessible using whichever algebraic data type you used at the level of abstraction you considered appropriate. For instance, you can declare explicitly opt some computations out of your default backup policies, with less frequent snapshots that aren’t replicated as thoroughly or with as strong distributed consistency requirements as are usual.



### Adding turtles below

Hence, Houyhnhnms don’t have any library to manage persistence. Instead, Houyhnhnms have a number of libraries to manage transience.

Not only does that make Houyhnhnm systems much simpler, it also guarantees forever interoperability of every single piece data with any future system, at whichever level of abstraction that data was defined. If you want your data to remain relevant to your future self, or to be usable by other people, etc., you still need to wisely choose suitable algebraic data types, to organize software into components with clean interfaces, to pick appropriate policies that lead to suitably performant implementations, to rely on suitable libraries.

Ngnghm hadn’t noticed at first this essential transience of all data in Human computer systems. Any and all of Human data may disappear at any time without notice. To prevent or mitigate this loss, Humans have to explicitly take extraordinary steps to save all kinds of data, regularly, with rigorous discipline. Each bit of data requires its own special steps to save and sometimes much harder to restore—if by a combination of bad luck yet good preparation some Humans lost their data but possessed some form of a backup. And that there exists no imaginable mechanism to restore data in a coherent way across several software or hardware components, making the restoration of a simple terminal user’s computer a hard task, and that of an actual live service a heroic feat.

Moreover, all data was bound to disappear eventually. Not only hardware, but also software, was often expected to be used until it failed, with no regular plan to transfer data to a replacement system until it had at least started to fail. Human applications are written in an extremely fragile way, where persistence and correctness are considered “non-functional” requirements and are dealt with as an afterthought. Therefore, it is expected that applications will crash, have a race condition with other applications, experience plain old bugs, or be subject to vulnerabilities, at which point users will irremediably lose configuration or session data, documents written or data entered. (Interestingly, while it is all too easy for data you care about to be deleted, yet it is very hard to make sure that some data you want forgotten is ever completely deleted.)

# Towers and Stacks




There is undo, but usually for a single operation or small number of operations during a single session; some applications maintain history, but it is optimized for data mining by spies, and useless to recover a usable session by users.

Humans have large and complex libraries to fake persistence on top of essential transience at every level. Houyhnhnms consider persistence a basic system property at every level, and have relatively simple libraries to escape into transience where performance or fine-grained semantics (or system bootstrap) calls for it. Humans have many devices that they connect into networks, where bits are copied. Houyhnhnms have a single system that they subdivide into domains, between which data is distributed (more like [Urbit](http://moronlab.blogspot.com/2010/01/urbit-functional-programming-from.html)).


Nothing in the world can take the place of persistence. Talent will not; nothing is more common than unsuccessful men with talent. Genius will not; unrewarded genius is almost a proverb. Education will not; the world is full of educated derelicts. Persistence and determination alone are omnipotent. The slogan 'Press On' has solved and always will solve the problems of the human race. — Calvin Coolidge

Sentient, Sapient, Sophont
Computer interface




Things we’d like to do but can’t


point of view
Orthogonal persistence… by default.
Infinite undo… by default.
Easy process migration, for everything.
Everything can be debugged
Delivering software as components, not applications (closest: browser plugins)
What others have done since

Low-Level Language
LLVM

Safe programming
ATS http://www.ats-lang.org/ has dependent and linear types
Idris, Agda: dependent types
Adam Chlipala

Safe Operating System
Coq: Adam Chlipala
Sing# (Spec#): Singularity
SPIN / Promela http://spinroot.com/spin/whatispin.html
Lisp: Symbolics Genera, TI Explorer
SML: Fox, ML/OS
OCaml: OpenMirage
Haskell: hOp, House, H, Kinetic, HLVM http://stackoverflow.com/questions/6638080/is-there-os-written-in-haskell
seL4


High-level language for system programming
ATS http://www.ats-lang.org/ has dependent and linear types
Rust http://www.rust-lang.org/ have linear types

Discussion groups for programming language design
LtU http://lambda-the-ultimate.org/
fonc@VPRI http://vpri.org/mailman/listinfo/fonc

Multi-language platforms
Racket
JVM
.NET

Orthogonal persistence
Eumel.
Most applications now know to save preferences without explicitly clicking save, and keep a recoverable backup of the file being edited even without explicit saving. But it’s expensively done by the programmer just for a few specific settings and data items.
“NoSQL” databases. And SQL back on top of them.

Reversible computing
Lenses
Benjamin Pierce’s Bidirectional Programming
Omniscient Debugging (ODB, elm-lang)

Metaprogramming
Most serious languages now provide some means to metaprogram
C++ has templates
Even Haskell has quasiquotations http://scrambledeggsontoast.github.io/2014/09/28/needle-announce/

Whole-system management
some progress in this direction: virtualization, systemd, NixOS, DisNix


Differential Programming
Huet’s zippers http://en.wikipedia.org/wiki/Zipper_%28data_structure%29
http://www.informatik.uni-marburg.de/~pgiarrusso/ILC/
http://www.umut-acar.org/self-adjusting-computation


Crucial things that no one is working on

First-class implementation.
Schema upgrade in an interactive system.
Types for code+data change.
A programming language that can handle both high-level and low-level aspects. Yet, see

Appendices / Draft

Fools ignore complexity; pragmatists suffer it; experts avoid it; geniuses remove it. — Alan Perlis

Bibliography

Better Stories, Better Languages http://fare.tunes.org/computing/bal2009.pdf
http://www.willamette.edu/~fruehr/haskell/evolution.html
http://homes.cs.washington.edu/~emina/
http://okmij.org/ftp/
http://www.ugcs.caltech.edu/~weel/lispm/genera-concepts.pdf



http://snapl.org/2015/cfp.html


-->
