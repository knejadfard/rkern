/*
 * According to the standard RISC-V calling convention, the stack grows downward
 * and is always kept 16-byte aligned.
 */
.section .bss
.align 16
stack_bottom:
.skip 64 # 64 Bytes
stack_top:

/*
 * The linker script specifies _start as the entry point to the kernel and the
 * bootloader will jump to this position once the kernel has been loaded. It
 * doesn't make sense to return from this function as the bootloader is gone.
 */
.section .text
.globl _start
.type _start, @function
_start:
    /*
     * Setup stack
     */
    la sp, stack_top

    /*
     * This is a good place to initialize crucial processor state before the
     * high-level kernel is entered. It's best to minimize the early
     * environment where crucial features are offline. Note that the
     * processor is not fully initialized yet: Features such as floating
     * point instructions and instruction set extensions are not initialized
     * yet. The GDT should be loaded here. Paging should be enabled here.
     * C++ features such as global constructors and exceptions will require
     * runtime support to work as well.
     */

    /*
     * Enter the high-level kernel. The ABI requires the stack is 16-byte
     * aligned at the time of the call instruction (which afterwards pushes
     * the return pointer of size 4 bytes). The stack was originally 16-byte
     * aligned above and we've since pushed a multiple of 16 bytes to the
     * stack (pushed 0 bytes so far) and the alignment is thus preserved and
     * the call is well defined.
     */
    call kernel_main

    /*
     * Go into an infinite loop if the kernel has nothing else to do.
     */
1:  wfi
    j 1b

/*
 * Set the size of the _start symbol to the current location '.' minus its start.
 * This is useful when debugging or call tracing is implemented.
 */
.size _start, . - _start
