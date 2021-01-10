# abcl-gearman
### Alejandro Zamora Fonseca <ale2014.zamora@gmail.com>_

A simple implementation of a Gearman client & worker using https://github.com/gearman/java-service with
ABCL(https://abcl.org/) FFI calls.

Useful as a example for use ABCL to load external Java library.

## Quick start

- Clone the system to your quicklisp local-projects folder

- docker run --rm -p 4730:4730 artefactual/gearmand:1.1.19.1-alpine

- CL-USER> (ql:quickload :abcl-gearman)

- CL-USER> (create-running-worker "reverse")

- CL-USER> (submit-job "reverse")

## License

MIT
