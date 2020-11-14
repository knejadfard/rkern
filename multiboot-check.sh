#!/bin/sh

RESULT=$(grub-file --is-x86-multiboot build/rkern.bin)
if $RESULT; then
  echo "Multiboot confirmed"
else
  echo "The file does not appear to be multiboot"
fi
