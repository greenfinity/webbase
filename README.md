# greenfinity/webbase docker image #

Docker image for Python (WSGI) and JS front-end web application development and deployment

# Base OS

Based on Ubuntu LTS (precise)

# Python

- python2.7
- python3.4

# NodeJS

NodeJS is essential for any front-end building task.
You probably want to use Grunt, Gulp or a similar build tool.

- node0.10

# Users

Besides the 'root' user, there is a 'docker' user that should be used for everything inside the container.

Both root and docker have password disabled, so you can only log in to them with ssh keys.

# Shell, editing

## ssh

OpenSSH server is running if you start the container with its default command. After that you can ssh into the container.

Optionally, you can install the host utilities by running `bin/install-host-utils` on the host machine, and after this you can `ssh containername.docker` from the host, provided that you are running the container with -P or -p option to bind the ssh port.

The image contains my ssh key. You may want to add your key and remove mine if you customize the container. If you don't add your key, you will not be able to log in.

TODO generate a password and print it during build, maybe.

## zsh

zsh is the default shell.

Contains my setup

## vim

My old setup. I don't actively use vim any more. This setup does a few things like applies a nice color scheme, enables syntax coloring and on-the-fly linting for Python and JavaScript sources.


