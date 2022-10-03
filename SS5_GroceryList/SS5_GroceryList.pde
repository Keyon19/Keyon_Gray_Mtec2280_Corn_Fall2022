// SS5_GroceryList by: Keyon Gray 
// Press on the mouse to change between each item by cycling through the array


int[] items = new int[3];

int positionItems = 0;

void setup(){
  size(600,600);
  textSize(32);
  textAlign(CENTER,CENTER);
  fill(0);
    
}

void draw(){
  background(255);
  
  items[0] = 1; // egg
  items[1] = 2; // milk
  items[2] = 3; // butter
  
  //egg(width/2,height/2,250,400);

  //milk(width/2,height/2,250,200,(width/2),(height/2)-100,(height/2)-125,250,100,250,50,25);
  
  //butter(width/2,height/2,400,100);
  
  if (positionItems == 1){
    egg(width/2,height/2,250,400);
  } else if(positionItems ==2){
    milk(width/2,height/2,250,200,(width/2),(height/2)-100,(height/2)-125,250,100,250,50,25);
  } else{
    butter(width/2,height/2,400,100);
  }
}


void egg(int x, int y, int w, int h){
  ellipseMode(CENTER);
  fill(255, 245, 196);
  ellipse(x,y,w,h);
  stroke(0);
  strokeWeight(2);
  fill(0);
  text("Egg",width/2,525);
}

void milk(int x, int y, int w, int h, int x2, int y2, int y3,int w2, int h2, int w3, int h3, int h4){
  rectMode(CENTER);
  fill(255);
  rect(x,y,w,h);
  fill(179, 230, 255);
  rect(x,y,w2,h2);
  fill(255);
  rect(x2,y2,w3,h3);
  rect(x2,y3,w3,h4);
  fill(0);
  textSize(36);
  text("Milk",x,y);
}

void butter(int x, int y, int w, int h){
  rectMode(CENTER);
  fill(246,235,97);
  rect(x,y,w,h);
  stroke(0);
  strokeWeight(2);
  fill(0);
  text("Stick of Butter",width/2,500);
}

void mousePressed(){
  if (positionItems == items.length-1){
    positionItems=0; 
  } else {
    positionItems++;
  }
}
