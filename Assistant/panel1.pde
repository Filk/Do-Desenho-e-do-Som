//new object of Cues messages
Cues [] cueing = new Cues[nModules];
int [] speedCueingValor = new int [nModules];
int [] areaCueingValor = new int [nModules];
int speedAllCueingValor;
int areaAllValor;

Slider s1, s2, s3, s4, s5, s6, s7, s8; 
Slider s1All, s2All;

class Cues
{
  //declaration of name of OSC messages
  OscMessage [] speedCueing = new OscMessage [nModules];
  OscMessage [] areaCueing = new OscMessage [nModules];
  int moduloo;
  
  Cues(int modulo)
  { 
     //creating osc messages 
     for (int i=0; i<nModules ; i++)
    {
     //OSC messages created   
     speedCueing[i] = new OscMessage ("/speedCueing" + i);
     areaCueing[i] =  new OscMessage ("/areaCueing" + i);
     // int to be sent (default values, same as slider)
     speedCueingValor[i] = 10;
     areaCueingValor[i] = 0; 
    }
     moduloo=modulo;
     
     //creating and initializing slider speed for module 1
     if (menus[modulo]==menus[0])
     {
     //slider to control speed
      s1 = cp5.addSlider("speed" + modulo)
      .setLabel("speed")
     .setRange(0,50)
     .setValue(10)
     .setSize(100,20)
     .hide();
     ;
    //creating and initializing slider area for module 1
      s2 = cp5.addSlider("area" + modulo)
      .setLabel("area")
     .setRange(0,height/2-50)
     .setValue(0)
     .setSize(100,20)
     .hide();
     ;
     }
     
    //creating and initializing slider for module 2
     if (menus[modulo]==menus[1])
     {
      s3 = cp5.addSlider("speed" + modulo)
      .setLabel("speed")
     .setRange(0,50)
     .setValue(10)
     .setSize(100,20)
     .hide();
     ;
    //slider to control area for module 2
      s4 = cp5.addSlider("area" + modulo)
      .setLabel("area")
     .setRange(0,height/2-50)
     .setValue(0)
     .setSize(100,20)
     .hide();
     ;
     }
     
         //creating and initializing slider for module 3
     if (menus[modulo]==menus[2])
     {
      s5 = cp5.addSlider("speed" + modulo)
      .setLabel("speed")
     .setRange(0,50)
     .setValue(10)
     .setSize(100,20)
     .hide();
     ;
    //slider to control area for module 3
      s6 = cp5.addSlider("area" + modulo)
      .setLabel("area")
     .setRange(0,height/2-50)
     .setValue(0)
     .setSize(100,20)
     .hide();
     ;
     }
     
     //creating and initializing slider for module 4
     if (menus[modulo]==menus[3])
     {
      s7 = cp5.addSlider("speed" + modulo)
      .setLabel("speed")
     .setRange(0,50)
     .setValue(10)
     .setSize(100,20)
     .hide();
     ;
    //slider to control area for module 4
      s8 = cp5.addSlider("area" + modulo)
      .setLabel("area")
     .setRange(0,height/2-50)
     .setValue(0)
     .setSize(100,20)
     .hide();
     ;
     }
  }
  
  void controloCueing(int pi)
  {
    if (menus[pi]==menus[0])
    {
    s1.show();
    s1.setPosition(25+250*pi,height*0.7);
    s2.show();
    s2.setPosition(25+250*pi,height*0.75);
    //value to send to client
    speedCueingValor[pi]=(int) cp5.getController("speed"+pi).getValue();
    areaCueingValor[pi]=(int) cp5.getController("area"+pi).getValue();
    //name osc message, add it, name of slider
    speedCueing[pi].add(speedCueingValor[pi]);
    areaCueing[pi].add(areaCueingValor[pi]);
    oscp5.send(speedCueing[pi], myRemoteLocation[pi]);
    oscp5.send(areaCueing[pi], myRemoteLocation[pi]);
    speedCueing[pi].clearArguments();
    areaCueing[pi].clearArguments();
    }
    
    if (menus[pi]==menus[1])
    {
    s3.show();
    s3.setPosition(25+250*pi,height*0.7);
    s4.show();
    s4.setPosition(25+250*pi,height*0.75);
    //value to send to client
    speedCueingValor[pi]=(int) cp5.getController("speed"+pi).getValue();
    areaCueingValor[pi]=(int) cp5.getController("area"+pi).getValue();
    //name osc message, add it, name of slider
    speedCueing[pi].add(speedCueingValor[pi]);
    areaCueing[pi].add(areaCueingValor[pi]);
    oscp5.send(speedCueing[pi], myRemoteLocation[pi]);
    oscp5.send(areaCueing[pi], myRemoteLocation[pi]);
    speedCueing[pi].clearArguments();
    areaCueing[pi].clearArguments();
    }
    
    if (menus[pi]==menus[2])
    {
    s5.show();
    s5.setPosition(25+250*pi,height*0.7);
    s6.show();
    s6.setPosition(25+250*pi,height*0.75);
    //value to send to client
    speedCueingValor[pi]=(int) cp5.getController("speed"+pi).getValue();
    areaCueingValor[pi]=(int) cp5.getController("area"+pi).getValue();
    //name osc message, add it, name of slider
    speedCueing[pi].add(speedCueingValor[pi]);
    areaCueing[pi].add(areaCueingValor[pi]);
    oscp5.send(speedCueing[pi], myRemoteLocation[pi]);
    oscp5.send(areaCueing[pi], myRemoteLocation[pi]);
    speedCueing[pi].clearArguments();
    areaCueing[pi].clearArguments();
    }
    
    if (menus[pi]==menus[3])
    {
    s7.show();
    s7.setPosition(25+250*pi,height*0.7);
    s8.show();
    s8.setPosition(25+250*pi,height*0.75);
    //value to send to client
    speedCueingValor[pi]=(int) cp5.getController("speed"+pi).getValue();
    areaCueingValor[pi]=(int) cp5.getController("area"+pi).getValue();
    //name osc message, add it, name of slider
    speedCueing[pi].add(speedCueingValor[pi]);
    areaCueing[pi].add(areaCueingValor[pi]);
    oscp5.send(speedCueing[pi], myRemoteLocation[pi]);
    oscp5.send(areaCueing[pi], myRemoteLocation[pi]);
    speedCueing[pi].clearArguments();
    areaCueing[pi].clearArguments();
    }
  }
}
  
  
void controloCueingHide()
{
    //hide controllers from module 1
    s1.hide();
    s2.hide();
    //hide controllers from module 2
    s3.hide();
    s4.hide();
    //hide controllers from module 2
    s5.hide();
    s6.hide();
    //hide controllers from module 2
    s7.hide();
    s8.hide();
    //hide controllers from module all
    s1All.hide();
    s2All.hide();
}
  
