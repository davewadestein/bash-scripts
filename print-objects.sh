#!/bin/bash

# print out all of the objects in the (.)git database

if test -d .git; then # is there a .git folder?
    cd .git/objects # cd into the object database
    for dir in [0-9a-z][0-9a-z]; do # find all dirs
        cd $dir 
	for object in *; do # find all hashes/objects in dir
            object=$(echo $object | colrm 7) # chop off last 32 chars
	    echo -n "$dir$object: " # print the hash
	    git cat-file -t $dir$object # ... and the type of object
	done
        cd ..
    done
else
    echo "This does not seem to be a git repo."
fi
