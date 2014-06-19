float t;
float catt;
float mul;
float exp;
PImage cat;

void setup(){
  size(320,320);
  noStroke();
  mul=1;
  exp=40;
  cat=loadImage("cat320.png");
}

void draw(){
  t=t+PI/8;
  for(int ry=0;ry<20;ry++){
    for(int rx=0;rx<20;rx++){
      fill(127+sin(sqrt(sq(9.5-rx)+sq(9.5-ry))*mul-t)*127,127+sin(sqrt(sq(9.5-rx)+sq(9.5-ry))*mul-t+PI/3*2)*127,127+sin(sqrt(sq(9.5-rx)+sq(9.5-ry))*mul-t+PI/3*4)*127);
      rect(rx*16,ry*16,16,16);
    }
  }
  catt=t/4;
  image(cat,-sin(catt)*exp/2,-sin(catt)*exp/2,320+sin(catt)*exp,320+sin(catt)*exp);
}
