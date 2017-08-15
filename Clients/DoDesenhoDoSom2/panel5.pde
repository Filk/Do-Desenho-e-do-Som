int toggleP5=0;
boolean bolaVerdade=true;
int coordX, coordY;
Mover mover;

class Panel5
{
  void display()
  {
    mover.update();
    mover.display();
    mover.controlaTrasp();
  }
  
}

class Mover 
{
 // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  // The Mover's maximum speed
  float topspeed;
  int transpa;
  boolean desaparece = false; 
  boolean aparece=false;
  float distance;
  boolean controlThing=true;

  Mover() 
  {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    mouse = new PVector(width/2,height/2);
    topspeed = 2;
    transpa=255;
    coordX=width/2;
    coordY=height/2;
    transpa=0;
  }

  void update() 
  {
    
    if (bolaVerdade)
    {
      mouse.x=coordX;
      mouse.y = coordY-70;
      distance = dist (mouse.x, mouse.y,location.x, location.y);
    }
    
    topspeed = map (distance, 0, width, 0, 10);
    PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
    acceleration.normalize();
    acceleration.mult(0.1);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
    location.x=location.x;
    location.y=location.y;
  }

  void display() 
  {
    stroke(0);
    strokeWeight(2);
    noStroke();
    fill(0,transpa);
    ellipse(location.x,location.y,28,28);
    if (desaparece)
    {
    transpa= transpa - 8;
      if (transpa <= 0)
      {
        transpa=0;
        desaparece=false;
      }
    }
    if (aparece)
    {
    transpa= transpa + 8;
      if (transpa >= 255)
      {
        transpa=255;
        aparece=false;
      }
    }
  }
  
  void controlaTrasp()
  {
    if (bolaVerdade==false && aparece==false)
    {
        desaparece=true;
        controlThing=true;
    }
    if (bolaVerdade && desaparece==false && controlThing)
    {
        aparece=true;
        location.x=width/2;
        location.y=height/2;
        mouse.x=width/2;
        mouse.y=height/2;
        controlThing=false;
    }
  }
  
}
