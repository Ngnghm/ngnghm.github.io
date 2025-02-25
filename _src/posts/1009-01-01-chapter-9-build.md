    Title: Chapter 9: Build Systems and Modularity
    Date: 2016-04-26T04:05:06
    Tags: Build, Meta, Developing, Division of Labor, In The Large, Modularity

In my various professional endeavors,
I had to deal a lot with build systems:
programs like Unix [Make](https://en.wikipedia.org/wiki/Make%20%28software%29),
Common Lisp’s [ASDF](http://common-lisp.net/project/asdf/),
or Google’s [Bazel](http://bazel.io/), but also
package managers like [rpm](https://en.wikipedia.org/wiki/RPM_Package_Manager),
[dpkg](https://en.wikipedia.org/wiki/Dpkg) or
[Nix](http://nixos.org/nix/),
with which developers describe how to build executable software from source files.
As the builds grew larger and more complex and had to fit a wider diversity of configurations,
I particularly had to deal with configuration scripts to configure the builds,
configuration script generation systems,
build extensions to abstract over build complexity, and
build extension languages to write these build extensions.
Since the experience had left me confused, frustrated, and yearning for a better solution,
I asked Ngnghm (or “Ann” as I call her)
how Houyhnhnms (or “Hunams” as I call them) dealt with these issues.
Could they somehow keep their builds always simple, or
did they have some elegant solution to deal with large complex builds?

Once again, Ann wasn’t sure what I meant, and
I had to explain her at length the kind of situations I had to deal with
and the kind of actions I took,
before Ann could map them to processes and interactions
that happened in Houyhnhnm computing systems.
And her conclusion was that
while Houyhnhnms computing systems certainly could express large builds,
they didn’t possess a “build system” separate and distinguished
from their normal development system;
rather their “build system” was simply
to use their regular development system at the meta-level,
while respecting certain common constraints usually enforced on meta-programs.

<!-- more -->

### Division of labor

From what Ann understood,
the fundamental interaction supported by what I called a build system
was _division of labor_ while _developing software_:
The entire point of it all is that large software endeavors
can be broken down in smaller pieces, such that
each piece is small enough to fit in a mindful,
and can be hacked into shape by a sentient developer.
Thus, a complex process way too large to be tackled
by any single sentient being in a single programming session,
has been reduced to a number of processes simple enough
to be addressed by one or more sentients in a large number of programming sessions.
Hence, the reach of what sentient beings can achieve through automation has been extended.

Also note this division of labor takes place in a larger process of
_developing software_:
unlike many Humans, Houyhnhnms do not think of software as a _solution_ to a “problem”,
that comes into existence by a single act of creation _ex nihilo_;
they see developing software as an interactive process
of incremental [evolution](http://fare.tunes.org/computing/evolutionism.html),
that _addresses_ on-going “issues” that sentients experience.
Sentient developers will thus continually modify, grow and shrink existing software,
in ways not completely random yet mostly not predictable —
at least, not predictable in advance by those same sentients,
who can’t have written the software before they have written it,
and have written it as soon as they have written it.

A build system is thus just a part or aspect of a larger interaction.
Therefore, a good build system will integrate smoothly with the rest of this interaction;
and a better build system will be one that further simplifies the overall interaction,
rather than one that displaces complexity
from what is somehow counted as “part of the build”
to other unaccounted parts of the overall software development process
(such as e.g. “configuration”, or “distribution”).


### Modularity

The smaller pieces into which software is broken are typically called _modules_.
A notable unit of modularity is often the _source file_,
which groups together related software definitions
(we’ll leave aside for now the question of
[what a file is or should be](/blog/2015/08/09/chapter-3-the-houyhnhnm-version-of-salvation/)).
Source files can sometimes be subdivided into smaller modules
(every definition, every syntactic entity, can be viewed as a software module);
and source files can often be grouped into ever larger modules:
directories, libraries, components, systems, projects, repositories, distributions, etc.
The names and specifics vary depending on
the programming languages and software communities that deal with those modules;
but generally, a _module_ can be composed of _submodules_ and be part of larger _supermodules_.

For a given division of software in modules to lead to effective division of labor,
modules should be such that
most changes to a module should not necessitate changes outside the module, and vice versa.
Thus, you should be able to use a module without understanding and having in mind its innards,
and you should be able to modify a module without understanding and having in mind its users.
In other words, the inside and outside of a module are separated, by some _interface_,
whether it is partially formalized or left wholly informal, that is much smaller and simpler
than the complete contents of the module itself, also called its _implementation_.
As long as module developers make no “backward-incompatible” changes to a module’s interface,
they shouldn’t have to worry about breaking things for the module users;
and as long as module users stick to the properties promised by the module’s interface,
they shouldn’t have to worry about module developers breaking things for them.

Of course, sometimes, informal interfaces or erroneous modules lead to divergent expectations
between users and developers, with a painful reconciliation or lack thereof.
Code may be moved from a module to another;
modules may be extended or reduced, created or deleted, split or fused,
used no longer or used anew, maintained or abandoned, forked or merged,
adapted to new contexts or made into counter-examples.
The division of code into modules is not static, cast in stone;
it is itself a dynamic aspect of the software development process.


### Social Roles in Module Interactions

There are four quite distinct interactions to be had with any given _module_:
authoring the module, using it (and its submodules) from another module,
integrating it together with other modules into a complete application,
or interacting as a non-technical end-user with a complete system that includes the module.
In each interaction the sentient being interacting with the system
has one of four distinct roles:

  1. _Authors_ write and modify the code (“authors” here is meant in a
    broad sense, including maintainers and contributors).

  2. _Users_ refer to the code by name while abstracting over its
    exact contents (“users” here is meant in a narrow sense, including only
    programmers of modules that use the referred module, not end-users).

  3. _Integrators_ assemble a collection of modules into an
    overall application, set of applications, virtual machine image, or
    other deliverable (“integrators” here is meant in a broad sense,
    including developers who put together their development environment).

  4. _End-Users_ use a software assembly while remaining blissfully unaware
    of the complex techniques and many modules that had to be mobilized
    to make their experience possible.

Note that for the purpose of his own applications,
as well as for his personal testing needs, a same person may (or may not) be
an _author_ of some modules, a _user_ of other another set of modules
an _integrator_ of various sets of modules into one or several different assemblies
(including his own personal development environments),
and an _end-user_ of many applications made of as many sets of modules.
It is also possible to be none of these, or one and not the other:
A person may delegate his authoring, using, integrating and end-using of software
to other more qualified or daring people.

Importantly, one author’s or integrator’s choice of which sets of which modules to use
in which specific version does not and cannot bind anyone else’s.
Some misguided build systems confuse authors and integrators, and force authors
to specify exact versions of other modules their modules will use;
but actual integrators will have to deal with security emergencies, bug fixes,
missing features and module updates;
they cannot wait for every author of every module in every integration
to partake in a successful and timely consensus
on which coherent set of all modules to use.
If anything, any consensus on a coherent set of modules should happen
_after_ the set is defined then successfully tested
(as with [Quicklisp](https://quicklisp.org/)),
and not as a prerequisite to even trying to test modules together
(as used to be the case with [Hackage](https://hackage.haskell.org/)).

In any case, understanding the distinction between these four roles
is essential when designing module systems,
build systems, module naming conventions,
versioning conventions and version constraints specifications,
or any software supposed to deal with modularity:
if it fails to serve one or more of the roles, or requires
a person having a role to specify information
that only people with other roles may know,
then it is a deeply dysfunctional design.


### Pure Functional Reactive Programming

Given this context, a good build system at heart is a _Pure_
[_Functional Reactive Programming_](https://en.wikipedia.org/wiki/Functional_Reactive_programming)
(FRP) language: its input signals are
source files in the version control system and intermediate outputs,
and its output signals are intermediate or final build artifacts.
Computations from inputs to outputs constitute a _build graph_:
a directed acyclic graph where individual nodes are called _actions_,
and arcs are called _dependencies_. The signals are called _artifacts_,
and, by extension, the inputs to the action that generate one of them
are also called its dependencies.

Actions in a good build system happen without side-effects:
no action may interfere with another action, even less so
with event sources outside the declared inputs.
Actions are thus _reproducible_.
Thence it follows that they can be parallelized and distributed,
and their results can be cached and shared.
A good build system is thus integrated with the version-control system
that manages the changes in source files and
the deployment systems that controls the changes in running artifacts.
By analogy with content-addressed storage
where the name for a file is the digest of its contents,
the cache of a good build system can then be said to be _source-addressed_:
the name of a file is a digest of source code
sufficient to rebuild the cached value.

For the sake of reproducibility, a good build system must therefore be
_hermetic_: when designating and caching a computation,
the system takes into account _all_ inputs necessary and sufficient
to reproduce the computation;
no source file outside of source-control should be used,
even less so an opaque binary file, or worst of all,
an external service beyond the control of the people responsible for the build.
Thus, when caching results from previous builds,
there won’t be false positives whereby some relevant hidden input has changed
but the build system fails to notice.

Ideally, all computations should also be _deterministic_:
repeating the same computation on two different computers at different times
should yield equivalent result.
Ideally that result should be bit for bit identical;
any noise that could cause some discrepancy should be eliminated
before it happens or normalized away after it does:
this noise notably includes timestamps,
PRNGs (unless with a controlled deterministic initial state),
race conditions, address-based hashing, etc.
To make this easier, all (or most) metaprograms should be written
in a language where all computations are deterministic _by construction_.
For instance, concurrency if allowed should only be offered
through _convergent_ abstractions that guarantee that
the final result doesn’t depend on the order of concurrent effects.


### Demanding Quality

Computing power is limited, and it doesn’t make sense to rebuild
further artifacts from defective pieces known to fail their tests;
therefore, computation of artifacts generally follows a _pull_ model
where computations happen lazily when demanded by some client reading
an output signal, rather than a _push_ model where computations happen
eagerly everytime an input signal changes: the model is thus
[Reactive Demand Programming](https://awelonblue.wordpress.com/).

Now, quality assurance processes will pull in new changes as often as
affordable; and when they find errors they will automatically use a
binary search to locate the initial failure (unless and until issues
are fixed). A good build system includes testing, and supports the
release cycle of individual modules as well as their integration into
larger module aggregates and ultimately entire running production
systems.

Because of those cycles are out of sync, the source control system
must enable developers to create branches for individual modules,
assemble them into branches for larger modules, for entire subsystems
and applications, for the complete system. Of course, inasmuch as user
feedback from (publicly or privately) released software is required to
get a feature exactly right, the length of the
[OODA loop](https://en.wikipedia.org/wiki/OODA_loop) determining how
fast quality can improve in a software development process is the
duration from feature request or bug report to user report after use
of the released feature, not the distance between two releases. Closer
releases can pipeline multiple changes and reduce latency due to the
release process itself, but don’t as such make the overall feedback
loop shorter. In other words, the release process introduces latency
and granularity in the overall development loop that adds up to other
factors; the delays it contributes can be reduced, but they will
remain positive, and at some point improving the release process as
such cannot help much and other parts of the development loop are
where slowness needs to be addressed.


### Dynamic, higher-order, staged evaluation

By examining the kinds of interactions that a build system is meant to
address we can identify some of the features it will sport as a
[_Reactive Programming_](https://en.wikipedia.org/wiki/Reactive%20programming)
system and as a programming system in general.

The build graph is the result from evaluating build files, and on many
build systems, also from examining source files. These files
themselves are signals that change with time; and their build recipes
and mutual relationships also change accordingly. Yet the names
of the inputs and outputs that the builders care about are often stable
across these changes. Therefore, considering the build as a FRP
system, it is one with a _dynamic_ flow graph that changes depending
on the inputs.

Now, building software happens at many scales, from small programs to
entire OS distributions. When the build gets very large and complex,
it itself has to be broken down into bits. A bad build system will
only handle part of the build and introduce some impedance mismatch
with the other build systems necessarily introduced to handle the
other parts of the build that it is incapable to handle itself. A good
build system will scale along the entire range of possible builds and
offer _higher order_ reactive programming where the build information
itself in its full generality can be computed as the result of
previous build actions. In particular the build system can be
“extended” with the full power of a general purpose programming
language, and for simplicity and robustness might as well be
completely implemented in that same language.

Now, intermediate as well as final build outputs are often programs
that get evaluated at a later time, in a different environment that
the build system needs to be able to describe: for these programs may
need to refer to programming language modules, to entities bound to
programming language identifiers or to filenames, where the module
names, identifiers and file names themselves might be computed build
outputs. Therefore, a build system in its full generality may have to
deal with first-class namespaces and environments, to serve as seeds
of evaluation in first-class virtual machines. This means that a good
build system supports a general form of _staged evaluation_. And not
only can it manipulate quoted programs for later stages of evaluation,
but it can also actually evaluate them, each in their own isolated
virtualized environment (to preserve purity, determinism, hermeticity,
reproducibility, etc.).

Yet, a good build system will automatically handle the usual case for
tracking the meaning of identifiers and filenames across these stages
of evaluation with minimal administrative overhead on the part of the
build developers. In other words, a good build system will manage
_hygiene_ in dealing with identifiers across stages of evaluation,
notably including when a program is to refer to files created in a
different (earlier or later) stage of evaluation! Simple
text-substitution engines are not appropriate, and lead to aliasing,
complex yet fragile developer-intensive context maintenance, or manual
namespace management with various unexamined and unenforced
limitations.


### Building In The Large

Humans often start growing their build system
[_in the small_](https://en.wikipedia.org/wiki/Programming_in_the_large_and_programming_in_the_small),
so it initially is only designed to work (at a time) only on one
module, in one company, out of one source repository.
They thus tend not to realize the nature of the larger build of software;
they cope with the complexities of a larger build separately in each module
by having it use some kind of configuration mechanism:
a `./configure` script, sometimes itself generated by tools like `autoconf`,
that may use _ad hoc_ techniques to probe the environment
for various bits of meta-information.
However, these solutions of course utterly fail as systems get built
with hundreds or thousands of such individual modules, where
each build-time configuration item contributes to
a combinatorial explosion of configurations and
superlinear increase in the amount of work for each
developer, integrator, system administrator or end-user
who has to deal with this complexity.

Humans then create completely separate tools for those larger builds:
they call these larger builds “software distributions”,
and these tools “package managers”. The first modern package managers, like
[rpm](https://en.wikipedia.org/wiki/RPM_Package_Manager) and
[dpkg](https://en.wikipedia.org/wiki/Dpkg),
pick a single compile-time configuration and try to guide the end-users
through a restricted number of runtime configuration knobs
while leaving advanced system administrators able to use
each “package”’s full configuration language.
But administrators who manage large installations with many machines
still have to use tools on top of that to actually deal with configuration,
all the while being susceptible to discrepancies manually introduced
in each machine's configuration.

More advanced package managers, like [Nix](http://nixos.org/nix/),
its variant [Guix](https://www.gnu.org/software/guix/),
or its extension [Disnix](https://nixos.org/disnix/) or
[NixOps](https://nixos.wiki/wiki/NixOps), lets administrators direct
the entire build and configuration of one or many machines
from one master configuration file, that can import code from other files,
all of which can all be kept under source control. Systems like that are
probably the way of the future, but the current incarnations still
introduce a gap between how people build software _in the small_ and
how they build it _in the large_, with a high price to pay to cross that gap.

Houyhnhnms understand that their build systems have to scale, and can
be kept much simpler by adopting the correct paradigm early on:
in this case, FRP, etc.
Humans have a collection of build systems that don’t interoperate well,
that each cost a lot of effort to build from scratch yet ends up under powered
in terms of robustness, debuggability and extensibility.
Houyhnhnms grow one build system as an extension to their platform, and
with much fewer efforts achieve a unified system that inherits from the rest of
the platform its robustness, debuggability and extensibility, for free.


### Global Namespace

When you start to build _in the large_, you realize that
the names people give to their modules constitute a _Global Namespace_,
or rather, a collection of global namespaces, one per build system:
indeed, the whole point of module names is that
authors, users and integrators can refer to the same thing
without being part of the same project,
without one-to-one coordination,
but precisely picking modules written largely by other people
whom you don’t know, and who don’t know you.
Global namespaces enable division of labor on a large scale,
where there is no local context for names.
Each namespace corresponds to a _community_ that uses that namespace
and has its own rules to avoid or resolve any conflicts in naming.

Thus, for instance, when Humans build Java software in the small,
they deal with the hierarchical namespace of Java packages;
and when they build it in the large, they _also_ deal
with the namespace of maven jar files.
In Common Lisp, they first deal with the namespace of symbols and packages,
then with that of hierarchical modules and files within a system, and
finally with the global namespace of ASDF systems.
In C, there is the namespace of symbols, and
the namespace of libraries you may link against.
But in the larger, beyond all these languages’ respective build systems,
there is the namespace of packages managed by
the “operating system distribution”
(whether via `rpm`, `dpkg`, `nix` or otherwise),
and the namespace of filesystem paths on each given machine.
Note how all these many namespaces often overlap somewhat,
with more or less complex partial mappings or hierarchical inclusions
between them.

The name of a module carries _intent_ that is supposed to remain
as its _content_ varies with time or with configuration.
Humans, who like to see _things_ even where there aren’t,
tend to look at intent as a platonic ideal state
of what the module “should” be doing;
but Houyhnhnms, who prefer to see _processes_, see intent as a
[Schelling point](https://en.wikipedia.org/wiki/Focal%20point%20%28game%20theory%29)
where the plans of sentient beings meet with the fewest coordination issues,
based on which they can divide their own and each other’s labor.

Note that a name, which denotes a fixed _intent_, may refer to varying _content_.
Indeed, the entire point of having a name is to abstract away from those changes
that necessarily occur to adapt to various contingencies as the context changes.
Even if a module ever reaches its “perfect” ideal, final, state,
no one may ever be fully certain when this has actually happened,
for an unexpected future change in its wider usage context
may make it imperfect again and it may still have to change due to “bitrot”
(the Houyhnhnm name for which would better translate to “fitrot”:
the bits themselves don’t rot, though it makes for an amusing paradoxical expression,
it is the fitness of those bits that degrades as the context evolves).

Not only will content vary with time, an intent may deliberately name
some “virtual” module to be determined from context
(such as the choice of a C compiler between `gcc`, `clang` or `tcc`, etc.).
In this and other cases, there may be mutually incompatible modules,
that cannot be present in a same build at the same time
(for instance, `glibc`, `uclibc`, `musl` and `klibc` are mutually exclusive
in a same executable, and so are `libgif` and `libungif`).
And yet, a “same” larger build may recursively include
multiple virtualized system images
that are each built while binding some common names to different contents:
for instance, as part of a same installation, a boot disk might be generated
using the lightweight `uclibc`
whereas the main image would use the full-fledged `glibc`.

A good build system makes it easy to manage its global namespaces.
To remain simple, it will not unnecessarily multiply namespaces;
instead it will leverage existing namespaces and their communities,
starting with the namespace of identifiers in the FRP language;
it will thus hierarchically include other namespaces into its main namespace,
and in particular it will adequately map its namespaces
to the filesystem or source control namespaces, etc.


### Out of DLL Hell

When building _in the large_, you have to integrate together
many modules that each evolve at their own pace.
Unhappily, they do not always work well together.
Actually, most versions of most modules
may not even work well by themselves:
they do not behave as they are intended to.

One naive approach to development is
to let each module author be his own integrator,
and have to release his software with a set of other modules
at exact versions known to work together with it.
Not only is it more work for each author to release their software,
it also leads to multiple copies of the same modules being present on each machine,
in tens of subtly different versions.
Precious space resources are wasted;
important security bug fixes are not propagated in a timely fashion;
sometimes some software uses the wrong version of a module;
or multiple subtly incompatible versions get to share the same data
and corrupt it or do the wrong thing based on it.
This is called _DLL hell_.

Proprietary software, such as Windows or macOS, encourages this hell,
because they make any coordination impossible:
each author is also an integrator and distributor — a vendor.
And vendors have to deal with all the active versions of the operating system,
but can’t rely on the end-user either having or not having installed
any other software from anyone else.
A few vendors might coordinate with each other, but
it would be an overall liability where the modest benefits in terms of sharing space
would be dwarfed by the costs in terms of having to significantly complexify your release process
to synchronize with others,
without saving on the overall costs of being a vendor or
of being able to promise much additional reliability
to users who install any software from a vendor outside the cartel.

Free software, by decoupling the roles of author and integrator,
make it possible to solve DLL hell.
Authors just don’t have to worry about integration,
whereas integrators can indeed gather software from all authors
and beat it into shape as required to make it work with the rest of the system.
Integrators can also manage the basic safety of the system,
and even those remaining proprietary software vendors have
less to worry about as most of the system is well-managed.

Houyhnhnms understand that software is better built
not just from source code, but from source control.
Indeed they reject the Human focus on
a static artifact being build from source that can be audited,
and instead insist on focusing on
the dynamic process of continually building software;
and that process includes importing changes, making local changes,
merging changes, sending some improvements upstream, and auditing the changes, etc.

They thus realize that whereas a module name denotes a global _intent_,
the value it will be bound to reflects some local context,
which is characterized by the set of branches or tags that the integrator follows.
Within these branches, each new version committed says
“use me, not any previous version”;
but then branches are subject to filtering
at the levels of various modules and their supermodules:
a module that doesn’t pass its test doesn’t get promoted to the certified branch;
if a module does pass its tests, then supermodules containing that module
can in turn be tested and hopefully certified, etc.
Now note that, to solve the DLL hell, modules present in several supermodules
must all be chosen at the same version;
therefore, all tests must happen based on a coherent snapshot of all modules.

This approach can be seen as a generalization of
Google’s official strategy of “building from HEAD”,
where what Google calls “HEAD” would be
the collection of branches for modules that pass their unit tests.
In this more general approach,
“HEAD” is just one step in a larger network of branches,
where some development branches feed into HEAD
when they pass their narrow unit tests, and
HEAD feeds into more widely tested integration branches.
The testing and vetting process can be fully automated,
tests at each level being assumed sufficient
to assess the quality of the wider module;
actually, from the point of view of the process,
manual tests can also be considered part of the automation,
just a slow, unreliable part implemented in wetware:
_from a programmer’s point of view, the user is a peripheral that
types when you issue a read request._ (P. Williams).


### Code Instrumentation

To assess the quality of your tests, an important tool is _code coverage_:
code is instrumented to track which parts are exercised;
then after running all tests, you can determine that some parts of the
code weren’t tested, and improve your tests to cover more of your
code, or to remove or replace redundant tests that slow down the
release process or over-constrain the codebase. Some parts of the
code might be _supposed_ not to be tested, such as cases that only
exist because the type system can’t express that it’s provably
impossible, or redundant protections against internal errors and
security vulnerabilities; a good development system will let
developers express such assumption, and it will, conversely, raise a
flag if those parts of the system are exercised during tests.

Sometimes, proofs are used instead of tests; they make it possible to
verify a property of the code as applies to an infinite set of
possible inputs, rather than just on a small finite number of input
situations.  Coverage can also be used in the context of proofs, using
variants of relevance logic.

Interestingly, a variant of this coverage instrumentation can be used
to automatically track which dependencies are used by an action (as
[vestasys](http://www.vestasys.org/) used to do). In other words,
dependency tracking is a form of code coverage at the meta-level for
the build actions. A developer can thus “just” build his code
interactively, and automatically extract from the session log a build
script properly annotated with the dependencies actually used.
Assuming the developer is using a deterministic dialect (as he should
when building software), the instrumentation and tracking can even be
done after the fact, with the system redoing parts of the computation
in an instrumented context when it is asked to extract a build script.

Instrumenting code on demand also offers solution for debugging.
When a build or test error is found, the system can automatically re-run
the failing action with a variant of the failing code generated with
higher instrumentation settings, possibly
[omniscient debugging](http://www.drdobbs.com/tools/omniscient-debugging/184406101),
enabled shortly before the failure. The developer can then easily
track down the chain of causes of the failure in his code.
Now, omniscient debugging might be too slow or too big for some tests;
then the developer may have to start with instrumentation at some coarse
granularity, and explicitly zoom in and out to determine with more
precision the location of the bug. There again, using deterministic
programming languages means that bugs are inherently reproducible, and
tracking them can be semi-automated. Separating code and debug
information can also make caching more useful, since code once
stripped of debugging information is likely to be more stable than
with it, and thus a lot of code won’t have to be re-tested just
because a line of comment was added.

Finally, “hot-patching” is a form of code instrumentation that is essential
to fix critical issues in modules that one doesn’t maintain, or even that one maintains,
but have different release cycles than the other modules or integrations that use them.
Thus, one will not have to do emergency releases, or worse, forks and uses of forks and branches,
followed by complete builds from scratch of entire software distributions to
issue emergency fixes to security alerts or blocking problems.
While hot-patching is rightfully regarded as a very bad permanent solution,
it is wonderful as a readily available venue for temporary solutions:
Hot-patching effectively *decouples* the release cycle of
multiple pieces of software—a necessity for large systems.
Developers need never be blocked by slow compilation,
a release cycle (their own or someone else’s)—or worse,
by the difficulty of searching for a perfect solution or negotiating a mutually acceptable one.
Just do it!
Ecosystems without hot-patching just *cannot* scale—or end up reinventing it
in ugly low-level ways with coarser granularity without language support:
at the very worst, special system upgrade tools will reboot the entire machine
after upgrading libraries;
these tools must first wait for the entire distribution to rebuild,
or introduce subtle occasional breakage due to library mismatches;
sometimes installations and configurations end up stuck in bad states,
and devices get “bricked” after an internal or external system service becomes unavailable.


### The Elusive Formalization of Modularity

The entire point of a “module” and its “interface” is
to isolate module usage from module authoring,
so that users need not know or understand the implementation details,
and authors may indeed change those details without users having to know or change their code.
This property of modules was once dubbed “information hiding” by some humans,
an atrocious name that evokes someone preventing someone else from knowing,
when no such thing happens, and the software might be all open source.
Modules do not solve a problem of information to show or hide,
but of responsibilities to negotiate, of incentives to align.
The problem they solve is not logical, but *social*.

(Interestingly, the social aspect is valid even when there is a single programmer,
with no other collaborator, albeit one with a limited mind:
to build programs larger than fit in his mind at once,
the programmer must still negotiate between the many occurrences
of his single “self” across time,
each being able to hold but limited amount of information in active memory,
so that each module fits with the interfaces it depends on in a single mindful.)

Functional programmers sometimes try to identify modularity with functional abstraction,
with linguistic notions of modules (whether first-class or not) as records with existential types,
which can indeed internalize the notion of modularity.
Object-Oriented programmers may “just” identify “modules” with “classes”, that do as well.
But modularity happens with or without internal notions of module and interface in a language;
and sometimes modularity happens by working *around* such internal notions,
when they don’t fit the social reality.
For instance, in the ubiquitous language C in which most human software “interfaces” are written,
there is no internal entity for either an interface or a module;
there are “header file” handled externally by a preprocessor,
subject to various linguistic and extra-linguistic conventions,
and have no internal representation and no language-enforced one-to-one mapping
to either individual files, or “libraries”, or the recent notion of “namespace”.
Even in OCaml where every file is a “module”, or in Java where every file is a “class”,
a “library” is an informal collection of such modules, that has no internal entity;
the internal abstraction mechanism is defeated
by exporting identifiers for testing, debugging or instrumentation purposes;
and inasmuch as a file may conform to an internal “interface” entity,
that entity is used once and only once, for that file,
and provides no actual meaningful “abstraction”.

Attempts to identify modularity with the use of internal language entities
miss the point that modularity is first and foremost *meta-linguistic*.
In any language, the actual “interface” is the semi-formal datum of
whatever “identifiers” (or “handles” of any kind) are defined and made visible
by a “module”, together with the types or shapes through which
these identifiers can be used, and a lot of informal documentation,
tests and examples that explain how to use the functionality inside.
Beyond any notion of module “internal” to the language, there will also be
external instructions for how to download, install, import, use, deploy and
configure the “module” outside of the language itself, which may further depend
on which “system”, “platform” or “distribution” the developer uses.
Internal notions of “modules”, while they might be useful,
are never either sufficient nor necessary for actual modularity.

Most of the time, within a given “program”, “application”, “system”,
“deployment”, “configuration”, or whatever unit of development
a given developer works in, there will be a single module implementing
each interface at stake, whether internal or external to the language.
Any “abstraction” achieved through modularity, wherein a given interface
is actually implemented multiple times by different modules,
seldom if ever happens within a program, and instead happens *across* “programs”:
different “programs”, different “versions” of the same “program”,
different “deployments” of a same “application”,
different “configurations”, used by different people, or
by the same developer in different roles at different times, etc.
In any given internal state of a program as seen by a language processor
or evaluator, the modularity is devoid of such abstraction;
modularity takes place externally to the language,
between the many states of many programs.

Attempts by some researchers to “measure” the utility or impact of modularity
by examining snapshots of source trees of software projects,
are thus doomed to bring nonsensical results.
The relative utility or disutility of modularizations
(ways to organize software into modules) relates to all those variations
that happen across source trees in time (as the software evolves) and
in space (multiple different uses of the software by same or different people).
On the cost side, has effort been saved through division of labor?
Has there been much sharing of code, and did it cost less
than for each developer to make his own variant?
On the benefit side, has modularization enabled software
that was not possible or affordable before?
Have developers been able to specialize in their tasks
and go further and deeper in topics they could not have explored as much?
Have new configurations of software been made possible?
Has the division in modules inspired new collaborations and created synergies,
or have they shut down creativity, diverted energy, and introduced friction?

Answers about the costs and benefits of modularization, as well as
of any software development techniques, require *economic reasoning*
about opportunity costs, comparing one universe to alternate potential universes
where different techniques are used.
And it is [a fallacy](http://fare.tunes.org/liberty/economic_reasoning.html)
to claim any *accounting* of what happened within a single universe
can yield any conclusion whatsoever about that *economic* reality.
Also, it is not usually possible to run repeatable experiments.
Even “natural experiments” where different teams use different techniques
involve different people with different abilities
and thousands of confounding factors;
if a same team develops the “same” software twice (which few can afford),
the two variants are still different software with many different choices,
and even the team learns as it develops and doesn’t actually stay the same.

Yet lack of measurable experiments doesn’t mean that informed guesses
are impossible. Indeed, many developers can quite predict beforehand
that a particular factorization will or won’t,
or agree after the fact that it did or didn’t.
But those guesses are not objective, and only stay relevant
because those who make them have *skin in the game*.
When developers disagree—they may part ways,
fork the code (or rewrite it from scratch),
and each use different modules and interfaces.
Software development has an intrinsically entrepreneurial aspect
as well as a community-building aspect.
Not every formula works for everyone, and many niche ecosystems
will form, grow and wither, based on many choices technical and non-technical.


### Reinventing the Wheel and Making it Square

At that point, it may become obvious that
what we’ve been calling “a good build system” has
all the advanced features of a complete development system, and more:
It includes features ranging from a reactive programming core
to general purpose extension languages
to control support for targets in arbitrary new programming languages
or mappings between arbitrary namespaces.
It has higher-order structures for control flow and data flow,
staged evaluation with hygiene across multiple namespaces.
It supports meta-linguistic modularity at various granularities
in tight cooperation with the source control system.
It has a rich set of instrumentation strategies
used while building, testing and deploying programs.
It scales from small interactive programs within a process’ memory
to large distributed software with a global cache.
It encompasses entire software ecosystems, wherein the “same” pieces of software
evolve and are used by many people in many different combinations and configurations.
How can such a thing even exist?

Human programmers might think that such a system
is a practical impossibility,
out of reach of even the bestest and largest software companies,
that can’t afford the development of such a software Behemoth —
and indeed demonstrate as much by their actual choice of build systems.
So Human programmers would typically set their expectations lower,
whenever they’d start writing a new build system,
they would just pick one more of the properties above
than the competition possesses, and
develop around it a “minimal viable product”,
then keep reaching for whichever low-hanging fruits
they can reach without any consideration for an end goal.
Admittedly, that’s probably the correct approach
for the pioneers who don’t yet know where they tread.
But for those who come after the pioneers,
it’s actually wilful blindness, the refusal to open one’s eyes and to see.

Human programmers thus devise some _ad hoc_ Domain Specific Language (DSL)
for build configuration; this language can barely express simple builds,
and the underlying execution infrastructure can barely build incrementally,
either through timestamps (like `Make`)
or through content digests (like `Bazel`).
Then, Humans painstakingly tuck new _ad hoc_ DSLs and DSL modifications
to it to support more advanced features:
they add a string substitution preprocessing phase or two to `Make`,
or an extension mechanism or two to `Bazel`;
they call external programs (or reimplement them internally) to extract
dependency information from programs in each supported language; etc.
However, because each feature is added without identifying
the full envelope of the interactions that their system ought to address,
each new feature that Humans add introduces its own layer of complexity
and badly interacts with past and future features,
making further progress exponentially harder as the product progresses.
Humans thus tend to reinvent the wheel all the time, and
most of the time they make it square — because
they are not wheel specialists but in this case build specialists
looking for an expedient that happens to be wheelish.

Houyhnhnms have a completely different approach
to developing a build system (or any software project).
They don’t think of build software as a gadget separate
from the rest of the programming system,
with its own evaluation infrastructure,
its own _ad hoc_ programming languages;
rather it is a library for meta-level build activities,
written in an appropriate deterministic reactive style,
in the same general purpose programming language as the rest of the system.
At the same time, most build activities are actually trivial:
one module depends on a few other modules,
the dependency is obvious from a cursory look at the module’s source;
and it all can be compiled without any non-default compiler option.
But of course, the activities are only trivial
after the build infrastructure was developed,
and support for the language properly added.

Thus, Houyhnhnms also start small (there is no other way to start),
but early on (or at least some time after pioneering new territories
but before going to production on a very large scale)
they seek to identify the interactions they want to address,
and obtain a big picture of where the software will go.
Thus, when they grow their software, they do it in ways
that do not accumulate new complexity, but instead
improve the overall simplicity of the interaction,
by integrating into their automation aspects
that were previously dealt with manually.

Also, what counts as “small” or
[“simple”](/blog/2015/08/02/chapter-1-the-way-houyhnhnms-compute/) to Houyhnhnms
is not the same as for Humans:
as [previously discussed](/blog/2015/12/25/chapter-7-platforms-not-applications/),
Houyhnhnms do not write “standalone programs”, but
natural extensions to their programming platform.
Therefore each extension itself is small,
but it can reuse and leverage the power of the entire platform.
Thus, Houyhnhnms do not need to invent new _ad hoc_ programming languages
for configuration and extension,
then face the dilemma of either investing a lot in tooling and support
using these languages or leave developers having to deal with
these aspects of their software without much tooling, if at all.
Instead, they refine their “normal” programming languages, and
any improvement made while working on the “application”
becomes available to programs at large, whereas in the other way around
any improvement made available to programs at large
becomes available when modifying the application
(in this case, a build system).

Consequently, a Houyhnhnm develops a build system by making sure
his normal language can express modules in arbitrary target languages,
programmable mapping between language identifiers and filesystem objects,
pure functional computations, determinism,
reactive programming paradigm with push and pull, dynamic execution flow,
higher-order functions, virtualization of execution,
staged evaluation, hygiene, etc.
Not all features may be available to begin with;
but growing the system happens by enriching the normal programming language
with these features, not by building a new minilanguage
from scratch for each combination of feature whereby
build programs won’t be able to interoperate when new features are added.

Another advantage of the Houyhnhnm platform approach is that
since programming language features are themselves largely modular,
they can be reused independently in different combinations
and with future replacements of other features.
Thus, if you realize you made a design mistake,
that you can improve some feature at the cost of some incompatibility, etc.,
then you don’t have to throw away the entire code base:
you can reuse most of the code, and you might even build bridges
to keep supporting users of the old code until they migrate to the new one,
while sharing a common base that enforces shared invariants.
Thus, for instance you might start with a system
that does not provide proper hygiene, add hygiene later, and
keep the non-hygienic bits running while you migrate your macros
to support the new system, and maybe even still afterwards.
Each time, writing “the next” build system does not involve
starting an even larger behemoth from scratch, but
adding a feature to the existing code base.

In conclusion: to Humans, a build system is
a complex collection of build utilities
disconnected from the rest of the development environment,
that can never fully address all build issues.
To Houyhnhnms, the build system is just
the regular system used at the meta-level, and
what we learn by analyzing what a build system should do
is the structure of the regular system’s programming language,
or what it evolves toward as it matures.
Once again, a difference in _point of view_ leads to
completely different software architecture, with very different results.

[propositions as filenames]: # (http://bentnib.org/posts/2015-04-17-propositions-as-filenames-essence-of-make.html)
[gittup]: # (http://gittup.org/)
[jsonnet]: # (http://jsonnet.org/)
[GNOME OSTree]: # (https://people.gnome.org/~walters/ostree/doc/ostree-intro.html)
[RedHat project atomic]: # (http://www.projectatomic.io/)
