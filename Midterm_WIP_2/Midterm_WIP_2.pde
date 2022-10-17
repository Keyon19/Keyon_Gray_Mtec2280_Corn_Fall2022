int currentTime = 0;
int previousTime = 0;
int timer = 500; // .5 second timer

int moveYA = 0; //used as a way to move the alien down (y-position)
int moveYB = 0; // used to move the bullet up (y-position)


PImage player;
PImage alien;

int[] position = new int[5];
int[] speed = new int[2];

String screenState = "home";
String playerState = "3";
String enemyState = "alive";
String bulletState = "eluding";

void setup(){
  size(1000,700);  
  imageMode(CENTER);
  textAlign(CENTER);
  
    player = loadImage("player.png");
    alien = loadImage("alien.png");
    
}

void draw(){
  background(0);
  currentTime = millis();
  
  position[0] = 100;
  position[1] = 300;
  position[2] = 500;
  position[3] = 700;
  position[4] = 900;
  
  speed[0] = 40;
  speed[1] = 20;
  if (screenState == "home"){
    background(0);
    textSize(36);
    text("Space Invaders", width/2,height/2);
    textSize(20);    
    text("Click the screen to start",width/2,height/2+50);
      if (mousePressed){
        screenState = "game";
      }
  }
  else if (screenState == "game"){
  if(moveYA < 700){
  for( int i =0; i <= 4; i++){
  alien.resize(70,0);
  image(alien,position[i],moveYA);
  }
} else {
  moveYA =0;
  println("respwaning");
}
  player.resize(150,0);
  image(player,mouseX,600);

  for (int i=0; i < 2; i++){
    if(currentTime - previousTime >= timer){
      moveYA += speed[i];
      previousTime = currentTime;
    }
  }
  
  if (mousePressed){
    bullet(mouseX,600,50,50);
  }
  /*
  if(currentTime - previousTime >= timer){
    moveYA += 20;
    previousTime = currentTime;
  }
  */
    
  }
  else if (screenState == "pause"){
  
  
  }
  else if (screenState == "gameover"){
  
  
  }
  

}

 
void bullet(int x,int y, int w, int h){
  rectMode(CENTER);
  fill(255);
  rect(x,y,w,h);
}
