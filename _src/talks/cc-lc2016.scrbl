#lang at-exp slideshow
;; -*- Scheme -*-
(require slideshow
         slideshow/code
         slideshow/code-pict)

#|
Computing Systems vs Computer Systems - presentation at LambdaConf 2016, 2016-05-28

For development, try:
  slideshow --comment-on-slide  --start ${S:-1} cc-lc2016.scrbl

NB: Quit with Alt-Q

On demo day, try:
  slideshow cc-lc2016.scrbl

Output slides for this document may be found at:
  http://ngnghm.github.io/talks/cc-lc2016.pdf

This document is available under the bugroff license.
  http://www.oocities.org/soho/cafe/5947/bugroff.html

Dijkstra once said that
'Computer Science is no more about computers than astronomy is about telescopes.'
Imagine a world where programmers think not in terms of computers, but in terms of computing.
In that world, programmers and businessmen don't focus on 'finished products';
they focus on development processes and customer interactions.
What counts as cheaper is not a shorter source file and smaller binary
but a shorter interaction loop and a system overall easier to reason about.
There are no 'operating systems' and 'standalone applications';
there are 'interactive platforms' and 'extensions' (just like Emacs, only less antiquated).
There is no painfully serializing data and saving it into file systems or databases,
then painfully getting it back; there is pervasive data persistence.
Virtualization isn't an advanced technique for system administration;
it is a basic programming language feature.
Meta-level programs aren't just arcane static code generation techniques;
they are the regular way programs are built and combined, at runtime as well as compile-time.
A relatively simple switch in how you look at programming will lead to
vastly different conclusions on what software architecture should look like,
on what software development best practices are, on what software business can be.
|#

(set-margin! 0)

(require scheme/gui/base
         slideshow/pict
         unstable/gui/pict)

;;; Definitions

(define (color-named name) (send the-color-database find-color name))
(define *blue* (color-named "blue"))
(define *red* (color-named "red"))
(define ~ @t{     })
(define ~~ (text " " 'default 10))
(define (title-style x) (text x (cons 'bold 'default) 34))
(define (url x) (colorize (tt x) *blue*))
(define (L . x) x)

(define (xlide #:title (title "") . body)
  (apply slide #:title (title-style title) body))

(define (figure name . args)
  (let ((b (bitmap (string-append "fig/" name))))
    (para #:align 'center (scale b (if (empty? args) 1 (first args))))))

(define (ngnghm #:size (size 150))
 (text "🐴" 'default 150))


;;; Slides ;;;

(xlide
 #:title "Computing vs Computers"
 @bt{The Houyhnhnm point of view}
 ~
 (ngnghm #:size 150)
 ~
 (para #:align 'center @t{François-René Rideau,} @it{TUNES Project})
 (text " " 'default 66)
 @t{LambdaConf 2016, 2016-05-28}
 @url{http://ngnghm.github.io/talks/cc-lc2016.pdf}

 (comment "\
Hi, I am François-René Rideau, and today I'm here to tell you about

Computing vs Computers
"))

(xlide
 #:title "This Talk"
 @para[#:align 'left]{Based on my blog @it{Houyhnhnm Computing}}
 (para #:align 'center @url{http://ngnghm.github.io/})
 ~
 @para[#:align 'left]{Itself based on my old @it{TUNES Project}}
 (para #:align 'center @url{http://TUNES.org/})
 ~
 (comment "Some of the finest piece of vaporware never written"))

(xlide
 #:title "The Take Home Points"
 @para{Interactions around us, not devices below us}
 ~
 @para{Simplicity, Orthogonal Persistence, Platforms...}
 ~
 @para{Reflective Systems: First-class Computation}
 ~
 @para{A change in point of view changes architecture})

(xlide
 #:title "Plan of the Talk"
 @para{Houyhnhnms vs Yahoos}
 ~
 @para{Orthogonal Persistence}
 ~
 @para{Going Meta: First-class Computing}
 ~
 @para{The way forward})

(xlide
 (title-style "I. Houyhnhnms vs Yahoos")
 (comment "\
A alien point of view.
"))

(xlide
 #:title "An Installation Story"
 @para{Installing @tt{overtone} on N's Windows laptop}
 'next
 @para{Clojure, Emacs, SuperCollider, JVM, Windows} ;; NB: lein.bat doesn't use cygwin
 @para{5 platforms!}
 'next
 @para{Issue: hunting files online}
 @para{Issue: @tt{HOME}: @tt{USERPROFILE} or @tt{LOCALAPPDATA}?}
 @para{Issue: 32-bit SuperCollider vs 64-bit JVM}
 'next
 @para{Linux (Ubuntu): I had made it worked earlier}
 @para{Issues: manual configuration, @tt{pulseaudio} vs @tt{jackd}}
 @para{No @it{solution} — but @it{scriptable workaround}}
 (comment "\
At least maybe NixOS or Qubes is working towards a solution, \
but a solution isn't part of mainstream Linux.

Not an indictment of any of the pieces of software in particular.

But then this predicament only makes it worse for software in general.
"))

(xlide
 #:title "N wonders"
 @para{How do you trust random programs?}
 @para{How can programs disagree on homedir? On ABI?}
 @para{How is the discrepancy not at least detected?}
 @para{Why configure at all? Why no sane defaults?}
 @para{What are files?}
 @para{Why redo everything on every machine?}
 @para{Why five development platforms?}
 @para{Why can't it all be automated?}
 @para{Why is the user involved at all?}
 (comment "\
"))

(xlide
 #:title "N is ignorant"
 @para{N is obviously ignorant}
 @para{But not @it{stupid}}
 @para{N doesn't know how Humans compute}
 @para{Yet N is an computing expert}
 (comment "\
And I have to admit these are pretty ignorant questions as far as they go.
My friend N obviously doesn't understand how computers work.
But I'll argue that these questions aren't _stupid_.
Indeed, my friend N is an expert in computing.
How is that possible?
Well, it's just that my friend N is not Human. She's a Houyhnhnm.
")
 'next
 @para[#:align 'center]{N is not Human, but a Houyhnhnm})

(xlide
 #:title "Gulliver"
 (figure "Gulliver.jpg")
 (comment "Lemuel Gulliver"))

(xlide
 #:title "Gulliver and Houyhnhnms"
 (figure "Gulliver_Houyhnhnms.jpg")
 (comment "Gulliver's Travel, book 4, by Jonathan Swift, 1726"))

(xlide
 #:title "Houyhnhnms and Yahoos"
 (figure "Yahoos.jpg" 1.5))

(xlide
 #:title "Swift's Book"
 (figure "Gulliver_s_Travels.jpg")
 (comment "\
Even though the story is true, you shouldn't trust all the details,
because the narrator modified the story to suit his social commentary.
"))

(xlide
 #:title "Ngnghm"
 (ngnghm #:size 150)
 (comment "
Skeptic.

Had too heard of the story of Gulliver, as told by *their* Swift.

Once decided to prove that traveling the way of Gulliver was impossible. \
Found a flaw in her proof. Decided to make the experiment.
"))

(xlide
 #:title "Ngnghm's adventures"
 (figure "horse_sailing.jpg" .8))

(xlide
 #:title "Ngnghm's misadventures"
 ;;(figure "horses_mating.jpg") ;; XXX
 (figure "horse_herd_tying.jpg"))

(xlide
 #:title "Ngnghm's misadventures"
 (figure "horsemeat.jpg"))

(xlide
 #:title "Ngnghm misadventures"
 (figure "horse_anatomy.jpg"))

(xlide
 #:title "Ngnghm saved"
 (figure "french_resistance.jpg") ;; picture from 'Top Secret' (1984)
 (comment "Thanks to the French Resistance"))

(xlide
 #:title "Ngnghm hiding"
 (figure "horse_computer.jpg" 2)
 (comment "
And that's how I met her. On IRC.

She told me her story, and she wants me to help her learn about Human computer systems.

She's in hiding, but can do a comparative cultural study \
on how Humans compute vs how Houyhnhnms compute.
"))

(xlide
 #:title "Houyhnhnm Computing"
 @para{No supernatural magic powers}
 ~
 @para{Just a different point of view}
 ~
 @bt{Computing vs Computers}
 ~
 @para{Human precedent: Cybernetics})

(xlide
 #:title "Computing vs Computers"
 @para{Computers as means, not ends}
 ~
 @para[#:align 'center]{
   @it{Computer Science is no more about computers}
   @it{than astronomy is about telescopes.}
   @t{— E. W. Dijkstra}
 }
 ~
 @para{Dijkstra: computing as exploring pure maths}
 ~
 @para{Houyhnhnms: maths yes, but foremost, meat})

(xlide
 #:title "Please Draw me a Sheep"
 (figure "petit_prince.gif"))

(xlide
 #:title "Please Draw me a Sheep"
 @para{N: Show me a @bt{simple} Human Computing System})

(xlide
 #:title "Simple Program"
 @tt{printf("hello, world\n");}
 ~
 @para{C programming language, simple & well formalized}
 ~
 @para{N: It's full of holes & not even Universal!}
 (comment "Turing-equiv…")
 ~
 @para{Filesystem, editor, compiler, @tt{make}, shell, kernel, console, GUI, networking, etc.}
 ~
 @para{N: That's extremely complex!})

(xlide
 #:title "Real Simple"
 @para{Smalltalk world}
 ~
 @para{Alan Kay's VPRI projects: entire system in 20 KLoC}
 ~
 @para{FORTH, but...}
 ~
 @para{Lower-level makes simpler computer systems,}
 @para{not simpler computing system})


(xlide
 #:title "Why Simple?"
 @para{@it{Reasonable} software}
 ~
 @para{Learning}
 ~~
 @para{Bootstrapping}
 ~~
 @para{Securing}
 ~~
 @para{Debugging}
 ~~
 @para{Refactoring})

(xlide
 #:title "Keyboards"
 (figure "symbolics-keyboard.jpg" 1)
 (comment "
One thing she likes to do is watch me type on my keyboard.

Because...
"))

(xlide
 #:title "What is this Magic Key Chord?"
 'next
 @para{Not @figure{Enter-Key.png}}
 'next
 @para{Not @figure{ctrl-alt-del.gif}}
 'next
 @para{The magic key chord:}
 @para[#:align 'center]{@tt{C-x C-s}}
 (comment "
Save File
"))

(xlide
 #:title "Why Save Files?"
 @para{Files}
 @para{If you don't @it{save}, all your changes are lost.}
 @para{Also daily prayer to Baah-Kup, god of data recovery}
 (comment "A merciful but vengeful god")
 ~
 @para{Protection in the rare and unpredictable event of:}
 @para{Bad click, closed app, software crash, power loss,}
 @para{device malfunctioning, lost, stolen, broken, too old...}
 ~
 'next
 @para{Predictable catastrophes, automatable solutions!}
 (comment "
"))

(xlide
 #:title "Why Save Files Manually?"
 @para{Historical reasons: big files, small disks}
 ~~
 @para{Architecture: that's how it's done}
 ~~
 @para{Epistemology: can't autodecide when to save}
 ~~
 @para{Personal: been bitten too often}
 ~~
 @para{Efficiency: save neurons by saving at every pause.}
 'next
 ~
 @para[#:align 'center]{N: Oh, it @bt{was} automated... in @bt{Wetware}!})

(xlide
 #:title "Sacred Motto"
 @para[#:align 'center]{Sacred Motto of the Guild}
 @para[#:align 'center]{of Houyhnhnm Programmers:}
 ~
 @bt{I object to doing things that computers can do.}
 @t{— Olin Shivers})

(xlide
 #:title "Why Compute?"
 @para{Automate in Wetware?}
 @para{That's missing the whole point of Computing!}
 ~
 @bt{The highest goal of computer science is}
 @bt{to automate that which can be automated.}
 @t{— Derek L. VerLee}
 ~
 @para{Wisdom: know to accept defeat}
 ~~
 @para{Foolishness: surrender when victory is at hand})

(xlide
 (title-style "II. Orthogonal Persistence")
 (comment "\
Will you accept Ngnghm as your personal data savior?
"))

(xlide
 #:title "Orthogonal Persistence"
 @para{Everything is always saved:}
 ~
 @bt{If it's not worth saving, it's not worth computing}
 ~
 @para{Do you manually spill registers to caches, to RAM...}
 ~
 @para{Why manually spill RAM to disk, to remote backup?})

(xlide
 #:title "Persistence Modalities"
 @para{Latency: persistence after a few seconds max}
 @para{With world-wide replicas if connected}
 ~
 @para{Space: enough for everything you type or view}
 ~
 @para{Strict determinism → replay from small state}
 @para{Keep high-level events, discard the irrelevant}
 ~
 @para{Privacy: everything encrypted by default.}
 @para{Optionally, share with others, or triple encrypt.})

(xlide
 #:title "Orthogonal Persistence Policy"
 @para{No one size fits all: latency, replication, privacy...}
 @para{Programmers can't possibly @bt{know}}
 @para{Let @bt{end-users} decide policy tradeoffs.}
 ~
 @para{Define @bt{domains} of persistence.}
 @para{Make it part of the UI.}
 @para{Use competing storage providers, world-wide.}
 @para{No data loss until the End of Civilization.})

(xlide
 #:title "Houyhnhn Design Principle"
 @para{When designing interaction for data entry, configuration, etc:}
 ~
 @bt{Each can specify what they know,}
 @bt{none need specify what they don't})

(xlide
 #:title "Fractal Transience"
 @para{Modern Apps may superficially save for you}
 @para{But it's not reliable, replicated, etc.}
 ~
 @para{Underneath, it's transience at every level}
 @para{Complex protocols for serializing, saving, transacting, upgrading, converting, etc.}
 ~
 @para{End-programmers can't handle all configurations}
 @para{Responsibility pushed back to helpless end-users})


(xlide
 #:title "Disaster of Homeric Proportion"
 @para{Joke on me for compulsively typing @tt{C-x C-s} ?}
 'next
 @para[#:align 'center]{Joke on N!}
 ~
 @para{Since rescue, used Microsoft Paint to take notes}
 @para{Her travels & travails, marvels & ordeals... in verse}
 ~
 @para{How many Homeric Sagas have been lost?}
 @para{How many thousand man years wasted world-wide?})

(xlide
 #:title "Some Perks of Orthogonal Persistence"
 @para{Never lose your session to a crash}
 @para{Not just tabs, but @it{all} session state}
 ~
 @para{Infinite Undo/Redo... for free!}
 @para{Eternal instant replay}
 ~
 @para{Others can't delete data on you}
 @para{@bt{You} own (search, analyze) your past data})


(xlide
 #:title "One disadvantage"
 @bt{Deletion is costly}
 ~
 @para{Cost linear in amount of data since item to delete}
 @para{Irreversible: requires a lot of testing}
 @para{Limitation: Other people keep their copies}
 ~
 @para{De-indexing is almost free!}
 'next
 ~
 @t{Primitives: Immutable facts, not mutable records})

(xlide
 #:title "Perks for Programmers"
 @para{Write at least 30% less code}
 @para{No "save" primitives — Yes "Don't save" primitives}
 ~
 @para{Experiment without fear}
 @para{Bugs 100% reproducible by default}
 ~
 @para{Think in terms of your abstractions, not of bits}
 @para{Don't implement from "the bottom"})

(xlide
 #:title "Yahoo Metaprogramming"
 @para{Programs: specify everything "from the bottom"}
 @para{"bottom": abstractions common to all end-users}
 ~
 @para{Metaprograms: most are compile-time only,}
 @para{some are horrible runtime kluges}
 ~
 @para{Leaky Abstraction: programs see what's underneath}
 @para{Brittle conventions. Security issues.}
 (comment "Please no space in filenames. Please please no security exploit."))

(xlide
 #:title "Houyhnhnm Metaprogramming"
 @para{Programs: specified from as high-level as possible}
 @para{But not higher. Write each program in its own DSL.}
 ~
 @para{Metaprograms: what is @it{underneath}}
 @para{Implement the DSL.}
 ~
 @para{Full Abstraction: programs can't see what's under}
 @para{(except through explicitly allowed non-determinism)})

(xlide
 #:title "Program Migration"
 @para{Change underlying metaprogram without restarting}
 ~
 @para{
   Change policy: I/O devices (console, sound...),
	  persistence, speed, latency, robustness,
	  "optimization level", privacy, trust, logging,
	  omniscient debugging, etc.}
 ~
 @para{Garbage Collection @bt{is} migrating the object graph}
 ~
 @para{Endless possibilities...})

(xlide
 #:title "Everything is different!"
 @para{No impermanence (but cleanup discipline)}
 @para{No byte sequences (but object boundaries)}
 @para{No saving files (but release management)}
 @para{No filenames (but data indexing)}
 @para{No startup scripts (but config diffs)}
 @para{No finite access rights (but domain capabilities)})

(xlide
 #:title "Not source but semantics"
 @para{Yahoos: byte sequences, with explicit encoding;}
 @para{text files as source, or worse;}
 @para{either unstructured or structured editing.}
 ~
 @para{Houyhnhnms: encoding-independent objects;}
 @para{semantics as source, auto encoding migration;}
 @para{editable views, both unstructured or structured})

(xlide
 #:title "Bad Memories"
 @para{What if you hose your system? Grave errors persist!}
 @para{OOM, fork bomb, deep metabug, garbled store, etc.}
 ~
 @para{Try not to!}
 @para{Keep old snapshots, drop irrelevant data,
       use watchdogs, regular drills for backup restoration...}
 ~
 @para{Yet what if you do? (Old Eumel story...)}
 'next
 @t{Escape to the meta-system!})

(xlide
 (title-style "III. Reflective Architecture")
 (comment "\
"))

(xlide
 #:title "The Meta System"
 @para{The Monitor: simple system with reserved memory}
 @para{Can merge in parts of the system being debugged}
 @para{Reason to build complex systems from simple ones}
 ~
 @para{What about bugs while debugging?}
 @para{Virtualize it! (Thus reserve @it{virtual} memory, too)}
 @para{Dichotomize where the catastrophe happened})

(xlide
 #:title "Real Scary Bugs"
 @para{A metabug breaking persistence can wreak havoc}
 @para{Can't completely avoid @it{all} bugs,
       yet can eliminate entire classes: prove correctness, test like SQLite}
 ~
 @para{Most Houyhnhnm programs don't touch persistence}
 @para{At least: not worse than for Yahoos}
 @para{Fallback: religiously keep (and test) old backups})

(xlide
 #:title "Virtualization as Branching"
 @para{Entire system under @tt{git} —-- but live, not dead}
 @para{Virtualization @bt{is} branching}
 ~
 @para{Undoing bad bug is rebasing (orwellian retcon)}
 @para{Limits: can't unprint the data, unlaunch missiles}
 ~
 @para{Hardware acceleration welcome, not needed}
 @para{What @bt{is} needed: @bt{Full Abstraction}})

(xlide
 #:title "Full Abstraction (Again)"
 @para{Higher levels can't see implementation specifics}
 @para{Essential difference b/w Houyhnhnms and Yahoos}
 @para{Property of @it{system}: not hardware, not language}
 ~
 @para{Leaky abstractions are not just top priority bugs:}
 'next
 @para{They are security issues.}
 @para{@bt{Call cops} on abstraction breakers}
 ~
 @t{First-class Computing Systems})

(xlide
 #:title "First-class Computing Systems"
 @para{Not just programming language}
 @para{Includes runtime execution state}
 ~
 @para{Every program is an abstract computing system}
 @para{Not a One True Global Computing System}
 ~
 @para{Abstract over incremental computing system diffs}
 @para{Virtualization not just for sysadmins}
 ~
 @url{http://j.mp/BHfci2016})

(xlide
 #:title "Lego Stacks, Not Rigid Towers"
 @para{Yahoo apps: rigid towers rooted in the OS}
 ~
 @para{Houyhnhm components: stackable modules}
 ~
 @para{Yahoo Operating Systems: privileged kernels}
 ~
 @para{Houyhnhnm: dynamically relinking metaprograms})

(xlide
 #:title "Rigid is Fragile"
 @para{Each leaky abstraction is a costly liability}
 @para{Error situations bubble up to the user}
 ~
 @para{Manual parsing, unparsing: slow, brittle, unsecure}
 @para{Validate inputs → @it{Language-Theoretic Security}}
 ~
 @para{Compatible? Find common tower level}
 @para{Adapters @bt{above} lose atomicity}
 @para{→ Need common metalevel @bt{below}})

(xlide
 #:title "Quality in Human Software"
 @para{Persistence, Robustness, Security,
		    Upgradability, Maintainability, Understandability, Explorability...}
 ~
 @para{Dismissed by Yahoo programmers as "Non-functional requirements" of their artifacts}
 @para{To Houyhnhnms, they essential aspect of computing interactions}
 ~
 @para{Choosing artifacts over interactions:}
 @para[#:align 'center]{Sacrificing ends to means})

(xlide
 #:title "Meta-level components"
 @para{Compression algorithms (lossless vs lossy)}
 @para{New synchronization algorithm (e.g. CRDT)}
 @para{Optimization passes (safe or unsafe)}
 @para{Data representations (depending on constraints)}
 ~
 @bt{Solve issue once with a meta-program}
 @para{Not every time manually with a "design pattern".})

(xlide
 #:title "Turtling down"
 @para{Infinite turtles below...}
 @para{and you can change them, dynamically!}
 ~
 @para{Building software @it{down}, not just @it{up}.}
 @para{That's why neither libraries nor servers will do.}
 ~
 @para{Not Tower of Babel, but computing algebra})

(xlide
 #:title "No Kernel"
 @para{Initial resource handler → Bootstrap chain}
 @para{Access control → Transferable ownership}
 @para{Resource management → Linear Logic}
 @para{Multiplexing access → Servers}
 @para{Implementing services → Meta-programs}
 @para{Virtualization → First-class full Abstraction})

(xlide
 #:title "No Apps"
 @para{One-way communication? Documents, not apps}
 @para{Both ways? Extensible Platforms (like Emacs)}
 ~
 @para{Yahoos: app each reimplement own bad selector}
 @para{Houyhnhnms: component solves issue for everyone}
 ~
 @para{Each focuses on his specialty (division of labour)})

(xlide
 #:title "Human Precedents"
 @para{T diagram: translate from A to B, running in C}
 ~
 @para{Lisp: great at abstraction, but leaky as hell}
 ~
 @para{PLT Racket: PL construction kit})

(xlide
 #:title "Getting There"
 @para{Who to pay costs of Migration?}
 ~
 @para{How to keep up with Yahoos?}
 ~
 @para{How to win despite network effects?}
 ~
 @para{How not to fall into autism?}
 ~
 @para{Where to bootstrap from?})

(xlide
 #:title "No worries"
 @para{Metaprogramming: programming programming}
 ~
 @para{Vision and Will come foremost}
 ~
 @para[#:align 'center]{@it{If you want to build a ship, don’t}
			@it{drum up the men to gather wood,}
			@it{divide the work, and give orders.}
			@it{Instead, teach them to yearn}
			@it{for the vast and endless sea.}
			@t{— Antoine de Saint-Exupéry (creatively misquoted)}
 }
 (comment "https://en.wikiquote.org/wiki/Talk:Antoine_de_Saint_Exupéry"))

(xlide
 #:title "Know the Goal"
 @para{The goal is not a system}
 ~
 @para{The goal is a saner approach to computing}
 ~
 @para{Metaprogramming is programming programming})

(xlide
 #:title "Living as a Houyhnhnm, Not a Yahoo"
 @para{Apply the knowledge. Share it with colleagues. Change the project.}
 @para{@t{Not every project can be reformed.}
       @t{Sometimes, restart from scratch.}
       @t{Sometimes, quit the project, or even the company.}}
 @para{@t{You can't save other people.} @t{But you can save yourself.}}
 @para{@t{There is no path to Happiness.} @t{Happiness is the path.}}
 @para{Yet recognize the tree by its fruits.})

(xlide
 #:title "Where to Start?"
 @para{Start Anywhere: not just from the "bare metal"}
 @para{Start Simple: no "all or nothing". Systemantics.}
 @para{Do your thing: division of labor}
 @para{Build bridges: division of labor}
 @para{Join forces: division of labor}
 @para{Go down, not just up})

(xlide
 #:title "Ideas have consequences"
 @para{New PoV leads to new architecture}
 ~
 @para{Interaction isn't one-way command-and-control})

(xlide
 #:title "The Take Home Points (redux)"
 @para{Interactions around us, not devices below us}
 ~
 @para{Simplicity, Orthogonal Persistence, Platforms...}
 ~
 @para{Reflective Systems: First-class Computation}
 ~
 @para{A change in point of view changes architecture})

(xlide
 #:title "Challenge: Condense the Vaporware"
 @para{Bring Runtime Reflection to your platform}
 ~
 @para{Platform: PL, IDE, OS, Shell, Distributed System}
 ~
 @para{First-class implementations, meta-levels, migration}
 ~
 @para{Enjoy simplification, persistence, robustness, etc.})

(xlide
 #:title "The Meta-Story"
 @para{More ambitious than just software:}
 'next
 ~
 (para #:align 'center @it{A change of point of view about computing})
 ~
 @para[#:align 'center]{Not mere vaporware: @it{wetware}}
 ~
 'next
 @para[#:align 'center]{Thanks!}
 ~
 @para[#:align 'center]{@it{Houyhnhnm Computing:} @url{http://ngnghm.github.io/}})

;; Why not libraries or servers?
;; Not really possible: inefficient, overly coupled, complex, slow, too much communication not enough expressiveness, etc.
