OUTPUT_ARCH(riscv)

/*
 * The bootloader will look at this image and start execution at the symbol
 * designated as the entry point.
 */
ENTRY(_start)

MEMORY
{
    flash (rx) : ORIGIN = 0x20010000, LENGTH = 0x6a120
    ram (rwxa) : ORIGIN = 0x80000000, LENGTH = 0x4000
}

PHDRS
{
    flash PT_LOAD;
    ram PT_NULL;
}

SECTIONS
{
    .text : ALIGN(4)
    {
        *(.text)
    } >flash AT>flash :flash

    /* Read-only data. */
    .rodata : ALIGN(4)
    {
        _rodata_s = .;
        *(.rodata)
        _rodata_e = .;
    } >flash AT>flash :flash

    /*
     * Read-write data (initialized)
     */
    .data : ALIGN(4)
    {
        _data_s = .;
        *(.data)
        _data_e = .;
    } >ram AT>flash :ram

    /*
     * Read-write data (uninitialized) and stack
     */
    .bss : ALIGN(4)
    {
        _bss_s = .;
        *(COMMON)
        *(.bss)
        _bss_e = .;
    } >ram AT>ram :ram
}
