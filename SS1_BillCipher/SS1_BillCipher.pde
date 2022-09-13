// Bill Cipher by: Keyon Gray 

void setup(){
  size(1080,720);
  background (255);
}

void draw(){
  
  //Arms
  stroke(255, 252, 69);
  strokeWeight(5);
  rectMode(CORNER);
  rect(600,450,300,20);
  rect(200,450,200,20);
  
  //Legs
  stroke(0);
  stroke(255, 252, 69);
  strokeWeight(5);
  rect(600,450,20,250);
  rect(450,450,20,250);
  
  //Body
  stroke(255, 252, 69);
  strokeWeight(5);
  fill(255, 252, 69);
  triangle(540,150,350,550,730,550);
  
  //Eye
  stroke(0);
  strokeWeight(3);
  fill(255);
  ellipse(540,345,150,125);
  //Top Eyelash
  line(520,250,530,280);
  line(560,250,550,280);
  line(580,260,570,285);
  line(500,260,510,285);

  //Pupil
  stroke(0);
  fill(0);
  ellipse(540,345,40,100);
  
  //Hat
  stroke(255, 252, 69);
  strokeWeight(5);
  rectMode(CENTER);
  rect(540,80,30,150);  
  rect(540,150,100,20);
  
  //Tie
  stroke(0);
  strokeWeight(1);
  triangle(560,470,490,440,490,490);
  triangle(520,470,590,440,590,490);
  

}
