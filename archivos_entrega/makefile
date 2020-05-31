main.o: main.c
	gcc -Wall -g -O0 -o conway main.c


mips: main.c vecinos.S
	gcc -Wall -g -O0 -o conway main_mips.c vecinos.S

opt1: main.c
	gcc -Wall -g -O1 -o conway main.c

opt2: main.c
	gcc -Wall -g -O2 -o conway main.c

opt3: main.c
	gcc -Wall -g -O3 -o conway main.c

opt1_mips: main.c vecinos.S
	gcc -Wall -g -O1 -o conway main_mips.c vecinos.S

opt2_mips: main.c vecinos.S
	gcc -Wall -g -O2 -o conway main_mips.c vecinos.S

opt3_mips: main.c vecinos.S
	gcc -Wall -g -O3 -o conway main_mips.c vecinos.S

clean:
	find . -type f -iname \*.pbm -delete
	rm -rf conway output

.PHONY: clean