//Classes for player, alien and bullet

// Class for the player
class Player{
  PImage player;
  int xposition;
  int yposition;
  
  Player(int x, int y){
    player = loadImage("player.png");
    xposition = x;
    yposition = y;
    //xposition = mouseX;
    //yposition = 650;
    player.resize(120,0);
    image(player,x,y);
  }
  
  void movement(){
    //xposition = mouseX;
    //yposition = 650;
  }
  
  void display(){
    player.resize(120,0);
    image(player,xposition,yposition);
  }
}

// Class for the Enemy(alien(s))
class Alien{
  PImage alien;
  float xposition;
  float yposition;
  float xsize;
  float ysize;
  float yspeed;
  boolean shouldRemove;
  
  
  int left;
  int right;
  int top;
  int bottom;
  
  Alien(float x, float y){
    xposition = x;
    yposition = y;
    xsize = 60;
    ysize = 40;
    yspeed = random(1,5);
    shouldRemove = false;
    alien = loadImage("alien.png");    
    
    left = round(xposition - xsize/2);
    right = round(xposition + xsize/2);
    top = round(yposition - ysize/2);
    bottom = round(yposition + ysize/2);
  }
  
  void display(){
    image(alien,xposition,yposition,xsize,ysize);
  }
  
  void movement(){
    yposition += yspeed;
  }
  //void checkRemoved(){
  //  if(yposition > height){
  //    shouldRemove = true;
  //  } 
  //}
}

// Class for the bullet
class Bullet{
  float xposition;
  float yposition;
  float xsize;
  float ysize;
  float yspeed;
  boolean shouldRemove;
  
  //collision boundary
  int left;
  int right;
  int top;
  int bottom;
  
  Bullet(float x, float y){
    xposition = x;
    yposition = y;
    xsize = 7;
    ysize = 25;
    yspeed = 7;
    shouldRemove = false;
    
    left = round(xposition - xsize/2);
    right = round(xposition + xsize/2);
    top = round(yposition - ysize/2);
    bottom = round(yposition + ysize/2);
  }
  
  void display(){
    rect(xposition,yposition,xsize,ysize);
  }
  
  void movement(){
    yposition -= yspeed;
    left = round(xposition - xsize/2);
    right = round(xposition + xsize/2);
    top = round(yposition - ysize/2);
    bottom = round(yposition + ysize/2);
  }
  
  void checkRemoved(){
    if(yposition < 0){
      shouldRemove = true;
    } 
  }
  
  void shootAlien(Alien aAlien){
  if(top <= aAlien.bottom && bottom >= aAlien.top && left <= aAlien.right && right >= aAlien.left){
    //println("shot");
    aAlien.shouldRemove = true;
    shouldRemove = true;
  }
  }
}
