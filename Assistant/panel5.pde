//new object of Panel5 messages
Panel5 [] panel5 = new Panel5[nModules];
// nModules + 1! The 1 is for the All module
Mover [] mover = new Mover [nModules + 1];

//toogles created for individual modules
Toggle [] tgP5 = new Toggle [nModules];

//toogle created for module all
Toggle tgP5All;

//value sent
int [] tgP5Status = new int [nModules];
int [] locRatoX = new int [nModules];
int [] locRatoY = new int [nModules];

//internal managment
boolean [] tgP5OnOff = new boolean [nModules];

class Panel5
{
    //declaration of name of OSC messages
  OscMessage [] tgStatus = new OscMessage [nModules];
  OscMessage [] coordRatoX = new OscMessage [nModules];
  OscMessage [] coordRatoY = new OscMessage [nModules];
  int moduloo;
 
  Panel5(int modulo)
  {
     
     for (int i=0; i<nModules; i++)
    {
      //OSC messages created
      tgStatus[i] = new OscMessage ("/tgStatus" + i);
      coordRatoX[i] = new OscMessage ("/coordRatoX" + i);
      coordRatoY[i] = new OscMessage ("/coordRatoY" + i);
      tgP5Status[i]=1;
      locRatoX[i] = 0;
      locRatoY[i] = 0; 
    }
    
    moduloo = modulo;
    
    if (menus[modulo]==menus[0])
    {
        tgP5[0]=cp5.addToggle("toggleP5"+modulo)
       .setSize(30,30)
       .setLabel("withNoNote")
       .setValue(false)
       .hide();
       ;
    }
   if (menus[modulo]==menus[1])
    {
        tgP5[1]=cp5.addToggle("toggleP5"+modulo)
       .setSize(30,30)
       .setLabel("withNoNote")
       .setValue(false)
       .hide();
       ;
    }
        if (menus[modulo]==menus[2])
    {
        tgP5[2]=cp5.addToggle("toggleP5"+modulo)
       .setSize(30,30)
       .setLabel("withNoNote")
       .setValue(false)
       .hide();
       ;
    }
        if (menus[modulo]==menus[3])
    {
        tgP5[3]=cp5.addToggle("toggleP5"+modulo)
       .setSize(30,30)
       .setLabel("withNoNote")
       .setValue(false)
       .hide();
       ;
    }
  }
  
  
  void display(int pi)
  {
    fazCalculo();
    
      //module 1
      if (menus[pi]==menus[0])
      {
        tgP5[0].show();
        tgP5[0].setPosition(25+250*pi,height*0.7);
        tgP5OnOff[0] = tgP5[0].getState();
        if (tgP5OnOff[0])
        {
          tgP5Status[0]=1;
          locRatoX[0] = (int) mover[0].location.x;
          locRatoY[0] = (int) mover[0].location.y;
        }
        if (tgP5OnOff[0]==false)
        {
          tgP5Status[0]=0;
        }
        //osc messages
        tgStatus[pi].add(tgP5Status[pi]);
        coordRatoX[pi].add(locRatoX[pi]);
        coordRatoY[pi].add(locRatoY[pi]);
        oscp5.send(tgStatus[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoX[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoY[pi], myRemoteLocation[pi]);
        tgStatus[pi].clearArguments();
        coordRatoX[pi].clearArguments();
        coordRatoY[pi].clearArguments();
     }
      
            //module 2
      if (menus[pi]==menus[1])
      {
        tgP5[1].show();
        tgP5[1].setPosition(25+250*pi,height*0.7);
        tgP5OnOff[1] = tgP5[1].getState();
        if (tgP5OnOff[1])
        {
          tgP5Status[1]=1;
          locRatoX[1] = (int) mover[1].location.x;
          locRatoY[1] = (int) mover[1].location.y;
        }
        if (tgP5OnOff[1]==false)
        {
          tgP5Status[1]=0;
        }
        //osc messages
        tgStatus[pi].add(tgP5Status[pi]);
        coordRatoX[pi].add(locRatoX[pi]);
        coordRatoY[pi].add(locRatoY[pi]);
        oscp5.send(tgStatus[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoX[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoY[pi], myRemoteLocation[pi]);
        tgStatus[pi].clearArguments();
        coordRatoX[pi].clearArguments();
        coordRatoY[pi].clearArguments();
      }
      
            //module 3
      if (menus[pi]==menus[2])
      {
        tgP5[2].show();
        tgP5[2].setPosition(25+250*pi,height*0.7);
        tgP5OnOff[2] = tgP5[2].getState();
        if (tgP5OnOff[2])
        {
          tgP5Status[2]=1;
          locRatoX[2] = (int) mover[2].location.x;
          locRatoY[2] = (int) mover[2].location.y;
        }
        if (tgP5OnOff[2]==false)
        {
          tgP5Status[2]=0;
        }
        //osc messages
        tgStatus[pi].add(tgP5Status[pi]);
        coordRatoX[pi].add(locRatoX[pi]);
        coordRatoY[pi].add(locRatoY[pi]);
        oscp5.send(tgStatus[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoX[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoY[pi], myRemoteLocation[pi]);
        tgStatus[pi].clearArguments();
        coordRatoX[pi].clearArguments();
        coordRatoY[pi].clearArguments();
      }
      
            //module 4
      if (menus[pi]==menus[3])
      {
        tgP5[3].show();
        tgP5[3].setPosition(25+250*pi,height*0.7);
        tgP5OnOff[3] = tgP5[3].getState();
        if (tgP5OnOff[3])
        {
          tgP5Status[3]=1;
          locRatoX[3] = (int) mover[3].location.x;
          locRatoY[3] = (int) mover[3].location.y;
        }
        if (tgP5OnOff[3]==false)
        {
          tgP5Status[3]=0;
        }
        //osc messages
        tgStatus[pi].add(tgP5Status[pi]);
        coordRatoX[pi].add(locRatoX[pi]);
        coordRatoY[pi].add(locRatoY[pi]);
        oscp5.send(tgStatus[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoX[pi], myRemoteLocation[pi]);
        oscp5.send(coordRatoY[pi], myRemoteLocation[pi]);
        tgStatus[pi].clearArguments();
        coordRatoX[pi].clearArguments();
        coordRatoY[pi].clearArguments();
      }
  }
  
    void fazCalculo()
    { 
      for (int i=0; i<nModules; i++)
      {
         //checks wheteher toggle of module all was pressed and update the modules toggles 
        if (tgP5All.getState() && (int)menusAll.getValue() ==4 && tgP5All.isMousePressed())
        {
          tgP5[i].setState(true);
        }
        if (tgP5All.getState()==false && (int)menusAll.getValue() ==4 && tgP5All.isMousePressed())
        {
          tgP5[i].setState(false);
        }
      }
    }
}

void controloPainel5Hide()
{
    //hide controllers from module 1
    tgP5[0].hide();
    //hide controllers from module 1
    tgP5[1].hide();
    //hide controllers from module 1
    tgP5[2].hide();
    //hide controllers from module 1
    tgP5[3].hide();    
    //hide controllers from All
    tgP5All.hide();
}

class Mover {

  // The Mover tracks location, velocity, and acceleration 
  public PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  // The Mover's maximum speed
  float topspeed;
  int transpa;
  boolean desaparece, aparece;
  float distance;
  // ints to define places of each modules ellipse
  float x, y;
  float initX, initY;
  //ints to define location of rectangle of each module
  float rectX, rectY, extXX, extYY;

  // init x of ellipse, init y of ellipse, start Rect X, start Rect Y, size x of Rectangle, size y of Rectanle
  Mover(float tempX, float tempY, float tempRectX, float tempRectY, float tempExtXX, float tempExtYY) 
  {
    initX=tempX;
    initY = tempY;
    // Start in the center
    location = new PVector(tempX,tempY);
    velocity = new PVector(0,0);
    mouse = new PVector(tempX,tempY);
    topspeed = 1;
    transpa=255;
    rectX = tempRectX;
    rectY= tempRectY;
    extXX = tempExtXX;
    extYY = tempExtYY;
    transpa=0;
    desaparece=true;
  }

  void update() 
  {
    if (mousePressed && mouseX >= rectX && mouseX <= rectX+ extXX && mouseY >= rectY && mouseY <= rectY + extYY)
    {
      mouse.x=mouseX;
      mouse.y = mouseY;
    }
    
    distance = dist (mouse.x, mouse.y,location.x, location.y);
    //topspeed = map (distance, rectX, rectX+ extXX, 0, 5);
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
    fill(30,transpa);
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
  
  //takes care of modules appearing and re-appering
  void controlaTrasp(int mod)
  {
    
    if (tgP5OnOff[mod]==false && aparece==false && tgP5[mod].isMousePressed() || tgP5All.getState()==false && tgP5All.isMousePressed())
    {
        desaparece=true;
    }
    if (tgP5OnOff[mod] && desaparece==false && tgP5[mod].isMousePressed() || tgP5All.getState() && tgP5All.isMousePressed())
    {
        aparece=true;
        location.x=initX;
        location.y=initY;
        mouse.x=initX;
        mouse.y=initY;
    }
  }
  
  //appearing and disappering all module
  void controlaTraspAll()
  {
    if (tgP5All.getState()==false && tgP5All.isMousePressed())
    {
        desaparece=true;
    }
    if (tgP5All.getState() && tgP5All.isMousePressed())
    {
        aparece=true;
        location.x=initX;
        location.y=initY;
        mouse.x=initX;
        mouse.y=initY;
    }
  }
  
  boolean checkaSeRatoEAccaoAll(float Allx, float Ally, float AlltamanhoX, float AlltamanhoY)
  {
    if (mousePressed && mouseX >= Allx && mouseX <= Allx+AlltamanhoX && mouseY >= Ally && mouseY<=Ally + AlltamanhoY)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
    
}


