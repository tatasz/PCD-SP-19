int size = 400; //<>//
//definimos a nossa regra
int b[] = {12, 18, 21, 26}; 
//células da geração atual e da anterior
int A[][] = new int[size][size];
int B[][] = new int[size][size];

void settings() {
  size(size, size);
}

void setup() {
  background(255);
  //preenchimento aleatório, densidade 10%
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = (random(1) < 0.1) ? 1 : 0;
      B[i][j] = 0;
    }
  }
  //colorimos os pixels de acordo com o estado das células
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      pixels[i + j * width] = color(A[i][j]* 255);
    }
  }
  updatePixels();
}
 
void draw() {
  for (int i = 0; i <size; i++) {
    //como a nossa vizinhança tem um formato bizarro, varrer a área não compensa
    //faço um vetor auxiliar...
    int ii[] = new int[9];
    for (int k =0; k < 9; k++){
      ii[k] = (i - 4 + k + size) % size;
    }
    for (int j = 0; j < size; j++) {
      //e outro vetor auxiliar...
      int jj[] = new int[9];
      for (int k =0; k < 9; k++){
        jj[k] = (j - 4 + k + size) % size;
      }
      int outval = A[i][j];  
      //e faço a soma na mão, célula a célula
      int soma = A[ii[0]][jj[3]]+A[ii[0]][jj[4]]+A[ii[0]][jj[5]]+A[ii[1]][jj[1]]+A[ii[1]][jj[2]]+A[ii[1]][jj[4]]+A[ii[1]][jj[6]]+A[ii[1]][jj[7]]+
                A[ii[2]][jj[1]]+A[ii[2]][jj[3]]+A[ii[2]][jj[5]]+A[ii[2]][jj[7]]+A[ii[3]][jj[0]]+A[ii[3]][jj[2]]+A[ii[3]][jj[3]]+A[ii[3]][jj[4]]+
                A[ii[3]][jj[5]]+A[ii[3]][jj[6]]+A[ii[3]][jj[8]]+A[ii[4]][jj[0]]+A[ii[4]][jj[1]]+A[ii[4]][jj[3]]+A[ii[4]][jj[5]]+A[ii[4]][jj[7]]+
                A[ii[4]][jj[8]]+A[ii[5]][jj[0]]+A[ii[5]][jj[2]]+A[ii[5]][jj[3]]+A[ii[5]][jj[4]]+A[ii[5]][jj[5]]+A[ii[5]][jj[6]]+A[ii[5]][jj[8]]+
                A[ii[6]][jj[1]]+A[ii[6]][jj[3]]+A[ii[6]][jj[5]]+A[ii[6]][jj[7]]+A[ii[7]][jj[1]]+A[ii[7]][jj[2]]+A[ii[7]][jj[4]]+A[ii[7]][jj[6]]+
                A[ii[7]][jj[7]]+A[ii[8]][jj[3]]+A[ii[8]][jj[4]]+A[ii[8]][jj[5]];  
      //aplicamos as regras
      if (soma >= b[2] & soma <= b[3]){
        outval = 0;
      } 
      if (soma >= b[0] & soma <= b[1]){
        outval = 1;
      }  
      B[i][j] = outval;
    }
  }
  //colorimos os pixels de acordo com o estado das células  
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = B[i][j];
      pixels[i + j * width] = color(A[i][j] * 255);
    }
  }
  updatePixels();
}
