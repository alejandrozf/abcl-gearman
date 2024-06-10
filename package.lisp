;;;; package.lisp

(defpackage #:abcl-gearman
  (:use #:cl)
  (:export #:submit-job #:create-running-worker))
