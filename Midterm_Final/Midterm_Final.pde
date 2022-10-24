// Use the left and right arrow to move
// Use the Spacebar to shoot

PImage playerImage;
PImage alienImage;

String screenState = "home"; 

Alien[] alien = new Alien[5]; 

float alienposX = random(0,width);
float alienposY = random(0,height);
float alienspeed = random(0,5);

int counter = 0;
int currentTime = 0;
int timer = 10000;

float playerPos = width/2;
float bulletX = width/2;
float bulletY = 550;

boolean moveUp;


class Alien {
  float xpos;
  float ypos;
  float yspeed;
  int respwanCount;
  boolean alive = true;

  Alien(float x, float y, float s){
    xpos = x;
    ypos = y;
    yspeed = s;
    respwanCount = 1;
  }

void display(){
  fill(255);
  image(alienImage,xpos,ypos);
  //rect(xpos,ypos,10,10);
  if (bulletX < xpos + 50 && bulletX > xpos -50 && bulletY < ypos+50 && bulletY > ypos-50){
    counter++;
    println(counter);
    println("scored");
  }
}

void move(){
  ypos += yspeed;
  if(ypos > height + 50){
    xpos = round(random(100,500));
    ypos = -50;
    yspeed = round(random(1,8));
    respwanCount++;
  }
}
}


void setup(){
  size(500,600);  
  for(int i = 0; i<alien.length;i++){
    alien[i] = new Alien( alienposX ,alienposY ,alienspeed);
  }
  rectMode(CENTER);
  
  imageMode(CENTER);
  playerImage = loadImage("player.png");
  playerImage.resize(100,0);
  
  alienImage = loadImage("alien.png");
  alienImage.resize(50,0);
  
}

void draw(){
  background(0);

  if (screenState == "home"){
    background(0);
    textSize(36);
    text("Space Invaders", 120,300);
    textSize(20);    
    text("Click the screen to start",120,350);
      if (mousePressed){
        screenState = "game";
      }
  }
  else if (screenState == "game"){
  if (keyPressed == true && key == CODED && keyCode == LEFT){
    playerPos = playerPos -5;
    bulletX = bulletX -5;
  }
  if (keyPressed == true && key == CODED && keyCode == RIGHT){
    playerPos = playerPos +5;
    bulletX = bulletX +5;
  }
  
  ellipse(bulletX,bulletY,10,10);
  image(playerImage,playerPos,height-50);  
  
  for(int i = 0; i<alien.length;i++){
    alien[i].move();
    alien[i].display();
  }
  
  if (keyPressed && key == ' '){
    moveUp = true;
  }  
  if (moveUp == true){
    bulletY = bulletY - 10;
  }  
  if (bulletY < 0){
    bulletY = 550;
    moveUp = false;
  }
 
  textSize(20);
  text("Points: " + counter, 350,50);
  
 
}
}
