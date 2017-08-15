int maisNotaP4;
boolean meteMaisNotaP4;
int menosNotaP4;
boolean meteMenosNotaP4=false;
boolean clean=true;

class Panel4
{
  float cresce=0;
  float bb,bbb;
  int teste=500/2;
  int notaNova=50;
  float transp=0;
  boolean safe=true;
  
  void display()
  {
    maisNotas();
    menosNotas();
    botaTransp();
    int m = millis();
//    if (m%3>1)
//    {
    cresce=cresce+0.8;
//    }
    strokeWeight(1);
    stroke(0,0,0,0);
    fill(5,5,5,transp);
    ellipse(cresce, (teste+(noise(cresce)*random(-bbb,bbb)))+notaNova,18,18);
    
    if (cresce>width)
    {
      teste=(int) random(height/4,height/1.4);
      cresce=-30;
      transp=0;
      notaNova=(int) random(-50,50);
      bbb=0;
    }
    
    
    if (m%150>140)
    {
      bb=(int) random (0, 4);
      if (bb==0)
      {
        bbb=1;
      }
      if(bb==1)
      {
        bbb=10;
      }
      if (bb==2)
      {
        bbb=40;
      }
      if(bb==3)
      {
        bbb=70;
      }
    }
  }
    
  
  void botaTransp()
  {
    int n =millis();
    
    if (n%10==0 && cresce<width/2)
      {
        transp=transp+3;
        
        if (transp>255)
        {
          transp=255;
        }
      }
      
    if (cresce>width-200)
    {
        transp=transp-1;
        
        if (transp<0)
        {
          transp=0;
        }
    }
  }
  
  void maisNotas()
  {
    // adds more notes
    if (meteMaisNotaP4)
    {
      Panel4 b = new Panel4 ();
      panel4 = (Panel4[]) append (panel4, b);
    }
    meteMaisNotaP4=false;
  }
  
    void menosNotas()
  {
    // takes notes
    if (meteMenosNotaP4 && safe)
    {
      panel4 = (Panel4[]) shorten (panel4);
      
      if (panel4.length==1)
      {
        safe=false;
      }
      else
      {
        safe=true;
      }
      meteMenosNotaP4=false;
    }
   
  }
}
