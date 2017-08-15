//class for managing IP stuff

boolean jaRecebiIp [] = new boolean [nModules];

class IP
{
  String Ip;
  String port;
  //position main module
  int posYAll=240;
  int posXAll=25;
  //position small modules
  int posY=490;
  int posX=25;
  
  IP (String IP_, int Port_)
  {
    this.Ip=IP_;
    this.port= str(Port_);
  }
  
  //IP and Port host computer
  void displayIPAll()
  {
    fill(255);
    text ("IP", posXAll, posYAll);
    text(Ip, posXAll+15 ,posYAll);
    text ("port", posXAll+140, posYAll);
    text(port, posXAll+ 168,posYAll);
  }
  
  //IP's and port client computers
  void displayIPs()
  {
    for (int i=0; i<nModules; i++)
    {
      //sees if an incoming IP has arrived
      if (Ips[i].equals("undefined"))
      {
        fill(255,0,0);
      }
      else
      {
        fill(0,200,0);
      }
        // runs through all the ips
        text ("IP", posX + 250 *i, posY);
        text(Ips[i], posX + 15 + 250 *i ,posY);
        text ("port", posX + 140 + 250*i, posY);
        text(portEnvio, posX+ 168 + 250 *i,posY);
    }
  }
}

//incoming OSC
void oscEvent(OscMessage theOscMessage) 
{ 
  for (int i=0; i<nModules; i++)
   { 
    //receives the IP addresses computers
    if (theOscMessage.checkAddrPattern("/ipAddress" + i)==true && jaRecebiIp [i])
    {
      Ips[i]= theOscMessage.get(0).stringValue();
      myRemoteLocation[i].add(new NetAddress(Ips[i], portEnvio));
      jaRecebiIp[i] =false;
    }
   }
}
