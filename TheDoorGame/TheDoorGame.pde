import javax.swing.JOptionPane;
import ddf.minim.*;
Minim minim;
AudioPlayer keyBing, blackHoleSound, leverFlip;
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
PImage greenKey;
PImage buttonOn;
PImage buttonOff;
PImage cube;
PImage blueKey;
PImage pinkKey;
boolean hasGreenKey = false;
boolean swich3 = false;
boolean hasYellowKey = false;
boolean hasRedKey = false;
boolean swich = false;
boolean swich2 = false;
boolean hasBox1 = false;
boolean hasBox2 = false;
boolean button1 = false;
boolean button2 = false;
boolean hasBlueKey = false;
boolean hasPinkKey = false;
boolean canUseBox1 = true;
boolean canUseBox2 = true;
int playerX = 400;
int playerY = 300;
int box1x = 500;
int box1y = 200;
int box2x = 40;
int box2y = 90;
int level = 1;
int mms = 5;
void setup() {
  size(800, 600);
  door = loadImage("Door.png");
  player = loadImage("Player.png");
  yellowKey = loadImage("Key.png");
  blackHole = loadImage("BlackHole.png");
  redKey = loadImage("Key2.png");
  greenKey = loadImage("Key3.png");
  door2 = loadImage("Door2.png");
  minim = new Minim(this);
  keyBing = minim.loadFile("Ding.wav");
  blackHoleSound = minim.loadFile("BlackHole.wav");
  leverFlip = minim.loadFile("LeverFlip.wav");
  JOptionPane.showMessageDialog(null, "Get to the door! Use wasd to move.\n\nThere is information that may appear at the\ntop of the screen, which may hold useful info.\n\nTutorial levels have lemon backgrounds while puzzles\nhave dungeon-like backgrounds.");
}
void draw() {
  //  Minim.start(this);
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
  case 4:
    level4();
    break;
  case 5:
    level5();
    break;
  case 6:
    level6();
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
  background(background);
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
  }
  if (!hasYellowKey)
  {
    image(yellowKey, 70, 325);
  }
  if (playerX + 16 > 70 && playerX < (70 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasYellowKey) {
    hasYellowKey = true;
    keyBing.play();
  }
}
void keyPressed() {
  if (key == 'w' && playerY > 0)
  {
    playerY = playerY-mms;
  } else if (key == 'a' && playerX > 0)
  {
    playerX = playerX-mms;
  } else if (key == 'd' && playerX + 16 < 800)
  {
    playerX = playerX+mms;
  } else if (key == 's' && playerY + 16 < 600)
  {
    playerY = playerY+mms;
  } else if (key == 'r') {
    hasGreenKey = false;
    swich3 = false;
    hasYellowKey = false;
    hasRedKey = false;
    swich = false;
    swich2 = false;
    hasBox1 = false;
    button1 = false;
    playerX = 400;
    playerY = 300;
    box1x = 500;
    box1y = 200;
  } else if (key == 'n') {
    level++;
  }
}
void level2() {
  background = loadImage("Background1.png");
  SwichOn = loadImage("LeverOn.png");
  SwichOff = loadImage("LeverOff.png");
  background(background);
  image(door, 15, 15);
  if (swich == false)
  {
    image(SwichOff, 100, 400);
  } else
  {
    image(SwichOn, 100, 400);
  }
  if (playerX > 80 && playerX < 120 && playerY > 380 && playerY < 420 && !swich)
  {
    swich = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (swich == true && !hasYellowKey)
  {
    image(yellowKey, 200, 325);
  }
  if (playerX + 16 > 200 && playerX < (200 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasYellowKey && swich) {
    hasYellowKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
  if (playerX + 16 > 15 && playerX < (15 + (32*3)) && playerY + 16 > 15 && playerY < (15 + (64*3)) && hasYellowKey)
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
    hasYellowKey = false;
    swich = false;
    playerX = 400;
    playerY = 300;
  }
  sayText("When you activate levers, they stay on.");
}
void level3()
{
  background = loadImage("Background2.png");
  SwichOn = loadImage("LeverOn.png");
  SwichOff = loadImage("LeverOff.png");
  background(background);
  image(door2, 15, 15);
  if (swich == false)
  {
    image(SwichOff, 100, 500);
  } else
  {
    image(SwichOn, 100, 500);
  }
  if (playerX + 16 > 100 && playerX < 100 + 16 && playerY + 16 > 500 && playerY < 500 + 16 && !swich)
  {
    swich = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (swich == true && hasRedKey == false)
  {
    image(redKey, 70, 325);
  }
  if (swich2 == false)
  {
    image(SwichOff, 100, 400);
  } else
  {
    image(SwichOn, 100, 400);
  }
  if (playerX + 16 > 100 && playerX < 100 + 16 && playerY + 16 > 400 && playerY < 400 + 16)
  {
    swich2 = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (swich2 == true)
  {
    swich = false;
    swich2 = false;
    playerX = 700;
    playerY = 400;
    hasRedKey = false;
  }
  if (playerX + 16 > 15 && playerX < (15 + (32*3)) && playerY + 16 > 15 && playerY < (15 + (64*3)) && hasRedKey)
  {
    image(blackHole, 15, 15);
    blackHoleSound = minim.loadFile("BlackHole.wav");
    blackHoleSound.play();
    swich = false;
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasRedKey = false;
    playerX = 400;
    playerY = 300;
  }
  if (playerX + 16 > 70 && playerX < (70 + (32)) && playerY + 16 > 325 && playerY < (325 + (16)) && !hasRedKey && swich) {
    hasRedKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
  sayText("By the way, some switches reset you.");
}
void level4()
{
  background = loadImage("Background2.png");
  SwichOn = loadImage("LeverOn.png");
  SwichOff = loadImage("LeverOff.png");
  background(background);
  image(door2, 15, 15);
  if (swich == false)
  {
    image(SwichOff, 200, 50);
  } else
  {
    image(SwichOn, 200, 50);
  }
  if (swich3 == false)
  {
    image(SwichOff, 600, 50);
  } else
  {
    image(SwichOn, 600, 50);
  }
  if (swich2 == false)
  {
    image(SwichOff, 400, 50);
  } else
  {
    image(SwichOn, 400, 50);
  }
  if (swich2 == true && !hasYellowKey)
  {
    image(yellowKey, 400, 100);
  }
  if (swich == true && !hasRedKey)
  {
    image(redKey, 200, 100);
  }
  if (swich3 == true && !hasGreenKey)
  {
    image(greenKey, 600, 100);
  }
  if (playerX > 180 && playerX < 220 && playerY > 30 && playerY < 70 && hasYellowKey && !swich)
  {
    swich = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  } else if (playerX > 180 && playerX < 220 && playerY > 30 && playerY < 70 && !hasYellowKey) {
    swich = false;
    swich2 = false;
    swich3 = false;
    playerX = 700;
    playerY = 400;
    hasRedKey = false;
    hasYellowKey = false;
    hasGreenKey = false;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (playerX > 380 && playerX < 420 && playerY > 30 && playerY < 70 && !swich2)
  {
    swich2 = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (playerX > 580 && playerX < 620 && playerY > 30 && playerY < 70 && hasRedKey && hasYellowKey && !swich3)
  {
    swich3 = true;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  } else if (playerX > 580 && playerX < 620 && playerY > 30 && playerY < 70 && (!hasRedKey || !hasYellowKey)) {
    swich = false;
    swich2 = false;
    swich3 = false;
    playerX = 700;
    playerY = 400;
    hasRedKey = false;
    hasYellowKey = false;
    hasGreenKey = false;
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
  }
  if (playerX + 16 > 15 && playerX < (15 + (32*3)) && playerY + 16 > 15 && playerY < (15 + (64*3)) && hasGreenKey)
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
    hasYellowKey = false;
    hasGreenKey = false;
    playerX = 400;
    playerY = 300;
  }
  if (playerX + 16 > 200 && playerX < (200 + (32)) && playerY + 16 > 100 && playerY < (100 + (16)) && !hasRedKey && swich) {
    if (!hasYellowKey)
    {
      swich = false;
      swich2 = false;
      swich3 = false;
      playerX = 700;
      playerY = 400;
      hasRedKey = false;
      hasYellowKey = false;
      hasGreenKey = false;
    } else
    {
      hasRedKey = true;
      keyBing = minim.loadFile("Ding.wav");
      keyBing.play();
    }
  }
  if (playerX + 16 > 400 && playerX < (400 + (32)) && playerY + 16 > 100 && playerY < (100 + (16)) && !hasYellowKey && swich2) {
    hasYellowKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
  if (playerX + 16 > 600 && playerX < (600 + (32)) && playerY + 16 > 100 && playerY < (100 + (16)) && !hasGreenKey && swich3) {
    if (!hasRedKey)
    {
      swich = false;
      swich2 = false;
      swich3 = false;
      playerX = 700;
      playerY = 400;
      hasRedKey = false;
      hasYellowKey = false;
      hasGreenKey = false;
    } else
    {
      hasGreenKey = true;
      keyBing = minim.loadFile("Ding.wav");
      keyBing.play();
    }
  }
  sayText("Keys don't just open doors!");
}

void level5() {
  background = loadImage("Background1.png");
  buttonOn = loadImage("ButtonOn.png");
  buttonOff = loadImage("ButtonOff.png");
  box = loadImage("Box.png");
  background(background);
  image(door, 40, 40);
  image(box, box1x, box1y);
  if (playerX + 16 > box1x && playerX < box1x + 16 && playerY + 16 > box1y && playerY < box1y + 16) {
    hasBox1 = true;
  }
  if (50 + 16 > box1x && 50 < box1x + 16 && 500 + 16 > box1y && 500 < box1y + 16 && !button1) {
    leverFlip = minim.loadFile("LeverFlip.wav");
    leverFlip.play();
    hasBox1 = false;
    image(buttonOn, 50, 500);
    button1 = true;
    box1x = 50;
    box1y = 495;
  } else if (50 + 16 > box1x && 50 < box1x + 16 && 500 + 16 > box1y && 500 < box1y + 16) {
    hasBox1 = false;
    image(buttonOn, 50, 500);
    button1 = true;
    box1x = 50;
    box1y = 495;
  } else {
    image(buttonOff, 50, 500);
  }
  if (hasBox1) {
    box1x = playerX;
    box1y = playerY - (17);
  }
  if (button1 && !hasYellowKey && playerX + 16 > 500 && playerX < 500 + 32 && playerY + 16 > 300 && playerY < 300 + 16) {
    hasYellowKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  } else if (button1 && !hasYellowKey) {
    image(yellowKey, 500, 300);
  }
  if (hasYellowKey && playerX + 16 > 40 && playerX < 40 + 96 && playerY + 16 > 40 && playerY < 40 + 192) {
    image(blackHole, 40, 40);
    blackHoleSound = minim.loadFile("BlackHole.wav");
    blackHoleSound.play();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasYellowKey = false;
    button1 = false;
    playerX = 400;
    playerY = 300;
    box1x = 300;
    box1y = 550;
    box2x = 150;
    box2y = 200;
  }
  sayText("Cubes can be picked up and placed down on buttons, but they can never come off. Press R to restart a level if you get stuck.");
}

void level6() {
  background = loadImage("Background2.png");
  buttonOn = loadImage("ButtonOn.png");
  buttonOff = loadImage("ButtonOff.png");
  box = loadImage("Box.png");
  door = loadImage("Door2.png");
  background(background);
  image(door, 600, 8);
  if (button1) {
    image(buttonOn, 200, 500);
  } else {
    image(buttonOff, 200, 500);
  }
  if (button2) {
    image(buttonOn, 400, 250);
  } else {
    image(buttonOff, 400, 250);
  }
  image(box, box1x, box1y);
  image(box, box2x, box2y);
  if (canUseBox1) {
    if (playerX + 16 > box1x && playerX < box1x + 16 && playerY + 16 > box1y && playerY < box1y + 16) {
      hasBox1 = true;
      box1x = playerX;
      box1y = playerY - (17);
    }
  }
  if (canUseBox2) {
    if (playerX + 16 > box2x && playerX < box2x + 16 && playerY + 16 > box2y && playerY < box2y + 16) {
      hasBox2 = true;
      box1x = playerX;
      box1y = playerY - (17 * 2);
    }
  }
  if (hasBox1) {
    box1x = playerX;
    box1y = playerY - (17);
  }
  if (hasBox2) {
    box2x = playerX;
    box2y = playerY - (17 * 2);
  }
  if (200 + 16 > box1x && 200 < box1x + 16 && 500 + 16 > box1y && 500 < box1y + 16 && !button1 && canUseBox1) {
    button1 = true;
    hasBox1 = false;
    canUseBox1 = false;
    box1x = 200;
    box1y = 495;
  }
  if (400 + 16 > box1x && 400 < box1x + 16 && 250 + 16 > box1y && 250 < box1y + 16 && !button2 && canUseBox1) {
    button2 = true;
    hasBox1 = false;
    canUseBox1 = false;
    box1x = 400;
    box1y = 245;
  }
  if (200 + 16 > box2x && 200 < box2x + 16 && 500 + 16 > box2y && 500 < box2y + 16 && !button1 && canUseBox2) {
    button1 = true;
    hasBox2 = false;
    canUseBox2 = false;
    box2x = 200;
    box2y = 495;
  }
  if (400 + 16 > box2x && 400 < box2x + 16 && 250 + 16 > box2y && 250 < box2y + 16 && !button2 && canUseBox2) {
    button2 = true;
    hasBox2 = false;
    canUseBox2 = false;
    box2x = 400;
    box2y = 245;
  }
  if (button1 && button2 && !hasRedKey) {
    image(redKey, 750, 450);
  }
  if (playerX + 16 > 750 && playerX < 750 + 32 && playerY + 16 > 450 && playerY < 450 + 16) {
    hasRedKey = true;
    keyBing = minim.loadFile("Ding.wav");
    keyBing.play();
  }
  if (hasRedKey && playerX + 16 > 600 && playerX < 600 + 96 && playerY + 16 > 8 && playerY < 8 + 192) {
    image(blackHole, 40, 40);
    blackHoleSound = minim.loadFile("BlackHole.wav");
    blackHoleSound.play();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    level++;
    hasRedKey = false;
    button1 = false;
    button2 = false;
    playerX = 400;
    playerY = 300;
    box1x = 300;
    box1y = 550;
    box2x = 150;
    box2y = 200;
  }
}

void stop()
{
  minim.stop() ;
  super.stop() ;
}

