#!/bin/bash

docker run --user "$(id -u):$(id -g)" -v $PWD/src/:/apps/ mario21ic/dmc-api:latest flake8
