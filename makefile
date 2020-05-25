main.o: main.c
	gcc -Wall -g -O0 -o conway main.c


clean: 
	rm conway *.o

.PHONY: clean