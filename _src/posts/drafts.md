# Random ideas for future posts
    Title: Kitchen Sink
    Date: 2015-08-03T00:00:00
    Tags: DRAFT

<!--

Chapter 1: The Way Houyhnhnms Compute
Introduction, Point of View, Simplicity

Chapter 2: Save Our Souls
Persistence, Automated. Orthogonal Persistence. Fractal Transience.


Chapter 3: The Houyhnhnm Version of Salvation


Chapter 4: They live!


Chapter 5: Minding Your Turtles.


Chapter 6: Transformation


CRDTs.

What happened to your data when you incompatibly modified a program?
Could some guiding principle help predict the answers to these and other questions?


Internal control vs external control.

When writing an update operator, you can't implicitly drop the data —
the system uses linear logic to ensure that you have to *explicitly* drop the data.

having software run in multiple domains:
though Humans had several times invented "virtualization" which they were using heroic techniques
to implement in an awkward way that seemed to make people's life overall more miserable rather than less.






### Conclusion

We discussed many hours, and eventually found that we could explain
the difference in approaches by a Houyhnhnm comput_ing_ system being a _live system_
based on the premise that the system stays always on
and evolves in internal interaction between machines and programmers,
whereas Human computer systems are [_cult of dead_](http://wiki.squeak.org/squeak/2950) systems
in programs never change then die taking all their data with them,
change happening as external commands from the programmer above.

By starting from the interactions and looking for general abstractions,
Houyhnhnms are able to provide a general solution
where Humans, starting from their devices and building only up
must implement a large variety of ad hoc tools.

That is because the basic premise of Human computer systems is that
change is external to programs, that it comes from Humans above,
in a one way command-and-obey interaction;
in Human computer systems,
programs are fixed entities that never change,
and any change requires that processes running the old programs must die,
taking all their data with them, to be replaced with new programs.
In other words, Human computer systems are
[_cult of dead_](http://wiki.squeak.org/squeak/2950) systems.
By contrast, Houyhnhnm computing systems are _live systems_,
where the code is not separate from the data,
but the two evolve together in a two-way interaction
with a Sentient being who isn't above but beside them.
Once again, this basic



We discussed many hours, and eventually found that we could explain
the difference in approaches by a Houyhnhnm comput_ing_ system being a _live system_
based on the premise that the system stays always on
and evolves in internal interaction between machines and programmers,


Ngnghm was interested in understanding how Human computer systems were or weren't implementing computing domains.
I was more interested in understanding how users of Houyhnhnm computing systems were dealing with a system that never forgot anything.





Nothing in the world can take the place of persistence. Talent will not; nothing is more common than unsuccessful men with talent. Genius will not; unrewarded genius is almost a proverb. Education will not; the world is full of educated derelicts. Persistence and determination alone are omnipotent. The slogan 'Press On' has solved and always will solve the problems of the human race. — Calvin Coolidge



Sentient-Computer interface


Things we’d like to do but can’t


Easy process migration, for everything.
Everything can be debugged
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
