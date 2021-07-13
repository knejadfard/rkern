# RKern
A research project for developing a kernel from scratch for embedded RISC-V systems.

## Motivation
I have always been interested in how kernels and the bridge between software and hardware works. Until recently I have always shied away from developing a kernel from scratch but this changed quickly after I was exposed to this subject during a number of my master's degree courses. After gaining knowledge on some of the inner workings of the Linux kernel and working with [Pintos](https://en.wikipedia.org/wiki/Pintos), as well as getting more familiar with hardware architecture, CPUs, and assembly language, I felt ready to take on the adventure of developing a research kernel. As the name suggests, this is an exploratory project with the main purpose of learning, and well, having fun while doing it!

## Vision
- RISC-V embedded systems are the first priority targets of this kernel - With recent developments happening in the RISC-V landscape and my interest in open hardware, my vision for this research project is to build RKern for embedded RISC-V systems. Given that I am starting this kernel from zero, this is a perfect starting point for me.
- The kernel will be written in C++ - As for the technology used for writing the kernel, I have chosen C++. Aside from me always being interested in this language and being more comfortable with it, the compilers and tooling around C++ have come a long way since the 90s. The C++ standard committe has been doing a great job of improving C++ over the years. I am interested in the idea of using low-overhead abstractions that C++ provides, combined with idiomatic C++ to improve kernel source maintainability.
- The kernel is modular and must be usable by low-power/restricted hardware, as well as more capable RISC-V systems such as [HiFive Unmatched by SiFive](https://www.sifive.com/boards/hifive-unmatched). You should not have to pay for what you don't need. The compilation process and source code must provide the ability to turn certain modules on/off based on what the target hardware is capable of.
- A supporting analysis tool will be developed using the Go ecosystem to capture build artifacts (assembly code produced by compiler) to assist with analyzing the impact of changes introduced by every commit. This is a supporting tool project for RKern and only the most critical features will be prioritized for development alongside RKern.

I am planning to take notes at all stages of this project and author a paper/document covering everything that I learn from this project. Based on how things look like in the end, I will have to decide if the document is worthy of publishing anywhere.

## Roadmap
Note: The roadmap is a work-in-progress and will be updated regularly.
- [x] Compile and run a bare-bones kernel in C.
- [x] Migrate the kernel source to C++ (will probablly have to be pure C++ without any libraries).
- [x] Migrate from Make to CMake.
- [x] Compile with riscv32 target.
- [x] Add ability to compile with either GCC or LLVM toolchains.
- [x] Write basic facilities for working with memory-mapped devices
- [x] Write basic GPIO driver on top of memory-mapped device facilities
- [ ] Write RGB LED driver using GPIO facilities (this can be used on the board as POC)
- [x] Run the kernel on a dev board ([HiFive1 Rev B](https://www.sifive.com/boards/hifive1-rev-b)).
- [ ] Implement UART driver and use it for serial output as POC
- [ ] Implement I2C driver and test with an OLED display peripheral.
- [ ] Implement SPI driver.

## Building the Kernel Binary
In order to build the kernel using the LLVM toolchain, the following flow can be used:
```
# assuming you are in the project's source root
mkdir build
cd build
CXX=clang++ cmake ../
make
```

Prefixing the `cmake` invocation with `CXX=clang++` ensures that CMake will recognize `clang++` as the C++ compiler without overriding this for the whole system.

In order to build the kernel using the GNU toolchain, you must first build a cross-compiler. For this project, given the current scope of working with HiFive1 Rev B board, the desired architecture is rv32imac with ilp32 as the ABI.
Assuming the `bin/` directory of the cross-compiler toolchain is in path, the following flow can be used for compiling using the GNU toolchain:
```
# assuming you are in the project's source root
mkdir build
cd build
CXX=riscv32-unknown-elf-g++ cmake ../
make
```

## Run the Kernel Binary Using Qemu
Run the kernel that is built for riscv32 target using Sifive's HiFive1 Rev B board in Qemu:
```
qemu-system-riscv32 -M sifive_e,revb=true -kernel rkern.bin
```

## Debug the Kernel Binary Using Qemu and GDB
The following command starts Qemu with the kernel binary, while pausing execution of CPU instructions and accepting a TCP connection from GDB on port 1234:
```
qemu-system-riscv32 -M sifive_e,revb=true -gdb tcp::1234 -S -kernel rkern.bin
```

Next, start GDB:
```
riscv32-unknown-elf-gdb rkern.bin
```

After GDB starts up and prompts for commands, it should be instructed to connect to Qemu's remote TCP port:
```
(gdb) target remote localhost:1234
```

At this point, you may want to set up breakpoints. Then, you can step through the instructions and debug.

## Flashing the Kernel
In order to flash the kernel to a HiFive1 Rev B board (at the time of this writing this is the only supported board):
```
openocd -f share/openocd/scripts/board/sifive-hifive1-revb.cfg -c "program rkern.bin verify reset exit"
```

A helper script has been provided under `rkern/support/scripts` folder to run the above command::
```
make
../support/scripts/upload.bash /path/to/share/openocd/scripts/board/sifive-hifive1-revb.cfg rkern.bin
```

## Special Thanks
I have to dedicate this section to specially thank the makers and contributors of https://wiki.osdev.org. I have learned a lot from the content available there. The rest of the resources used are noted in the research paper/report and will be updated as the document is further developed.
