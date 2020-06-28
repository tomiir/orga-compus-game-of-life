#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>

extern int vecinos(unsigned char *mapa, int x, int y,unsigned int filas,unsigned int cols);

unsigned char* crear_mapa(int filas, int cols) {
  unsigned char *mapa = calloc(filas, cols *sizeof(unsigned char));
  return mapa;
}

int es_numerico(char* param){
  size_t len = strlen(param);
  for (int i=0; i<len; i++){
    if(!isdigit(param[i])){
      return -1;
    }
  }
  return 0;
}

int cargar_mapa(unsigned char* mapa, unsigned int filas, unsigned int cols, char* filename) {
  FILE* archivo = fopen(filename, "r");
  if(archivo != NULL) {
    char linea[256];
    while(fgets(linea, sizeof(linea), archivo)) {
      char* input_f = strtok(linea, " ");
      char* input_c = strtok(NULL, "\n");
      if (!(es_numerico(input_f) == 0 && es_numerico(input_c) == 0)) {
        fprintf(stderr, "Error en el archivo de entrada. La celda [%s, %s] contiene caracteres no numéricos.\n", input_f, input_c);
        return -1;
      }
      int f = atoi(input_f);
      int c = atoi(input_c);
      if (f < 0 || c < 0 || f >= filas || c > cols) {
        fprintf(stderr, "Error en el archivo de entrada. Celda [%d, %d] fuera del mapa\n", f, c);
        fclose(archivo);
        return -1;
      }
      unsigned int posicion = c + f * cols;
      mapa[posicion] = 1;
    }
  } else {
    fprintf(stderr, "Error abriendo el archivo de entrada");
    return -1;
  }
  fclose(archivo);
  return 0;
}

void avanzar(unsigned char *mapa, unsigned int filas,unsigned int cols){
  unsigned char* mapa_tmp = crear_mapa(filas, cols);

  for(int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      unsigned int pos = j + i * cols;
      unsigned int cant_vecinos = vecinos(mapa, i,j, filas, cols);
      int vive = mapa[pos] ? (cant_vecinos == 3 || cant_vecinos == 2) : cant_vecinos == 3;
      mapa_tmp[pos] = vive;
    }
  }
  for(int x = 0; x < cols * filas; x++) {
      mapa[x] = mapa_tmp[x];
  }

  free(mapa_tmp);
}

void dump(unsigned char *mapa,unsigned int filas,unsigned int cols, FILE* pgming) {
  /*Volcar Mapa a archivo*/

  for(int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      int pos = j + i * cols;
      printf("%d ", mapa[pos]);
      fprintf(pgming, "%d ", mapa[pos]);
      if (j == cols - 1){
        printf("\n");
        fprintf(pgming, "\n");
      }
    }
  }
  printf("\n");
  printf("\n");
}

int validar_datos(int argc, char** argv){

  int opt;
  if (argc == 2){
    while((opt = getopt(argc, argv, "hv")) != -1) {  
    switch(opt){  
        case 'h':
          printf("-V Da la version del programa. -o Prefijo de los archivos de salida.\n Ejemplos:\n conway 10 20 20 glider -o estado\n Representa 10 iteraciones del Juego de la Vida en una matriz de 20x20, con un estado inicial tomado del archivo ‘‘glider’’. \n Los archivos de salida se llamaran estado_n.pbm.\n Si no se da un prefijo para los archivos de salida\n el prefijo sera el nombre del archivo de entrada\n");
          return -1;
        case 'v':
          printf("Version 1.0.0\n");
          return -1;
        default:
          fprintf(stderr, "Parametros incorrectos, use -h o -v si usa un solo argumento.\n");
          return -1;
      }
    }
  }
  if (argc < 4){
    fprintf(stderr, "Argumentos insuficientes, usar flag -h para ver paramentros obligatorios\n");
    return -1;
  }
  for (int i=1; i<4; i++) {
    if (es_numerico(argv[i]) != 0 || atoi(argv[i]) <= 0) {
      fprintf(stderr, "Parametros incorrectos, las iteraciones y el tamaño de la matriz deben ser enteros positivos.\n");
      return -1;
    } 
  }
  return 0; 
}  


void set_filename(char* filename, char** argv, int argc, int iter){
  if(argc>=7){
    if (strcmp("-o", argv[5])==0){
      strcpy(filename, argv[6]);
    }
  }
  else{
    // Uso nombre default
    strcpy(filename, "default");
  }

  //Agrego el numero de corrida
  char corrida[10];
  sprintf(corrida, "_%d", iter);

  strcat(filename, corrida);
  // Agrego la extension
  strcat(filename,".pbm");
}

int main(int argc, char** argv){
  if(validar_datos(argc,argv)<0){
    return -1;
  }

  unsigned int num_iter = atoi(argv[1]);
  unsigned int filas = atoi(argv[2]);
  unsigned int cols = atoi(argv[3]);
  // Construir mapa
  unsigned char* mapa = crear_mapa(filas, cols);

  // abrir archivo
  char* filename = argv[4];

  if(cargar_mapa(mapa, filas, cols, filename) < 0) {
    fprintf(stderr, "Error cargando mapa. Cerrando programa...\n");
    free(mapa);
    return -1;
  }

  // Correr
  FILE* pgming;
  int k = 0;
  char archivo_salida[500];
  while (k < num_iter) {
    int verbose = 1;
    if(argc == 6 ){
      verbose = strcmp(argv[5],"-p");
    }

    if (verbose != 0){
      // Crear archivo de salida
      set_filename(archivo_salida, argv, argc, k);
      pgming = fopen(archivo_salida, "wb");                 //write the file in binary mode

      // Formateo el achivo de salida
      fprintf(pgming, "P1\n");                              // Writing Magic Number to the File
      fprintf(pgming, "%d %d\n", cols, filas);              // Writing Width and Height into the file
      fprintf(pgming, "\n"); 
      dump(mapa, filas, cols, pgming);
      fclose(pgming);
    }

    avanzar(mapa, filas, cols);
    k++;
  }

  // Limpiar
  free(mapa);
  return 0;
}
