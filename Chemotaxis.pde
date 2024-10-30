boolean gameOver = false;
Alien [] bob;
Person jeff;
void setup() {
  size(600, 600);
  bob = new Alien[10];
  jeff = new Person();
  for (int i = 0; i < bob.length; i ++) {
    bob[i] = new Alien();
  }
}

void draw() {
  background(0);
  jeff.Run();
  jeff.show();
  for (int i = 0; i < bob.length; i ++) {
    bob[i].Bounce();
    bob[i].show();
    if (bob[i].myX > mouseX) {
      bob[i].myX = bob[i].myX - (int) (Math.random() * 6) + 1;
    } else {
      bob[i].myX = bob[i].myX + (int) (Math.random() * 3) + 1;
    }
    if (bob[i].myY > mouseY) {
      bob[i].myY = bob[i].myY - (int) (Math.random() * 6) + 1;
    } else {
      bob[i].myY = bob[i].myY + (int) (Math.random() * 3) + 1;
    }
    if (get(bob[i].myX, bob[i].myY) != color(0, 0, 255)) {
      gameOver = true; 
    }
    if(gameOver == true){
     fill(255, 255, 255);
     textSize(50);
     text("Game Over", 200, 300);
     noLoop();
    }
  }
}

void keyPressed(){
 if(key == 'r'){
  loop();
  redraw();
  background(255);
  gameOver = false;
 }
}

class Person {
  color myRgbTwo;
  int mYX, mYY;
  Person() {
    myRgbTwo = color(240, 198, 212);
    mYX = mouseX;
    mYY = mouseY;
  }
  void Run() {
    mYX = mouseX + 3;
    mYY = mouseY + 3;
  }
  void show() {
    fill(myRgbTwo);
    ellipse(mYX, mYY, 50, 50);
  }
}

class Alien {
  color myRgb;
  int myX, myY;
  Alien() { // construtor
    myRgb = color(0, 0, 255);
    myX = width / 2;
    myY = height / 2;
  }

  void Bounce() {
    myX = myX + (int) (Math.random() * 7) - 3;
    myY = myY + (int) (Math.random() * 7) - 3;
  }
  void show() {
    fill(myRgb);
    ellipse(myX, myY, 60, 60);
    if (dist(mouseX, mouseY, myX, myY) < 20) {
      myRgb = color(0, 247, 241);
    } else {
      myRgb = color(0, 0, 255);
    }
  }
}//end of ball
