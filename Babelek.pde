import processing.sound.*;

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();


SoundFile file;

PImage heart;
PImage pop;

int points = 0;
int HP = 3;
boolean gameover = false;
float speed = 0.8;


void setup() {
  ellipseMode(RADIUS);
  size(640, 320);
 
  for(int i = 0; i < 3; i++){
    bubbles.add(new Bubble(random(0+26,width-26), height+40, speed, 26));
  //bubbles[i] = new Bubble(random(0+26,width-26), height-26, random(0.8,1.8), 26);
  
  }

  
  

  heart = loadImage("heart.png");
  pop = loadImage("pop.png");


  file = new SoundFile(this, "pop.wav");
}
void draw() {
  background(255);
  
  for(int i = 0; i < bubbles.size(); i++){
    Bubble b = bubbles.get(i);
    
    b.display();
    if(gameover == false){
    b.move();
    b.edge();
    b.update();
    b.pop();
    }
    
    if(b.display == false){
    bubbles.remove(i);
    if(speed < 1){
      speed *= 1.04;
    }else if(speed >= 1){
    speed *= 1.009;
    }
    bubbles.add(new Bubble(random(0+26,width-26), height+40, speed, 26));
    //println(speed);
    //bubbles.add(new Bubble(random(0+26,width-26), height+45, random(0.4,1), 26));
    }
      
 
  }
  
  death();
  interFace();
}
void interFace() {
  stroke(0);
  fill(0);
  textSize(16);
  text("Punkty: "+points, 10, 30);
  text("Zycia: ", 10, 80);

  switch(HP) {
  case 3:
    image(heart, 60, 70);
    image(heart, 80, 70);
    image(heart, 100, 70);
  case 2:
    image(heart, 60, 70);
    image(heart, 80, 70);
  case 1:
    image(heart, 60, 70);
  case 0:
  }
}
void death() {
  if (HP <= 0) {
    stroke(0);
    fill(255, 0, 0);
    textSize(48);
    gameover = true;
    text("Game Over!", width/2, height/2);
  }
}