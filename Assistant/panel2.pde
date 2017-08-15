
panel2 [] notes = new panel2 [nModules];

//bangs created for individual modules
Bang [] botoes = new Bang [2*menus.length];
//toogles created for individual modules
Toggle [] tg = new Toggle [nModules];
//bangs created for module all
Numberbox [] nb = new Numberbox [nModules];

Bang botoes1All, botoes2All;
//toogle created for module all
Toggle tgAll;
//numberbox for all
Numberbox nbAll;

//variables to be sent
int [] nNotasPresent = new int [nModules];
int [] rastoPresent = new int [nModules];
int [] criarObjectoCliente= new int[nModules];

//variables because I don't understand why a bang works like it does!!!
boolean [] maisPainel2= new boolean [nModules];
boolean [] menosPainel2=new boolean [nModules];

//checks for each module total number of notes
int [] totalM= new int [nModules];

class panel2
{
  //declaration of name of OSC messages
  OscMessage [] nNotas = new OscMessage [nModules];
  OscMessage [] rasto = new OscMessage [nModules];
  int moduloo;
  
  panel2(int modulo)
  {
     //creating osc messages 
     for (int i=0; i<nModules ; i++)
    {
     //OSC messages created   
     nNotas[i] = new OscMessage ("/nNotas" + i);
     rasto[i] =  new OscMessage ("/rasto" + i);
     // int to be sent (default values, same as slider)
     nNotasPresent[i] = 1;
     rastoPresent[i] = 0;
     //numberbox
     totalM[i]=1;
        
     //boolean to check number of notes present
     maisPainel2[i]=false;
     menosPainel2[i]=false;  
    }
    moduloo=modulo;
    
     //creating and initializing button speed for module 1
     if (menus[modulo]==menus[0])
     {
       //button to control speed
      botoes[0]=cp5.addBang("Plus"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoes[1]=cp5.addBang("Minus"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tg[0]=cp5.addToggle("toggle"+modulo)
       .setSize(30,30)
       .setLabel("Tail")
       .setValue(false)
       .hide();
       ;
     nb[0]=cp5.addNumberbox("numberboxValue" + modulo)
       .setSize(50,30)
       .setRange((int)0, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;
     }
     
     //creating and initializing button speed for module 2
     if (menus[modulo]==menus[1])
     {
       //button to control speed
      botoes[2]=cp5.addBang("Plus"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoes[3]=cp5.addBang("Minus"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tg[1]=cp5.addToggle("toggle"+modulo)
       .setSize(30,30)
       .setLabel("Tail")
       .setValue(false)
       .hide();
       ;    
     nb[1]=cp5.addNumberbox("numberboxValue" + modulo)
       .setSize(50,30)
       .setRange((int)1, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;    
     }
     
     //creating and initializing button speed for module 3
     if (menus[modulo]==menus[2])
     {
       //button to control speed
      botoes[4]=cp5.addBang("Plus"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoes[5]=cp5.addBang("Minus"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tg[2]=cp5.addToggle("toggle"+modulo)
       .setSize(30,30)
       .setLabel("Tail")
       .setValue(false)
       .hide();
       ;    
     nb[2]=cp5.addNumberbox("numberboxValue" + modulo)
       .setSize(50,30)
       .setRange((int)1, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;    
     }
     
     //creating and initializing button speed for module 4
     if (menus[modulo]==menus[3])
     {
       //button to control speed
      botoes[6]=cp5.addBang("Plus"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoes[7]=cp5.addBang("Minus"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tg[3]=cp5.addToggle("toggle"+modulo)
       .setSize(30,30)
       .setLabel("Tail")
       .setValue(false)
       .hide();
       ;    
     nb[3]=cp5.addNumberbox("numberboxValue" + modulo)
       .setSize(50,30)
       .setRange((int)1, (int)50)
       .setDecimalPrecision(0)
       .setLabel("Total Events")
       .setMultiplier((int) 1) // set the sensitifity of the numberbox
       .setValue((int)1)
       .setLock(true)
       .hide();
       ;    
     }
  }
      
    void desenha(int pi)
    {
      fazCalculo();
      
      //module 1
      if (menus[pi]==menus[0])
      {
      botoes[0].show();
      botoes[0].setPosition(25+250*pi,height*0.7);
      botoes[1].show();
      botoes[1].setPosition(100+250*pi,height*0.7);
      nb[0].show();
      nb[0].setPosition(170+250*pi,height*0.7);   
      nb[0].setValue((int)totalM[pi]);
      tg[0].show();
      tg[0].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasPresent[pi]=(int) totalM[pi];
      if (tg[pi].getState())
      {
        rastoPresent[pi]= 1;
      }
      else
      {
        rastoPresent[pi]= 0;
      }
      //osc Messages
      nNotas[pi].add(criarObjectoCliente[pi]);
      rasto[pi].add(rastoPresent[pi]);
      oscp5.send(nNotas[pi], myRemoteLocation[pi]);
      oscp5.send(rasto[pi], myRemoteLocation[pi]);
      nNotas[pi].clearArguments();
      rasto[pi].clearArguments();
      criarObjectoCliente[pi]=0;
      }
      
      //module 2
      if (menus[pi]==menus[1])
      {
      botoes[2].show();
      botoes[2].setPosition(25+250*pi,height*0.7);
      botoes[3].show();
      botoes[3].setPosition(100+250*pi,height*0.7);
      nb[1].show();
      nb[1].setPosition(170+250*pi,height*0.7);
      nb[1].setValue((int)totalM[pi]);
      tg[1].show();
      tg[1].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasPresent[pi]=(int) totalM[pi];
      if (tg[pi].getState())
      {
        rastoPresent[pi]= 1;
      }
      else
      {
        rastoPresent[pi]= 0;
      }
      //osc Messages
      nNotas[pi].add(criarObjectoCliente[pi]);
      rasto[pi].add(rastoPresent[pi]);
      oscp5.send(nNotas[pi], myRemoteLocation[pi]);
      oscp5.send(rasto[pi], myRemoteLocation[pi]);
      nNotas[pi].clearArguments();
      rasto[pi].clearArguments();
      criarObjectoCliente[pi]=0;
      }
      
      //module 3
      if (menus[pi]==menus[2])
      {
      botoes[4].show();
      botoes[4].setPosition(25+250*pi,height*0.7);
      botoes[5].show();
      botoes[5].setPosition(100+250*pi,height*0.7);
      nb[2].show();
      nb[2].setPosition(170+250*pi,height*0.7);   
      nb[2].setValue((int)totalM[pi]);
      tg[2].show();
      tg[2].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasPresent[pi]=(int) totalM[pi];
      if (tg[pi].getState())
      {
        rastoPresent[pi]= 1;
      }
      else
      {
        rastoPresent[pi]= 0;
      }
      //osc Messages
      nNotas[pi].add(criarObjectoCliente[pi]);
      rasto[pi].add(rastoPresent[pi]);
      oscp5.send(nNotas[pi], myRemoteLocation[pi]);
      oscp5.send(rasto[pi], myRemoteLocation[pi]);
      nNotas[pi].clearArguments();
      rasto[pi].clearArguments();
      criarObjectoCliente[pi]=0;
      }
      
      //module 4
      if (menus[pi]==menus[3])
      {
      botoes[6].show();
      botoes[6].setPosition(25+250*pi,height*0.7);
      botoes[7].show();
      botoes[7].setPosition(100+250*pi,height*0.7);
      nb[3].show();
      nb[3].setPosition(170+250*pi,height*0.7);
      nb[3].setValue((int)totalM[pi]);
      tg[3].show();
      tg[3].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasPresent[pi]=(int) totalM[pi];
      if (tg[pi].getState())
      {
        rastoPresent[pi]= 1;
      }
      else
      {
        rastoPresent[pi]= 0;
      }
      //osc Messages
      nNotas[pi].add(criarObjectoCliente[pi]);
      rasto[pi].add(rastoPresent[pi]);
      oscp5.send(nNotas[pi], myRemoteLocation[pi]);
      oscp5.send(rasto[pi], myRemoteLocation[pi]);
      nNotas[pi].clearArguments();
      rasto[pi].clearArguments();
      criarObjectoCliente[pi]=0;
      }
    }
    
    void fazCalculo()
    {    
      for (int i=0; i<nModules; i++)
      {
        if (maisPainel2[i] && totalM[i]<50)
        {
          //variable to be displayed in host computer
          totalM[i]=totalM[i]+1;
          //variable to be sent;
          criarObjectoCliente[i]=1;
          maisPainel2[i]=false;
          menosPainel2[i]=false;
        }
        if (menosPainel2[i] && totalM[i]>1)
        {
          //variable to be displayed in host computer
          totalM[i]=totalM[i] - 1;
          //variable to be sent;
          criarObjectoCliente[i]=-1;
          menosPainel2[i]=false;
          maisPainel2[i]=false;
        }
        
        if (maisPainel2All && (int)menusAll.getValue() ==1)
        {
          //variable controlling all modules
          nbAllValue= nbAllValue+1;
          //variable to be sent;
          criarObjectoCliente[i]=1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalM[j]=nbAllValue;
          }
          maisPainel2All=false;
          menosPainel2All=false;    
        }
        if (menosPainel2All && (int)menusAll.getValue() ==1)
        {
          //variable controlling all modules
          nbAllValue=nbAllValue - 1;
          //variable to be sent;
          criarObjectoCliente[i]=-1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalM[j]=nbAllValue;
          }
          menosPainel2All=false;
          maisPainel2All=false;
        } 
        
        if (totalM[i]<1)
        {
          totalM[i]=1;
        }
      }
    }
}

void controloPainel2Hide()
{
    //hide controllers from module 2
    botoes[0].hide();
    botoes[1].hide();
    tg[0].hide();
    nb[0].hide();
    //hide controllers from module 2
    botoes[2].hide();
    botoes[3].hide();
    tg[1].hide();
    nb[1].hide();
    //hide controllers from module 3
    botoes[4].hide();
    botoes[5].hide();
    tg[2].hide();
    nb[2].hide();
    //hide controllers from module 4
    botoes[6].hide();
    botoes[7].hide();
    tg[3].hide();
    nb[3].hide();
    //hide controllers from module all
    botoes1All.hide();
    botoes2All.hide();
    tgAll.hide();
    nbAll.hide();
}

