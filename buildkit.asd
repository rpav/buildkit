(defpackage :buildkit.asdf
  (:use #:cl #:asdf))

(in-package :buildkit.asdf)

(defsystem :buildkit
  :description "Binary build utilities"
  :author "Ryan Pavlik"
  :license "MIT"
  :version "0.0"

  :depends-on (:alexandria :defpackage-plus)
  :pathname "src"
  :serial t

  :components
  ((:file "package")
   (:file "util")
   (:file "build")))
