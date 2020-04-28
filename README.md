# Frama-C Learning

<div style="text-align:center" alt="Flutter logo"><img src="images/framac.gif" /></div>

## Tutorials how to use Frama-C for software verification

In this repo we try some features/plugins from Frama-C tool that is available at https://frama-c.com/

## How install Frama-C

Frama-C is a platform dedicated to the analysis of source code written in C. 

### Installing Frama-C via opam (**Recommended mode**)

Aiming the next steps to try the Frama-C, I'll adopt a Docker container. To build the container is adopted the Dockerfile. It's worth noting that for while I won't adopt GUI. Notes:

- OPAM is the OCaml package manager
- In the Docker container we found some linux packages to handle with C programs
- It is recommeded that the Docker container runs with shared volume
- To build the container run:
```console
foo@bar:~$ docker build -t hbgit/framac --no-cache -f Dockerfile .
foo@bar:~$ docker run -it --name=framac -v $(pwd):/home/framac/devel_tool:Z --user $(id -u):$(id -g) hbgit/framac /bin/bash
```

**NOTE:** You should run the second command inside from your clone of this repository.



### Installing Frama-C via your Linux distribution (Debian/Ubuntu/Fedora)

According Frama-C website *the distribution packages are updated later than opam packages, so if you want access to the most recent versions of Frama-C, opam is currently the recommended approach.*

- Debian/Ubuntu: 
```console
foo@bar:~$ sudo apt-get install frama-c
```
- Fedora: 
```console
foo@bar:~$ sudo dnf install frama-c
```

More details at [Frama-C website.][install-package]


### Compiling from source

More details at [Compilation Guide.][install-build-guide]


[install-build-guide]: https://www.frama-c.com/install-20.0-Calcium.html#full-compilation-guide
[framac-website]: https://frama-c.com
[install-package]: https://www.frama-c.com/install-20.0-Calcium.html#installing-frama-c-via-your-linux-distribution-debianubuntufedora



