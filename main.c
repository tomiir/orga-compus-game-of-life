#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int obtener_vecinos(unsigned int **mapa, int x, int y,unsigned int w,unsigned int h){
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

void avanzar(unsigned int **mapa,unsigned int ancho,unsigned int alto){
  for(int i = 0; i < ancho; i++) {
    for (int j = 0; j < alto; j++) {
      unsigned int vecinos = obtener_vecinos(mapa, i,j, ancho, alto);
      mapa[i][j] = vecinos == 2 || vecinos == 3;
    }
  }
}

void dump(unsigned int **mapa,unsigned int ancho,unsigned int alto) {
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

int validar_datos(int argc){
  if (argc == 3){
    printf("Iniciando \n");
    return 0;
  }
  else{
    printf("Cantidad incorrecta de parametros. \n");
    return 1;
  }
  
}

int main(int argc, char** argv){
  if(validar_datos(argc) != 0){
    return 1;
  };

  // Convierto los parametros en enteros
  int x = atoi(argv[1]);
  int y = atoi(argv[2]);
  unsigned int w = x;
  unsigned int h = y;

  // Construir mapa
  unsigned int **mapa = malloc(h*sizeof(unsigned int*));
  for (int i = 0; i < w; i++) {
    unsigned int *fila = malloc(w * sizeof(unsigned int));
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
 
