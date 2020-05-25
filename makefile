main.o: main.c
	gcc -Wall -g -O0 -o conway main.c


clean: 
	find . -type f -iname \*.pbm -delete
	rm -rf conway output

.PHONY: clean