Houyhnhnm Computing
===================

> If you want to build a ship, don’t drum up the men to gather wood, divide the work,
> and give orders. Instead, teach them to yearn for the vast and endless sea.
> ― Antoine de Saint-Exupéry, [creatively misquoted](https://en.wikiquote.org/wiki/Talk:Antoine_de_Saint_Exupéry).

This is the source code for the blog "Houyhnhnm Computing" at <http://ngnghm.github.io/>


Installing Prerequisite Tools
-----------------------------

Assuming you have already installed [Racket](http://racket-lang.org/),
install frog as follows:

    raco pkg install frog


Updating the blog
-----------------

Edit a post in [_src/posts/](_src/posts/)
and then regenerate the website with:

    raco frog -bp

When it's all ready, just `git commit` and `git push` to github.

