    Title: Chapter 9: Software Extensions
    Date: 2015-12-13T14:15:16
    Tags: DRAFT, Applications

I was left hungry for more information by Ngnghm's explanations of how
Houyhnhnms don't have a notion of software applications,
but instead have either interactive documents,
or extensions to a common software platform.
How do Houyhnhnm software extensions compare to the way
Humans extend applications with plugins and scripts?
How does the way Houyhnhnm compose software components compare
with the way Humans do it?
What does it mean when these extensions are meta-programs?

<!-- more -->


### Extensibility through Reflection ###

While there are a lot of autistic applications,
most applications involve some communication with other applications.
And that's the difference between Houyhnhnm and Human applications becomes obvious:
Human applications are monolithic and irreflective,
whereas Houyhnhnm applications are modular and reflective.

In a Human application, any case of communication whatsoever
must be supported by an explicitly written case in a procedure;
which requires the programmer to foresee that case of communication and support it.
This is very work intensive, and any new case requires an update
to each and every application involved.
A copy/paste protocol can often alleviate the combinatorial explosion of cases
in communication between pairs of applications:
users may then select and cut or copy some data from one application, and paste it into another.

However, this only works where each application's programmer explicitly enabled
the proper half of the protocol (copying, or pasting).
And even then, it requires user-intensive interactions
and is not suitable to automation.
Some Human computer systems support some form of Object Linking and Embedding,
whereby some of this copy and pasting effort can be automated;
but it remains an advanced feature that requires yet more programmer support,
is only usable by experts, and remains brittle
when communication happens without human supervision.

Human computer systems do their worst to erase any meta-level at runtime,
and can only deal with a fixed number of hardwired cases;
these cases become ever more numerous and complex as the applications get larger,
yet they are never sufficient.
Eventually, some slightly more "clever" Human reinvents an extensible general case,
using a protocol that badly reimplements a small _ad hoc_ subset of dynamic typing and reflection.
Thereupon, whatever static types are used in these Human computer systems
become a burden that have to be fought constantly to keep the system extensible,
deconstructing and reconstructing them
at the interface between the system and its extensibility layer.

By contrast, Houyhnhnms embrace the fact that communication between applications
is an operation at the meta-level with respect to these applications:
at heart, it is about generating the code for two applications to communicate with each other.
This code may be very simple, but will crucially depend on the two applications.
Houyhnhnm computing systems can access the meta-level at runtime and simply generate that code
based on a declarative approach,
whereby each application suitably registers its interfaces and their types.
The type-driven code generation is simultaneously simple, general, safe and fast;
programmers have almost nothing to write by hand.

Types are thus a boon and helps generate all or most of the code
without the programmers having to write anything by hand.
Not having all the general-purpose code at the base-level
also makes it much easier to reason about safety property of the code base.
Not having to reinvent the wheel badly in every application
means that it types and reflection can be invented well
once (or a handful of times) in the entire system.


### Modularity through Declarativeness ###

This communication often happens from outside the application itself:
some application exposes some data, and
the user latter copies and pastes that data into another application.
Often, the might like the data to be directly linked from one application to the next,
and the entire copy/pasting automated;
but in Human computer systems, architectural limitations often make such automated linking
either altogether possible, or too brittle to happen without human supervision.

Extensibility.
Plug-ins.
XXXX

Delivering software as components, not applications (Human closest: browser plugins)

AOP: Modularity in implementation strategies
Aspects: search.









### Sentient-Computer interface

Failure of UX Design of the programmer experience.



Not only does that make Houyhnhnm systems much simpler,
it also guarantees forever interoperability of every single piece data with any future system,
at whichever level of abstraction that data was defined.
If you want your data to remain relevant to your future self, or to be usable by other people, etc.,
you still need to wisely choose suitable algebraic data types,
to organize software into components with clean interfaces,
to pick appropriate policies that lead to suitably performant implementations,
to rely on suitable libraries.



Implementation vs expression.
Expression can be implemented at the meta-level —
but that requires explicitly distinguishing the meta-level from the base-level.
Human computer systems tend to either not allow meta-level programming,
or to conflate and confuse meta-levels.
Korzybsky: Insanity.
Confusing the thing and its representation.
Turing: universal languages wrt implementation, that can implement anything.
But unless the meta-level is universal, you cannot express everything.
And unless you actually implement other languages (DSLs),
then _in practice_, the restricted subset of your language that you actually use
is _not Turing-equivalent_.



### See ngnghm's branching reactions to a Bob Harper article
https://twitter.com/debasishg/status/1711717155811860621
https://existentialtype.wordpress.com/2011/04/16/modules-matter-most/
https://www.pathsensitive.com/2023/03/modules-matter-most-for-masses.html
Bob Harper is completely wrongheaded in identifying *modularity* and *parametric polymorphism*.

Modularity is about division of labor, and plenty of languages enable it without parametric polymorphism—trivial proof that the two are distinct.

Harper is a sad one trick pony.

Don't get me wrong, parametric polymorphism is great.

But Harper's conflation of parametric polymorphism with modularity is as brain-damaged as Java's conflation of modularity with ad hoc polymorphism.

Disgusting.

And in both cases, misleading entire generations of programmers and computer scientists into utter confusion, false beliefs, bad science, terrible designs, and countless bugs.

Bob Harper has had an outsize influence in Academia, both good and bad. His SML work is notable.

And elders in the Lisp community still remember how he took over the Lisp and Functional Programming conference to merge it into ICFP only to exclude Lisp from it.

Has the industry listened to Harper much? No.
Has academia? Lots.
[He's very well published, very well cited, was on many publication committees many of which he presided,
received rare prizes, had countless students, a great number of which are now themselves professors.]

And by confusions such as above, he greatly contributed to the miscommunication gap between FP and OO communities—thus making FP less relevant, and its industry adoption slower.

Conflating two distinct concepts only introduces confusion, introduces parasitic semantics you don't want, and extra syntax for semantics you do want.

Haskell has parametric polymorphism and doesn't confuse it with modularity.

Is Java right in conflating modules and classes?

*Even if* somehow *conflation* of two concepts is a correct design choice in some context (... and I have emphatically argued *it is* in the past, see my paper on prototype OO), *confusion* NEVER is. It is a mind-killer. And it is what Harper is doing in that post. Sad.

Bene Gesserit and Jedi masters: fear is the mind killer.

Me: "The"? No way! Confusion is another mind killer. There are plenty of ways to kill a mind.

He starts with assumptions that there should be a header file, that types are the one and only information in that header, that the semantics of using a module is one of substitution with parametric polymorphism, that racketeers agree with him about it, etc.

And then he blames others for not having the same inconsistent world-view as himself, instead of either fixing his own world-view, or helping them fix inconsistencies in their own.

Medice, cura te ipsum.

Dumb and sad.

Look, I appreciate that by inhabiting some narrow constraints with a limited domain of validity, some people can get immensely creative.

But it's profoundly dumb and sad when they start believing their assumptions are universally valid.

And it's only dumber and sadder when they become gurus with disciples who blindly repeat the misguided assumptions without inhabiting them and gaining the creativity in exchange, instead just sowing confusion and strife in the world. A closing of minds instead of an opening.
