int tamanho = 600;
// 111, 110, 101, 100, 011, 010, 001, 000
int regra[] = {0, 0, 0, 1, 1, 1, 1, 0};
//os dados das células de cada geração
int celulas[] = new int[tamanho];
int celulas_anterior[] = new int[tamanho];
//começamos com geração 0
int geracao = 0;
void settings() {
  size(tamanho, tamanho / 2);
}
void setup() {
  background(0);
  noStroke();
  fill(255);
  //valores aleatórios para a primeira geração
  for (int i = 0; i < tamanho; i++) {
    celulas[i] = round(random(1));
    //desenhamos o retângulo na cor apropriada
    fill(celulas[i] * 255);
    rect(i, geracao, 1, 1);
  }
  //incrementamos a geração
  geracao +=1;
}
void draw() {
  //criamos uma cópia das células tal como estão
  arrayCopy(celulas, celulas_anterior);
  //para cada célula
  for (int i = 1; i < tamanho - 1; i++) {
    //pegamos a vizinhança
    int a = celulas_anterior[i - 1];
    int b = celulas_anterior[i];
    int c = celulas_anterior[i + 1];
    //aplicamos a nossa regra (dá pra fazer de forma mais inteligente)
    if (a == 1 && b == 1 && c == 1) celulas[i] = regra[0];
    if (a == 1 && b == 1 && c == 0) celulas[i] = regra[1];
    if (a == 1 && b == 0 && c == 1) celulas[i] = regra[2];
    if (a == 1 && b == 0 && c == 0) celulas[i] = regra[3]; //<>//
    if (a == 0 && b == 1 && c == 1) celulas[i] = regra[4];
    if (a == 0 && b == 1 && c == 0) celulas[i] = regra[5]; //<>//
    if (a == 0 && b == 0 && c == 1) celulas[i] = regra[6]; //<>//
    if (a == 0 && b == 0 && c == 0) celulas[i] = regra[7];
    //desenhamos o retângulo na cor apropriada
    fill(celulas[i] * 255);
    rect(i, geracao, 1, 1);
  }
  //próxima geração
  geracao += 1;
} //<>//
