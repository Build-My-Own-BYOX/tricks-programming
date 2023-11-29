#!/bin/bash 
# dup.sh executes a specific command multiple times
# usage: dup.sh {run_occurrence} {command}
# example: dup.sh 3 'echo 123'
# example result: 
# > 123
# > 123
# > 123

eval "for i in {1..$1}; do ($2 &); done"