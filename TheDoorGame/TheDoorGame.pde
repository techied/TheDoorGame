PImage background;
PImage door;
PImage key;
int playerX = 400;
int playerY = 300;
void setup(){
  size(800, 600);
  door = loadImage("Door.png");
}
void draw(){
  fill(0,0,0);
  level1();
  ellipse(playerX, playerY, 16, 16);
}
void level1(){
  background = loadImage("Background1.png");
  image(background, 0, 0);
  image(door, 700, 400);
  //rect(0, 0, 150, 20);
  //text("Hello, world!", 150, 20);
}
