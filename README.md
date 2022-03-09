# FakeCreateV1
// Different background colours
// Stamp hotbar
// Realtime Colour Wheel



color black = color(0, 128);
color white = color(255, 128);
color lineColor;
float normalizedI;
color getColor;
float brightness, saturation;

void setup() {
  size(300, 300);
  background(0);
  colorMode(HSB);
  for(float i = 0; i < width; i++) {
    for(float j = 0; j < height; j++){
      saturation = i/width*255;
      brightness = j/height*255;
      stroke(170, saturation, brightness);
      
      point(i, j);
    }
  }
}

void draw() {
  getColor = get(mouseX, mouseY);
  println(red(getColor) +" "+green(getColor)+" "+blue(getColor));
}
