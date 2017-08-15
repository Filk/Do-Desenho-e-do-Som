//global variables receiving values from OSC messages
int nNotasGrowP3=0;
int GrowP3=0;
boolean meteP3, tiraP3;

class Panel3
{
  float tamanho;
  int r=1;
  int [] pos = new int [2];
  float velCresc;
  boolean safe=true;
  int ateX = (width/2)-100;
  int ateXX = (width/2)+100;
  int aiai=0;
  
  Panel3()
  {
    pos[0]= (int) random(ateX,ateXX);
    pos[1]= (int) random(height*1/2-40,height*1/2+40);
    tamanho=5;
    velCresc= random(5)/10;
    GrowP3=1;
  }
  
  void display()
  {
    maisNotas();
    menosNotas();
    nota();
//    pauta();
  }
  
  void pauta()
  { 
   //draws the score 
//  strokeWeight(1);
//  stroke(255);
//  line (ateX, height*1/2, ateXX, height*1/2);
//  line (ateX, height*1/2-20, ateXX, height*1/2-20);
//  line (ateX, height*1/2+20, ateXX, height*1/2+20);
//  line (ateX, height*1/2-40, ateXX, height*1/2-40);
//  line (ateX, height*1/2+40, ateXX, height*1/2+40);
  }
  
  void nota()
  {
    ellipseMode(CENTER);
    strokeWeight(1);
    stroke(255);
    fill(255,200);
    ellipse (pos[0], pos[1], tamanho,tamanho);
    
    tamanho=tamanho+(velCresc*r);

    //controls the grow or not grow
    if (tamanho>70)
    {
      if (GrowP3==1)
      {
      r=-1;
      }
      
      if(GrowP3==0)
      {
      tamanho=1;
      }
    }
    
    else if(tamanho<5)
    {
      r=1;
    }
  }
  
  void maisNotas()
  {
    // adds more notes
    if (meteP3)
    {
      Panel3 b = new Panel3 ();
      panel3 = (Panel3[]) append (panel3, b);
    }
    meteP3=false;
  }
  
  void menosNotas()
  {
    // takes notes
    if (tiraP3 && safe)
    {
      panel3 = (Panel3[]) shorten (panel3);
      
      if (panel3.length==1)
      {
        safe=false;
      }
      else
      {
        safe=true;
      }
      tiraP3=false;
    }
   
  }
    
}
