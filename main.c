#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

unsigned char* crear_mapa(int filas, int cols) {
  unsigned char *mapa = calloc(filas, cols *sizeof(unsigned char));
  return mapa;
}

void liberar_mapa(unsigned char* mapa, int filas) {
  free(mapa);
}

unsigned int mapear_posicion(unsigned int x, unsigned int y, unsigned int cols) {
  return x + y * cols;
}



int vecinos(unsigned char *mapa, int x, int y,unsigned int filas,unsigned int cols){
  int contador = 0;
  for(int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {

      int _x = (x + i);
      _x = _x < 0 ? filas - 1 : _x%filas;
      int _y = (y + j);
      _y = _y < 0 ? cols - 1 : _y%cols;

      unsigned int pos = mapear_posicion(_x,_y, cols);
      if (!(i == 0 && j == 0)) contador += mapa[pos] ? 1 : 0;
    }
  }
  // printf("Fila:%d Columna:%d  Valor: %d- Vecinos: %d \n", x, y, mapa[mapear_posicion(x,y,cols)], contador);
  return contador;
}


void avanzar(unsigned char *mapa, unsigned int filas,unsigned int cols){
  unsigned char* mapa_tmp = crear_mapa(filas, cols);

  for(int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      unsigned int pos = mapear_posicion(i,j, cols);
      unsigned int cant_vecinos = vecinos(mapa, i,j, filas, cols);
      int vive = mapa[pos] ? (cant_vecinos == 3 || cant_vecinos == 2) : cant_vecinos == 3;
      // printf("Cant Vec: %d  Vive: %d  SobreVive: %d",cant_vecinos, mapa[pos], vive);
      mapa_tmp[pos] = vive;
    }
  }
  for(int x = 0; x < filas; x++) {
    for(int y = 0; y < cols; y++) {
      unsigned int pos = mapear_posicion(x,y, cols);
      mapa[pos] = mapa_tmp[pos];
    }
  }

  liberar_mapa(mapa_tmp, filas);
}

void dump(unsigned char *mapa,unsigned int filas,unsigned int cols) {
  /*Volcar Mapa a archivo*/
  for(int i = 0; i < cols; i++) {
    for (int j = 0; j < filas; j++) {
      unsigned int pos = mapear_posicion(i,j, cols);
      printf("%d", mapa[pos]);
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

int main(int argc, char** argv){
  // Convierto los parametros en enteros
  unsigned int num_iter = atoi(argv[1]);
  unsigned int cols = atoi(argv[2]);
  unsigned int filas = atoi(argv[3]);
  char* filename = argv[4];
  // Construir mapa
  unsigned char* mapa = crear_mapa(filas, cols);

  // Crear archivo de salida
  FILE* pgmimg;
  pgmimg = fopen("my_pgmimg.pgm", "wb"); //write the file in binary mode

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
      unsigned int posicion = mapear_posicion(x,y, cols);
      mapa[posicion] = 1;
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
