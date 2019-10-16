class Bubble {

  float circleX;
  float circleY;
  float yspeed = 0.9;
  float xspeed;
  float diameter = 26;
  boolean edge;
  int straty = 0;
  boolean display = true;


  ////////////////////
  float alphaBabelka = 210;
  color c = color(random(145, 230), random(145, 230), random(145, 230), alphaBabelka);
  ////////////////////

  Bubble(float tempCX, float tempCY, float tempYS, float tempD) {
    circleX = tempCX;
    circleY = tempCY;
    yspeed = tempYS;
    diameter = tempD;
  }

  void display() {


    if (c > color(249, 249, 249, alphaBabelka)) {
      c= color(random(145, 255), random(145, 255), random(145, 255), alphaBabelka);
    }


    fill(c);
    //noStroke();
    ellipse(circleX, circleY, diameter, diameter);



    fill(255, 255, 255, alphaBabelka);
    //noStroke();
    ellipse(circleX+12, circleY -14, 5, 5);
  }

  void move() {
    xspeed = random(-2, 2);
    circleY = circleY - yspeed;
    circleX = circleX + xspeed;
  }

  void edge() {

    if (circleY<0+diameter) {
      //yspeed=yspeed * -1;
      yspeed = 0;
      pop();
      edge = true;
    }
    //if (circleY>height-diameter) {
    //  //yspeed=yspeed*-1;
    //  yspeed = 0;
    //  pop();
    //  edge = true;
    //}
  }
  void pop() {

    if (update()) {
      if (mousePressed) {
        display =false;
        file.play();
        //bubbles.add(new Bubble(random(0+26,width-26), height-26, random(0.8,1.8), 26));
        //image(pop,circleX,circleY);



        points += 1;
      }
    }

    if (edge) {
      display = false;
      file.play();

      switch(straty) {
      case 0:
        HP -= 1;
        straty += 1;
        break;

      case 1:
        HP -= 1;
        straty += 1;
        break;

      case 2:
        HP -= 1;
        straty += 1;
        break;
      }
    }
  }

  boolean update() {
    float dis = dist(mouseX, mouseY, circleX, circleY);
    if (dis<diameter) { 
      return true;
    } else return false;
  }
}