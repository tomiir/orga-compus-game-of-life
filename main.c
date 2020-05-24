#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int obtener_vecinos(unsigned int **mapa, int x, int y,unsigned int w,unsigned int h){
  int contador = 0;
  for(int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int _x = (x + i)%w;
      int _y = (y + j)%h;

      if (i+j != 0) contador += mapa[_x][_y] ? 1 : 0;
    }
  }
  printf("Fila:%d Columna:%d  Valor: %d- Vecinos: %d \n", x, y, mapa[x][y], contador);
  return contador;
}

void avanzar(unsigned int **mapa,unsigned int ancho,unsigned int alto){
  unsigned int **nuevo_mapa = malloc(sizeof(mapa));
  nuevo_mapa = mapa;
  for(int i = 0; i < ancho; i++) {
    for (int j = 0; j < alto; j++) {
      unsigned int vecinos = obtener_vecinos(mapa, i,j, ancho, alto);
      nuevo_mapa[i][j] = vecinos == 2 || vecinos == 3;
    }
  }
  mapa = nuevo_mapa;
}

void dump(unsigned int **mapa,unsigned int ancho,unsigned int alto) {
  /*Volcar Mapa a archivo*/
  for(int i = 0; i < alto; i++) {
    for (int j = 0; j < ancho; j++) {
      printf("%d", mapa[i][j]);
      if (j == ancho - 1) printf("\n");
    }
  }
  printf("\n");
  printf("\n");
}

int validar_datos(int argc){
  if (argc >= 5){
    printf("Iniciando \n");
    return 0;
  }
  else{
    printf("Cantidad incorrecta de parametros. \n");
    return 1;
  }
  
}

int main(int argc, char** argv){
  // Convierto los parametros en enteros
  unsigned int num_iter = atoi(argv[1]);
  unsigned int cols = atoi(argv[2]);
  unsigned int filas = atoi(argv[3]);
  char* filename = argv[4];
  // Construir mapa
  unsigned int **mapa = malloc(filas*sizeof(unsigned int*));
  for (int i = 0; i < filas; i++) {
    unsigned int *fila = malloc(cols * sizeof(unsigned int));
    for(int j = 0; j< cols; j++) {
      fila[j] =  0;
    }
    mapa[i] = fila;
  }

  // abrir archivo
  FILE* archivo = fopen(filename, "r");
  if(archivo != NULL) {
    char linea[256];
    while(fgets(linea, sizeof(linea), archivo)) {
      int x = atoi(strtok(linea, " "));
      int y = atoi(strtok(NULL, " "));
      if (x > filas || y > cols) {
        printf("ERROR EN EL ARCHIVO DE ENTRADA \n");
        printf("Celda [%d, %d] fuera del mapa", x, y);
        return 1;
      }
      mapa[x][y] = 1;
    }
  }

  // por cada linea en el archivo filename -> marcar el punto en el mapa


  // Correr
  int k = 0;
	while (k < num_iter) {
		dump(mapa, filas, cols);
		avanzar(mapa, filas, cols);
    k++;
  }

  // Limpiar
  for (int i = 0; i < filas; i++) {
    free(mapa[i]);
  }
  free(mapa);

  return 0;
}
 
