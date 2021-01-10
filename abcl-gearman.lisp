;;;; abcl-gearman.lisp

(in-package #:abcl-gearman)

(let ((gearman-java-jar (asdf:system-relative-pathname "abcl-gearman" "lib/java-gearman-service-0.7.0-SNAPSHOT-jar-with-dependencies.jar")))
  (java:add-to-classpath gearman-java-jar))

(defun create-running-worker (function-name
                              &key (hostname "localhost") (port 4730)
                                (worker-function (lambda (function data callback)
                                                   (print (java:jarray-ref data 0)))))
  "Creates a worker linked to a server in HOST and PORT"
  (let* ((gearman (java:jstatic "createGearman" "org.gearman.Gearman"))
         (worker (java:jcall "createGearmanWorker" gearman))
         (server (java:jcall "createGearmanServer" gearman hostname port)))
    (java:jcall "addServer" worker server)
    (java:jcall "addFunction" worker function-name
           (java:jinterface-implementation "org.gearman.GearmanFunction" "work" worker-function))))



(defun submit-job (function-name &key (hostname "localhost") (port 4730)
                    (data (java:jnew-array-from-list "byte" '(1 2))))
  (let* ((gearman (java:jstatic "createGearman" "org.gearman.Gearman"))
         (client (java:jcall "createGearmanClient" gearman))
         (server (java:jcall "createGearmanServer" gearman hostname port)))
    (java:jcall "addServer" client server)
    (java:jcall "submitJob" client function-name data)))

#+nil
(create-running-worker "reverse")
#+nil
(submit-job "reverse")
