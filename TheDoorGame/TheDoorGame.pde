PImage background;
PImage door;
void setup(){
  size(800, 600);
  background = loadImage("Background1.png");
  door = loadImage("Door.png");
}
void draw(){
  image(background, 0, 0);
  image(door, 700, 500);
}
