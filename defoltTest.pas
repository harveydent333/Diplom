unit defoltTest;

interface

//var
procedure question2;
procedure question3;
procedure question4;
procedure question5;
procedure question6;
procedure question7;
procedure question8;
procedure question9;

implementation
uses PassingKnowledgeControl;

procedure question2;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=190; Width:=921; Left:=64; Top:=312; Font.Size:=28; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=190; Width:=921; Left:=64; Top:=509; Font.Size:=28; Visible:=true;
        end;
  Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=395;
   Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=590;
         Radiobutton3.Visible:=false;
           Radiobutton4.Visible:=false;
             Radiobutton5.Visible:=false;
               Radiobutton6.Visible:=false;
                Radiobutton7.Visible:=false;
                 Radiobutton8.Visible:=false;
                   Radiobutton9.Visible:=false;
DBMemo3.Visible:=false; DBMemo4.Visible:=false; DBMemo5.Visible:=false; DBMemo7.Visible:=false; DBMemo8.Visible:=false;
DBMemo9.Visible:=false; DBMemo10.Visible:=false;
   label1.Caption:='Выберите один из 2 вариантов ответов:';
    end;
end;
                                ///====================3========================
procedure question3;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=130; Width:=921; Left:=64; Top:=312; Font.Size:=28; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=130; Width:=921; Left:=64; Top:=449; Font.Size:=28; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=120; Width:=921; Left:=64; Top:=586; Font.Size:=28; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=380;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=502;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=638;
            Radiobutton4.Visible:=false;
             Radiobutton5.Visible:=false;
               Radiobutton6.Visible:=false;
                Radiobutton7.Visible:=false;
                 Radiobutton8.Visible:=false;
                   Radiobutton9.Visible:=false;
DBMemo4.Visible:=false; DBMemo5.Visible:=false; DBMemo7.Visible:=false; DBMemo8.Visible:=false;
DBMemo9.Visible:=false; DBMemo10.Visible:=false;
   label1.Caption:='Выберите один из 3 вариантов ответов:';
    end;
end;
                                //=================4============================
procedure question4;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=95; Width:=921; Left:=64; Top:=312; Font.Size:=24; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=95; Width:=921; Left:=64; Top:=412; Font.Size:=24; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=95; Width:=921; Left:=64; Top:=512; Font.Size:=24; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=95; Width:=921; Left:=64; Top:=611; Font.Size:=24; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=348;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=446;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=550;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=651;
           Radiobutton5.Visible:=false;
            Radiobutton6.Visible:=false;
                Radiobutton7.Visible:=false;
                 Radiobutton8.Visible:=false;
                   Radiobutton9.Visible:=false;
DBMemo5.Visible:=false; DBMemo7.Visible:=false; DBMemo8.Visible:=false; DBMemo9.Visible:=false; DBMemo10.Visible:=false;
    label1.Caption:='Выберите один из 4 вариантов ответов:';
    end;
end;

                                //=================5============================
procedure question5;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=75; Width:=921; Left:=64; Top:=320; Font.Size:=20; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=75; Width:=921; Left:=64; Top:=400; Font.Size:=20; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=75; Width:=921; Left:=64; Top:=480; Font.Size:=20; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=75; Width:=921; Left:=64; Top:=560; Font.Size:=20; Visible:=true;
        end;
       with DBMemo5 do
        begin
          Height:=75; Width:=921; Left:=64; Top:=640; Font.Size:=20; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=356;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=430;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=510;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=595;
            Radiobutton5.Visible:=true; Radiobutton5.Left:=24; RadioButton5.Top:=672;
              Radiobutton6.Visible:=false;
                Radiobutton7.Visible:=false;
                 Radiobutton8.Visible:=false;
                   Radiobutton9.Visible:=false;
DBMemo7.Visible:=false; DBMemo8.Visible:=false; DBMemo9.Visible:=false; DBMemo10.Visible:=false;
   label1.Caption:='Выберите один из 5 вариантов ответов:';
    end;
end;

                                //=================6============================
procedure question6;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=320; Font.Size:=18; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=380; Font.Size:=18; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=450; Font.Size:=18; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=515; Font.Size:=18; Visible:=true;
        end;
       with DBMemo5 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=580; Font.Size:=18; Visible:=true;
        end;
       with DBMemo7 do
        begin
          Height:=60; Width:=921; Left:=64; Top:=645; Font.Size:=18; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=348;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=406;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=470;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=531;
            Radiobutton5.Visible:=true; Radiobutton5.Left:=24; RadioButton5.Top:=600;
             Radiobutton6.Visible:=true; Radiobutton6.Left:=24; RadioButton6.Top:=664;
               Radiobutton7.Visible:=false;
                 Radiobutton8.Visible:=false;
                   Radiobutton9.Visible:=false;
DBMemo8.Visible:=false; DBMemo9.Visible:=false; DBMemo10.Visible:=false;
label1.Caption:='Выберите один из 6 вариантов ответов:';
    end;
end;

                                //=================7============================
procedure question7;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=320; Font.Size:=16; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=375; Font.Size:=16; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=430; Font.Size:=16; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=485; Font.Size:=16; Visible:=true;
        end;
       with DBMemo5 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=540; Font.Size:=16; Visible:=true;
        end;
       with DBMemo7 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=595; Font.Size:=16; Visible:=true;
        end;
       with DBMemo8 do
        begin
          Height:=50; Width:=921; Left:=64; Top:=650; Font.Size:=16; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=340;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=395;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=445;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=500;
            Radiobutton5.Visible:=true; Radiobutton5.Left:=24; RadioButton5.Top:=558;
             Radiobutton6.Visible:=true; Radiobutton6.Left:=24; RadioButton6.Top:=610;
              Radiobutton7.Visible:=true; Radiobutton7.Left:=24; RadioButton7.Top:=665;
                Radiobutton8.Visible:=false;
                 Radiobutton9.Visible:=false;
DBMemo9.Visible:=false; DBMemo10.Visible:=false;
label1.Caption:='Выберите один из 7 вариантов ответов:';
    end;
end;

                                //=================8============================
procedure question8;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=320; Font.Size:=14; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=370; Font.Size:=14; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=420; Font.Size:=14; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=470; Font.Size:=14; Visible:=true;
        end;
       with DBMemo5 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=520; Font.Size:=14; Visible:=true;
        end;
       with DBMemo7 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=570; Font.Size:=14; Visible:=true;
        end;
       with DBMemo8 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=620; Font.Size:=14; Visible:=true;
        end;
       with DBMemo9 do
        begin
          Height:=45; Width:=921; Left:=64; Top:=670; Font.Size:=14; Visible:=true;
        end;
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=340;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=387;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=437;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=492;
            Radiobutton5.Visible:=true; Radiobutton5.Left:=24; RadioButton5.Top:=534;
             Radiobutton6.Visible:=true; Radiobutton6.Left:=24; RadioButton6.Top:=586;
              Radiobutton7.Visible:=true; Radiobutton7.Left:=24; RadioButton7.Top:=633;
               Radiobutton8.Visible:=true; Radiobutton8.Left:=24; RadioButton8.Top:=685;
                Radiobutton9.Visible:=false;
DBMemo10.Visible:=false;
label1.Caption:='Выберите один из 8 вариантов ответов:';
    end;
end;

                                //=================9============================
procedure question9;
begin
  with PassingKnowledgeControlForm do
    begin
      with DBMemo1 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=320; Font.Size:=12; Visible:=true;
        end;
       with DBMemo2 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=364; Font.Size:=12; Visible:=true;
        end;
       with DBMemo3 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=408; Font.Size:=12; Visible:=true;
        end;
       with DBMemo4 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=452; Font.Size:=12; Visible:=true;
        end;
       with DBMemo5 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=496; Font.Size:=12; Visible:=true;
        end;
       with DBMemo7 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=540; Font.Size:=12; Visible:=true;
        end;
       with DBMemo8 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=584; Font.Size:=12; Visible:=true;
        end;
       with DBMemo9 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=628; Font.Size:=12; Visible:=true;
        end;
         with DBMemo10 do
        begin
          Height:=40; Width:=921; Left:=64; Top:=672; Font.Size:=12; Visible:=true;
        end;
        label1.Caption:='Выберите один из 9 вариантов ответов:';
        Radiobutton1.Visible:=true; Radiobutton1.Left:=24; RadioButton1.Top:=333;
         Radiobutton2.Visible:=true; Radiobutton2.Left:=24; RadioButton2.Top:=378;
          Radiobutton3.Visible:=true; Radiobutton3.Left:=24; RadioButton3.Top:=421;
           Radiobutton4.Visible:=true; Radiobutton4.Left:=24; RadioButton4.Top:=464;
            Radiobutton5.Visible:=true; Radiobutton5.Left:=24; RadioButton5.Top:=507;
             Radiobutton6.Visible:=true; Radiobutton6.Left:=24; RadioButton6.Top:=554;
              Radiobutton7.Visible:=true; Radiobutton7.Left:=24; RadioButton7.Top:=593;
               Radiobutton8.Visible:=true; Radiobutton8.Left:=24; RadioButton8.Top:=637;
                Radiobutton9.Visible:=true; Radiobutton9.Left:=24; RadioButton9.Top:=686;
    end;
end;


end.
