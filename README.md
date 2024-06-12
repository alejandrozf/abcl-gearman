# abcl-gearman
### Alejandro Zamora Fonseca <ale2014.zamora@gmail.com>

A simple implementation of a Gearman client & worker using https://github.com/gearman/java-service with
ABCL(https://abcl.org/) FFI calls.

Useful as a example for use ABCL to load external Java library.

## Quick start

- Clone the system to your quicklisp local-projects folder

- docker run --rm -p 4730:4730 artefactual/gearmand:1.1.19.1-alpine

```
CL-USER> (ql:quickload :abcl-gearman)
To load "abcl-gearman":
  Load 1 ASDF system:
    abcl-gearman
; Loading "abcl-gearman"

(:ABCL-GEARMAN)
CL-USER> (in-package :abcl-gearman)
#<PACKAGE ABCL-GEARMAN>
ABCL-GEARMAN> (create-running-worker "echo")
NIL
ABCL-GEARMAN> (submit-job "echo" :data (java:jcall "getBytes" "Bulgaria"))
#<org.gearman.impl.client.GearmanJobReturnImpl org.gearman.impl.client.GearmanJ.... {E4FF3C5B}>

"Worker returning ..."
ABCL-GEARMAN> (require :jss)
NIL
ABCL-GEARMAN> (jss:get-java-field ** "eventList" t)
#<java.util.LinkedList [GearmanJobEvent: GEARMAN_SUBMIT.... {400F9EE2}>
#<java.lang.reflect.Field private final java.util.Deque or.... {83E96F99}>
ABCL-GEARMAN> (java:jcall "toString" *)
"[GearmanJobEvent: GEARMAN_SUBMIT_SUCCESS : H:46011f87b16e:6, GearmanJobEvent: GEARMAN_JOB_SUCCESS : Bulgaria]"
ABCL-GEARMAN>
```

## License

MIT
