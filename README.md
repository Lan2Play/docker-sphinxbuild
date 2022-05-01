# Lan2play Sphinx Build

[Github](https://github.com/Lan2Play/docker-sphinxbuild)

[Docker Hub](https://hub.docker.com/r/lan2play/docker-sphinxbuild)

This image is intended to build [sphinx documentations](https://www.sphinx-doc.org/en/master/) .

## Linux Container

[![linux/amd64](https://github.com/Lan2Play/docker-sphinxbuild/actions/workflows/build-linux-image.yml/badge.svg?branch=main)](https://github.com/Lan2Play/docker-sphinxbuild/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull lan2play/docker-sphinxbuild:latest;
```

### Run sphinx build
run in the docs Folder
```shell
docker run -it --rm -v $PWD:/docs lan2play/docker-sphinxbuild:latest
```

### Additional Info

* if a ```requirements.txt``` exists, ```pip3 install -r requirements.txt``` will be executed before the MakeCommands
* the ```MakeCommands``` env variable is set to ```html``` by default, to execute the ```make html``` command. if you want to use something else or multiple, you can overwrite it like this:

```shell
docker run -it --rm -v $PWD:/docs -e MakeCommands=html,latexpdf lan2play/docker-sphinxbuild:latest
```

* if you want to make sure that the documentation is owned by a specific userid, just add the environment variables
```shell
-e USERID=$(id -u ${USER}) -e GROUPID=$(id -g ${USER})
```
