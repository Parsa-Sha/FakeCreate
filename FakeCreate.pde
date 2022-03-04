PImage image, loadedImage, bg, bgO;
float size = 5;
String mode = "Brush";
float sizeSliderValue = 1;
float variationSliderValue = 1;
float brushSize = 1;
color colour = color(255, 255, 255);
float brushSelection = 255;
float stampSelection = 0;
float eraseSelection = 0;
float brushHover = 0;
float stampHover = 0;
float galleryHover = 0;
float eraseHover = 0;

void setup() {
  size(900, 675, P2D);
  bg = loadImage("images\\bg.png");
  bgO = loadImage("images\\bgo.png");
  image(bg, 0, 0, width, height);
  imageMode(CENTER);
  image = loadImage("images\\brusha.png");
  rectMode(CORNER);
  
  noStroke();
  fill(120);
}

void draw() {
  brushHover = 0;
  stampHover = 0;
  galleryHover = 0;
  eraseHover = 0;
  
  // Buttons
  
  if(mouseX > 850 && mouseX < width && mouseY < 50 && mousePressed){
    selectOutput("Choose a name for your new image file", "saveImage");
    mousePressed = false;
  }
  
  if(mouseX > 18 && mouseX < 68 && mouseY > 10 && mouseY < 30){ // If mouse is over button
    if(mousePressed){ // If button is pressed
      selectInput("Pick an image to load", "openImage");
    }
    galleryHover = 100;
  }
  
  if(mouseX > 741 && mouseX < 775 && mouseY > 10 && mouseY < 30){ // If mouse is over button
    if(mousePressed && mode != "Erase"){ // If button is pressed
      mode = "Erase";
      eraseSelection = 255;
      brushSelection = 0;
      stampSelection = 0;
    }
    eraseHover = 100;
  }
  
  if(mouseX > 625 && mouseX < 645 && mouseY > 10 && mouseY < 30){ // If mouse is over button
    if(mousePressed && mode != "Brush"){ // If button is pressed
      mode = "Brush";
      brushSelection = 255;
      stampSelection = 0;
      eraseSelection = 0;
    }
    brushHover = 100;
  }
  
  if(mouseX > 685 && mouseX < 705 && mouseY > 10 && mouseY < 30){ // If mouse is over button
    if(mousePressed && mode != "Stamp"){ // If button is pressed
      mode = "Stamp";
      stampSelection = 255;
      brushSelection = 0;
      eraseSelection = 0;
    }
    stampHover = 100;
  }
  
  if(mouseX > 245 && mouseX < 380 && mouseY > 637 && mouseY < 663 && mousePressed) {
    sizeSliderValue = map(mouseX, 245, 380, 1, 100);
  }
  
  if(mouseX > 555 && mouseX < 690 && mouseY > 637 && mouseY < 663 && mousePressed) {
    variationSliderValue = map(mouseX, 690, 555, 1, 100);
  }
   
  if(mouseY > 70 && mouseY < 525){ // Drawing
    if(mousePressed && mode == "Stamp"){ // Stamping
      stampBrush(mouseX, mouseY, floor(variationSliderValue)); 
    }
    
    if(mousePressed && mode == "Brush"){ // Brushing
      stroke(colour, 255);
      strokeWeight(sizeSliderValue);
      line(mouseX, mouseY, pmouseX, pmouseY); 
      strokeWeight(1);
    }
    
    if(mousePressed && mode == "Erase"){ // Erasing
      stroke(30, 255);
      strokeWeight(sizeSliderValue);
      line(mouseX, mouseY, pmouseX, pmouseY); 
      strokeWeight(1);
    }
  } 
  
  if(mouseX > 400 && mouseX < 520 && mouseY > 550 && mouseX < 670 && mousePressed){ // Selecting Colour
      colour = get(mouseX, mouseY);  
  }
  
  imageMode(CORNER);
  image(bgO, 0, 0, width, height);
  
  noFill();
  stroke(120, brushSelection);
  ellipse(635, 20, 27, 27); // Brush Selection
  stroke(120, stampSelection);
  ellipse(695, 20, 27, 27); // Stamp Selection
  stroke(120, eraseSelection);
  ellipse(758, 20, 27, 27); // Erase Selection

  
  
  noStroke();
  fill(120, brushHover);
  ellipse(635, 20, 27, 27); // Brush Hover
  fill(120, stampHover);
  ellipse(695, 20, 27, 27); // Stamp Hover
  fill(120, galleryHover);
  rect(43, 20, 50, 20); // Gallery Hover
  fill(120, eraseHover);
  ellipse(758, 20, 27, 27); // Erase Hover

  rectMode(CENTER);
  fill(120);
  stroke(120);
  rect(map(sizeSliderValue, 1, 100, 245, 380), 650, 25, 25, 4); // Size Slider Location
  rect(map(variationSliderValue, 1, 100, 690, 555), 650, 25, 25, 4); // Variation Slider Location
  //ellipse(758, 20, 27, 27); // testing 
  fill(colour);
  noStroke();
  ellipse(881, 19, 26, 26);
}

void stampBrush(int x, int y, int scatterR) {
  float bSize = random(20)*size;
  float rotation = random(360);
  float scatterX = random(scatterR) - scatterR / 2;
  float scatterY = random(scatterR) - scatterR / 2;
  pushMatrix();
  translate(x+scatterX, y+scatterY);
  rotate(rotation);
  imageMode(CENTER);
  image(image, 0, 0, bSize, bSize);
  popMatrix();
}

void saveImage(File f){ // Saving Function
  if(f != null){
    PImage canvas = get(0, 70, width, 525);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f){ // Loading Function
  if(f != null){
    PImage pic = loadImage(f.getPath());
    image(pic, 0, 55);
  }
}

void keyPressed() {
  if(key=='n'||key=='N'){
    image(bg, 0, 0, width, height);
  }
}
