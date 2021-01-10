;;;; abcl-gearman.asd

(asdf:defsystem #:abcl-gearman
  :description "Simple Gearman interfaces using ABCL Java FFI calls"
  :author "Alejandro Zamora Fonseca <ale2014.zamora@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "abcl-gearman")))
