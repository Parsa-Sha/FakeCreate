PImage image, bg;
float size = 5;
String mode = "Brush";
float sliderValue = 0;
float brushSize = 1;
color colour = color(255, 255, 255);

void setup() {
  size(900, 675);
  bg = loadImage("images\\bg.png");
  image(bg, 0, 0, width, height);
  imageMode(CENTER);
  image = loadImage("images\\brusha.png");
  rectMode(CORNER);
  
  noStroke();
  fill(120);
}
void draw() {
  // Buttons
  if(mouseX > 625 && mouseX < 645 && mouseY > 10 && mouseY < 30 && mousePressed && mode != "Brush"){
    mode = "Brush";
  }
  
  if(mouseX > 685 && mouseX < 705 && mouseY > 10 && mouseX < 30 && mode != "Stamp"){
    mode = "Stamp";
  }
  
  if(mode == "Brush") {
    ellipseMode(CENTER);
    noFill();
    stroke(120);
    ellipse(635, 20, 25, 25);
  }
  
  if(mode == "Stamp") {
    ellipseMode(CENTER);
    noFill();
    stroke(120);
    ellipse(695, 20, 25, 25);
  }
   
  if(mouseY > 70 && mouseY < 525){ // Drawing
    if(mousePressed && mode == "Stamp"){
      stampBrush(mouseX, mouseY, floor(sliderValue)); 
    }
    
    if(mousePressed && mode == "Brush"){
      fill(colour, 255);
      ellipse(mouseX, mouseY, brushSize, brushSize); 

    }
  } 
  rectMode(CENTER);
  rect(5, 750, 30, 30); 

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
