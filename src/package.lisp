(in-package defpackage+-user-1)

(defpackage+ :build
  (:nicknames #:kit.build)
  (:use #:cl #:alexandria)
  (:export

   #:*binary*

   #:eval-always
   #:app-path))

(in-package :build)

 ;; Variables

(defvar *binary* nil
  "This is non-`NIL` if the app is loaded and running from a binary.")

(defvar *user-main* nil
  "This is set to the \"user main\" function which is called after buildkit
bookkeeping.  This is only non-`NIL` after build.")
