#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

unsigned int** crear_mapa(int filas, int cols) {
  unsigned int **mapa = malloc(filas*sizeof(unsigned int*));
  for (int i = 0; i < filas; i++) {
    unsigned int *fila = calloc(cols,  sizeof(unsigned int));
    mapa[i] = fila;
  }
  return mapa;
}

void liberar_mapa(unsigned int** mapa, int filas) {
    for (int i = 0; i < filas; i++) {
    free(mapa[i]);
  }
  free(mapa);
}

int vecinos(unsigned int **mapa, int x, int y,unsigned int filas,unsigned int cols){
  int contador = 0;
  // printf("Celda: [%d, %d]: \n ", x ,y);
  for(int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {

      int _x = (x + i);
      _x = _x < 0 ? filas - 1 : _x%filas;

      int _y = (y + j);
      _y = _y < 0 ? cols - 1 : _y%cols;

      // printf("i: %d, j: %d, posicion corregida: [%d %d]\n",i, j, _x,_y);
      if (!(i == 0 && j == 0)) contador += mapa[_x][_y] ? 1 : 0;
    }
  }
  // printf("Fila:%d Columna:%d  Valor: %d- Vecinos: %d \n", x, y, mapa[x][y], contador);
  return contador;
}

void avanzar(unsigned int **mapa, unsigned int filas,unsigned int cols){
  unsigned int** mapa_tmp = crear_mapa(filas, cols);

  for(int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      unsigned int cant_vecinos = vecinos(mapa, i,j, filas, cols);
      int vive = mapa[i][j] ? cant_vecinos == 3 || cant_vecinos == 2 : cant_vecinos == 3;
      mapa_tmp[i][j] = vive;
    }
  }
  for(int x = 0; x < filas; x++) {
    for(int y = 0; y < cols; y++) {
      mapa[x][y] = mapa_tmp[x][y];
    }
  }

  liberar_mapa(mapa_tmp, filas);
}

void dump(unsigned int **mapa,unsigned int filas,unsigned int cols) {
  /*Volcar Mapa a archivo*/
  for(int i = 0; i < cols; i++) {
    for (int j = 0; j < filas; j++) {
      printf("%d", mapa[i][j]);
      if (j == filas - 1) printf("\n");
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

// Funcion que imprime la matriz en un archivo formato pgm
void imprimir_pgm(unsigned char** mapa, FILE* pgming, unsigned int h, unsigned int w){ 
  // h y w son las filas y las columnas
  int count = 0;
  int i, j;
  for (i = 0; i < h; i++) {
    for (j = 0; j < w; j++) {
      fprintf(pgming, "%d ", mapa[i][j]); //Copy gray value from array to file
    }
    fprintf(pgming, "\n");
  }
}

void set_filename(char* filename, char** argv, int argc){
  if (argc == 6){
    if (strcmp(argv[5], "-o") == 0 ){
      // Uso nombre pasado por parametro
      strcpy(filename,(const char)* argv[6]);
    }
    else{
      // Uso nombre default
      strcpy(filename, (const char)* argv[4]);
    } 
  }
  // Agrego la extension 
  strcat(filename,".pbm");
}

int main(int argc, char** argv){
  // Convierto los parametros en enteros
  unsigned int num_iter = atoi(argv[1]);
  unsigned int cols = atoi(argv[2]);
  unsigned int filas = atoi(argv[3]);
  // Construir mapa
  unsigned int** mapa = crear_mapa(filas, cols);

  //Crear nombre del archivo de salida
  char filename[30];
  set_filename(&filename, argv, argc);

  // Crear archivo de salida
  FILE* pgmimg;
  pgmimg = fopen((const char)* filename, "wb"); //write the file in binary mode
  
  // Formateo el achivo de salida
  fprintf(pgmimg, "P2\n"); // Writing Magic Number to the File
  fprintf(pgmimg, "%d %d\n", cols, filas); // Writing Width and Height into the file
  fprintf(pgmimg, "1\n"); // Writing the maximum gray value

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

  // Correr
  int k = 0;
	while (k < num_iter) {
		dump(mapa, filas, cols);
		avanzar(mapa, filas, cols);
    k++;
  }

  // Limpiar
  liberar_mapa(mapa, filas);
  
  // Cerrar archivo de salida
  fclose(pgmimg);

  return 0;
}