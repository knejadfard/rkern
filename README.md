# research-kernel
A personal project for researching and developing a kernel from scratch.

## Goals
I have always been interested in how kernels work under the hood, and how the bridge between software and hardware works. Until recently I have lways shied away from developing a kernel from scratch but this changed after I was exposed to this subject during a number of my master's degree courses. After gaining knowledge on some of the inner workings of the Linux kernel, as well as getting more familiar with the hardware architecture, CPUs, and assembly language, suddenly I felt ready to take on the adventure of developing a research kernel. As the name suggests, this is an exploratory project with the sole purpose of learning.

As a side goal to developing this kernel, I am planning on taking various notes, and authoring a document covering everything that I learn from this project.

## Roadmap
- [x] Compile and run a bare-bones kernel in C
- [ ] Migrate the kernel source to C++ (will probablly have to be pure C++ without any libraries)
- [ ] (Optional) Migrate boot.s to NASM
- [ ] Evaluate if libc++, libunwind, and friends can be integrated into the kernel

Rest of the roadmap TBD...

## Special Thanks
I have to dedicate this section to specially thank the makers and contributors of https://wiki.osdev.org.
