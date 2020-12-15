# RKern
A research project for developing a kernel from scratch for embedded RISC-V systems.

## Motivation
I have always been interested in how kernels and the bridge between software and hardware works. Until recently I have always shied away from developing a kernel from scratch but this changed quickly after I was exposed to this subject during a number of my master's degree courses. After gaining knowledge on some of the inner workings of the Linux kernel and working with [Pintos](https://en.wikipedia.org/wiki/Pintos), as well as getting more familiar with hardware architecture, CPUs, and assembly language, I felt ready to take on the adventure of developing a research kernel. As the name suggests, this is an exploratory project with the main purpose of learning, and well, having fun while doing it!

## Vision
- RISC-V embedded systems are the first priority targets of this kernel - With recent developments happening in the RISC-V landscape and my interest in open hardware, my vision for this research project is to build RKern for embedded RISC-V systems. Given that I am starting this kernel from zero, this is a perfect starting point for me.
- The kernel will be written in C++ - As for the technology used for writing the kernel, I have chosen C++. Aside from me always being interested in this language and being more comfortable with it, the compilers and tooling around C++ have come a long way since the 90s. The C++ standard committe has been doing a great job of improving C++ over the years. I am interested in the idea of using low-overhead abstractions that C++ provides, combined with idiomatic C++ to improve kernel source maintainability.
- The kernel is modular and must be usable by low-power/restricted hardware, as well as more capable RISC-V systems such as [HiFive Unmatched by SiFive](https://www.sifive.com/boards/hifive-unmatched). You should not have to pay for what you don't need. The compilation process and source code must provide the ability to turn certain modules on/off based on what the target hardware is capable of.

I am planning to take notes at all stages of this project and author a paper/document covering everything that I learn from this project. Based on how things look like in the end, I will have to decide if the document is worthy of publishing anywhere.

## Roadmap
- [x] Compile and run a bare-bones kernel in C.
- [x] Migrate the kernel source to C++ (will probablly have to be pure C++ without any libraries).
- [ ] Migrate from Make to CMake and add ability to use GCC or Clang using a CMake option.
- [ ] Compile with risc-v target and run the kernel on a dev board ([HiFive1 Rev B](https://www.sifive.com/boards/hifive1-rev-b)).
- [ ] Evaluate if libc++, libunwind, and friends can be integrated into the kernel.
- [ ] Implement I2C, SPI, and UART drivers.

## Directly Running the Kernel Binary Using Qemu
Run the kernel that is compiled for riscv32 target in Qemu with 16 KiB of memory available:
```
qemu-system-riscv32 -m 16K -kernel build/rkern.bin
```

## Special Thanks
I have to dedicate this section to specially thank the makers and contributors of https://wiki.osdev.org.
