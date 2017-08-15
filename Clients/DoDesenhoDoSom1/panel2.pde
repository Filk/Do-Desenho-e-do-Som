//global variables receiving values from OSC messages
int nNotasP2=0;
int rastoP2=0;

boolean meteP2, tiraP2; 
boolean safeP2=true;

class Panel2
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int tamanho=40;
  int[] xpos = new int[30];
  float [] decay = new float [3];
  int [] alt = new int [3];
  int b,c;
  boolean safe=true; 

  Panel2() 
  {
    this.location = new PVector(width+tamanho, height*0.5);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(-0.1,0);
    this.topspeed = 10;
    
    decay[0]=0.8; //longo
    decay[1]=0.04; //curto
    decay[2]=0.15; //médio
    
    alt[0]= 0;
    alt[1]=-50;
    alt[2]=50;
    
    for (int i=0; i<xpos.length; i++)
    {
      xpos[i]= 100+i*20;
    }
  }
  
  void update() 
  {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() 
  {
    if (rastoP2==1)
    {
      for (int i=0; i<xpos.length; i++)
      {
      xpos[i]=(int)location.x+ i*(int)(tamanho*decay[b]);
      fill(0+(i*4),255-i*10);
      rectMode(CENTER);
      noStroke();
      rect(xpos[i],height*0.5+ alt[c],tamanho, tamanho);
      rectMode(CORNER);
      }
    }
    
    fill(0);   
    rectMode(CENTER);
    noStroke();
    ellipse(location.x-tamanho*0.5,height*0.5+ alt[c],tamanho, tamanho);
    rectMode(CORNER);
  }

  void checkEdges() 
  {
    if (location.x<-700) 
    {
      location.x = width + tamanho;
      velocity.x=0;
      acceleration.x=-random(1,10)/100;
      tamanho= (int) random (10,40);
      b = (int) random(3);
      c = (int) random(3);
    }
  }

  void aumentar()
  {
    if  (meteP2)
    {
      Panel2 b = new Panel2 ();
      p2 = (Panel2[]) append (p2, b);
      meteP2=false;
    }
    
    if (tiraP2 && safeP2)
    {
      p2 = (Panel2[]) shorten (p2);
      
      if (p2.length<1)
      {
        safeP2=false;
      }
      else
      {
        safeP2=true;
      }
      
      tiraP2=false;
    }
  }

}
