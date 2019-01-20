int size = 400; //<>//
//definimos a nossa regra
float b[] = {0.07439784, 0.08640735};
float b0[] = {0.07906281, 1.666969, 1.6843622, 1.8832203, 1.9594915, 1.9711796};
float b1[] = {0.13060886, 0.5250461, 1.2263749, 1.7707202}; 
//número de estados
int states = 60;
//vamos ter cores, só pra variar
color cores[] = new color[states];
//células da geração atual e da anterior
int A[][] = new int[size][size];
int B[][] = new int[size][size];

void settings() {
  size(size, size);
  //criamos um gradiente do preto pro azul, depois vermelho, depois branco.
  for (int i=0; i<20; i++){
    cores[i] = color(0, 150*i/20, 250*i/20);
  }
  for (int i=0; i<20; i++){
    cores[i+20] = color(250*i/20, 150*(20-i)/20, 250*(20-i)/20 + 100*i/20);
  }
  for (int i=0; i<40; i++){
    cores[i+20] = color(250*(20-i)/20 + 255*i/20, 255*i/20, 100*(20-i)/20 + 255*i/20);
  }
}

void setup() {
  background(255);
  //preenchimento aleatório, densidade 50%
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = (random(1) < 0.5) ? floor(random(states)) : 0;
      B[i][j] = 0;
    }
  }
  //colorimos os pixels de acordo com o estado das células
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      pixels[i + j * width] = cores[A[i][j]];
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
        int soma0 = A[ii[1]][jj[3]]+A[ii[1]][jj[4]]+A[ii[1]][jj[5]]+A[ii[2]][jj[2]]+A[ii[2]][jj[6]]+A[ii[3]][jj[1]]+A[ii[3]][jj[3]]+A[ii[3]][jj[4]]+A[ii[3]][jj[5]]+A[ii[3]][jj[7]]+A[ii[4]][jj[1]]+A[ii[4]][jj[3]]+A[ii[4]][jj[5]]+A[ii[4]][jj[7]]+A[ii[5]][jj[1]]+A[ii[5]][jj[3]]+A[ii[5]][jj[4]]+A[ii[5]][jj[5]]+A[ii[5]][jj[7]]+A[ii[6]][jj[2]]+A[ii[6]][jj[6]]+A[ii[7]][jj[3]]+A[ii[7]][jj[4]]+A[ii[7]][jj[5]];
        int soma1 = A[ii[0]][jj[3]]+A[ii[0]][jj[4]]+A[ii[0]][jj[5]]+A[ii[1]][jj[1]]+A[ii[1]][jj[2]]+A[ii[1]][jj[4]]+A[ii[1]][jj[6]]+A[ii[1]][jj[7]]+A[ii[2]][jj[1]]+A[ii[2]][jj[3]]+A[ii[2]][jj[5]]+A[ii[2]][jj[7]]+A[ii[3]][jj[0]]+A[ii[3]][jj[2]]+A[ii[3]][jj[3]]+A[ii[3]][jj[4]]+A[ii[3]][jj[5]]+A[ii[3]][jj[6]]+A[ii[3]][jj[8]]+A[ii[4]][jj[0]]+A[ii[4]][jj[1]]+A[ii[4]][jj[3]]+A[ii[4]][jj[5]]+A[ii[4]][jj[7]]+A[ii[4]][jj[8]]+A[ii[5]][jj[0]]+A[ii[5]][jj[2]]+A[ii[5]][jj[3]]+A[ii[5]][jj[4]]+A[ii[5]][jj[5]]+A[ii[5]][jj[6]]+A[ii[5]][jj[8]]+A[ii[6]][jj[1]]+A[ii[6]][jj[3]]+A[ii[6]][jj[5]]+A[ii[6]][jj[7]]+A[ii[7]][jj[1]]+A[ii[7]][jj[2]]+A[ii[7]][jj[4]]+A[ii[7]][jj[6]]+A[ii[7]][jj[7]]+A[ii[8]][jj[3]]+A[ii[8]][jj[4]]+A[ii[8]][jj[5]];  

        float aux0 = (sin(b[0] * soma0 / states));
        float aux1 = (sin(b[1] * soma1 / states));
        
        int val = floor((aux0 + aux1) / 2 * (states));
        if (val < 0) val = outval;
        
        if (aux0 >= b0[4] & aux0 <= b0[5]){
          outval = val;
        } 
        if (aux0 > b0[5]){
          outval = 0;
        }         
        if (aux0 >= b0[0] & aux0 <= b0[1]){
          outval = 0;
        } 
        if (aux0 >= b0[2] & aux0 < b0[3]){
          outval = 0;
        } 
        if (aux0 == b0[3]){
          outval = val;
        } 
        if (aux1 >= b1[2] & aux1 <= b1[3]){
          outval = 0;
        } 
        if (aux1 >= b1[0] & aux1 <= b1[1]){
          outval = val;
        }  

      B[i][j] = outval;
    }
  }
  //colorimos os pixels de acordo com o estado das células  
  loadPixels();
  for (int i = 0; i <size; i++) {
    for (int j = 0; j < size; j++) {
      A[i][j] = B[i][j];
      pixels[i + j * width] = cores[A[i][j]];
    }
  }
  updatePixels();
}
