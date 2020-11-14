// Check if the compiler thinks the wrong operating system is being targetted.
#if defined(__linux__)
  #error "Not using a cross-compiler. This is probably a bad idea."
#endif

// Currently rkern only works for 32-bit ix86 targets.
#if !defined(__i386__)
  #error "This tutorial needs to be compiled with a ix86-elf compiler"
#endif

#include "types.hpp"
#include "vga.hpp"
#include "utility.hpp"
#include "terminal.hpp"

using namespace rkern;

extern "C" void kernel_main()
{
    Terminal terminal;
	terminal.write_string("Hello, kernel World!\n");
}
