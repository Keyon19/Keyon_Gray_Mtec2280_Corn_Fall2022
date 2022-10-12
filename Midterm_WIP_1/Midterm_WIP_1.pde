int currentTime = 0;
int previousTime = 0;
int timer = 500; // .5 second timer

int moveYA = 0; //used as a way to move the alien down (y-position)

PImage player;
PImage alien;

int[] position = new int[5];

int[] speed = new int[2];

void setup(){
  size(1000,700);  
  imageMode(CENTER);
  
    player = loadImage("player.png");
    alien = loadImage("alien.png");
    
}

void draw(){
  background(0);
  currentTime = millis();
/*
  position[0] = int(random(100,150));
  position[1] = int(random(150,300));
  position[2] = int(random(300,450));
  position[3] = int(random(450,600));
  position[4] = int(random(600,750));
  position[5] = int(random(750,900));
*/
  position[0] = 100;
  position[1] = 300;
  position[2] = 500;
  position[3] = 700;
  position[4] = 900;
  
  speed[0] = 40;
  speed[1] = 20;

if(moveYA < 700){
  for( int i =0; i < 5; i++){
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
  
  
  /*
  if(currentTime - previousTime >= timer){
    moveYA += 20;
    previousTime = currentTime;
  }
  */
}
