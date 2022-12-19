import processing.serial.*;
Serial myPort;
int[] serialInArray = new int[2];    
int serialCount = 0;                 
boolean firstContact = false;  

int currentTimer;
int interval = 1 * 60;

String toPrint;

int xpos, ypos; 
float rangeX;
int buttonPressed;

int pointCounter = 0;

Player player;

ArrayList<Alien> alienList;
Alien alien;
Alien alien2;
Alien alien3;
Alien alien4;

ArrayList<Bullet> bulletList;

void setup(){
  size(900,700); 
  imageMode(CENTER);
  textAlign(CENTER);  
  textSize(36);
  
  xpos = 0;
  ypos = 650;
  
  printArray(Serial.list()); 
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);
  
  //player = new Player(xpos,ypos);
    
  alien = new Alien(200,0);
  alien2 = new Alien(400,0);
  alien3 = new Alien(600,0);
  alien4 = new Alien(800,0);
  
  alienList = new ArrayList<Alien>();
  alienList.add(alien);
  alienList.add(alien2);
  alienList.add(alien3);
  alienList.add(alien4);
  
  bulletList = new ArrayList<Bullet>();
}

void draw(){
  background(0); 
  text("Score: " + pointCounter, 800,40);
  currentTimer = (interval - millis() /1000);
  int min = currentTimer / 60;
  int seconds = currentTimer % 60;
  String timeSec = "";
  
  if(seconds < 10){
    timeSec = "0";
  };
  timeSec += Integer.toString(seconds);
  println(timeSec);
  
  toPrint = "";
  if(min >= 1){
    toPrint += min;
    toPrint += ":";
  }
  
  toPrint += timeSec;
  

  if(currentTimer > 0){
    //gameState = "Game";
      text(toPrint, width/2, 40);
// alien
  for (Alien aalien : alienList){
    aalien.display();
    aalien.movement();
    //aalien.checkRemoved();
  }

  for (int e = alienList.size() -1; e >= 0; e--){
    Alien aAlien = alienList.get(e);
    
    if(aAlien.shouldRemove == true){
      alienList.remove(aAlien);
    }
       
    for (int i = alienList.size() -1; i >= 0; i--){
      Alien aalien = alienList.get(i);
    
      if(aalien.shouldRemove == true){
        alienList.remove(aalien);
        alienList.add(new Alien(random(100,900),0));
        pointCounter += 50;
    }
      if(aalien.yposition > height){
        alienList.remove(aalien);
        alienList.add(new Alien(random(100,900),0));
        pointCounter -=100;
      }
  }
      
// bullet  
  for(Bullet aBullet : bulletList){
    aBullet.display();
    aBullet.movement();
    aBullet.checkRemoved(); 
    for (Alien aalien : alienList){
      aBullet.shootAlien(aAlien);
  }
  }
  
  for (int i = bulletList.size() -1; i >= 0; i--){
    Bullet aBullet = bulletList.get(i);
    
    if(aBullet.shouldRemove == true){
      bulletList.remove(aBullet);
    }
  }

  }


//player  
    player = new Player(round(rangeX),ypos);
    rangeX = map(float(xpos),0,255,0,width);
    
  } else {
      gameOver();
  }
  }

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          
      firstContact = true;     
      myPort.write('A');       
    }
  } else {
    serialInArray[serialCount] = inByte;
    serialCount++;

    if (serialCount > 1 ) {
      xpos = serialInArray[0];
      buttonPressed = serialInArray[1];

      if(buttonPressed == 0){
        buttonPressed();
      }
      
      //println(xpos + "\t" + buttonPressed + "\t");
      myPort.write('A');
      serialCount = 0;
    }
  }
}

void buttonPressed(){
  bulletList.add(new Bullet(player.xposition,player.yposition));
}

void gameOver(){  
  background(0); 
  textSize(36);
  text("GAME OVER",width/2,height/2);
  text("Score: " +pointCounter,width/2,(height/2) + 50);
}
