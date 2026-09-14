float line1X; //<>//
float line2X;
float line1Y;
float line2Y;
float inv;
float colorSelect = 1;
float sizeSelect = 1;
float [] colorBoxX;
float [] colorBoxY;
int r;
int g;
int b;
int s = 100;
int select;
boolean noLine = false;
boolean Draw = true;
boolean speedUp;

void setup() {
  fullScreen();
  background(255);
  colorBoxX = new float[10];
  colorBoxY = new float[10]; 
}

void draw() {
  if(s < 1) s = 1;
  if (select > 3) select = 3;
  if (select < 0) select = 0;
  if(r < 0) r = 0;
  if(g < 0) g = 0;
  if(b < 0) b = 0;
  if(s < 1) s = 1;
  if(r > 255) r = 255;
  if(g > 255) g = 255;
  if(b > 255) b = 255;
  if(s > 100) s = 100;
  if(mouseY < 150) Draw = false;
  else Draw = true;
  if(speedUp){
    colorSelect = 51;
    sizeSelect = 20;
  }
  else{
    colorSelect = 1;
    sizeSelect = 1;
  }
  strokeWeight(s);
  if(noLine) inv = 255;
  if(!noLine) inv = 0;
  if (mousePressed) {
    if(Draw){
    fill(r, g, b);
    stroke(r, g, b, inv);
    line1X = mouseX;
    line1Y = mouseY;
    strokeWeight(s);
    line(line1X, line1Y, line2X, line2Y);
    strokeWeight(0);
    circle(mouseX, mouseY,s);
    strokeWeight(s);
    line2Y = mouseY;
    line2X = mouseX;
    noLine = true;
    }
  }
  strokeWeight(1);
  fill(0,0,0,0);
  stroke(0);
  strokeWeight(10);
  fill(255);
  rect(0, 0, width, 150);
  strokeWeight(8);
  rect(13, (select) * 30 + 15, 30, 30);
  fill(255, 0, 0);
  textSize(30);
  text("R", 20, 40);
  text(r, 55, 40);
  fill(0, 255, 0);
  text(g, 55, 70);
  text("G", 20, 70);
  fill(0, 0, 255);
  text(b, 55, 100);
  text("B", 20, 100);
  fill(0);
  text(s, 55, 130);
  text("S", 20, 130);
  strokeWeight(1);
  fill(255);
  square(120, 25, 102);
  fill(r, g, b);
  stroke(r, g, b);
  circle(171, 76, s);
  for(int i=0; i<min(colorBoxX.length, colorBoxY.length); ++i){
    fill(255);
    colorBoxX[i] = i * 51 + 240;
    colorBoxY[i] = 25;
    if(i * 51 + 240 > 5 * 51 + 240 - 1){
      colorBoxX[i] = (i - 5) * 51 + 240;
      colorBoxY[i] += 51;
    }
    square(colorBoxX[i], colorBoxY[i], 51);
  }
}

void keyPressed() {
  if (keyCode == 83) select += 1;
  if (keyCode == 87) select -= 1;
  if (keyCode == 68){
    if(select == 0) r += colorSelect;
    if(select == 1) g += colorSelect;
    if(select == 2) b += colorSelect;
    if(select == 3) s += sizeSelect;
  }
  if (keyCode == 65){
    if(select == 0) r -= colorSelect;
    if(select == 1) g -= colorSelect;
    if(select == 2) b -= colorSelect;
    if(select == 3) s -= sizeSelect;
  }
  if(keyCode == 16) speedUp = true;
}

void keyReleased(){
  if(keyCode == 16) speedUp = false;
}

void mouseReleased() {
  noLine = false;
}
