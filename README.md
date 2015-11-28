# Functional Programming 2015

Functional Programming for 2nd year CS students at FMI / Sofia University.

The languages that are going to be covered are Racket and Haskell.

## Intro materials

* [DrRacket](http://download.racket-lang.org/) - this is going to be the IDE for the course
* [The Racket Guide](http://docs.racket-lang.org/guide/index.html) - everything you need to get you started.

## Books

If you pick any of the books below, you will be really really ahead of others.

* [Structure and Interpretation of Computer Programs, Second Edition](https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-4.html#%_toc_start)
* [How To Design Problems](http://www.htdp.org/)
* [Learn You A Haskell for Great Good!](http://learnyouahaskell.com/)
* [The Haskell Book](http://haskellbook.com/)

## REPL and XREPL

If you are using command-line based racket repl, you can use the `racket` command for the basic repl. But the basic repl sucks big time.

We suggest you to use the **xrepl**.

There are two ways to start it:

* Run `$ rackert -il xrepl` and you will start the xrepl. You will know if you get the `->` prompt.
* Run `$ racket` and inside it, type `(dynamic-require 'xrepl #f)`. You will get the `->` prompt again.

XREPL is much much better. Use it!
