PImage backgroundImg1,backgroundImg2;
PImage enemyImg,fighterImg,hpImg,treasureImg;
PImage endImg1,endImg2,startImg1,startImg2;
int x,treasureX,treasureY,enemyX,enemyY,bgX;
float hp;
float fighterX,fighterY;
float fighterSpeed = 4;

boolean isPlaying = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
 
void setup () {
  //background
  size(640,480) ; 
  bgX = 0;
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  
  //hp
  hp = random(194);
  hpImg = loadImage("img/hp.png");
  
  //fighter
  fighterX = width-70;
  fighterY = height/2;
  fighterImg = loadImage("img/fighter.png");
  
  //treasure
  treasureX = floor(random(500));
  treasureY = floor(random(80,400));
  treasureImg = loadImage("img/treasure.png");
  
  //enemy
  enemyX = -100;
  enemyY = floor(random(80,400));
  enemyImg = loadImage("img/enemy.png");
  
  //start
  startImg1 = loadImage("img/start1.png");
  startImg2 = loadImage("img/start2.png");
  
  //end
  endImg1 = loadImage("img/end1.png");
  endImg2 = loadImage("img/end2.png");
}

void draw() {
  //start
  image(startImg2,0,0);
  
  if (mouseX <= 450 && mouseX >= 170){
    if (mouseY <= 410 && mouseY >= 385){
      image(startImg1,0,0);
    }
  }
  
  if (isPlaying){
    //background
    image(backgroundImg1,++bgX % 1280 - 640,0);
    image(backgroundImg2,(bgX + 640) % 1280 - 640,0);
      
    //hp
    stroke(#ff0000);
    fill(#ff0000);
    rect(32,24,hp,23);
    image(hpImg,20,20);
    
    //enemy
    image(enemyImg,enemyX,enemyY);
    if ((enemyX += 3) > 700){
      enemyX = -100;
      enemyY = floor(random(80,400));
    }
    
    //fighter
    image(fighterImg,fighterX,fighterY);
    if (upPressed){
      fighterY -= fighterSpeed;
    }
    if (downPressed){
      fighterY += fighterSpeed;
    }
    if (leftPressed){
      fighterX -= fighterSpeed;
    }
    if (rightPressed){
      fighterX += fighterSpeed;
    }
    
    if (fighterX >= (width-70)){
      fighterX = width-70;
    }
    if (fighterX <= 20){
      fighterX = 20;
    }
    if (fighterY <= 70){
      fighterY = 70;
    }
    if (fighterY >= (height-60)){
      fighterY = height-60;
    }
    
    //treasure
    image(treasureImg,treasureX,treasureY);
       
    //end
    if ((enemyX+25) >= (fighterX-25)) {
      if((enemyY+25) >= (fighterY-25) || (fighterY+25) >= (enemyY-25)){
        image(endImg2,0,0); 
      }
    }
    if ((fighterX+25) >= (enemyX-25)) {
      if((enemyY+25) >= (fighterY-25) || (fighterY+25) >= (enemyY-25)){
        image(endImg2,0,0);
      }
    }
    if ((enemyY+25) >= (fighterY-25)) {
      if((enemyX+25) >= (fighterX-25) || (fighterX+25) >= (enemyX-25)){
        image(endImg2,0,0); 
      }
    }
    if ((fighterY+25) >= (enemyY-25)) {
      if((enemyX+25) >= (fighterX-25) || (fighterX+25) >= (enemyX-25)){
        image(endImg2,0,0); 
      }
    }
  }
}

void mousePressed(){
  isPlaying = true;
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
