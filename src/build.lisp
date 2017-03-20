(in-package :build)

(defvar *init-hooks* nil)
(defvar *binary-path* nil)

(defmacro eval-always (nil &body body)
  (with-gensyms (fun)
    `(eval-when (:compile-toplevel :load-toplevel :execute)
       (let ((,fun (lambda () ,@body)))
         (pushnew ,fun *init-hooks*)
         (,fun)))))

;;; This could be done via SB-EXT:*INIT-HOOKS* etc, except... why?
;;; Using implementation-specific facilities just requires specific
;;; code for every implementation and doesn't seem to buy anything.
(defun bk-run-init ()
  (loop for fun in (nreverse *init-hooks*)
        do (funcall fun)))

(defun bk-main (argv)
  (bk-run-init)
  (setf *binary-path* (first argv))
  (funcall *user-main* argv))

(defun app-path (system &rest dirs)
  (let* ((argv0 (or *binary-path*
                    (asdf:component-pathname
                     (asdf:find-system system))))
         (path (merge-pathnames (string-join dirs "/") argv0)))
    (unless (probe-file path)
      (error "File not found: ~A" path))
    path))
