void escolha()
{
    //hidding other panels (por isto é que a cena não fica iluminada)
    
    if (hidePanel)
    {
    controloCueingHide();
    controloPainel2Hide();
    controloPainel3Hide();
    controloPainel4Hide();
    controloPainel5Hide();
    hidePanel=false;
    }

    //panels display by All module
    switch((int)menusAll.getValue())
    {
      //panel Cueing
      case 0:
              s1All.show();
              s1All.setPosition(275,height*0.1);
              s2All.show();
              s2All.setPosition(275,height*0.15);
                      
              for (int i=0; i<nModules; i++)
              {
                if (presentPanelAll==0)
                {
                  if (cp5.getController("speedAll").isMousePressed())
                  {
                  //get value from moduleAll sliders and sends it to individual modules 
                  cp5.getController("speed"+i).setValue((int) cp5.getController("speedAll").getValue());
                  }
                  if (cp5.getController("areaAll").isMousePressed())
                  {
                  cp5.getController("area"+i).setValue((int) cp5.getController("areaAll").getValue());
                  }
                }
              }
              break;
       
       //panel 2   
       case 1:
              botoes1All.show();
              botoes1All.setPosition(275,height*0.1);
              botoes2All.show();
              botoes2All.setPosition(355,height*0.1);
              tgAll.show();
              tgAll.setPosition(275,height*0.2);
              nbAll.show();
              nbAll.setPosition(425,height*0.1);
              nbAll.setValue(nbAllValue);
                
              for (int i=0; i<nModules; i++)
              {
                if (presentPanelAll==1 && tgAll.isMousePressed())
                {
                  tg[i].setState(tgAll.getState());
                }
              }
              break;

       //panel 3   
       case 2:
              botoes1GrowAll.show();
              botoes1GrowAll.setPosition(275,height*0.1);
              botoes2GrowAll.show();
              botoes2GrowAll.setPosition(355,height*0.1);
              tgGrowAll.show();
              tgGrowAll.setPosition(275,height*0.2);
              nbGrowAll.show();
              nbGrowAll.setPosition(425,height*0.1);
              nbGrowAll.setValue(nbGrowAllValue);
                
              for (int i=0; i<nModules; i++)
              {
                if (presentPanelAll==2 && tgGrowAll.isMousePressed())
                {
                  tgGrow[i].setState(tgGrowAll.getState());
                }
              }
              break;

        //panel 4   
       case 3:
              botoes1P4All.show();
              botoes1P4All.setPosition(275,height*0.1);
              botoes2P4All.show();
              botoes2P4All.setPosition(355,height*0.1);
              nbP4All.show();
              nbP4All.setPosition(425,height*0.1);
              nbP4All.setValue(nbP4AllValue);
              break;
      
      //panel 5
      case 4:
              tgP5All.show();
              tgP5All.setPosition(275,height*0.05);
              fill(255);
              rect(340,height*0.05, 200*1.5, 120*1.5);
              mover[4].update();
              mover[4].display();
              mover[4].controlaTraspAll();
             // mover[4].checkaSeRatoEAccaoAll(340,height*0.05, 200*1.5, 120*1.5);
              if (mover[4].checkaSeRatoEAccaoAll(340,height*0.05, 200*1.5, 120*1.5))
              {  
                for (int i=0; i<nModules; i++)
                 {
                    float tretaX= map (mover[4].mouse.x, 340, 340+(200*1.5), 25+(250*i), 25+(250*i)+200);
                    mover[i].mouse.x= tretaX;
                    float tretaY= map (mover[4].mouse.y, height*0.05, height*0.05+120*1.5, height*0.78, height*0.78+100);
                    mover[i].mouse.y= tretaY;
                 }
              }
              break;      
    }
      
    //control for individual modules  
    for (int i=0; i<nModules; i++)
    {
     //check which module I am in
      if (menus[i]==menus[0])
      { 
        //check which panel I am in        
        switch((int) menus[i].getValue())
        {
          case 0:
          //first panel
          cueing[0].controloCueing(i);
          break;

          case 1:
          notes[0].desenha(i);
          break;
          
          case 2:
          grow[0].desenha(i);
          break;
          
          case 3:
          panel4[0].display(i);
          break;
          
          case 4:
          panel5[0].display(i);
          fill(255);
          rect(25+250*0,height*0.78, 200, 120);          
          mover[0].update();
          mover[0].display();
          mover[0].controlaTrasp(0);
          break;
         }
      }

      else if (menus[i]==menus[1])
      {        
        switch((int) menus[i].getValue())
        {
        case 0:
        cueing[1].controloCueing(i);
        break;

        case 1:
        notes[1].desenha(i);
        break;

        case 2:
        grow[1].desenha(i);
        break;

        case 3:
        panel4[1].display(i);
        break;

        case 4:
        panel5[1].display(i);
        fill(255);
        rect(25+250*1,height*0.78, 200, 120);        
        mover[1].update();
        mover[1].display();
        mover[1].controlaTrasp(1);        
        break;        
        }
      }
      
      else if (menus[i]==menus[2])
      {        
        switch((int) menus[i].getValue())
        {
        case 0:
        cueing[2].controloCueing(i);
        break;

        case 1:
        notes[2].desenha(i);
        break;

        case 2:
        grow[2].desenha(i);
        break;

        case 3:
        panel4[2].display(i);
        break;

        case 4:
        panel5[2].display(i);
        fill(255);
        rect(25+250*2,height*0.78, 200, 120);          
        mover[2].update();
        mover[2].display();
        mover[2].controlaTrasp(2);      
        break;        
        }
      } 
      else if (menus[i]==menus[3])
      {        
        switch((int) menus[i].getValue())
        {
        case 0:
        cueing[3].controloCueing(i);
        break;

        case 1:
        notes[3].desenha(i);
        break;

        case 2:
        grow[3].desenha(i);
        break;

        case 3:
        panel4[3].display(i);
        break;

        case 4:
        panel5[3].display(i);
        fill(255);
        rect(25+250*3,height*0.78, 200, 120);        
        mover[3].update();
        mover[3].display();
        mover[3].controlaTrasp(3);       
        break;        
        }
      }      
    }
    
}
