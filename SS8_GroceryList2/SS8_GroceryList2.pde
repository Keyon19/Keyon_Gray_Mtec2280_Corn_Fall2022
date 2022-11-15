import processing.serial.*; //imports Serial library from Processing

Serial myPort; 
char HEADER = 'H';    
short LF = 10;        
int[] values = {0, 1};
color c = color(0, 0, 0);

int[] items = new int[3];

int positionItems = 0;


void setup() {
  size(600, 600);
  textSize(32);
  textAlign(CENTER,CENTER);
  fill(0);
  
  String[] portList = Serial.list();
  printArray(portList); 
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  if ( myPort.available() > 0) { 
    String message = myPort.readStringUntil(LF);
    
    if(message != null) {
      print(message);
      String [] data  = message.split(","); 
      if(data[0].charAt(0) == HEADER) {       
        for( int i = 1; i < data.length-1; i++) { 
          try{
            values[i-1] = Integer.parseInt(data[i]);
          }
          catch (NumberFormatException e){
            return;
          }
          println("Value" +  i + " = " + values[i-1]);  
        }
        println();
      }
    }
  }

  background(255);
  if(values[1] == 0){
     //c = color(random(255), random(255), random(255));
     egg(width/2,height/2,250,400);
  } else {
    milk(width/2,height/2,250,200,(width/2),(height/2)-100,(height/2)-125,250,100,250,50,25);
  }
  

  //fill (c);
  //ellipse (width/2, height/2, values[0], values[0]);
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
