PImage alien;
PImage player;

float opacity = 255;
float fade = 10;

float fall = 0;
float alienPos = 0;
float playerPos = 0;

void setup(){
  size(1000,700);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(200);
  
  // Assign image to object using loadImage() method  
  // "name of PImage" = loadImage("name of png/jpeg file");
  
  alien = loadImage("alien.png");
  player = loadImage("player.png");
  
}

void draw(){
  background(0);
  
  player.resize(150,0);
  alien.resize(100,0);
  
  fill(opacity);
  text("GAME OVER", width/2,height/2);
  
  opacity = opacity + fade;
  
  if (opacity > 255 || opacity < 0){
  fade = -fade;
  }  
  // display image with image() method, x,y cooridinate of image
  // image("name of PImage", x , y);
  
  image(player, playerPos, height/2 + 260);
  image(alien, alienPos,fall);
  
  playerPos = mouseX;
  alienPos = width/2;
  fall = fall + 5;
  
  if (fall > 800){
    fall = -50;  
  }
  if (fall == -50){
    alienPos = alienPos + random(-100,100);
  
  }
  
}
