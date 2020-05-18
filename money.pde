
class Drop {
  float x, y, r;
  boolean toDelete;

  Drop(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 30;
    this.toDelete = false;
  }

  void show() {
    noStroke();
    fill(150, 0, 255);
    image(money, this.x-28, this.y, this.r*2, this.r*2);
    //ellipse(this.x, this.y, this.r*2, this.r*2);
  }

  void evaporate() {
    this.toDelete = true;
  }

  boolean hits(Flower flower) { //defining the variable "hits"
    float d = dist(this.x, this.y, flower.x, flower.y);
    if (d < this.r + flower.r) { // if the distance of the object is less than radius of this and the radius of the bubble
      return true;
    } else {
      return false;
    }
  }

  void move() {
    this.y = this.y - 7; //speed of droplet moving on y axis
  }
}
