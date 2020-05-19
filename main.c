#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int obtener_vecinos(int **mapa, int x, int y, int w, int h){
  int contador = 0;
  for(int i = 0; i <= 1; i++) {
    for (int j = 0; j <= 1; j++) {
      int _x = (x + i)%w;
      int _y = (y + i)%h;

      if (i+j != 0) contador += mapa[_x][_y];
    }
  }
  // printf("Fila:%d Columna:%d - Vecinos: %d \n", x, y, contador);
  return contador;
}

void avanzar(int **mapa, int ancho, int alto){
  for(int i = 0; i < ancho; i++) {
    for (int j = 0; j < alto; j++) {
      int vecinos = obtener_vecinos(mapa, i,j, ancho, alto);
      mapa[i][j] = vecinos == 2 || vecinos == 3;
    }
  }
}

void dump(int **mapa, int ancho, int alto) {
  /*Volcar Mapa a archivo*/
  for(int i = 0; i < ancho; i++) {
    for (int j = 0; j < alto; j++) {
      printf("%d", mapa[i][j]);
      if (j == ancho - 1) printf("\n");
    }
  }
  printf("\n");
  printf("\n");
}

int main(int argc, char** argv){
  int w = 10;
  int h = 10;

  // Construir mapa
  int **mapa = malloc(h*sizeof(int*));
  for (int i = 0; i < w; i++) {
    int *fila = malloc(w * sizeof(int));
    for(int j = 0; j< h; j++) {
      fila[j] =  rand() < RAND_MAX / 10 ? 1 : 0;
    }
    mapa[i] = fila;
  }

  // Correr
  int k = 0;
	while (k < 10) {
		dump(mapa, w, h);
		avanzar(mapa, w, h);
    k++;
	
  }

  // Limpiar
  for (int i = 0; i < w; i++) {
    free(mapa[i]);
  }
  free(mapa);

  return 0;
}
 
