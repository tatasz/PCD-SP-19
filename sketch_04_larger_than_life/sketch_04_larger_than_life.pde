int size = 400;

//parâmetros
//tamanho da vizinhança
int range = 5;
//constantes nas condições de mudança de estado
int b1 = 9;
int b2 = 9;
int a1 = 9;
int a2 = 9;

//matrizes para as gerações atual e anterior
int A[][] = new int[size][size];
int B[][] = new int[size][size];

void settings() {
  size(size, size);
}

void setup() { //<>//
  background(0);
  //geramos uma distribuição aleatória de células
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      //densidade 10%
      A[i][j] = (random(1) < 0.1) ? 1 : 0;
      B[i][j] = 0;
    }
  }
  //preenchemos a tela, pixel a pixel
  loadPixels();
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      color c = (A[i][j] == 1) ? color(255) : color(0);
      pixels[i * size + j] = c;
    }
  }
  updatePixels();
}
 
void draw() {
  //varremos todas as células
  for (int i = 0; i <size; i++) { //<>//
    for (int j = 0; j < size; j++) {
      int sum = 0;
      //varremos a vizinhança
      for (int ii = -range; ii <= range; ii++){
        int xi = (ii + i + size) % size;
        for (int jj = -range; jj <= range; jj++){
          int yj =(jj + j + size) % size; //<>//
          sum += A[xi][yj];
        }
      }
      //aplicamos as regras
      //se a célula está viva e a soma da vizinhança satisfaz a condição de vida, ela permanece viva
      if (A[i][j] == 1 & sum >= a1 & sum <= a2){
        B[i][j] = 1;
      } else {
        //se a célula está morta e a soma da vizinhança satisfaz a condição de vida, ela fica viva 
        if (A[i][j] == 0 & sum >= b1 & sum <= b2){
          B[i][j] = 1;
        } else {
          //caso contrário, ela morre ou permanece morta
          B[i][j] = 0;
        }
      }
    }
  }
  //preenchemos a tela, pixel a pixel
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = B[i][j];
      color c = (A[i][j] == 1) ? color(255) : color(0);
      pixels[i * size + j] = c;
    }
  }
  updatePixels();
}
