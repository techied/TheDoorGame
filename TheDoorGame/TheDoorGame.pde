import javax.swing.JOptionPane;
import ddf.minim.*;
Minim minim;
AudioPlayer keyBing, blackHoleSound;
PImage background;
PImage door;
PImage door2;
PImage player;
PImage yellowKey;
PImage redKey;
PImage blackHole;
PImage box;
PImage SwichOn;
PImage SwichOff;
boolean hasYellowKey = false;
boolean hasRedKey = false;
boolean swich = false;
boolean swich2 = false;
int playerX = 400;
int playerY = 300;
int level = 1;
int mms = 10;
void setup() {
  size(800, 600);
  door = loadImage("Door.png");
  player = loadImage("Player.png");
  yellowKey = loadImage("yellowKey.png");
  blackHole = loadImage("BlackHole.png");
  redKey = loadImage("Key2.png");
  door2 = loadImage("Door2.png");
  minim = new Minim(this);
  keyBing = minim.loadFile("Ding.wav");
  blackHoleSound = minim.loadFile("BlackHole.wav");
  JOptionPane.showMessageDialog(null, "Get to the door! Use wasd to move.");
}
void draw() {
  switch(level) {
  case 1:
    level1();
    break;
  case 2:
    level2();
    break;
  case 3:
    level3();
    break;
  }
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
    blackHoleSound.play();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasYellowKey = false;
    playerX = 400;
    playerY = 300;
  } else if (hasYellowKey) {
    sayText("You have the key!");
    keyBing.play();
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
    playerY = playerY-mms;
  } else if (key == 'a')
  {
    playerX = playerX-mms;
  } else if (key == 'd')
  {
    playerX = playerX+mms;
  } else if (key == 's')
  {
    playerY = playerY+mms;
  }
}
void level2() {
  background = loadImage("Background2.png");
  SwichOn = loadImage("LeverOn.png");
  SwichOff = loadImage("LeverOff.png");
  image(background, 0, 0);
  image(door2, 15, 15);
  if (swich == false)
  {
    image(SwichOff, 100, 400);
  } else
  {
    image(SwichOn, 100, 400);
  }
  if (playerX > 80 && playerX < 120 && playerY > 380 && playerY < 420)
  {
    swich = true;
  }
  if (swich == true && !hasRedKey)
  {
    image(redKey, 70, 325);
  }
  if (playerX + 16 > 70 && playerX < (70 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasRedKey && swich) {
    hasRedKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
  if (playerX + 16 > 15 && playerX < (15 + (32*3)) && playerY + 16 > 15 && playerY < (15 + (64*3)) && hasRedKey)
  {
    image(blackHole, 15, 15);
    blackHoleSound = minim.loadFile("BlackHole.wav");
    blackHoleSound.play();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasRedKey = false;
    swich = false;
    playerX = 400;
    playerY = 300;
  }
}
void level3()
{
  background = loadImage("Background2.png");
  SwichOn = loadImage("LeverOn.png");
  SwichOff = loadImage("LeverOff.png");
  image(background, 0, 0);
  image(door, 15, 15);
  if (swich == false)
  {
    image(SwichOff, 100, 400);
  } else
  {
    image(SwichOn, 100, 400);
  }
  if (playerX > 80 && playerX < 120 && playerY > 380 && playerY < 420)
  {
    swich = true;
  }
  if (swich == true && hasRedKey == false)
  {
    image(redKey, 70, 325);
  }
  if (swich2 == false)
  {
    image(SwichOff, 100, 500);
  } else
  {
    image(SwichOn, 100, 500);
  }
  if (playerX > 80 && playerX < 120 && playerY > 480 && playerY < 520)
  {
    swich2 = true;
  }
  if (swich2 == true)
  {
    swich = false;
    swich2 = false;
    playerX = 700;
    playerY = 400;
  }
  if (playerX + 16 > 15 && playerX < (15 + (32*3)) && playerY + 16 > 15 && playerY < (15 + (64*3)) && hasRedKey)
  {
    image(blackHole, 15, 15);
    blackHoleSound = minim.loadFile("BlackHole.wav");
    blackHoleSound.play();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasRedKey = false;
    playerX = 15;
    playerY = 15;
  }
  if (playerX + 16 > 70 && playerX < (70 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasRedKey && swich) {
    hasRedKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
}

void stop()
{
  minim.stop() ;
  super.stop() ;
}

