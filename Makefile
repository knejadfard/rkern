OPTIONS=-m32 -Isrc/
WARNS=-Wall -Wextra -pedantic
COMMON=-ffreestanding -nostdlib -MMD -fstack-protector-strong $(OPTIONS) $(WARNS)
LDFLAGS=-static -nostdlib -melf_i386 --strip-all --script=src/linker.ld
CFLAGS=-std=gnu11 $(COMMON)
CXXFLAGS=-std=c++14 -fno-exceptions -fno-rtti $(COMMON)

COBJ=build/kernel.o
ASMOBJ=build/boot.o
OUT=build/rkern.bin

all: $(COBJ) $(ASMOBJ)
	$(LD) $(LDFLAGS) $(COBJ) $(ASMOBJ) -o $(OUT)

build/%.o: src/%.asm
	i686-gnu-as -o $@ $<

build/%.o: src/%.c
	$(CC) -target i386 $(CFLAGS) -c $< -o $@

clean:
	rm -r build/
