    Title: Chapter 6: Kernel Is As Kernel Does
    Date: 2015-11-28T23:34:45
    Tags: Kernel, Resource Management, Abstraction, Enforcement, Security, Meta

I admitted to Ngnghm that I was perplexed by Houyhnhnm computing systems;
to better understand them, I wanted to know
what their kernels, libraries and applications looked like.
There again, he surprised me by having no notion of what I called kernel or application:
the way Houyhnhnm systems are architected leads to widely different concepts;
and for the most part there isn't a direct one-to-one correspondance between
our notions and theirs.
And so I endeavored to discover what in Houyhnhnm computing systems replaces
what in Human computer systems is embodied by the operating system kernel.

<!-- more -->

### Kernels ###

"What does an Operating System Kernel look like in a Houyhnhnm computing system?"
I asked Ngnghm.
He wasn't sure what I was calling either Operating System or Kernel.

I explained that in a Human computer system,
the kernel is a piece of software that handled the hardware resources,
and provided some uniform abstractions that isolated users
from the hardware details that varied from machine to machine and across time.
All the rest of the system is expressed in terms of those abstractions;
modern computer hardware ensures through runtime checks that
all programs beside the kernel run in a "user mode" that only sees these abstractions;
the kernel alone runs in a "kernel mode" that gives it direct access to the hardware.
The kernel can also use this hardware support to provide low-level isolation between "processes":
it allows multiple user programs to run at the same time while ensuring that
none may interfere with other programs except through said abstractions.

Ngnghm however had trouble distinguishing the kernel from any other program based on my description.
The notion of kernel, like most concepts of Human computer systems, was too artifact-oriented
and didn't fit the grid of interaction-oriented Houyhnhnm computing systems.
"What is it that a kernel _does_?" Ngnghm asked me;
when he'd know that, he could tell me how their systems implement analogous _interactions_.
And then I was at loss to distinguish exactly what kinds of interaction a kernel does
that other pieces of software don't.


### Resource Management ###

The most obvious thing a kernel does is that it manages and _multiplexes_ resources:
it takes some resources, such as CPU time, core memory, disk space, console access,
network connections, etc.;
and it makes available to multiple programs, either one after the other, or at the same time.
It ensures that each program can use all the resources it needs
without programs stepping on each other's toes and corrupting each other's state.

However, resource management cannot _define_ what a kernel is,
since plenty of other components of a computer system also manage resources:
All but the simplest programs contain a memory allocator.
A database server, or any kind of server, really, manages some kind of records.
A sound mixer, a 3D scene renderer, a Window system,
or anything worth of being called a system at all,
allow multiple entities to coexist, interact with each other, and be
perceived, modified, accessed, experienced, by the system's user.

Houyhnhnms recognize that resource management is an infinitely varied topic;
this topic cannot possibly be reduced to a fixed set of resources,
but is an inherent aspect of most programs.
When they need to explicitly deal with this aspect,
Houyhnhnms make it an explicit part of the rich algebra they use to express programs.
The simplest idiom for that is to use a proxy, a handle,
or some indirect way of naming a resource;
programs that use the resource may only go through that handle,
while only the program that manages the resource manipulates the underlying details.
More advanced idioms include using some variant of what we call
[linear logic](https://en.wikipedia.org/wiki/Linear_logic);
on some systems, linear logic can also be painfully emulated using monads.


### Access Control ###

A kernel also provides some kind of _access control_ to the resources it exposes:
for instance, you have to login as a _user_ to access the system;
then you can only access those files owned by said user,
or explicitly shared by other users.

But there again so does any system manage access to resources.
Moreover, whichever access control a Human Computer System kernel provides
is often so primitive that it's both too slow to be in any code's critical path
and yet too coarse and too inexpressive to match
any but the most primitive service's intended access policies.
Therefore, every program must either reimplement its own access control from scratch
or become a big security liability whenever it's exposed to a hostile environment.

Houyhnhnms recognize that access control too is not a fixed issue
that can be solved once and for all for all programs using a pre-defined one-size-fits-all policy.
It can even less be solved using a policy that's so simple
that it maps directly to a bitmask and some simple hardware operations.
Instead, they also prefer to provide explicit primitives in their programming language
to let programmers define the access abstractions that fit their purposes;
in doing so, they can use common libraries to express all the usual security paradigms and
whichever variant or combination the users will actually need;
and these primitives fit into the algebra they use to manage resources above.


### Abstraction ###

A Human Computer System kernel (usually) provides _abstraction_:
all programs in the system, beside the kernel itself, are _user_ programs;
their computations are restricted to _only_ be combinations
of the primitives provided by the _system_, as implemented at runtime by the kernel.
It is not possible for user programs to subvert the system
and directly access the resources on top of which the system itself is built
(or if it is, it's a major security issue to be addressed as the highest emergency).
The system thus offers an abstraction of the underlying hardware;
and this abstraction offers portability of programs to various hardware platforms,
as well as security when these programs interact with each other.
More generally, abstraction brings the ability to reason about programs
independently from the specificities of the hardware on which they will run
("abstracting away" those specificities).
And this in turn enables _modularity_ in software and hardware development:
the division of labor that makes it possible to master
the otherwise unsurmountable complexity of a complete computer system.

Now and again, abstraction is also what any library or service interface provides,
and what every programming language enforces:
by using the otherwise opaque API of the library or service,
programmers do not have to worry about how things are implemented underneath,
as long as they follow the documented protocol.
And by using a programming language that supports it,
they can rely on the compiler-generated code always following the documented protocol,
and they don't even have to worry about following it manually:
as long as the program compiles and runs, it can't go wrong
(with respect to the compiler-enforced protocols).
Abstraction in general is thus not a defining activity of an operating system kernel either;
and neither is abstraction of any of the specific resources it manages,
that are often better abstracted by further libraries or languages.

Houyhnhnms not only reckon that abstraction is an essential mechanism for expressing programs;
Houyhnhnms also acknowledge that abstraction is not reserved to a one single "system" abstraction
to be shared by all programmers in all circumstances.
Rather, abstraction is an essential tool for the division of mental labor,
and is available to all programmers who want to define the limits
between their respective responsibilities.
The program algebras used by Houyhnhnms thus have a notion of first-class programming system
(which includes programming language as well as programming runtime),
that programmers can freely define as well as use,
in every case providing abstraction.
Since they are first-class, they can also be parametrized and made from smaller blocks.

Note, however, that when parametrizing programming systems,
it is important to be able to express _full_ abstraction,
whereby programs are prevented from examining the data being abstracted over.
A fully abstracted value may only be used
according to the interface specified by the abstract variable type;
thus, unless that abstract type explicitly includes
some interface to inspect the actual value's type
or to deconstruct its value according to specific match patterns,
the client code won't be able to do any of these,
even if in the end the actual value provided happens to be
of a known type for which such operations are available.
A dynamic language may implement it through opaque runtime proxies;
a static language may provide this feature through static typing;
some languages, just like [computability logic](http://www.csc.villanova.edu/~japaridz/CL/),
may distinguish between "blind" quantifiers and regular "parallel" or "choice" quantifiers.
In any case, the fragment of code in which a full abstraction holds
is prevented from peering inside the abstraction,
even if the language otherwise provides reflection mechanisms
that can see through regular abstractions.
Of course, when turtling down the tower of implementations,
what is a completely opaque full abstraction at a higher level
may be a fully transparent partial abstraction at a lower level;
that's perfectly fine —
the lower-level, which requires proper permissions to access and modify,
is indeed responsible for properly implementing the invariants of the higher-level.


### Enforced and Unenforced Abstractions ###

There is one thing, though, that kernels do in Human computer systems
that other pieces software mostly don't do
— because they mostly can't do it, lacking system support:
and that's _enforcing_ full abstraction.
Indeed, in a Human computer system, typically,
only the operating system's invariants are enforced.
They are enforced by the kernel, and no other piece of software is allowed to enforce anything.
If a process runs as a given user, say `joe`, then
any other process running as `joe` can do pretty much what it wants to it,
mucking around with its files, maybe even its memory, by attaching with a debugger interface, etc.
If a user is allowed to debug things he runs at all (and he probably should be allowed),
then all processes running as that user are allowed, too.
Users in Unix or Windows can't create sub-users that they control,
in which they could enforce their user-defined invariants.
Any failed invariant potentially puts the entire system at risk, and
any security breach means everything the user does is affected
(which on single-user computers, means everything worthwhile on the computer).
That subsystems shall not break their own or each other's invariants
thus remains a pure matter of convention:
the kernel will not enforce these invariants at all;
they are enforced solely by myriads of informal naming conventions,
manual management by system administrators, and social pressure for software developers
to play well with software developed by others.
Any bug in any application exposed to the internet puts the entire system at risk.

There does exist a tool whereby user-defined invariants can be enforced, of sorts:
machine emulation, machine virtualization, hypervisors, containers, user-level filesystems, etc.,
allow to run an entire human machine with its own kernel.
However, except for the most costly and least powerful strategy, emulation, that is always available,
these tools are not available for casual users or normal programs;
they are heavy-weight tools that require system administrator privileges,
and a lot of setup indeed.
Still, they exist; and with these tools, companies with a large expensive engineering crew
can enforce their company-wide invariants;
they can thus enjoy the relative simplicity that comes when you can reason about the entire system,
knowing that parasitic behaviors have been eliminated,
because they are just not expressible in the [unikernels](https://en.wikipedia.org/wiki/Unikernel)
that are run inside the managed subsystems.

Houyhnhnms recognize that the invariants that ultimately matter in a computing system
are never those that underlie any "base" system;
instead, they are always those of the overall system,
the "final" applications, as experienced by users.
To them, the idea that there should be a one privileged "base" system,
with a kernel that possesses a monopoly on invariant enforcement, is absurd on its face;
the invariants of a system low-level enough to implement all the programs that users may care about
are necessarily way too low-level to matter to any user.
In Houyhnhnm computing systems, virtualization is a basic ubiquitous service
that is universally relied upon;
each activity is properly isolated and its invariants cannot be violated by any other activity,
except those that explicitly run at its meta-level.

What's more, Houyhnhnms understand that when building software components and applications,
programmers almost never want to start
from that "base" system of a low-level machine, however virtualized,
but want to start from as high-level a system as they can afford.
Therefore, Houyhnhnms have first-class notions for computing systems
and for implementing a computing system based on another computing system
(again, in terms closer to notions of a human computer systems,
a computing system includes both a programming language and a runtime virtual machine).
Which functionality is virtualized,
and which is just inherited unmodified from the lower-level system,
can thus be decided at the highest level that makes sense,
keeping the overall system simpler, easier to reason about, and easier to implement efficiently
— which is all one and the same.

Certainly, some technical enforcement cannot wholly replace social enforcement:
some invariants are too expensive to enforce through technical means,
or would require artificial intelligence to do so, which Houyhnhnms don't possess more than Humans.
But at least, Houyhnhnms can minimize the "surface of attack"
for technical defects that can possibly violate desired invariants,
by making such attacks impossible without a meta-level intervention;
and those meta-level interventions that are necessary can be logged and reviewed,
making for more effective social enforcement
as well as for general reproducibility and debuggability.


### Runtime and Compile-time Enforcement ###

In a Human computer system, The Kernel possesses a monopoly on invariant enforcement,
and only enforces a static set of invariants;
it does so by being an expensive middleman at runtime
between any two components that communicate with each other or use any hardware device.
In terms of invariant enforcement, this is simultaneously extremely unexpressive and quite expensive.

Houyhnhnm computing systems, on the other hand, have a decentralized model of invariant enforcement.
Every user specifies his invariants by picking a high-level language as the base for his semantics,
and using this language to define further computing elements and their invariants.
Most invariants can be enforced statically by the high-level language's compiler,
and necessitate no runtime enforcement whatsoever, eschewing the cost of a kernel.
When multiple components need to communicate with each other,
the linker can similarly check and enforce most invariants,
and eschew any runtime enforcement cost.

Well-behaved programming language implementations can therefore manipulate low-level buffers directly
without any copying, when producing video or sound;
the result is real-time performance without expensive runtime tricks
— or rather, performance precisely by the absence of expensive runtime tricks.
When the user requests causes a change in the circuit diagram,
the code may have to be unlinked and relinked:
thus, relinking will happen when users
add or remove a filter between the sound producers and the actual audio output,
or similarly introduce some window between graphic drawers and the actual video output.
But this relinking can happen without any interruption in the music,
with an atomic code switch at a time the buffers are in a stable state.

Certainly, any available hardware support to optimize or secure virtualization
can and will be used, wherever it makes sense.
But it isn't the exclusive domain of a One Kernel enforcing one static set of invariants.
Rather, it is part of the panoply of code generation strategies
available to compilers targetting the given hardware platform.
These techniques will be used by compilers when they are advantageous;
they will also be used to segregate computing systems that do not mutually trust each other.
But what matters most, they are not foundational system abstractions;
the computing interactions desired by the users are the foundational system abstractions,
and all the rest is implementation details.


### Bootstrapping ###

The last thing (or, depending on how you look at it, first thing)
that a Kernel does in a Human Computer System is to _bootstrap_ the computer:
The Kernel will initialize the computer, detect the hardware resources available,
activate the correct drivers, and somehow publish the abstracted resources.
The Kernel will take the system from whatever state the hardware has it when it powers up
to some state usable by the user programs at a suitable level of abstraction.

As always, between the firmware, the boot loader, The Kernel,
the initialization service manager, the applications that matter,
plus various layers of virtualization, etc.,
the task of initializing the system
is already much less centralized even in Human computer systems
than the Human "ideal" would have it.
Houyhnhnms just do away with this not-so-ideal ideal.
They consider that what matters is the state in which the system
is ready to engage in whichever actual interactions the user is interested in;
anything else is either an intermediate step, or is noise and a waste of resources
— either way, nothing worth "blessing" as "the" "base" system.
Instead, automatic snapshotting means that the time to restart a Houyhnhnm system
is never more than the time to page in the state of the working memory from disk;
only the first run after an installation or update can take more time than that.

As for the initial hardware resources, just like any resources visible in a system,
they are modeled using linear logic,
ensuring they have at all times a well-defined owner;
and the owner is usually some virtual device broker and multiplexer
that will dynamically and safely link, unlink and relink the device to its current users.
Conversely, the users will be linked to a new device if there is a change,
e.g. because hardware was plugged in or out,
or because the system image was frozen on one hardware platform and thawed on a different one.
With the ability to unlink and relink, Houyhnhnm computing systems
can thus restart or reconfigure any subsystem while the rest of the system is running,
all the while [persisting any state worth persisting](/blog/2015/08/03/chapter-2-save-our-souls/).
This is quite unlike Human computer systems,
that require you to reboot the entire system any time a component is stuck,
at which point you lose the state of all running programs.


### Polycentric Order ###

In the end, it appeared that once again,
the difference of approach between Humans and Houyhnhnms led to very different architectures,
organized around mutually incommensurable notions.
Humans think in terms of fixed artifacts;
Houyhnhnms think in terms of evolving computing processes.
My questions about some hypothetical fixed piece of software in their computing architecture
were answered with questions about some hypothetical well-defined patterns of interactions
in our computer architecture.

Houyhnhnm computing systems do not possess a one single Kernel;
instead they possess as many "kernels" as there are computing subsystems and subsubsystems,
each written in as high-level a language as makes sense for its purpose;
and the set of those "kernels" continually changes
as new processes are started, modified or stopped.
Resource management is decentralized using linear logic and meta-level brokers,
linking, unlinking and relinking.
Invariant enforcement, though it may involve runtime checks, including hardware-assisted ones,
is driven primarily by compile-time and link-time processes.
Overriding invariants, while possible, requires special privileges and will be logged;
unlike with Human computer systems, processes can't casually interfere with each other "just"
because they run with the same coarse "user" privilege.

Humans try to identify an artifact to buy or sell;
Houyhnhnms look for processes to partake in.
Humans have static understanding of relations between artifacts;
Houyhnhnms have a dynamic understanding of interactions between processes.
Humans use metaphors of centralized control;
Houyhnhnms use metaphors of decentralized ownership.
Humans think of enforcement as done by a superior third-party;
Houyhnhnms think of enforcement as achieved through mutually agreeable contracts
between equally free parties.
Humans see all resources as ultimately owned by the Central entity and delegated to users;
Houyhnhnms see resources as being used, shared or exchanged by independent processes.
I could see a lot of ways that the paradigm of Human computer systems
fit in a wider trend of patterns in which to conceive of social and political interactions.
Yet, I resisted the temptation of asking Ngnghm about the social and political context
in which Houyhnhnm computing systems were being designed;
at least for now, I was too deeply interested in figuring out the ins and outs
of Houyhnhnm computing to be bothered by a digression into these far ranging matters.
However, I did take stock that there was a lot of context that led towards
the architecture of Human computer systems;
and I saw that this context and its metaphors didn't apply to Houyhnhnm computing,
and that I needed to escape from them if I wanted to better understand it.
