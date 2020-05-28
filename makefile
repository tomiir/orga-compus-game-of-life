main.o: main.c
	gcc -Wall -g -O0 -o conway main.c


mips: main.c vecinos.S
	gcc -Wall -g -O0 -o conway main_mips.c vecinos.S


clean:
	find . -type f -iname \*.pbm -delete
	rm -rf conway output

.PHONY: clean