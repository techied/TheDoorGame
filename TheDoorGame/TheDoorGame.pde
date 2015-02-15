PImage background;
PImage door;
PImage player;
PImage yellowKey;
PImage blackHole;
boolean hasYellowKey = false;
int playerX = 400;
int playerY = 300;
void setup() {
  size(800, 600);
  door = loadImage("Door.png");
  player = loadImage("Player.png");
  yellowKey = loadImage("yellowKey.png");
  blackHole = loadImage("BlackHole.png");
}
void draw() {
  level1();
  image(player, playerX, playerY);
}
void sayText(String t) {
  fill(255, 255, 255);
  rect(0, 0, 800, 20);
  fill(0, 0, 0);
  text(t, 0, 15);
}
void level1() {
  background = loadImage("Background1.png");
  image(background, 0, 0);
  image(door, 700, 400);
  if (playerX + 16 > 700 && playerX < (700 + (32*3)) && playerY + 16 > 400 && playerY < (400 + (64*3)) && !hasYellowKey) {
    sayText("I'm locked! Find the key!");
  } else if (playerX + 16 > 700 && playerX < (700 + (32*3)) && playerY + 16 > 400 && playerY < (400 + (64*3)) && hasYellowKey)
  {
    image(blackHole, 700, 400);
  }else if(hasYellowKey){
    sayText("You have the key!");
  }
  if (!hasYellowKey)
  {
    image(yellowKey, 70, 325);
  }
  if (playerX + 16 > 70 && playerX < (70 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasYellowKey) {
    hasYellowKey = true;
  }
}
  void keyPressed() {
    if (key == 'w')
    {
      playerY = playerY-5;
    } else if (key == 'a')
    {
      playerX = playerX-5;
    } else if (key == 'd')
    {
      playerX = playerX+5;
    } else if (key == 's')
    {
      playerY = playerY+5;
    }
  }

