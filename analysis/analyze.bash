#!/bin/bash

rm -rf ./report
mkdir report

diff -y <(objdump -t $1) <(objdump -t $2) >report/symbols.diff
diff -y <(objdump -d $1) <(objdump -d $2) >report/disassembly.diff
