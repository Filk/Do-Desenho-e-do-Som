
panel3 [] grow = new panel3 [nModules];

//bangs created for individual modules
Bang [] botoesGrow = new Bang [2*menus.length];
//toogles created for individual modules
Toggle [] tgGrow = new Toggle [nModules];
//bangs created for module all
Numberbox [] nbGrow = new Numberbox [nModules];

Bang botoes1GrowAll, botoes2GrowAll;
//toogle created for module all
Toggle tgGrowAll;
//numberbox for all
Numberbox nbGrowAll;

//variables to be sent
int [] nNotasGrowPresent = new int [nModules];
int [] growPresent = new int [nModules];
int [] criarObjectoGrowCliente= new int[nModules];

//variables because I don't understand why a bang works like it does!!!
boolean [] maisPainel3= new boolean [nModules];
boolean [] menosPainel3=new boolean [nModules];

//checks for each module total number of notes
int [] totalG= new int [nModules];

class panel3
{
  //declaration of name of OSC messages
  OscMessage [] nNotasGrow = new OscMessage [nModules];
  OscMessage [] pulse = new OscMessage [nModules];
  int moduloo;
  
  panel3(int modulo)
  {
     //creating osc messages 
     for (int i=0; i<nModules ; i++)
    {
     //OSC messages created   
     nNotasGrow[i] = new OscMessage ("/nNotasGrow" + i);
     pulse[i] =  new OscMessage ("/Grow" + i);
     // int to be sent (default values, same as slider)
     nNotasGrowPresent[i] = 1;
     growPresent[i] = 0;
     //numberbox
     totalG[i]=1;
        
     //boolean to check number of notes present
     maisPainel3[i]=false;
     menosPainel3[i]=false;  
    }
    moduloo=modulo;
    
     //creating and initializing button speed for module 1
     if (menus[modulo]==menus[0])
     {
       //button to control speed
      botoesGrow[0]=cp5.addBang("PlusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesGrow[1]=cp5.addBang("MinusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tgGrow[0]=cp5.addToggle("toggleGrow"+modulo)
       .setSize(30,30)
       .setLabel("pulsing")
       .setValue(false)
       .hide();
       ;
     nbGrow[0]=cp5.addNumberbox("numberboxValueGrow" + modulo)
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
      botoesGrow[2]=cp5.addBang("PlusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesGrow[3]=cp5.addBang("MinusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tgGrow[1]=cp5.addToggle("toggleGrow"+modulo)
       .setSize(30,30)
       .setLabel("pulsing")
       .setValue(false)
       .hide();
       ;    
     nbGrow[1]=cp5.addNumberbox("numberboxValueGrow" + modulo)
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
      botoesGrow[4]=cp5.addBang("PlusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesGrow[5]=cp5.addBang("MinusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tgGrow[2]=cp5.addToggle("toggleGrow"+modulo)
       .setSize(30,30)
       .setLabel("pulsing")
       .setValue(false)
       .hide();
       ;    
     nbGrow[2]=cp5.addNumberbox("numberboxValueGrow" + modulo)
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
      botoesGrow[6]=cp5.addBang("PlusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesGrow[7]=cp5.addBang("MinusGrow"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     tgGrow[3]=cp5.addToggle("toggleGrow"+modulo)
       .setSize(30,30)
       .setLabel("pulsing")
       .setValue(false)
       .hide();
       ;    
     nbGrow[3]=cp5.addNumberbox("numberboxValueGrow" + modulo)
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
      botoesGrow[0].show();
      botoesGrow[0].setPosition(25+250*pi,height*0.7);
      botoesGrow[1].show();
      botoesGrow[1].setPosition(100+250*pi,height*0.7);
      nbGrow[0].show();
      nbGrow[0].setPosition(170+250*pi,height*0.7);   
      nbGrow[0].setValue((int)totalG[pi]);
      tgGrow[0].show();
      tgGrow[0].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasGrowPresent[pi]=(int) totalG[pi];
      if (tgGrow[pi].getState())
      {
        growPresent[pi]= 1;
      }
      else
      {
        growPresent[pi]= 0;
      }
      //osc Messages
      nNotasGrow[pi].add(criarObjectoGrowCliente[pi]);
      pulse[pi].add(growPresent[pi]);
      oscp5.send(nNotasGrow[pi], myRemoteLocation[pi]);
      oscp5.send(pulse[pi], myRemoteLocation[pi]);
      //println(criarObjectoGrowCliente[0]);
      nNotasGrow[pi].clearArguments();
      pulse[pi].clearArguments();
      criarObjectoGrowCliente[pi]=0;
      }
      
            //module 2
      if (menus[pi]==menus[1])
      {
      botoesGrow[2].show();
      botoesGrow[2].setPosition(25+250*pi,height*0.7);
      botoesGrow[3].show();
      botoesGrow[3].setPosition(100+250*pi,height*0.7);
      nbGrow[1].show();
      nbGrow[1].setPosition(170+250*pi,height*0.7);   
      nbGrow[1].setValue((int)totalG[pi]);
      tgGrow[1].show();
      tgGrow[1].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasGrowPresent[pi]=(int) totalG[pi];
      if (tgGrow[pi].getState())
      {
        growPresent[pi]= 1;
      }
      else
      {
        growPresent[pi]= 0;
      }
      //osc Messages
      nNotasGrow[pi].add(criarObjectoGrowCliente[pi]);
      pulse[pi].add(growPresent[pi]);
      oscp5.send(nNotasGrow[pi], myRemoteLocation[pi]);
      oscp5.send(pulse[pi], myRemoteLocation[pi]);
      nNotasGrow[pi].clearArguments();
      pulse[pi].clearArguments();
      criarObjectoGrowCliente[pi]=0;
      }

      //module 3
      if (menus[pi]==menus[2])
      {
      botoesGrow[4].show();
      botoesGrow[4].setPosition(25+250*pi,height*0.7);
      botoesGrow[5].show();
      botoesGrow[5].setPosition(100+250*pi,height*0.7);
      nbGrow[2].show();
      nbGrow[2].setPosition(170+250*pi,height*0.7);   
      nbGrow[2].setValue((int)totalG[pi]);
      tgGrow[2].show();
      tgGrow[2].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasGrowPresent[pi]=(int) totalG[pi];
      if (tgGrow[pi].getState())
      {
        growPresent[pi]= 1;
      }
      else
      {
        growPresent[pi]= 0;
      }
      //osc Messages
      nNotasGrow[pi].add(criarObjectoGrowCliente[pi]);
      pulse[pi].add(growPresent[pi]);
      oscp5.send(nNotasGrow[pi], myRemoteLocation[pi]);
      oscp5.send(pulse[pi], myRemoteLocation[pi]);
      nNotasGrow[pi].clearArguments();
      pulse[pi].clearArguments();
      criarObjectoGrowCliente[pi]=0;
      }      
      
      //module 4
      if (menus[pi]==menus[3])
      {
      botoesGrow[6].show();
      botoesGrow[6].setPosition(25+250*pi,height*0.7);
      botoesGrow[7].show();
      botoesGrow[7].setPosition(100+250*pi,height*0.7);
      nbGrow[3].show();
      nbGrow[3].setPosition(170+250*pi,height*0.7);   
      nbGrow[3].setValue((int)totalG[pi]);
      tgGrow[3].show();
      tgGrow[3].setPosition(25+250*pi,height*0.8);
      //value to send to client
      nNotasGrowPresent[pi]=(int) totalG[pi];
      if (tgGrow[pi].getState())
      {
        growPresent[pi]= 1;
      }
      else
      {
        growPresent[pi]= 0;
      }
      //osc Messages
      nNotasGrow[pi].add(criarObjectoGrowCliente[pi]);
      pulse[pi].add(growPresent[pi]);
      oscp5.send(nNotasGrow[pi], myRemoteLocation[pi]);
      oscp5.send(pulse[pi], myRemoteLocation[pi]);
      nNotasGrow[pi].clearArguments();
      pulse[pi].clearArguments();
      criarObjectoGrowCliente[pi]=0;
      }       
    }
    
    void fazCalculo()
    {    
      for (int i=0; i<nModules; i++)
      {
        if (maisPainel3[i] && totalG[i]<50)
        {
          //variable to be displayed in host computer
          totalG[i]=totalG[i]+1;
          //variable to be sent;
          criarObjectoGrowCliente[i]=1;
          maisPainel3[i]=false;
          menosPainel3[i]=false;
        }
        if (menosPainel3[i] && totalG[i]>1)
        {
          //variable to be displayed in host computer
          totalG[i]=totalG[i] - 1;
          //variable to be sent;
          criarObjectoGrowCliente[i]=-1;
          menosPainel3[i]=false;
          maisPainel3[i]=false;
        }
        
        if (maisPainel3All && (int)menusAll.getValue() ==2)
        {
          //variable controlling all modules
          nbGrowAllValue= nbGrowAllValue+1;
          //variable to be sent;
          criarObjectoGrowCliente[i]=1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalG[j]=nbGrowAllValue;
          }
          maisPainel3All=false;
          menosPainel3All=false;    
        }
        if (menosPainel3All && (int)menusAll.getValue() ==2)
        {
          //variable controlling all modules
          nbGrowAllValue=nbGrowAllValue - 1;
          //variable to be sent;
          criarObjectoGrowCliente[i]=-1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalG[j]=nbGrowAllValue;
          }
          menosPainel3All=false;
          maisPainel3All=false;
        } 
        
        if (totalG[i]<1)
        {
          totalG[i]=1;
        }
      }
    }
}

void controloPainel3Hide()
{
    //hide controllers from module 2
    botoesGrow[0].hide();
    botoesGrow[1].hide();
    tgGrow[0].hide();
    nbGrow[0].hide();
    //hide controllers from module 2
    botoesGrow[2].hide();
    botoesGrow[3].hide();
    tgGrow[1].hide();
    nbGrow[1].hide();
    //hide controllers from module 3
    botoesGrow[4].hide();
    botoesGrow[5].hide();
    tgGrow[2].hide();
    nbGrow[2].hide();
    //hide controllers from module 4
    botoesGrow[6].hide();
    botoesGrow[7].hide();
    tgGrow[3].hide();
    nbGrow[3].hide();
    //hide controllers from module all
    botoes1GrowAll.hide();
    botoes2GrowAll.hide();
    tgGrowAll.hide();
    nbGrowAll.hide();
}

