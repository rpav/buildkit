(in-package :build)

(defun string-join (list string)
  (labels ((zipper (c list)
             (when list
               (list* c (format nil "~A" (car list))
                      (zipper string (cdr list))))))
    (apply #'concatenate 'string (zipper "" list))))
