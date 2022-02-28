PImage image, bg;
float size = 5;
String mode = "Stamp";
float sliderValue = 0;

void setup() {
  size(1200, 900);
  bg = loadImage("images\\bg.png");
  image(bg, 0, 0);
  imageMode(CENTER);
  image = loadImage("images\\brusha.png");
  rectMode(CORNER);
  
  noStroke();
  fill(120);
  
}

void draw() {
  if(mouseY > 50 && mouseY < 700){ // Drawing
    if(mousePressed && mode == "Stamp"){
      stampBrush(mouseX, mouseY, floor(sliderValue)); 
    }
  } 
  
  if(mouseY > 745 && mouseY < 765 && mousePressed){
    sliderValue = (min(950, max(50, mouseX)) - 50) / 9;
  }
  
  if(mouseX > 0 && mouseX < 50 && mouseY > 0 && mouseX < 50){
    
  }
  
  fill(68, 66, 69);
  rectMode(CORNER);
  rect(25, 725, 950, 50);
  stroke(0);
  line(50, 750, 950, 750);
  rectMode(CENTER);
  rect(sliderValue * 9 + 50, 750, 30, 30);
}

void stampBrush(int x, int y, int scatterR) {
  float bSize = random(20)*size;
  float rotation = random(360);
  float scatterX = random(scatterR) - scatterR / 2;
  float scatterY = random(scatterR) - scatterR / 2;
  pushMatrix();
  translate(x+scatterX, y+scatterY);
  rotate(rotation);
  image(image, 0, 0, bSize, bSize);
  popMatrix();
}
