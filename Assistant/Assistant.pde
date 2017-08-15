/**
 * by andreas schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 */

import controlP5.*;
import oscP5.*;
import netP5.*;

//number and array of modules
int nModules=4;

//network stuff
NetAddressList [] myRemoteLocation = new NetAddressList [nModules];
OscP5 oscp5;
int portEnvio=8100;
int portRecebo=8000;


//font used
PFont fonte;

// active panel for each module
OscMessage [] Panel = new OscMessage [nModules];

//initialize dropList
ControlP5 cp5;

//array of dropLists modules
DropdownList [] menus = new DropdownList [nModules];
//droplist Allmodules
DropdownList menusAll;

// present panel for each module
int [] presentPanel= new int [nModules];
// present panel of Allmodule
int presentPanelAll;

//id module and if there was event
int actPanelRealTime=-1;

//names of existing panels
String [] paineis= { "Pong", "Balls", "Cells", "Shake", "Drawing", "Solo", "Silence", "END"};

//array with images screenshots
PImage [] ss = new PImage [paineis.length];
//image credits
PImage fundo;

//array of screenshot of modules to be displayed in real-time
screenShot [] scrsh = new screenShot[paineis.length];
// initialize screenshot of Allmodule
screenShot scrshAll= new screenShot();

// host IP
IP oscStuff;

// string of clients IP
String [] Ips = new String [nModules];



void setup() 
{
  size(1024,768);

  // create a DropdownList
  cp5 = new ControlP5(this);
  // receives osc in that address
  oscp5 = new OscP5(this,portRecebo);

    
  //initializes modules
  for (int i=0; i<nModules; i++)
  {
    // sends osc to that address
    myRemoteLocation [i] = new NetAddressList();
  
    menus[i] = cp5.addDropdownList("Panels" + i).setPosition(250*i+25, 285).setId(i);
               customize(menus[i]); // customize the first list
               menus[i].setValue(7); //sets the first image to initialize
    
    //OSC info of host computer           
    oscStuff= new IP (oscp5.ip(), portRecebo);
    //OSC info for client computers
    Ips[i] = new String ("undefined");
    // to get IP real-time
    jaRecebiIp[i] = true;
    //OSC about module and panel chosen to host computers
    Panel[i] = new OscMessage("/panel" + i);
    
    //panel 1 of each module
    cueing[i]= new Cues(i);
    
    //panel 2 of each module
    notes[i]= new panel2(i);
     //numberbox
     totalM[i]=0;
     
    //panel 3 of each module
    grow[i]= new panel3(i);
     //numberbox
     totalG[i]=0;
     
    //panel 4 of each module
    panel4[i] = new Panel4(i);
    //number of notes per module, initalized with 1
    totalNP4[i] = 1;
  
    //panel 5 of each module
    panel5[i] = new Panel5(i);
    // init x of ellipse, init y of ellipse, start Rect X, start Rect Y, size x of Rectangle, size y of Rectanle
    mover[i] = new Mover(25+(250*i)+ 100, height*0.78+60, 25+(250*i),  height*0.78, 200, 100);  
  }
     
  //initializes moduleAll
    menusAll = cp5.addDropdownList("PanelsAll").setPosition(25, 40).setId(4);
               customize(menusAll); // customize the first list
               menusAll.setValue(7); //sets the first image to initialize
               
   //Panel All -Cueing
    //slider to control speed
      s1All = cp5.addSlider("speedAll")
      .setLabel("speed")
     .setRange(0,50)
     .setValue(10)
     .setSize(100,20)
     .hide();
     ;
     
    //slider to control area
      s2All = cp5.addSlider("areaAll")
      .setLabel("area")
      .setRange(0,height/2-50)
      .setValue(0)
      .setSize(100,20)
      .hide();
      ;

    //Panel All -panel 2      
      botoes1All=cp5.addBang("PlusAll")
     .setSize(30, 30)
     .setLabel("Plus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ;
      
      botoes2All=cp5.addBang("MinusAll")
     .setSize(30, 30)
     .setLabel("Minus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ;

     tgAll=cp5.addToggle("toggleAll")
       .setSize(30,30)
       .setLabel("Tail")
       .setValue(false)
       .hide();
       ;

     nbAll=cp5.addNumberbox("numberboxValueAll")
       .setSize(50,30)
       .setRange((int)1, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;       
 
 
     //Panel All -panel 3      
      botoes1GrowAll=cp5.addBang("PlusGrowAll")
     .setSize(30, 30)
     .setLabel("Plus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ;
      
      botoes2GrowAll=cp5.addBang("MinusGrowAll")
     .setSize(30, 30)
     .setLabel("Minus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ;

     tgGrowAll=cp5.addToggle("toggleGrowAll")
       .setSize(30,30)
       .setLabel("Pulsing")
       .setValue(false)
       .hide();
       ;

     nbGrowAll=cp5.addNumberbox("numberboxValueGrowAll")
       .setSize(50,30)
       .setRange((int)1, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;
      
    //Panel All -panel 4      
      botoes1P4All=cp5.addBang("PlusShakeAll")
     .setSize(30, 30)
     .setLabel("Plus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ;
      
      botoes2P4All=cp5.addBang("MinusShakeAll")
     .setSize(30, 30)
     .setLabel("Minus")
     .setTriggerEvent(Bang.RELEASE)
     .hide();
      ; 
      
      nbP4All=cp5.addNumberbox("numberboxValueP4All")
      .setSize(50,30)
      .setRange((int)1, (int)50)
      .setDecimalPrecision(0)
      .setLabel("Total Events")
      .setMultiplier((int) 1) // set the sensitifity of the numberbox
      .setValue((int)1)
      .setLock(true)
      .hide();
      ;
      
    //Panel All 5
       tgP5All=cp5.addToggle("toggleP5All")
       .setSize(30,30)
       .setLabel("withNoNote")
       .setValue(false)
       .hide();
       ;
     // init x of ellipse, init y of ellipse, start Rect X, start Rect Y, size x of Rectangle, size y of Rectanle  
     mover[4] = new Mover(340+((200*1.5)*0.5), height*0.05+((120*1.5)*0.5), 340,  height*0.05, 340+200*1.5, height*0.05+120*1.5);   
          
  //load of images to be used in screenshots              
  for (int j=0; j< ss.length; j++)
  {
    ss[j]=loadImage(j + ".png");
  }
  
  //initializes screenshots objects
  for (int k=0; k<paineis.length; k++)
  {
    scrsh[k] = new screenShot();
  }
  
  //creates text font
  fonte= loadFont ("STXihei-12.vlw");
  
  //background image
  fundo= loadImage ("fundo.png");
  
}



void draw() 
{
  background(33);
  
  textoInfo();
  
  //displaying IP's
  oscStuff.displayIPAll();
  oscStuff.displayIPs();
  
  //send OSC stuff
  mandarPanel();
  
  //screeshots
  screenSH();
  
  //escolhas
  escolha();
}

//displays screenshots of each module
void screenSH()
{
  scrshAll.meteImagem(ss[presentPanelAll], 25,40);
  
  for (int i=0; i<nModules; i++)
  {
  //image for each panel, xpos, ypos  
  scrsh[i].meteImagem(ss[presentPanel[i]],250*i+25,285);
  }
}

//retrives module and send the panel to host computers
void mandarPanel()
{
  for (int i=0 ; i<nModules; i++)
  {
      if (!accaoAll)
      {
      //selects individual modules and checks panel and send to specific host
      int paneil = (int) menus[i].getValue();
      Panel[i].add(paneil);
      oscp5.send(Panel[i], myRemoteLocation[i]);
      Panel[i].clearArguments();
      } 
      
      if (accaoAll)
      {
      //changes all modules to specific panel
      int paneilAll = (int) menusAll.getValue();
      Panel[i].add(paneilAll);
      oscp5.send(Panel[i], myRemoteLocation[i]);
      Panel[i].clearArguments();
      }
  }
}

//  /credits
void textoInfo()
{
  image (fundo,0,height-10,width,10);
}
