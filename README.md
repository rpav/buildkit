# WIP

Note this is incomplete; script integration with buildapp etc needs done, though a number of the other things work.

# buildkit

This is a utility kit for *binary* application building and
deployment.  This does **not replace**
[http://www.xach.com/lisp/buildapp/](Buildapp),
[Qlot](https://github.com/fukamachi/qlot), etc.  Rather, it ties them
all together for easy binary deployment.

So you bundled and dumped a binary.  Great!  Now you might notice you have some problems:

* You need to load binary-relative assets; ASDF will no longer help
* You need to run things when the *binary* loads; `EVAL-WHEN` does not help here, and every CL has a different mechanism
* You need to handle quitting or other various mechanisms differently if you're a binary... so you need a way to tell

There are also many problems to pay attention to:

* If you require a custom solib/dll path, you cannot dump an image with the required libraries loaded unless you have an external launcher script
* If you allocate foreign memory and dump, you will have junk pointers on load

These are what `buildkit` provides utilities for:

* Evaluate code normally when loaded by ASDF, or during binary startup.
* Provide a well-defined boolean to check whether the app is being run from a binary or not
* Look for ASDF-relative or binary-relative paths transparently
* Easy scripts for using buildapp and excluding Quicklisp/Qlot as per [this article](http://darkchestnut.com/2016/keep-quicklisp-and-qlot-out-of-your-application-binary/)

Any implementation supported by Buildapp should in theory be supported by buildkit.

# API

