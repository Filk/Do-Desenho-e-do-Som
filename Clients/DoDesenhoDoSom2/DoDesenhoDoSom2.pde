import oscP5.*;
import netP5.*;

//network stuff
NetAddress myRemoteLocation;
OscP5 oscp5;
int portEnvio=8000;
int portRecebe=8100;

//my IP
OscMessage myIP;

//id of the module
// CHANGE FOR EACH COMPUTER (0-3);
int idModule=1;

//initial panel
int panelChosen=-1;

//first panel
Cues cues;

//second panel
Panel2 [] p2 = new Panel2 [1];

//third panel
Panel3 [] panel3 = new Panel3[1];
int ateX, ateXX;

//fourth panel
Panel4 [] panel4 = new Panel4[1];
float crescePauta=0;

//fifth panel
Panel5 [] panel5 = new Panel5[1];


boolean jaComecou=false;


void setup()
{
  size (1024, 768);
  frameRate(60);
  smooth();
  noCursor();
  
  selectInput("Select a file to process:", "fileSelected");
  
  //first panel
  cues = new Cues(width, height);
  //second panel
  p2[0] = new Panel2();
  //third panel
  panel3[0]= new Panel3();
  ateX = (width/2)-100;
  ateXX = (width/2)+100;
    //fourth panel
  panel4[0]= new Panel4();
  //fifth panel
  panel5[0] = new Panel5();
  mover = new Mover();
  
  // receives osc in that address
  oscp5 = new OscP5(this,portRecebe);

  
  background(255);
}

void draw()
{
  //sends current IP address to host (maestro)
  assignIP();
  
  //chose and execute panel
  escolha();
}

void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else 
  {
    println("User selected " + selection.getAbsolutePath());
  // sends osc to that address
  String[] dataIpMaestro = loadStrings(selection);
  StringBuilder strBuilder = new StringBuilder();
  for (int i = 0; i < dataIpMaestro.length; i++) 
  {
   strBuilder.append(dataIpMaestro[i]);
  }
  String ipMaestro = strBuilder.toString();
  println(ipMaestro);
  myRemoteLocation = new NetAddress(ipMaestro, portEnvio);
  
  // Ip address this computer
  myIP = new OscMessage("/ipAddress" + idModule );
  myIP.add(oscp5.ip());
    /* send the message */
  oscp5.send(myIP, myRemoteLocation);
  //clears the message
  myIP.clearArguments();
  //println(myMessage.get(0)); 
  }
}

//retrives and send IP address to host computer
void assignIP() 
{  
//  myIP.add(oscp5.ip()); 

//  /* send the message */
//  oscp5.send(myIP, myRemoteLocation);
//  //clears the message
//  myIP.clearArguments();
//  //println(myMessage.get(0)); 
}

// see which panel is on for this specific client
void escolha()
{
  if (panelChosen!=4)
  {
    clean=true;
  }
    
  switch(panelChosen)
  {    
    case 0:
      cues.desenhaCues();
      break;
      
    case 1:
      background(255);
      for (int i=0; i<p2.length; i++)
      {
        p2[i].update();
        p2[i].checkEdges();
        p2[i].display();
        p2[i].aumentar();
      }
      //line to play
        stroke(0);
        line(0,height/2-50,width, height/2-50);
        line(0,height/2,width, height/2);
        line(0,height/2+50,width, height/2+50);
        noStroke();
        fill(170,220);
        rect(0,0,width*0.1,height);
      break;
    
    case 2:
      background(0);
      strokeWeight(1);
      stroke(255);
      line (ateX, height*1/2, ateXX, height*1/2);
      line (ateX, height*1/2-20, ateXX, height*1/2-20);
      line (ateX, height*1/2+20, ateXX, height*1/2+20);
      line (ateX, height*1/2-40, ateXX, height*1/2-40);
      line (ateX, height*1/2+40, ateXX, height*1/2+40);
      for (int i=0; i<panel3.length; i++)
      {
      panel3[i].display();
      }
      break;
    
    case 3:
      fill(255,10);
      rectMode(CENTER);
      rect(width/2,height/2,width+20,height+20);
      //score elements
      stroke(50,20);
      crescePauta=crescePauta+0.8;
      strokeWeight(map(crescePauta, 0, width, 1, 21));
      if (crescePauta>width)
      {
        crescePauta=0;
      }
      line (0, height/2, width, height/2);
      line (0, height/2-20, width, height/2-20);
      line (0, height/2+20, width, height/2+20);
      line (0, height/2-40, width, height/2-40);
      line (0, height/2+40, width, height/2+40);
      //end of score elements
      for (int i=0; i<panel4.length; i++)
      {
      panel4[i].display();
      }
      rectMode(CORNER);
      break;
    
    case 4:
      if (clean)
      {
        background(255);
      }
      fill(255,4);
      rect(-20,-20, width+20, height+20);
      fill(0);
      panel5[0].display();
      clean=false;
      break;
    
    //solo panel
    case 5:
       background(0);
      strokeWeight((int)random(2));
      stroke(((int)random(155))+100);
      line (0,height/2,135,height/2);
      stroke(((int)random(155))+100);
      line (135,height/2,270,height/2);
      stroke(((int)random(155))+100);
      line (270,height/2,405,height/2);
      stroke(((int)random(155))+100);
      line (405,height/2,530,height/2);
      stroke(((int)random(155))+100);
      line (530,height/2,730,height/2);
     stroke(((int)random(155))+100);
      line (730,height/2,850,height/2);
      stroke(((int)random(155))+100);
      line (850,height/2,970,height/2);
       stroke(((int)random(155))+100);
      line (970,height/2,1080,height/2);
      int flash= (int) random(100);
      if (flash==1)
      {
        background(255);
      }
      break;
    
    //silence panel
    case 6:
        background(0);
        strokeWeight(4);
        stroke(255);
        line (width/2-100, height/2-30,width/2+100, height/2-30);
        fill(255);
        rect (width/2-60, height/2-30, 120, 30);
        break;
        
     case 7:
        if (jaComecou)
        {
          fill(0,4);
          rect(-20,-20, width+40, height+40);
          if (millis()%6000>=5500)
          {
          background(0);
          }
        }
        break;
        
  }
}

//incoming OSC
void oscEvent(OscMessage theOscMessage) 
{ 
    //checks which client this sketch is
    if (theOscMessage.checkAddrPattern("/panel" + idModule)==true)
    {
      panelChosen = theOscMessage.get(0).intValue();
    
    if (panelChosen!=7)
    {
    jaComecou=true;
    }
      //println(panelChosen);
    }
    
    //OSC messages panel 1
    if (theOscMessage.checkAddrPattern("/speedCueing" + idModule)==true)
    {
      speedCues = theOscMessage.get(0).intValue();
    }
    //OSC messages panel 1
    if (theOscMessage.checkAddrPattern("/areaCueing" + idModule)==true)
    {
    areaCues = theOscMessage.get(0).intValue();
    }
    
    
     //OSC messages panel 2
    if (theOscMessage.checkAddrPattern("/nNotas" + idModule)==true)
    {
     nNotasP2 = theOscMessage.get(0).intValue();
       if (nNotasP2==1)
       {
         meteP2=true;
       }
       if (nNotasP2==-1)
       {
         tiraP2=true;
         println("boi");
       }
    }
    //OSC messages panel 2
    if (theOscMessage.checkAddrPattern("/rasto" + idModule)==true)
    {
     rastoP2 = theOscMessage.get(0).intValue();
    }
    
    
    //OSC messages panel 3
    if (theOscMessage.checkAddrPattern("/nNotasGrow" + idModule)==true)
    {
     nNotasGrowP3 = theOscMessage.get(0).intValue();
     //println(nNotasGrowP3);
       if (nNotasGrowP3==1)
       {
         meteP3=true;
       }
       if (nNotasGrowP3==-1)
       {
         tiraP3=true;
       }
    }
    //OSC messages panel 3
    if (theOscMessage.checkAddrPattern("/Grow" + idModule)==true)
    {
     GrowP3 = theOscMessage.get(0).intValue();
    }
    
    
        //OSC messages panel 4
    if (theOscMessage.checkAddrPattern("/maisNota" + idModule)==true)
    {
      maisNotaP4 = theOscMessage.get(0).intValue();
      if (maisNotaP4==1)
       {
         //println("mais");
         meteMaisNotaP4=true;
       }

    }
    //OSC messages panel 4
    if (theOscMessage.checkAddrPattern("/menosNota" + idModule)==true)
    {
       menosNotaP4 = theOscMessage.get(0).intValue();

       if (menosNotaP4==1)
       {
         //println("menos");
         meteMenosNotaP4=true;
       }
    }
    
    //OSC messages panel 5
    if (theOscMessage.checkAddrPattern("/tgStatus" + idModule)==true)
    {
       toggleP5 = theOscMessage.get(0).intValue();
       //println(toggleP5);

       if (toggleP5==1)
       {
         bolaVerdade=true;
       }
       if (toggleP5==0)
       {
         bolaVerdade=false;
       }
    }
    
    if (theOscMessage.checkAddrPattern("/coordRatoX" + idModule)==true)
    {
       coordX = theOscMessage.get(0).intValue();
       coordX = (int) map (coordX, 25+(250*idModule), 25+(250*idModule) + 200, 0, width);
       println(coordX);
    }
    if (theOscMessage.checkAddrPattern("/coordRatoY" + idModule)==true)
    {
       coordY = theOscMessage.get(0).intValue();
       coordY = (int) map (coordY, height*0.78, height*0.78+100, 0, height);
    }
}
