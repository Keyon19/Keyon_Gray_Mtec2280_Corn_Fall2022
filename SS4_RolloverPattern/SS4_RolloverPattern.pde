//SS4_RolloverPattern
/*
When you hover the mouse over the circle on the bottom right, the circle will light
green and "cars" will spwan and drive but once the mouse is off the circle the 
code ill stop.
*/



float moveX;
float FmoveX;

void setup(){
  size(600,550);
  ellipseMode(CENTER);
}

void draw(){
  background(0);
  
  for(float i = 120; i < 600; i+=300){
    stroke(255);
    strokeWeight(1);
    //horizontal lines
    line(10,i,20,i);
    line(90,i,100,i);
    line(180,i,190,i);
    line(270,i,280,i);
    line(360,i,370,i);
    line(450,i,460,i);
    line(540,i,550,i);
  }

  for(float i = 260; i < 275; i+=10){
    stroke(255, 251, 41);
    strokeWeight(4);
    line(0,i,600,i);   
  }
/*    
  if(mouseX>width/2){
    moveX+=2;
    stroke(255);
    fill(255);
    rect(moveX,50,40,20);
    rect(-moveX+width,350,40,20);
  }
  
  if(mouseX>width/2){
    FmoveX+=3;
    stroke(255);
    fill(255);
    rect(FmoveX,200,40,20);
    rect(-FmoveX+width,450,40,20);
  }
  */
  
  ellipse(550,500,40,40);
  
  float d = dist(mouseX, mouseY, 550, 500);
  if (d < 50) {
    stroke(40, 250, 85);   
    fill(40, 250, 85);
    ellipse(550,500,40,40);
    
    moveX+=2;
    stroke(255);
    fill(255);
    rect(moveX,50,40,20);
    rect(-moveX+width,350,40,20);
    
    FmoveX+=3;
    stroke(255);
    fill(255);
    rect(FmoveX,200,40,20);
    rect(-FmoveX+width,450,40,20);
  } else {
    fill(255);
  }
  

}
