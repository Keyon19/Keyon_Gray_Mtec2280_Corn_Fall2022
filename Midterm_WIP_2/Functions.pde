Alien alien1;

void displayA(){
  alien.resize(70,0);
  
}

void moveA() {
  ypos += yspeed;
  if (ypos > height + 50) {
    xpos = round(random(100,500));
    ypos = -50;
    yspeed = round(random(1,8));
    repspwanCount++;
  }
}
