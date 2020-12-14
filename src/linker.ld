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

SECTIONS
{
	.text : ALIGN(4)
	{
		*(.text)
	} >flash

    /*
     * The start of flash data is right after all of code in flash.
     */
    flash_sdata = .;

	/* Read-only data. */
	.rodata : ALIGN(4)
	{
		*(.rodata)
	} >flash

	/*
     * Read-write data (initialized)
     */
	.data : ALIGN(4)
	{
		*(.data)
	} >ram

	/*
     * Read-write data (uninitialized) and stack
     */
	.bss : ALIGN(4)
	{
		*(COMMON)
		*(.bss)
	} >ram

	/*
     * The compiler may produce other sections, by default it will put them in
     * a segment with the same name. Simply add stuff here as needed.
     */
}
