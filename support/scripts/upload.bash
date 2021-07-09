#!/bin/bash

# TODO add sanity check for #1 to be an existing file
# TODO add sanity check for #2 to be an existing file

openocd -f $1 -c "program $2 verify reset exit"
