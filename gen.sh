#!/bin/sh
GIT_VERSION="$1" envsubst '${GIT_VERSION}' <Dockerfile.template >Dockerfile
