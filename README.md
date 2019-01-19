# RKern
A research project for developing a micro-kernel in C++.

## Goals
I have always been interested in how kernels work under the hood, and how the bridge between software and hardware works. Until recently I have always shied away from developing a kernel from scratch but this changed after I was exposed to this subject during a number of my master's degree courses. After gaining knowledge on some of the inner workings of the Linux kernel, as well as getting more familiar with the hardware architecture, CPUs, and assembly language, suddenly I felt ready to take on the adventure of developing a research kernel. As the name suggests, this is an exploratory project with the sole purpose of learning.

As a side goal to developing this kernel, I am planning on taking various notes, and authoring a document covering everything that I learn from this project.

## Roadmap
- [x] Compile and run a bare-bones kernel in C
- [ ] (Optional) Migrate boot.asm to NASM
- [ ] Migrate the kernel source to C++ (will probablly have to be pure C++ without any libraries)
- [ ] Migrate from Make to CMake and add ability to use GCC or Clang using a CMake option
- [ ] (Optional) Migrate boot.asm to NASM?
- [ ] Evaluate if libc++, libunwind, and friends can be integrated into the kernel

## Directly Running the Kernel Binary Using Qemu
You can use the utility script `run-qemu.sh` to run the kernel binary directly in qemu, without having to use any iso images. The utility script executes the following command:
```
qemu-system-i386 -kernel build/rkern.bin
```

## Generating .iso Image
The utility script `make-iso.sh` uses `grub-mkrescue` to generate a bootable iso image, with a very basic `grub.cfg` file that is located in the `iso/` folder. This process has a dependency on the `xorriso` package.

In order to run the iso image using qemu:
```
qemu-system-i386 -cdrom build/rkern.iso
```

## Special Thanks
I have to dedicate this section to specially thank the makers and contributors of https://wiki.osdev.org.
