//new object of Panel4 messages
Panel4 [] panel4 = new Panel4[nModules];
int [] nNotasPresentP4 = new int [nModules];
int [] totalNP4 =  new int [nModules];
int nNotasPresentP4All;

//bangs created for individual modules
Bang [] botoesP4 = new Bang [2*menus.length];
//bangs created for module all
Numberbox [] nbP4 = new Numberbox [nModules];

Bang botoes1P4All, botoes2P4All;
//numberbox for all
Numberbox nbP4All;

//variables because I don't understand why a bang works like it does!!!
boolean [] maisPanel4= new boolean [nModules];
boolean [] menosPanel4=new boolean [nModules];
boolean [] maisPanel4AllManda = new boolean [nModules];
boolean [] menosPanel4AllManda = new boolean [nModules];
int [] maisPanel4Manda = new int [nModules];
int [] menosPanel4Manda = new int [nModules];

class Panel4
{
  //declaration of name of OSC messages
  OscMessage [] maisNota = new OscMessage [nModules];
  OscMessage [] menosNota = new OscMessage [nModules];
  int moduloo;
  
  Panel4(int modulo)
  { 
    for (int i=0; i<nModules; i++)
    {
      //OSC messages created
      maisNota[i] = new OscMessage ("/maisNota" + i);
      menosNota[i] = new OscMessage ("/menosNota" + i);
      //default values
      nNotasPresentP4[i]=1;
      
      //boolean to check number of notes present
      maisPanel4[i]=false;
      menosPanel4[i]=false;
      maisPanel4AllManda[i]=false;
      menosPanel4AllManda[i]=false;
    }
    moduloo = modulo;
  
     //creating and initializing button speed for module 1
     if (menus[modulo]==menus[0])
     {
       //button to increase notes or not
      botoesP4[0]=cp5.addBang("PlusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesP4[1]=cp5.addBang("MinusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     nbP4[0]=cp5.addNumberbox("numberboxValueP4" + modulo)
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
       //button to increase notes or not
      botoesP4[2]=cp5.addBang("PlusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesP4[3]=cp5.addBang("MinusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     nbP4[1]=cp5.addNumberbox("numberboxValueP4" + modulo)
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
     
          //creating and initializing button speed for module 3
     if (menus[modulo]==menus[2])
     {
       //button to increase notes or not
      botoesP4[4]=cp5.addBang("PlusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesP4[5]=cp5.addBang("MinusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     nbP4[2]=cp5.addNumberbox("numberboxValueP4" + modulo)
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
     
          //creating and initializing button speed for module 4
     if (menus[modulo]==menus[3])
     {
       //button to increase notes or not
      botoesP4[6]=cp5.addBang("PlusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Plus")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     botoesP4[7]=cp5.addBang("MinusShake"+ modulo)
         .setSize(30, 30)
         .setLabel("Less")
         .setTriggerEvent(Bang.RELEASE)
         .hide();
         ;
     nbP4[3]=cp5.addNumberbox("numberboxValueP4" + modulo)
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
  }
  
  void display (int pi)
  { 
      //module 1
      if (menus[pi]==menus[0])
      {
      botoesP4[0].show();
      botoesP4[0].setPosition(25+250*pi,height*0.7);
      botoesP4[1].show();
      botoesP4[1].setPosition(100+250*pi,height*0.7);
      nbP4[0].show();
      nbP4[0].setPosition(170+250*pi,height*0.7);   
      nbP4[0].setValue((int)totalNP4[pi]);
      //because oscP5 has problems parsing boolean values I have to convert everything to int...boring!
      if (maisPanel4[pi]==true || maisPanel4AllManda[pi])
      {
        maisPanel4Manda[pi]=1;
      }
      else
      {
        maisPanel4Manda[pi]=-1;
      }
      if (menosPanel4[pi]==true || menosPanel4AllManda [pi])
      {
        menosPanel4Manda[pi]=1;
      }
      else
      {
        menosPanel4Manda[pi]=-1;
      }
      
      //osc Messages
      maisNota[pi].add(maisPanel4Manda[pi]);
      menosNota[pi].add(menosPanel4Manda[pi]);
      oscp5.send(maisNota[pi], myRemoteLocation[pi]);
      oscp5.send(menosNota[pi], myRemoteLocation[pi]);
      maisNota[pi].clearArguments();
      menosNota[pi].clearArguments();
      maisPanel4AllManda[pi]=false;
      menosPanel4AllManda[pi]=false;
      }
      
            //module 2
      if (menus[pi]==menus[1])
      {
      botoesP4[2].show();
      botoesP4[2].setPosition(25+250*pi,height*0.7);
      botoesP4[3].show();
      botoesP4[3].setPosition(100+250*pi,height*0.7);
      nbP4[1].show();
      nbP4[1].setPosition(170+250*pi,height*0.7);   
      nbP4[1].setValue((int)totalNP4[pi]);
      //because oscP5 has problems parsing boolean values I have to convert everything to int...boring!
      if (maisPanel4[pi]==true || maisPanel4AllManda[pi])
      {
        maisPanel4Manda[pi]=1;
      }
      else
      {
        maisPanel4Manda[pi]=-1;
      }
      if (menosPanel4[pi]==true || menosPanel4AllManda [pi])
      {
        menosPanel4Manda[pi]=1;
      }
      else
      {
        menosPanel4Manda[pi]=-1;
      }
      
      //osc Messages
      maisNota[pi].add(maisPanel4Manda[pi]);
      menosNota[pi].add(menosPanel4Manda[pi]);
      oscp5.send(maisNota[pi], myRemoteLocation[pi]);
      oscp5.send(menosNota[pi], myRemoteLocation[pi]);
      maisNota[pi].clearArguments();
      menosNota[pi].clearArguments();
      maisPanel4AllManda[pi]=false;
      menosPanel4AllManda[pi]=false;
      }
      
      //module 3
      if (menus[pi]==menus[2])
      {
      botoesP4[4].show();
      botoesP4[4].setPosition(25+250*pi,height*0.7);
      botoesP4[5].show();
      botoesP4[5].setPosition(100+250*pi,height*0.7);
      nbP4[2].show();
      nbP4[2].setPosition(170+250*pi,height*0.7);   
      nbP4[2].setValue((int)totalNP4[pi]);
      //because oscP5 has problems parsing boolean values I have to convert everything to int...boring!
      if (maisPanel4[pi]==true || maisPanel4AllManda[pi])
      {
        maisPanel4Manda[pi]=1;
      }
      else
      {
        maisPanel4Manda[pi]=-1;
      }
      if (menosPanel4[pi]==true || menosPanel4AllManda [pi])
      {
        menosPanel4Manda[pi]=1;
      }
      else
      {
        menosPanel4Manda[pi]=-1;
      }
      
      //osc Messages
      maisNota[pi].add(maisPanel4Manda[pi]);
      menosNota[pi].add(menosPanel4Manda[pi]);
      oscp5.send(maisNota[pi], myRemoteLocation[pi]);
      oscp5.send(menosNota[pi], myRemoteLocation[pi]);
      maisNota[pi].clearArguments();
      menosNota[pi].clearArguments();
      maisPanel4AllManda[pi]=false;
      menosPanel4AllManda[pi]=false;
      }
      
      //module 4
      if (menus[pi]==menus[3])
      {
      botoesP4[6].show();
      botoesP4[6].setPosition(25+250*pi,height*0.7);
      botoesP4[7].show();
      botoesP4[7].setPosition(100+250*pi,height*0.7);
      nbP4[3].show();
      nbP4[3].setPosition(170+250*pi,height*0.7);   
      nbP4[3].setValue((int)totalNP4[pi]);
      //because oscP5 has problems parsing boolean values I have to convert everything to int...boring!
      if (maisPanel4[pi]==true || maisPanel4AllManda[pi])
      {
        maisPanel4Manda[pi]=1;
      }
      else
      {
        maisPanel4Manda[pi]=-1;
      }
      if (menosPanel4[pi]==true || menosPanel4AllManda [pi])
      {
        menosPanel4Manda[pi]=1;
      }
      else
      {
        menosPanel4Manda[pi]=-1;
      }
      
      //osc Messages
      maisNota[pi].add(maisPanel4Manda[pi]);
      menosNota[pi].add(menosPanel4Manda[pi]);
      oscp5.send(maisNota[pi], myRemoteLocation[pi]);
      oscp5.send(menosNota[pi], myRemoteLocation[pi]);
      maisNota[pi].clearArguments();
      menosNota[pi].clearArguments();
      maisPanel4AllManda[pi]=false;
      menosPanel4AllManda[pi]=false;
      }
      
      fazCalculo();
  }
  
  void fazCalculo()
  {    
     for (int i=0; i<nModules; i++)
     {
        if (maisPanel4[i] && totalNP4[i]<10)
        {
          //variable to be displayed in host computer
          totalNP4[i]=totalNP4[i]+1;
          maisPanel4[i]=false;
          menosPanel4[i]=false;
        }
        if (menosPanel4[i] && totalNP4[i]>1)
        {
          //variable to be displayed in host computer
          totalNP4[i]=totalNP4[i] - 1;
          menosPanel4[i]=false;
          maisPanel4[i]=false;
        }
        
        //All panel
       if (maisPanel4All && (int)menusAll.getValue() ==3)
        {
          //variable controlling all modules
          nbP4AllValue= nbP4AllValue + 1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalNP4[j]=nbP4AllValue;
            maisPanel4AllManda[j]=true;
          }
          maisPanel4All=false;
          menosPanel4All=false;    
        }
        if (menosPanel4All && (int)menusAll.getValue() ==3)
        {
          //variable controlling all modules
          nbP4AllValue=nbP4AllValue - 1;
          //looping in all modules to update values from All
          for (int j=0; j<nModules ; j++)
          {
            totalNP4[j]=nbP4AllValue;
            menosPanel4AllManda[j]=true;
          }
          menosPanel4All=false;
          maisPanel4All=false;
        }
      
       if (totalNP4[i]<1)
       {
          totalNP4[i]=1;
       }
     }
  }  
}

void controloPainel4Hide()
{
    //hide controllers from module 1
    botoesP4[0].hide();
    botoesP4[1].hide();
    nbP4[0].hide();
    //hide controllers from module 2
    botoesP4[2].hide();
    botoesP4[3].hide();
    nbP4[1].hide();
    //hide controllers from module 3
    botoesP4[4].hide();
    botoesP4[5].hide();
    nbP4[2].hide();
    //hide controllers from module 4
    botoesP4[6].hide();
    botoesP4[7].hide();
    nbP4[3].hide();    
    //hide controllers from All
    botoes1P4All.hide();
    botoes2P4All.hide();
    nbP4All.hide();
}
