float [] paintx; //<>//
float [] painty;
float [] inv;
float [] Sp;
float [] Rp;
float [] Gp;
float [] Bp;
int r;
int g;
int b;
int s = 100;
int select;
boolean noLine = false;

void setup() {
  fullScreen();
  paintx = new float [0];
  painty = new float [0];
  Sp = new float [0];
  Rp = new float [0];
  Gp = new float [0];
  Bp = new float [0];
  inv = new float [0];
}

void draw() {
  int highestIndex = 0;
  background(255);
  for (int i = 0; i < min(paintx.length, painty.length) - 1; i++) {
    stroke(Rp[i], Gp[i], Bp[i]);
    fill(Rp[i], Gp[i], Bp[i]);
    strokeWeight(0);
    circle(paintx[i], painty[i], Sp[i]);
    strokeWeight(Sp[i]);
    stroke(Rp[i], Gp[i], Bp[i], inv[i]);
    line(paintx[i], painty[i], paintx[i + 1], painty[i + 1]);
  }
  for (int i = 1; i < inv.length; i++) {
    if (i > highestIndex) {
      highestIndex = i;
    }
  }
  if (noLine) {
    inv[highestIndex] = 255;
  }
  // every time you click new arrays are made
  //nigga
  if (mousePressed) {
    paintx = (float[]) append(paintx, mouseX);
    painty = (float[]) append(painty, mouseY);
    Sp = (float[]) append(Sp, s);
    Rp = (float[]) append(Rp, r);
    Gp = (float[]) append(Gp, g);
    Bp = (float[]) append(Bp, b);
    inv = (float[]) append(inv, 0);
    noLine = true;
  }
  strokeWeight(1);
  fill(0,0,0,0);
  stroke(0);
  circle(mouseX, mouseY, s);
  stroke(255);
  circle(mouseX, mouseY, s - 1);
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
}

void keyPressed() {
  if (keyCode == 83) select += 1;
  if (keyCode == 87) select -= 1;
  if (keyCode == 68){
    if(select == 0) ++r;
    if(select == 1) ++g;
    if(select == 2) ++b;
    if(select == 3) ++s;
  }
  if (keyCode == 65){
    if(select == 0) --r;
    if(select == 1) --g;
    if(select == 2) --b;
    if(select == 3) --s;
  }
  if (keyCode == 39){
    if(select == 0) r += 51;
    if(select == 1) g += 51;
    if(select == 2) b += 51;
    if(select == 3) s += 20;
  }
  if (keyCode == 37){
    if(select == 0) r -= 51;
    if(select == 1) g -= 51;
    if(select == 2) b-= 51;
    if(select == 3) s -= 20;
  }
}


void mouseReleased() {
  noLine = false;
}
