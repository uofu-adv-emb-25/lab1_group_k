CPP = arm-none-eabi-cpp
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
SRC = main.c second.c
OBJS = $(patsubst %.c,%.o,$(SRC))

all: firmware.elf

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean all
clean:
	rm -f *.i *.s *.o hello.txt firmware.elf

