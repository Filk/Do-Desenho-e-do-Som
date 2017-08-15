boolean accaoAll=false;

//variables for panel 2 All
int nbAllValue=1;
boolean menosPainel2All =false; 
boolean maisPainel2All=false;

//variables for panel 3 All
int nbGrowAllValue=1;
boolean menosPainel3All =false; 
boolean maisPainel3All=false;

//variables for panel 4 All
int nbP4AllValue=1;
boolean menosPanel4All = false;
boolean maisPanel4All = false;

//variable to hide elements from different panels in main window
boolean hidePanel=true;
  
void customize(DropdownList ddl) 
{
  //customize a DropdownLists of modules
  for (int i=0;i<menus.length;i++) 
  {
    if (ddl==menus[i])
    {
    ddl.setBackgroundColor(0);
    ddl.setSize(200,250);
    ddl.setItemHeight(20);
    ddl.setBarHeight(30);
    ddl.captionLabel().set("Panels");
    ddl.captionLabel().style().marginTop = 8;
    ddl.captionLabel().style().marginLeft = 3;
    ddl.valueLabel().style().marginTop = 3;
      //adds possible panels to modules
      for (int j=0;j<paineis.length;j++)
     { 
      ddl.addItem(paineis[j], j);
     }
    ddl.scroll(0);
    ddl.setColorBackground(color(60));
    ddl.setColorActive(color(255, 128));
    ddl.setValue(7);
    }
  }
  
  //customize menuAll
  if (ddl==menusAll)
  {
    ddl.setBackgroundColor(0);
    ddl.setSize(200,250);
    ddl.setItemHeight(20);
    ddl.setBarHeight(30);
    ddl.captionLabel().set("Panels All");
    //ddl.setCaptionLabel("Panels All");
    ddl.captionLabel().style().marginTop = 8;
    ddl.captionLabel().style().marginLeft = 3;
    ddl.valueLabel().style().marginTop = 3;
     for (int j=0;j<paineis.length;j++)
     { 
      ddl.addItem(paineis[j], j);
     }
//    ddl.scroll(100);
    ddl.setColorBackground(color(100));
    ddl.setColorActive(color(55, 128));
  }   
}

public void controlEvent(ControlEvent theEvent) 
{
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.
  
  if (theEvent.isGroup()) 
  {
    //just to hide once the things
    hidePanel=true;
    
    for (int i=0; i<nModules; i++)
    {
      if (theEvent.getGroup().getId()==i) 
      {
       accaoAll=false; 
      //sends signal of the id module that just produced action  
      actPanelRealTime= theEvent.getGroup().getId();
      //retrive and assign the panel number for each individual module
      presentPanel[actPanelRealTime]=(int) theEvent.getGroup().getValue();
      //println( actPanelRealTime + " " + presentPanel[actPanelRealTime]);
      }
    }
    
    //id 4 is the All panel group
    if (theEvent.getGroup().getId()==4)
    {
      accaoAll=true;
      //retrive and assign the panel number of central module
      presentPanelAll=(int) theEvent.getGroup().getValue();
      //boolean to see if All module is in use

          //if main panel moves, all the other change
          for (int i=0; i<nModules; i++)
          {
            menus[i].setIndex(presentPanelAll);
            //menus[i].updateDisplayMode(presentPanelAll);
          }
    }
  }
 
    if (theEvent.isController())
    {
      oEvento=theEvent;
      
      //painel 2, button stuff
      for (int i=0; i<nModules; i++)
      {
        if (theEvent.getController().getName().equals("Plus"+i))
        {
        maisPainel2[i]=true;
        }
      
        if (theEvent.getController().getName().equals("Minus"+i))
        {
        menosPainel2[i]=true;
        }
        
        if (theEvent.getController().getName().equals("PlusAll"))
        {
          maisPainel2All= true;
        }
      
        if (theEvent.getController().getName().equals("MinusAll"))
        {
          menosPainel2All= true;
        }
      }
      
      //painel 3, button stuff
      for (int j=0; j<nModules; j++)
      {
        if (theEvent.getController().getName().equals("PlusGrow"+j))
        {
        maisPainel3[j]=true;
        }
      
        if (theEvent.getController().getName().equals("MinusGrow"+j))
        {
        menosPainel3[j]=true;
        }
        
        if (theEvent.getController().getName().equals("PlusGrowAll"))
        {
          maisPainel3All= true;
        }
      
        if (theEvent.getController().getName().equals("MinusGrowAll"))
        {
          menosPainel3All= true;
        }
      }
      
      //painel 4, button stuff
      for (int k=0; k<nModules; k++)
      {
        if (theEvent.getController().getName().equals("PlusShake"+k) && totalNP4[k]<10)
        {
        maisPanel4[k]=true;
        }
      
        if (theEvent.getController().getName().equals("MinusShake"+k) && totalNP4[k]>1)
        {
        menosPanel4[k]=true;
        }
        
        if (theEvent.getController().getName().equals("PlusShakeAll"))
        {
          maisPanel4All= true;
        }
      
        if (theEvent.getController().getName().equals("MinusShakeAll"))
        {
          menosPanel4All= true;
        }
      }
    } 
}

ControlEvent oEvento;
