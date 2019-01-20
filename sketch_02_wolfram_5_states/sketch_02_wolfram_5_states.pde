int tamanho = 250;
//array para as regras
int regra[] = new int[int(pow(5, 3))];
//dá pra fazer preto e branco, mas vamos ter cores bonitinhas uma vez na vida
color cores[] = new color[5];
//os dados das células de cada geração
int celulas[] = new int[tamanho];
int celulas_anterior[] = new int[tamanho];
//começamos com geração 0
int geracao = 0;
void settings() {
  size(tamanho * 4, tamanho * 2); //<>//
}
void setup() {
  background(0);
  noStroke();
  fill(255);
  //geramos a regra aleatoriamente
  for (int i = 0; i < regra.length; i++) {
    regra[i] = (random(1) < 0.3) ? 0 : floor(random(5));
    print(regra[i]);
  }
  //cores bonitinhas
  cores[0] = color(0, 145, 160);
  cores[1] = color(140, 210, 240);
  cores[2] = color(240, 0, 40);
  cores[3] = color(250, 170, 0);
  cores[4] = color(176, 0, 80);
  //valores aleatórios para a primeira geração
  for (int i = 0; i < tamanho; i++) {
    celulas[i] = floor(random(5));
    //desenhamos o retângulo na cor apropriada
    fill(cores[celulas[i]]);
    rect(i * 4, geracao * 4, 4, 4);
  }
  //próxima geração
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
    //convertemos da base 5 para decimal e usamos para acessar a regra correspondente
    int id = a * 5 * 5 + b * 5 + c;
    celulas[i] = regra[id]; //<>//
    //desenhamos o retângulo na cor apropriada
    fill(cores[celulas[i]]);
    rect(i * 4, geracao * 4, 4, 4);
  }
  //próxima geração
  geracao += 1;
} //<>//
