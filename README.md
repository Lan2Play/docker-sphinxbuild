# Lan2play Sphinx Build

[Github](https://github.com/Lan2Play/docker-sphinxbuild)

[Docker Hub](https://hub.docker.com/r/lan2play/docker-sphinxbuild)

This image is intended to build [sphinx documentations](https://www.sphinx-doc.org/en/master/) .

## Linux Container

[![linux/amd64](https://github.com/Lan2Play/docker-sphinxbuild/actions/workflows/build-linux-image.yml/badge.svg?branch=main)](https://github.com/Lan2Play/docker-sphinxbuild/actions/workflows/build-linux-image.yml)

### Image tags

*latest : based on `sphinxdoc/sphinx`, so capable of producing html and epub
*latexpdf : based on `sphinxdoc/sphinx-latexpdf`, so capable of producing html, epub and pdf

If you want to produce a pdf documentation, please replace `latest` in the examples below with `latexpdf`


### Download

```shell
docker pull lan2play/docker-sphinxbuild:latest;
```

### Run sphinx build
run in the docs Folder
```shell
docker run -it --rm -v $PWD:/docs -e USERID=$(id -u ${USER}) -e GROUPID=$(id -g ${USER}) lan2play/docker-sphinxbuild:latest
```
### Run sphinx-intl update
run in the docs Folder
```shell
docker run -it --rm -v $PWD:/docs -e Task=intl -e USERID=$(id -u ${USER}) -e GROUPID=$(id -g ${USER}) lan2play/docker-sphinxbuild:latest
```
### Additional Info

* if a ```requirements.txt``` exists, ```pip3 install -r requirements.txt``` will be executed before the MakeCommands
* if you want to cache the pip packages, you can set the env `CACHE=TRUE` and mount  `/cache` to some folder on your system. This will cache `/usr/local/lib/python*/site-packages` and `/usr/local/bin`. For example:
```shell
docker run -it --rm -v $PWD:/docs -v $PWD/cache:/cache -e CACHE=TRUE -e MakeCommands=html,epub lan2play/docker-sphinxbuild:latest
```
* if you do not set the ```USERID``` or ```GROUPID``` env variable, the build folder will be owned by root
* the ```MakeCommands``` env variable is set to ```html``` by default, to execute the ```make html``` command. if you want to use something else or multiple, you can overwrite it like this:

```shell
docker run -it --rm -v $PWD:/docs -e MakeCommands=html,epub lan2play/docker-sphinxbuild:latest
```
* if you want to specify multiple intl languages (or change the de default) on the intl task, you can just add them with ```-e IntlLangs=de,fr```
* if you want to specify a different output on the intl task than ```build/gettext```, you can just add them with ```-e IntlOut=de,fr```

