CPP = arm-none-eabi-cpp
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as

main.i: main.c
	$(CPP) main.c > main.i

second.i: second.c
	$(CPP) second.c > second.i

main.s: main.i
	$(CC) -S main.i

second.s: second.i
	$(CC) -S second.i

main.o: main.s
	$(AS) main.s -o main.o

second.o: second.s
	$(AS) second.s -o second.o

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f main.i main.s main.o second.i second.s second.o hello.txt

