// Check if the compiler thinks the wrong operating system is being targetted.
#if defined(__linux__)
  #error "Not using a cross-compiler. This is probably a bad idea."
#endif

#include "types.hpp"
#include "vga.hpp"
#include "utility.hpp"
#include "terminal.hpp"

extern "C" void kernel_main()
{
    rkern::Terminal terminal;
	terminal.write_string("Hello, kernel World!\n");
}
