    Title: Chapter 1: The Way Houyhnhnms Compute
    Date: 2015-08-02T10:56:46
    Tags: Introduction, Point of View, Simplicity

Dear fellow programmer,

[I](/About.html) used to think humans wrote software the way they did
because they knew what they were doing.
Then I realized that they didn't really know,
but adopted ways that seemed to work better than others.
Or maybe rather humans were adopted
by the ways that best knew how to survive, whether they actually "worked" or not.
In any case, I trusted "evolution", that is, ultimately, _other people_,
to have figured out the best way that software could and should be written.
But everything I knew about computing changed when one day I met a
[Houyhnhnm](http://en.wikipedia.org/wiki/Houyhnhnm),
who told me how things were done in his faraway land.
He made me think in terms of computing systems rather than computer systems;
and from my newly found understanding, I could see clearly how computing systems could and should be,
that today's (mainstream) Human computer systems aren't.
But mostly, he taught me how to _think_, by myself, about computing.
And so let me take you through my story of computing enlightenment.

<!-- more -->

### Beyond the Sea of Potentiality

This adventurous Houyhnhnm, whose name was [Ngnghm](https://twitter.com/Ngnghm),
had heard of a stranger who long ago visited his home country.
So the legend said, the traveler, called
[Gulliver](https://www.gutenberg.org/files/17157/17157-h/17157-h.htm),
was a "Human": a paradoxical creature that looked just like a Yahoo,
yet who like a Houyhnhnm (to a point) possessed the ability to reason and speak.
There were fantastic tales of a planet full of such Humans,
as attributed to this Gulliver;
and the stories went that in the land of Humans,
there were animals known as "Horses" that looked just like Houyhnhnms,
but like Yahoos couldn't speak any language and were likely not fully sentient.
Ngnghm, immensely curious, had embarked on a journey of discovery
to find and visit this fantasy land of Humans and Horses, if it existed at all.
But while sailing the Sea of Potentiality, his transdimensional ship
collided with débris caused by Human (or was it Yahoo?) pollution — and he was shipwrecked.
Now he was stranded onto our plane of existence (actually a sphere).
Not being able to communicate in Human language,
he was initially mistaken for an old horse; and he had but narrowly
escaped being sent to the knacker — or worse, to a government research facility.

By the time I met him through a friend, though,
Ngnghm had already learned to read and write our language, albeit imperfectly.
He was desperately looking for parts to build a new ship,
so that he may some day sail back home.
Since I know nothing of transdimensional travel,
I instead showed him how to use the Internet
to find all the support that mankind could offer him.
He was stupefied by how similar yet how different
our Human computer systems were from those of the Houyhnhnms;
in some way, ours were so much more advanced,
yet in other ways they were so desperately primitive.
And as he was telling me of how Computing was done amongst Houyhnhnms,
I was suddenly reminded of how I had always felt that
there had to be better ways to engage in computing,
but couldn't pin point exactly what was wrong.
Now I had found a clearer vision
of a world I was yearning for — a world I felt like I had lost,
though I never had it — and a world that was within reach
if only I could build a suitable ship,
to sail the Sea of Potentiality and reach
the mysterious and enticing land of Houyhnhnm computing.

Some people have accused me of having imagined all this encounter.
But my hope is that, after reading my story,
you'll see that it is not only real but necessary,
and soon you will start telling other people what you're now imagining;
and eventually, you and I will build the ship
with which we will sail together to the land of Houyhnhnm computing.


### A Different Point of View

The fundamental difference between Human computer systems and
Houyhnhnm computing systems is one of _point of view_.
Houyhnhnms do not possess a different kind of logic, nor mathematics, nor physics;
though they have discovered how to travel through many dimensions,
they do not have quantum computers, logical oracles,
or any magic means of computation beyond our own capabilities.
But they approach computing in a way that is foreign to us Humans,
and that leads to very different results.

Whereas Humans view computers as tools below them
to which they give orders and that do their bidding,
Houyhnhnms view computing as an interaction within a system around them
that extends their consciousness.
Humans articulate their plans primarily in terms of things:
the logical and physical devices they build
(sometimes including tools to make more tools),
in the lower realms of software and hardware.
Houyhnhnms weave their conversations foremost in terms of processes:
the interactions they partake in, that they attempt to automate
(including these conversations themselves),
which always involves [wetware](https://en.wikipedia.org/wiki/Wetware_(brain)) first.
In short, Humans have _computer_ systems, Houyhnhnms have _computing_ systems.

You may dismiss all this as dreamy philosophy,
empty words without any consequences — I certainly did so at first.
Yet the difference in point of view that I am now attempting to distill
leads to systems that are organized in very different ways,
that are optimized for very different metrics,
and that engage users in very different processes,
with role delineations according to very different criteria,
resulting in a very different variety of artifacts of very different sizes,
but most importantly, connected in very different ways.
It may all be but _just so stories_, but
[stories have consequences](http://fare.tunes.org/computing/bal2009.pdf).


### Simplicity

What made me most aware of this difference was when Ngnghm
discovered that, like him in his own world, I was trained in writing software,
and then asked me to demonstrate the working of some Human computing systems,
starting with the simplest I could find.
So I showed him simple programs I was writing in C;
C is a relatively simple programming language
with a somewhat familiar syntax and well defined enough formal semantics,
but nevertheless a universal programming language capable of doing everything,
and indeed used almost everywhere that Humans have computers.
Yet, after he painfully assimilated enough of what I showed him, struggling all the way,
his conclusion was that, no, I was obviously not programming in C,
and that I couldn't possibly be programming in C,
because C was not a universal programming system at all,
but could do next to nothing, and only very inefficiently so.
Instead, what I was programming in was not just C, but
a C compilation toolchain plus an IDE and an Operating System
plus plenty of libraries and utilities, that all together
constituted a very large computing system with incredibly complex formal semantics;
what more, a large part of the interaction between these components depended on a large number of
completely informal semi-conventions about how the filesystem was or wasn't used by which process,
and how these system and user processes themselves were managed.
What to Humans looked simple because our _point of view_
focuses on some aspects and neglects others,
to the Houyhnhnms was an unmanaged and unmanageable mess
because they see things from a different angle.

What Houyhnhnms considered to be a simple system was one that has
a short description when you take into account the entire software system,
including the compiler, interactive editor, formal verification tools,
libraries, operating system, drivers, hardware blueprints, etc.,
and including the informal conventions used by isolated or cooperating users,
or the chaotic lack thereof.
C, because its underlying development environment necessitated
huge and largely informal support structures,
constituted a very complex computing system, even though
it looked small and simple once the support system was assumed.
Functional programming languages like ML or Haskell yield much simpler systems
if you take into account the verification tools and the development process;
yet they still neglected entire swaths of what makes a complete computing system,
such as IDE, Operating System, persistent storage usage conventions, schema upgrade, etc.,
and so they ended up being overall still pretty complex.

By Houyhnhnm standards, the simplest Human computing systems, though far from ideal,
would be more something like Smalltalk or the other systems
built by Alan Kay's [ViewPoints Research Institute](http://vpri.org/),
where the description for the entire system, including compiler, IDE, libraries, operating system,
drivers, interactive graphical environment, font rendering, etc.,
all fit in a few tens of thousands of lines of code.
Note that FORTH has been used to build complete systems of even smaller overall software size;
but being low-level, FORTH relies more on
informal design patterns and manually enforced limitations,
which according to Houyhnhnm criteria make the resulting system overall more complex,
especially so if multiple people are supposed to work on the same system.
Still, such simplistic systems make sense for isolated resource-starved programmers.

Houyhnhnms certainly don't restrict themselves
to using systems that are simple (according to their metric).
But these simple systems do play an essential role in the Houyhnhnm computing ecology:
first, they are an essential part of computing curricula,
so programmers can get a grasp of all the parts that make a complete system;
second, the ways to factor and evolve such systems is also studied by designers and managers
so they may think in terms of overall system architecture
(including the Houyhnhnm factor, of course);
last but not least, they are also instrumental in the bootstrapping process
by which more complex systems are built in a way that is
[auditably _secure_](http://fare.tunes.org/computing/reclaim_your_computer.html).

In any case, a change in point of view led to a completely different metric
to assess the simplicity of computing systems.
It would also change how to judge other qualities of computing systems in general
— and thus change the approach to how computing is done and what artifacts it yields.
And next on the block was something as basic as Persistence...


### Post-Scriptum: Pronounciation

How do you pronounce "Ngnghm" or "Houyhnhnm", my friends ask? Mostly, I don't.
You must realize that these are attempted transcriptions of sounds
that Houyhnhnms make with their equine mouths.
So if you've never met a Houyhnhnm, just imagine one of them whinnying
in a way that you'd transcribe like that if you had to.
Or don't. Personally, I have stopped trying to mimic the way Ngnghm neighs,
and if I have to pronounce one of these two names when talking to a friend,
I just say the initial "N." or "H.".
Importantly, though, I am careful to avoid the H-word when talking about Ngnghm and his kin:
he deeply dislikes and vehemently objects to being assimilated to these stupid creatures, Horses
— just like you probably wouldn't want to be taken for (and treated as) a Yahoo.
