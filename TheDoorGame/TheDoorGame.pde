PImage background;
PImage door;
PImage player;
PImage yellowKey;
boolean hasYellowKey = false;
int playerX = 400;
int playerY = 300;
void setup(){
  size(800, 600);
  door = loadImage("Door.png");
  player = loadImage("Player.png");
  yellowKey = loadImage("yellowKey.png");
}
void draw(){
  level1();
  image(player, playerX, playerY);
}
void sayText(String t){
  fill(255, 255, 255);
  rect(0, 0, 800, 20);
  fill(0, 0, 0);
  text(t, 0, 15);
}
void level1(){
  background = loadImage("Background1.png");
  image(background, 0, 0);
  image(door, 700, 400);
  if(playerX + 16 > 700 && playerX < (700 + (32*3)) && playerY + 16 > 400 && playerY < (400 + (64*3))){
    sayText("I'm locked! Find the key!");
  }
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
