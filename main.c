#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>

unsigned char* crear_mapa(int filas, int cols) {
  unsigned char *mapa = calloc(filas, cols *sizeof(unsigned char));
  return mapa;
}
int parametro_es_numerico(char* param){
  size_t len = strlen(param);
  for (int i=0; i<len; i++){
    if(!isdigit(param[i])){
      return -1;
    }
  }
  return 0;
}

int vecinos(unsigned char *mapa, int x, int y,unsigned int filas,unsigned int cols){
  unsigned int contador = 0;
  for(int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {

      int _x = (x + i);
      _x = _x < 0 ? filas - 1 : _x%filas;
      int _y = (y + j);
      _y = _y < 0 ? cols - 1 : _y%cols;

      unsigned int pos = _y + _x * cols;

      if (!(i == 0 && j == 0)) contador += mapa[pos] ? 1 : 0;
    }
  }
  return contador;
}


void avanzar(unsigned char *mapa, unsigned int filas,unsigned int cols){
  unsigned char* mapa_tmp = crear_mapa(filas, cols);

  for(int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      unsigned int pos = j + i * cols;
      unsigned int cant_vecinos = vecinos(mapa, i,j, filas, cols);
      int vive = mapa[pos] ? (cant_vecinos == 3 || cant_vecinos == 2) : cant_vecinos == 3;
      // printf("Cant Vec: %d  Vive: %d  SobreVive: %d",cant_vecinos, mapa[pos], vive);
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
          printf("Info\n");
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
  for (int i=1; i<4; i++){
    if ( parametro_es_numerico(argv[i]) != 0 ){
      fprintf(stderr, "Parametros incorrectos, use -h o -v si usa un solo argumento.\n");
      return -1;
    }
  }
  return 0; 
}  


void set_filename(char* filename, char** argv, int argc, int iter){
  if(argc>=5){
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
  sprintf(corrida, "%d", iter);

  strcat(filename, corrida);
  // Agrego la extension
  strcat(filename,".pbm");
}

int main(int argc, char** argv){
  // Convierto los parametros en enteros
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

  FILE* archivo = fopen(filename, "r");
  if(archivo != NULL) {
    char linea[256];
    while(fgets(linea, sizeof(linea), archivo)) {
      int f = atoi(strtok(linea, " "));
      int c = atoi(strtok(NULL, " "));
      if (f > filas || c > cols) {
        printf("ERROR EN EL ARCHIVO DE ENTRADA \n");
        printf("Celda [%d, %d] fuera del mapa", f, c);
        return 1;
      }
      unsigned int posicion = c + f * cols;
      mapa[posicion] = 1;
    }
  }

  // Correr
  FILE* pgming;
  int k = 0;
  char archivo_salida[500];
	while (k < num_iter) {
    // Crear archivo de salida
    set_filename(archivo_salida, argv, argc, k);
    pgming = fopen(archivo_salida, "wb"); //write the file in binary mode

    // Formateo el achivo de salida
    fprintf(pgming, "P1\n");  // Writing Magic Number to the File
    fprintf(pgming, "%d %d\n", cols, filas); // Writing Width and Height into the file
    fprintf(pgming, "\n"); // Writing the maximum gray value

		dump(mapa, filas, cols, pgming);
		avanzar(mapa, filas, cols);
    k++;
  }

  // Limpiar
  free(mapa);

  // Cerrar archivo de salida
  fclose(pgming);

  return 0;
}
