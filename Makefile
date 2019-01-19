boot.o: src/boot.s
	i686-linux-gnu-as -o boot.o src/boot.s

kernel.o: src/kernel.c
	i686-linux-gnu-gcc -c src/kernel.c -o kernel.o -std=gnu99 -ffreestanding -Wall

clean:
	rm boot.o
