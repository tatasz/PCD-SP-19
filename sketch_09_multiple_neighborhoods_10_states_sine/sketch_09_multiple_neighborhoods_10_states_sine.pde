int size = 400; //<>//
//definimos a nossa regra
float b[] = {0.008984578, 0.003306883};
//número de estados
int states = 10;
//células da geração atual e da anterior
int A[][] = new int[size][size];
int B[][] = new int[size][size];

void settings() {
  size(size, size);
}

void setup() {
  background(255);
  //preenchimento aleatório, densidade 5%
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = (random(1) < 0.1) ? floor(random(states)) : 0;
      B[i][j] = 0;
    }
  }
  //colorimos os pixels de acordo com o estado das células
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      pixels[i + j * width] = color(A[i][j] * 255 / (states - 1));
    }
  }
  updatePixels();
}
 
void draw() {
  for (int i = 0; i <size; i++) {
    //como a nossa vizinhança tem um formato bizarro, varrer a área não compensa
    //faço um vetor auxiliar...
    int ii[] = new int[29];
    for (int k =0; k < 29; k++){
      ii[k] = (i - 14 + k + size) % size;
    }
    for (int j = 0; j < size; j++) {
      //e outro vetor auxiliar...
      int jj[] = new int[29];
      for (int k =0; k < 29; k++){
        jj[k] = (j - 14 + k + size) % size;
      }
      int outval = A[i][j];  
      //e faço a soma na mão, célula a célula
        int soma0 = A[ii[13]][jj[13]]+A[ii[13]][jj[14]]+A[ii[13]][jj[15]]+A[ii[14]][jj[13]]+A[ii[14]][jj[15]]+A[ii[15]][jj[13]]+A[ii[15]][jj[14]]+A[ii[15]][jj[15]];
        int soma1 = A[ii[0]][jj[12]]+A[ii[0]][jj[13]]+A[ii[0]][jj[14]]+A[ii[0]][jj[15]]+A[ii[0]][jj[16]]+A[ii[1]][jj[9]]+A[ii[1]][jj[10]]+A[ii[1]][jj[11]]+A[ii[1]][jj[12]]+A[ii[1]][jj[13]]+A[ii[1]][jj[14]]+A[ii[1]][jj[15]]+A[ii[1]][jj[16]]+A[ii[1]][jj[17]]+A[ii[1]][jj[18]]+A[ii[1]][jj[19]]+A[ii[2]][jj[7]]+A[ii[2]][jj[8]]+A[ii[2]][jj[9]]+A[ii[2]][jj[10]]+A[ii[2]][jj[11]]+A[ii[2]][jj[12]]+A[ii[2]][jj[13]]+A[ii[2]][jj[14]]+A[ii[2]][jj[15]]+A[ii[2]][jj[16]]+A[ii[2]][jj[17]]+A[ii[2]][jj[18]]+A[ii[2]][jj[19]]+A[ii[2]][jj[20]]+A[ii[2]][jj[21]]+A[ii[3]][jj[5]]+A[ii[3]][jj[6]]+A[ii[3]][jj[7]]+A[ii[3]][jj[8]]+A[ii[3]][jj[9]]+A[ii[3]][jj[10]]+A[ii[3]][jj[18]]+A[ii[3]][jj[19]]+A[ii[3]][jj[20]]+A[ii[3]][jj[21]]+A[ii[3]][jj[22]]+A[ii[3]][jj[23]]+A[ii[4]][jj[4]]+A[ii[4]][jj[5]]+A[ii[4]][jj[6]]+A[ii[4]][jj[7]]+A[ii[4]][jj[8]]+A[ii[4]][jj[13]]+A[ii[4]][jj[14]]+A[ii[4]][jj[15]]+A[ii[4]][jj[20]]+A[ii[4]][jj[21]]+A[ii[4]][jj[22]]+A[ii[4]][jj[23]]+A[ii[4]][jj[24]]+A[ii[5]][jj[3]]+A[ii[5]][jj[4]]+A[ii[5]][jj[5]]+A[ii[5]][jj[6]]+A[ii[5]][jj[10]]+A[ii[5]][jj[11]]+A[ii[5]][jj[12]]+A[ii[5]][jj[16]]+A[ii[5]][jj[17]]+A[ii[5]][jj[18]]+A[ii[5]][jj[22]]+A[ii[5]][jj[23]]+A[ii[5]][jj[24]]+A[ii[5]][jj[25]]+A[ii[6]][jj[3]]+A[ii[6]][jj[4]]+A[ii[6]][jj[5]]+A[ii[6]][jj[8]]+A[ii[6]][jj[9]]+A[ii[6]][jj[19]]+A[ii[6]][jj[20]]+A[ii[6]][jj[23]]+A[ii[6]][jj[24]]+A[ii[6]][jj[25]]+A[ii[7]][jj[2]]+A[ii[7]][jj[3]]+A[ii[7]][jj[4]]+A[ii[7]][jj[7]]+A[ii[7]][jj[8]]+A[ii[7]][jj[20]]+A[ii[7]][jj[21]]+A[ii[7]][jj[24]]+A[ii[7]][jj[25]]+A[ii[7]][jj[26]]+A[ii[8]][jj[2]]+A[ii[8]][jj[3]]+A[ii[8]][jj[4]]+A[ii[8]][jj[6]]+A[ii[8]][jj[7]]+A[ii[8]][jj[21]]+A[ii[8]][jj[22]]+A[ii[8]][jj[24]]+A[ii[8]][jj[25]]+A[ii[8]][jj[26]]+A[ii[9]][jj[1]]+A[ii[9]][jj[2]]+A[ii[9]][jj[3]]+A[ii[9]][jj[6]]+A[ii[9]][jj[22]]+A[ii[9]][jj[25]]+A[ii[9]][jj[26]]+A[ii[9]][jj[27]]+A[ii[10]][jj[1]]+A[ii[10]][jj[2]]+A[ii[10]][jj[3]]+A[ii[10]][jj[5]]+A[ii[10]][jj[23]]+A[ii[10]][jj[25]]+A[ii[10]][jj[26]]+A[ii[10]][jj[27]]+A[ii[11]][jj[1]]+A[ii[11]][jj[2]]+A[ii[11]][jj[5]]+A[ii[11]][jj[23]]+A[ii[11]][jj[26]]+A[ii[11]][jj[27]]+A[ii[12]][jj[0]]+A[ii[12]][jj[1]]+A[ii[12]][jj[2]]+A[ii[12]][jj[5]]+A[ii[12]][jj[23]]+A[ii[12]][jj[26]]+A[ii[12]][jj[27]]+A[ii[12]][jj[28]]+A[ii[13]][jj[0]]+A[ii[13]][jj[1]]+A[ii[13]][jj[2]]+A[ii[13]][jj[4]]+A[ii[13]][jj[24]]+A[ii[13]][jj[26]]+A[ii[13]][jj[27]]+A[ii[13]][jj[28]]+A[ii[14]][jj[0]]+A[ii[14]][jj[1]]+A[ii[14]][jj[2]]+A[ii[14]][jj[4]]+A[ii[14]][jj[24]]+A[ii[14]][jj[26]]+A[ii[14]][jj[27]]+A[ii[14]][jj[28]]+A[ii[15]][jj[0]]+A[ii[15]][jj[1]]+A[ii[15]][jj[2]]+A[ii[15]][jj[4]]+A[ii[15]][jj[24]]+A[ii[15]][jj[26]]+A[ii[15]][jj[27]]+A[ii[15]][jj[28]]+A[ii[16]][jj[0]]+A[ii[16]][jj[1]]+A[ii[16]][jj[2]]+A[ii[16]][jj[5]]+A[ii[16]][jj[23]]+A[ii[16]][jj[26]]+A[ii[16]][jj[27]]+A[ii[16]][jj[28]]+A[ii[17]][jj[1]]+A[ii[17]][jj[2]]+A[ii[17]][jj[5]]+A[ii[17]][jj[23]]+A[ii[17]][jj[26]]+A[ii[17]][jj[27]]+A[ii[18]][jj[1]]+A[ii[18]][jj[2]]+A[ii[18]][jj[3]]+A[ii[18]][jj[5]]+A[ii[18]][jj[23]]+A[ii[18]][jj[25]]+A[ii[18]][jj[26]]+A[ii[18]][jj[27]]+A[ii[19]][jj[1]]+A[ii[19]][jj[2]]+A[ii[19]][jj[3]]+A[ii[19]][jj[6]]+A[ii[19]][jj[22]]+A[ii[19]][jj[25]]+A[ii[19]][jj[26]]+A[ii[19]][jj[27]]+A[ii[20]][jj[2]]+A[ii[20]][jj[3]]+A[ii[20]][jj[4]]+A[ii[20]][jj[6]]+A[ii[20]][jj[7]]+A[ii[20]][jj[21]]+A[ii[20]][jj[22]]+A[ii[20]][jj[24]]+A[ii[20]][jj[25]]+A[ii[20]][jj[26]]+A[ii[21]][jj[2]]+A[ii[21]][jj[3]]+A[ii[21]][jj[4]]+A[ii[21]][jj[7]]+A[ii[21]][jj[8]]+A[ii[21]][jj[20]]+A[ii[21]][jj[21]]+A[ii[21]][jj[24]]+A[ii[21]][jj[25]]+A[ii[21]][jj[26]]+A[ii[22]][jj[3]]+A[ii[22]][jj[4]]+A[ii[22]][jj[5]]+A[ii[22]][jj[8]]+A[ii[22]][jj[9]]+A[ii[22]][jj[19]]+A[ii[22]][jj[20]]+A[ii[22]][jj[23]]+A[ii[22]][jj[24]]+A[ii[22]][jj[25]]+A[ii[23]][jj[3]]+A[ii[23]][jj[4]]+A[ii[23]][jj[5]]+A[ii[23]][jj[6]]+A[ii[23]][jj[10]]+A[ii[23]][jj[11]]+A[ii[23]][jj[12]]+A[ii[23]][jj[16]]+A[ii[23]][jj[17]]+A[ii[23]][jj[18]]+A[ii[23]][jj[22]]+A[ii[23]][jj[23]]+A[ii[23]][jj[24]]+A[ii[23]][jj[25]]+A[ii[24]][jj[4]]+A[ii[24]][jj[5]]+A[ii[24]][jj[6]]+A[ii[24]][jj[7]]+A[ii[24]][jj[8]]+A[ii[24]][jj[13]]+A[ii[24]][jj[14]]+A[ii[24]][jj[15]]+A[ii[24]][jj[20]]+A[ii[24]][jj[21]]+A[ii[24]][jj[22]]+A[ii[24]][jj[23]]+A[ii[24]][jj[24]]+A[ii[25]][jj[5]]+A[ii[25]][jj[6]]+A[ii[25]][jj[7]]+A[ii[25]][jj[8]]+A[ii[25]][jj[9]]+A[ii[25]][jj[10]]+A[ii[25]][jj[18]]+A[ii[25]][jj[19]]+A[ii[25]][jj[20]]+A[ii[25]][jj[21]]+A[ii[25]][jj[22]]+A[ii[25]][jj[23]]+A[ii[26]][jj[7]]+A[ii[26]][jj[8]]+A[ii[26]][jj[9]]+A[ii[26]][jj[10]]+A[ii[26]][jj[11]]+A[ii[26]][jj[12]]+A[ii[26]][jj[13]]+A[ii[26]][jj[14]]+A[ii[26]][jj[15]]+A[ii[26]][jj[16]]+A[ii[26]][jj[17]]+A[ii[26]][jj[18]]+A[ii[26]][jj[19]]+A[ii[26]][jj[20]]+A[ii[26]][jj[21]]+A[ii[27]][jj[9]]+A[ii[27]][jj[10]]+A[ii[27]][jj[11]]+A[ii[27]][jj[12]]+A[ii[27]][jj[13]]+A[ii[27]][jj[14]]+A[ii[27]][jj[15]]+A[ii[27]][jj[16]]+A[ii[27]][jj[17]]+A[ii[27]][jj[18]]+A[ii[27]][jj[19]]+A[ii[28]][jj[12]]+A[ii[28]][jj[13]]+A[ii[28]][jj[14]]+A[ii[28]][jj[15]]+A[ii[28]][jj[16]];

      //aplicamos as regras
        float s0 = (sin(b[0] * soma0));
        float s1 = (sin(b[1] * soma1));
        outval = (s0 > 0) ? floor(s0 * states) : outval;
        outval = (s1 > 0) ? floor(s1 * states) : outval;

      B[i][j] = outval;
    }
  }
  //colorimos os pixels de acordo com o estado das células  
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = B[i][j];
      pixels[i + j * width] = color(A[i][j] * 255 / (states - 1));
    }
  }
  updatePixels();
}
