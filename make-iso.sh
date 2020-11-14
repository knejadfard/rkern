#!/bin/sh

mkdir build/iso
cp -r iso/* build/iso
cp build/rkern.bin build/iso/boot
grub-mkrescue -o build/rkern.iso build/iso/

exit 0
