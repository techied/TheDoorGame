PImage background;
PImage door;
PImage key;
void setup(){
  size(800, 600);
  door = loadImage("Door.png");
}
void draw(){
  level1()
}
void level1(){
  background = loadImage("Background1.png");
  image(background, 0, 0);
  image(door, 700, 400);
}
