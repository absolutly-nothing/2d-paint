//random varibles //<>//
float line1X;
float line2X;
float line1Y;
float line2Y;
float inv;
float colorSelect = 1;
float sizeSelect = 1;
float [] colorBoxX;
float [] colorBoxY;
float colour;
int r;
int g;
int b;
int s = 100;
int select;
boolean noLine = false;
boolean Draw = true;
boolean speedUp;
boolean rainbow = false;

void setup() {
  fullScreen();
  background(255);
  //setup for array
  colorBoxX = new float[10];
  colorBoxY = new float[10];
}

void draw() {
  //bunch of if statements
  if (s < 1) s = 1; //prevents the size of the brush to get to low

  //prevents the select bar from going too high or too low
  if (select > 3) select = 3;
  if (select < 0) select = 0;

  //prevents the rgb for the brush from becoming too low or too high
  if (r < 0) r = 0;
  if (g < 0) g = 0;
  if (b < 0) b = 0;
  if (s < 1) s = 1;
  if (r > 255) r = 255;
  if (g > 255) g = 255;
  if (b > 255) b = 255;
  if (s > 100) s = 100;

  //this makes it so you cant draw on the tool bar
  if (mouseY < 150) Draw = false;
  else Draw = true;

  //instead of changing the rgb by 1 you can change it by 51
  if (speedUp) {
    colorSelect = 51;
    sizeSelect = 20;
  } else {
    colorSelect = 1;
    sizeSelect = 1;
  }

  //makes it so there isint a line connecting all of the cirkle draw. only some are conected
  strokeWeight(s);
  if (noLine) inv = 255;
  if (!noLine) inv = 0;
  //this is what makes it possible to draw shit
  if (mousePressed) {
    if (Draw) {

      //if rainbow = true the brush color becomes rainbow
      if (rainbow) {
        colorMode(HSB, 360, 100, 100);
        colour = (colour + 1) % 360;
        fill(colour, 100, 100);
        stroke(colour, 100, 100, inv);
      } else {
        colorMode(RGB, 255, 255, 255);
        fill(r, g, b);
        stroke(r, g, b, inv);
      }
      //this draws a line and a circle
      line1X = mouseX;
      line1Y = mouseY;
      strokeWeight(s);
      line(line1X, line1Y, line2X, line2Y);
      strokeWeight(0);
      circle(mouseX, mouseY, s);
      strokeWeight(s);
      line2Y = mouseY;
      line2X = mouseX;
      noLine = true;
    }
  }

  //this is the ui
  colorMode(RGB, 255, 255, 255);
  strokeWeight(1);
  fill(0, 0, 0, 0);
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

  //this is for the colorcubes in the toolbar
  if (rainbow) {
    colorMode(HSB, 360, 100, 100);
    fill(colour, 100, 100);
  } else {
    colorMode(RGB, 255, 255, 255);
    fill(r, g, b);
  }
  strokeWeight(1);
  stroke(0);
  circle(171, 76, s);
  colorMode(RGB, 255, 255, 255);
  for (int i=0; i<min(colorBoxX.length, colorBoxY.length); ++i) {
    stroke(0);
    if (i == 0) fill(255, 0, 0);
    if (i == 1) fill(0, 255, 0);
    if (i == 2) fill(255, 255, 0);
    if (i == 3) fill(255, 115, 0);
    if (i == 4) fill(0);
    if (i == 5) fill(0, 0, 255);
    if (i == 6) fill(255, 0, 255);
    if (i == 7) fill(0, 255, 255);
    if (i == 8) fill(196);
    if (i == 9) fill(255);
    colorBoxX[i] = i * 51 + 240;
    colorBoxY[i] = 25;
    if (i * 51 + 240 > 5 * 51 + 240 - 1) {
      colorBoxX[i] = (i - 5) * 51 + 240;
      colorBoxY[i] += 51;
    }
    square(colorBoxX[i], colorBoxY[i], 51);
  }
}

//controlls
void keyPressed() {
  //this is for changing color and size of the brush
  if (keyCode == 83) select += 1;
  if (keyCode == 87) select -= 1;
  if (keyCode == 68) {
    if (select == 0) r += colorSelect;
    if (select == 1) g += colorSelect;
    if (select == 2) b += colorSelect;
    if (select == 3) s += sizeSelect;
  }
  if (keyCode == 65) {
    if (select == 0) r -= colorSelect;
    if (select == 1) g -= colorSelect;
    if (select == 2) b -= colorSelect;
    if (select == 3) s -= sizeSelect;
  }
  //tis is for the rainbow and speedup feature
  if (keyCode == 16) speedUp = true;
  if (keyCode == 17) rainbow = true;
}

void keyReleased() {
  if (keyCode == 16) speedUp = false;
  if (keyCode == 17) rainbow = false;
}

void mouseReleased() {
  noLine = false;
}

void mousePressed() {
  //this is to make it so when you click one of the colorboxes, your brush color changes the the respective color
  if (mouseX > 240 && mouseX < 5 * 51 + 240 && mouseY > 25 && mouseY < 25 + 51 * 2) {
    color sampled = get(mouseX, mouseY);
    r = int(red(sampled));
    g = int(green(sampled));
    b = int(blue(sampled));
  }
}
