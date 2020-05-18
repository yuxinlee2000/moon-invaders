import processing.sound.*;

SoundFile flowerHit;

Ship ship;
Flower[] flowers = new Flower[6]; //number of flower objects 
ArrayList<Drop> drops = new ArrayList<Drop>();

PImage bg;

PImage money;
PImage [] bubbles = new PImage[6];

void setup() {
  size(600, 400);
  ship = new Ship();
  bg = loadImage("bg.png");

  flowerHit = new SoundFile(this, "flowerhit.wav");

  for (int i = 0; i < bubbles.length; i++) {
    bubbles [i] = loadImage("bubble"+i+".png");
  }

  money = loadImage("money.png");

  for (int i = 0; i < flowers.length; i++) {
    int index = int(random(0, bubbles.length));
    flowers[i] = new Flower(bubbles[index], i*80+80, 60); // location spacing of the flowers
  }
}

void draw() {
  background(bg);

  ship.show();
  ship.move();

  for (Drop d : drops) {
    d.show();
    d.move();

    for (int j = 0; j < flowers.length; j++) {
      if (d.hits(flowers[j])) {
        flowers[j].grow(); //commands the flower to grow
        d.evaporate(); //drop disappears
        flowerHit.play();
      }
    }
  }

  boolean edge = false;

  for (int i = 0; i < flowers.length; i++) {
    flowers[i].show();
    flowers[i].move();
    if (flowers[i].x > width || flowers[i].x < 0) { //if any flower hits the edge
      edge = true;
    }
  }

  if (edge) {
    for (int i = 0; i < flowers.length; i++) {
      flowers[i].shiftDown(); // flower shifts down when touching the edge
    }
  }

  for (int i = drops.size()-1; i >= 0; i--) {
    Drop d = drops.get(i);
    if (d.toDelete) {
      drops.remove(i);
    }
  }
}

void keyReleased() {
  if (key != ' ') {
    ship.setDir(0);
  }
}


void keyPressed() {
  if (key == ' ') {
    Drop drop = new Drop(ship.x, height);
    drops.add(drop); //calls for drops to be produced with spacebar
  }

  if (keyCode == RIGHT) {
    ship.setDir(1);
  } else if (keyCode == LEFT) { 
    ship.setDir(-1);
  }
}
