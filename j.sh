#!/bin/bash
for i in "${@}" ; do 
    javac "${i}".java; java "${1}"
done
