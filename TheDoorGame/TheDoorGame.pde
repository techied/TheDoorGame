PImage background;
PImage door;
PImage player;
PImage picturekey;
int playerX = 400;
int playerY = 300;
void setup(){
  size(800, 600);
  door = loadImage("Door.png");
  player = loadImage("Player.png");
}
void draw(){
  level1();
  image(player, playerX, playerY);
}
void level1(){
  background = loadImage("Background1.png");
  image(background, 0, 0);
  image(door, 700, 400);
  fill(255, 255, 255);
  rect(0, 0, 170, 20);
  fill(0, 0, 0);
  text("Use wasd to move to the door!", 0, 15);
}
void keyPressed(){
  if(key == 'w')
  {
    playerY = playerY-5;
  }else if(key == 'a')
  {
    playerX = playerX-5;
  }else if(key == 'd')
  {
    playerX = playerX+5;
  }else if(key == 's')
  {
    playerY = playerY+5;
  }
}
