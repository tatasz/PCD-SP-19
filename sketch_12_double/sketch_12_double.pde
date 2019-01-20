PShader sh1; //<>//
void setup() {
  size(500, 500, P2D);
  sh1 = loadShader("frag.glsl");  
  sh1.set("res",float(width),float(height));
  for (int i=0; i < width; i++){
    for (int j=0; j < height; j++){
      //float c = (random(1) < j / float(height)+0.1) ? 1 : 0;
      float c = (random(1) < (noise(i*0.03, j*0.05)* noise(i*0.03, j*0.05))*0.8+0.1 ) ? 1 : 0;
      set(i,j, color(c * 255));
    }
  }

float b0[] = { 1.0 ,  2.0 ,  7.0 ,  7.0 };
float b1[] = { 14.0 ,  17.0 ,  19.0 ,  48.0 ,  82.0 ,  83.0 ,  83.0 ,  83.0 ,  191.0 ,  242.0 ,  250.0 ,  250.0 };
float b01[] = { 1.0 ,  2.0 ,  2.0 ,  5.0 };
float b11[] = { 2.0 ,  12.0 ,  41.0 ,  92.0 ,  93.0 ,  133.0 ,  231.0 ,  247.0 ,  252.0 ,  267.0 ,  280.0 ,  282.0 };
float b2[] = { 1151.0 ,  1169.0 };

boolean t1 = false;
boolean t2 = false;
boolean t3 = false;
  
  if (t1){
    b0[0] = rnd(0, 7);
    b0[1] = rnd(b0[0], 7);
    b0[2] = rnd(b0[1], 8);  //
    b0[3] = rnd(b0[2], 8);  //8
    
    b1[0] = rnd(0, 84);
    b1[1] = rnd(b1[0], 84); //
    b1[2] = rnd(b1[1], 84); //
    b1[3] = rnd(b1[2], 84); //
    b1[4] = rnd(b1[3], 84); //
    b1[5] = rnd(b1[4], 84); //
    b1[6] = rnd(b1[5], 84); 
    b1[7] = rnd(b1[6], 84); //
    b1[8] = rnd(b1[7], 84); //
    b1[9] = rnd(b1[8], 84); //
    b1[10] = rnd(b1[9], 84); //
    b1[11] = rnd(b1[10], 84); //284
  }
  if (t2){
    b01[0] = rnd(0, 7);
    b01[1] = rnd(b01[0], 7);
    b01[2] = rnd(b01[1], 8);  //
    b01[3] = rnd(b01[2], 8);  //8
    
    b11[0] = rnd(0, 84);
    b11[1] = rnd(b11[0], 84); //
    b11[2] = rnd(b11[1], 84); //
    b11[3] = rnd(b11[2], 84); //
    b11[4] = rnd(b11[3], 84); //
    b11[5] = rnd(b11[4], 84); //
    b11[6] = rnd(b11[5], 84); 
    b11[7] = rnd(b11[6], 84); //
    b11[8] = rnd(b11[7], 284); //
    b11[9] = rnd(b11[8], 284); //
    b11[10] = rnd(b11[9], 284); //
    b11[11] = rnd(b11[10], 284); //284
  }
  if (t3){
  b2[0] = (rnd(600, 1600));
  b2[1] = (rnd(b2[0], int(b2[0]) + 100));
  }
 
  println("float b0[] = {", str(b0[0]), ", ", str(b0[1]), ", ", str(b0[2]), ", ", str(b0[3]), "};");
  println("float b1[] = {", str(b1[0]), ", ", str(b1[1]), ", ", str(b1[2]), ", ", str(b1[3]), ", ", str(b1[4]), ", ", 
            str(b1[5]), ", ", str(b1[6]), ", ", str(b1[7]), ", ", str(b1[8]), ", ", str(b1[9]), ", ", str(b1[10]), ", ", str(b1[11]), "};");

  println("float b01[] = {", str(b01[0]), ", ", str(b01[1]), ", ", str(b01[2]), ", ", str(b01[3]), "};");
  println("float b11[] = {", str(b11[0]), ", ", str(b11[1]), ", ", str(b11[2]), ", ", str(b11[3]), ", ", str(b11[4]), ", ", 
            str(b11[5]), ", ", str(b11[6]), ", ", str(b11[7]), ", ", str(b11[8]), ", ", str(b11[9]), ", ", str(b11[10]), ", ", str(b11[11]), "};");

println("float b2[] = {", str(b2[0]), ", ", str(b2[1]), "};");

      
  sh1.set("v00", b0[0], b0[1]);
  sh1.set("v01", b0[2], b0[3]);
  
  sh1.set("v10", b1[6], b1[7]);
  sh1.set("v11", b1[2], b1[3]);
  sh1.set("v12", b1[8], b1[9]);
  sh1.set("v13", b1[4], b1[5]);
  sh1.set("v14", b1[0], b1[1]);
  sh1.set("v15", b1[10], b1[11]);
  
  sh1.set("v001", b01[0], b01[1]);
  sh1.set("v011", b01[2], b01[3]);
  
  sh1.set("v101", b11[6], b11[7]);
  sh1.set("v111", b11[2], b11[3]);
  sh1.set("v121", b11[8], b11[9]);
  sh1.set("v131", b11[4], b11[5]);
  sh1.set("v141", b11[0], b11[1]);
  sh1.set("v151", b11[10], b11[11]);
  
  sh1.set("v40", b2[0], b2[1]);
}

void draw(){
  sh1.set("tex", get());
  shader(sh1);
  rect(0,0,width, height);
  
  sh1.set("tex", get());
  shader(sh1);
  rect(0,0,width, height);
  
  //saveFrame("./01/pattern-######.png");
}


float rnd(float x0, int x1){
  float r = random(0,1);
  r = r * r;
  r = r * (x1 - x0) + x0;
  return round(r);
}


void mouseClicked() {
  saveFrame("pattern-######.png");
}
