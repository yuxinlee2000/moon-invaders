
class Flower {
  float x, y, r, xdir;

  PImage img; 

  Flower(PImage tempImg, float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 40;

    this.xdir = 1; //speed of x axis movement
    img = tempImg;
  }

  void grow() {
    this.r = this.r + 4; // defines what grow is, ie growing radius
  }



  void shiftDown() {
    this.xdir *= -1; //reversal in direction when shifted down
    this.y += this.r;
  }

  void move() {
    this.x = this.x + this.xdir;
  }

  void show() {
    noStroke();
    fill(255, 0, 0);

    image(img, this.x, this.y, this.r*2, this.r*2);

    //int index = int(random(0, enemy.length));
    //flower[i]=new Flower(r, x, y, textures[index]);
    //image(enemy[], this.x, this.y, this.r*2, this.r*2);
    //ellipse(this.x, this.y, this.r*2, this.r*2);
  }
}
