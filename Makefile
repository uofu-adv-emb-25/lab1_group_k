CPP = arm-none-eabi-cpp
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f *.i *.s *.o hello.txt

