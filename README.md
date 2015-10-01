# Functional Programming 2015

Functional Programming for 2nd year CS students at FMI / Sofia University.

## Intro materials

* [DrRacket](http://download.racket-lang.org/) - this is going to be the IDE for the course
* [The Racket Guide](http://docs.racket-lang.org/guide/index.html) - everything you need to get you started.

## REPL and XREPL

If you are using command-line based racket repl, you can use the `racket` command for the basic repl. But the basic repl sucks big time.

We suggest you to use the **xrepl**.

There are two ways to start it:

* Run `$ rackert -il xrepl` and you will start the xrepl. You will know if you get the `->` prompt.
* Run `$ racket` and inside it, type `(dynamic-require 'xrepl #f)`. You will get the `->` prompt again.

XREPL is much much better. Use it!
