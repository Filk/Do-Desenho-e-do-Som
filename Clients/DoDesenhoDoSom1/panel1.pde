//global variables receiving values from OSC messages
int speedCues=0;
int areaCues=0;

class Cues
{
  int nMaxcues=1;
  int sizeS=30;
  int posY, posX, roda;
  int minAlt=areaCues;
  PVector [] location = new PVector[nMaxcues];
  float [] velocity = new float [nMaxcues];
  
  Cues(int posX_, int posY_)
  {
    posX= posX_;
    posY= posY_;
    
    for (int i=0; i<nMaxcues; i++)
    {
      location[i] = new PVector(posX*0.5,posY*0.5);
      velocity[i] = 12.5;
      roda=1;
    }
  }
  
  void desenhaCues()
  {
    fill(255,100);
    rect(0,0,width,height);
    stroke(0);
    line (0,height*0.5, width, height*0.5);
    
    for (int i=0 ; i<nMaxcues; i++)
    {
      velocity[i] = speedCues*roda;
      location[i].y = location[i].y + velocity[i];
      
      if (location[i].y > (height-areaCues)-sizeS) 
      {   
          location[i].y=(height-areaCues)-sizeS;
          roda= roda*-1;
          velocity[i] = velocity[i]* roda;
      }
      if (location[i].y < areaCues)
      {
          location[i].y= areaCues;
          roda= roda*-1;
          velocity[i] = velocity[i]* roda;
      }     
      fill(0);
      stroke(200);
      pushMatrix();
      translate(location[i].x,location[i].y);
      rect (0,0,sizeS, 30);
      noStroke();
      popMatrix();
    }
    
    //rectangle defining area 
    noStroke();
    fill(127);
    rect(0,0,width,areaCues);
    fill(127);
    rect(0,height-areaCues, width, areaCues);
  }
  
}
