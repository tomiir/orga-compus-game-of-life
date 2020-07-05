#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "./cache.h"

void read_file(char *file_path) {
  FILE * file_pointer;
  char * line = NULL;
  size_t len = 0;

  file_pointer = fopen(file_path, "r");
  if (file_pointer == NULL) {
    fprintf(stderr, "Error abriendo el archivo de entrada. Cerrando...");
    exit(EXIT_FAILURE);
  }

  char *remaining;
  while (getline(&line, &len,  file_pointer) != -1) {
      printf("%s", line);
      if (line[0] == 'R') {
          unsigned int address = atoi(line + 2);
          if (address < MEM_SIZE) {
              printf("Se ejecuta read_byte(%i) con resultado: %u.\n", address, read_byte(address));
          } else {
              printf("Se intentó ejecutar read_byte(%i), pero la dirección se encuentra fuera de rango.\n", address);
          }
      }
      // Caso Write
      else if (line[0] == 'W') {
          unsigned int address = strtol(line + 2, &remaining, 10);
          unsigned int value = strtol(remaining + 2, &remaining, 10);
          if (address < MEM_SIZE) {
              printf("Se ejecuta write_byte(%i, %i).\n", address, value);
              write_byte(address, value);
          } else {
              printf("Se intentó ejecutar write_byte(%i), pero la dirección se encuentra fuera de rango.\n", address);
          }
      } else if (line[0] == 'M' && line[1] == 'R') {
          printf("Se ejecuta get_miss_rate() con resultado: %f.\n", get_miss_rate());
      }
      else if (strlen(line) != 1) {
        printf("Se encontró una línea inválida en el archivo de entrada");
      }
  }
  
  fclose(file_pointer);
  if (line) free(line);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "%s", "Uso: ./memsym archivo_comandos.\n");
        return 1;
    }
    init();
    read_file(argv[1]);
}