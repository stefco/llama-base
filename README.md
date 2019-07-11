# Low-Latency Algorith for Multi-messenger Astrophysics (LLAMA) Conda build environment
![Anaconda environment
used](https://anaconda.org/stefco/llama-py37/badges/version.svg) ![Docker build status](https://img.shields.io/docker/cloud/build/stefco/llama-base.svg?style=flat-square)

[LLAMA](http://multimessenger.science) is a reliable and flexible multi-messenger astrophysics framework and search pipeline. It identifies astrophysical signals by combining observations from multiple types of astrophysical messengers and can either be run in online mode as a self-contained low-latency pipeline or in offline mode for post-hoc analyses. It is maintained by [Stefan Countryman](https://stc.sh) from [this github repository](https://github.com/stefco/llama-env); the Docker image can be found [here](https://cloud.docker.com/repository/registry-1.docker.io/stefco/llama-env). Some
documentation on manually pushing the [Conda environment](https://anaconda.org/stefco/environments) is available
[here](http://docs.anaconda.com/anaconda-cloud/user-guide/tasks/work-with-environments/).

This repository houses infrequently-changing images used as base images for
more complex LLAMA images. These images provide `miniconda3` Anaconda Python
distributions installed under user `llama` with varying distribution flavors
and non-python utilities installed; you should use the lightest distribution
image that satisfies your needs when building more complex images or
deploying/developing containers.
