unit defoltTest;

interface
procedure countQuest(count:integer);
procedure setMemoLines;
procedure memoClear;
procedure clearStrokiMemo;
procedure RadioButtonClear;
procedure checkOtvet;
Function getClearString(answer :string ): String;

var countBall,exitPoint:integer;
posetivAnswer, userAnswer:string;

implementation

uses PassingKnowledgeControl, Variants_Question_More, Control_CRUD,
  Add_Question, Menu_Control, SysUtils;

procedure checkOtvet;
begin
    posetivAnswer:=getClearString(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('�����������').AsString);
    
    with PassingKnowledgeControlForm.VariantsQuestionMore1 do
      begin
        if ((RadioButton1.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo11.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton2.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo2.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton3.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo3.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton4.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo4.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton5.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo5.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton6.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo6.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton7.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo7.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton8.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo8.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton9.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo9.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;

        if ((RadioButton10.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo10.Text);
              if ((userAnswer = posetivAnswer ))then
                inc(countBall);
            end;
  end;
end;

Function getClearString(answer :string ) : String;
var i:integer;
begin
    i:=1;
    while i<=length(answer) do
      begin
        if ((answer[i]=#13) or (answer[i]=#10)) then
          Delete(answer,i,1)
        else inc(i);
      end;
    Result:=answer;
end;

procedure setMemoLines;
begin
    with PassingKnowledgeControlForm.VariantsQuestionMore1 do
      begin
         Memo11.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���1').AsString);
         Memo2.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���2').AsString);
         Memo3.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���3').AsString);
         Memo4.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���4').AsString);
         Memo5.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���5').AsString);
         Memo6.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���6').AsString);
         Memo7.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���7').AsString);
         Memo8.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���8').AsString);
         Memo9.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���9').AsString);
         Memo10.Lines.Add(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('���10').AsString);
      end;
end;

procedure countQuest(count:integer);
begin
    case count of
    2:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=2;

               memoClear;
               RadioButtonClear;

               Memo2.Visible:=true;
               label2.Visible:=true;
               RadioButton2.Visible:=true;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=false;
               Memo4.Clear;
               label4.Visible:=false;
               RadioButton4.Visible:=false;

               Memo5.Visible:=false;
               Memo5.Clear;
               label5.Visible:=false;
               RadioButton5.Visible:=false;

               Memo6.Visible:=false;
               Memo6.Clear;
               label6.Visible:=false;
               RadioButton6.Visible:=false;

               Memo7.Visible:=false;
               Memo7.Clear;
               label7.Visible:=false;
               RadioButton7.Visible:=false;

               Memo8.Visible:=false;
               Memo8.Clear;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               Memo9.Clear;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               Memo10.Clear;
               label10.Visible:=false;
               RadioButton10.Visible:=false;

            end;
        end;
      3:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=3;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=false;
               Memo4.Clear;
               label4.Visible:=false;
               RadioButton4.Visible:=false;

               Memo5.Visible:=false;
               Memo5.Clear;
               label5.Visible:=false;
               RadioButton5.Visible:=false;

               Memo6.Visible:=false;
               Memo6.Clear;
               label6.Visible:=false;
               RadioButton6.Visible:=false;

               Memo7.Visible:=false;
               Memo7.Clear;
               label7.Visible:=false;
               RadioButton7.Visible:=false;

               Memo8.Visible:=false;
               Memo8.Clear;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               Memo9.Clear;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               Memo10.Clear;
               label10.Visible:=false;
               RadioButton10.Visible:=false;

            end;
        end;
      4:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=4;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=false;
               label5.Visible:=false;
               RadioButton5.Visible:=false;

               Memo6.Visible:=false;
               label6.Visible:=false;
               RadioButton6.Visible:=false;

               Memo7.Visible:=false;
               label7.Visible:=false;
               RadioButton7.Visible:=false;

               Memo8.Visible:=false;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
      5:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=5;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;


               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=false;
               label6.Visible:=false;
               RadioButton6.Visible:=false;

               Memo7.Visible:=false;
               label7.Visible:=false;
               RadioButton7.Visible:=false;

               Memo8.Visible:=false;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
      6:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=6;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=true;
               label6.Visible:=true;
               RadioButton6.Visible:=true;

               Memo7.Visible:=false;
               label7.Visible:=false;
               RadioButton7.Visible:=false;

               Memo8.Visible:=false;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
      7:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=7;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=true;
               label6.Visible:=true;
               RadioButton6.Visible:=true;

               Memo7.Visible:=true;
               label7.Visible:=true;
               RadioButton7.Visible:=true;

               Memo8.Visible:=false;
               label8.Visible:=false;
               RadioButton8.Visible:=false;

               Memo9.Visible:=false;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
      8:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=8;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=true;
               label6.Visible:=true;
               RadioButton6.Visible:=true;

               Memo7.Visible:=true;
               label7.Visible:=true;
               RadioButton7.Visible:=true;

               Memo8.Visible:=true;
               label8.Visible:=true;
               RadioButton8.Visible:=true;

               Memo9.Visible:=false;
               label9.Visible:=false;
               RadioButton9.Visible:=false;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
      9:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=9;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=true;
               label6.Visible:=true;
               RadioButton6.Visible:=true;

               Memo7.Visible:=true;
               label7.Visible:=true;
               RadioButton7.Visible:=true;

               Memo8.Visible:=true;
               label8.Visible:=true;
               RadioButton8.Visible:=true;

               Memo9.Visible:=true;
               label9.Visible:=true;
               RadioButton9.Visible:=true;

               Memo10.Visible:=false;
               label10.Visible:=false;
               RadioButton10.Visible:=false;
            end;
        end;
     10:
      begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=10;

               memoClear;
               RadioButtonClear;

               Memo3.Visible:=true;
               label3.Visible:=true;
               RadioButton3.Visible:=true;

               Memo4.Visible:=true;
               label4.Visible:=true;
               RadioButton4.Visible:=true;

               Memo5.Visible:=true;
               label5.Visible:=true;
               RadioButton5.Visible:=true;

               Memo6.Visible:=true;
               label6.Visible:=true;
               RadioButton6.Visible:=true;

               Memo7.Visible:=true;
               label7.Visible:=true;
               RadioButton7.Visible:=true;

               Memo8.Visible:=true;
               label8.Visible:=true;
               RadioButton8.Visible:=true;

               Memo9.Visible:=true;
               label9.Visible:=true;
               RadioButton9.Visible:=true;

               Memo10.Visible:=true;
               label10.Visible:=true;
               RadioButton10.Visible:=true;
            end;
        end;
    end;
end;

procedure memoClear;
begin
  with PassingKnowledgeControlForm.VariantsQuestionMore1 do
    begin
        Memo11.Clear;
        Memo2.Clear;
        Memo3.Clear;
        Memo4.Clear;
        Memo5.Clear;
        Memo6.Clear;
        Memo7.Clear;
        Memo8.Clear;
        Memo9.Clear;
        Memo10.Clear;
    end;
end;

procedure clearStrokiMemo;
var i:integer;
begin
    with PassingKnowledgeControlForm.VariantsQuestionMore1 do
      begin
        for i:=Memo11.Lines.Count-1 downto  0 do
          if Memo11.Lines.Strings[i]='' then Memo11.Lines.Delete(i);

        for i:=Memo2.Lines.Count-1 downto  0 do
          if Memo2.Lines.Strings[i]='' then Memo2.Lines.Delete(i);

        for i:=Memo3.Lines.Count-1 downto  0 do
          if Memo3.Lines.Strings[i]='' then Memo3.Lines.Delete(i);

        for i:=Memo4.Lines.Count-1 downto  0 do
          if Memo4.Lines.Strings[i]='' then Memo4.Lines.Delete(i);

        for i:=Memo5.Lines.Count-1 downto  0 do
          if Memo5.Lines.Strings[i]='' then Memo5.Lines.Delete(i);

        for i:=Memo6.Lines.Count-1 downto  0 do
          if Memo6.Lines.Strings[i]='' then Memo6.Lines.Delete(i);

        for i:=Memo7.Lines.Count-1 downto  0 do
          if Memo7.Lines.Strings[i]='' then Memo7.Lines.Delete(i);

        for i:=Memo8.Lines.Count-1 downto  0 do
          if Memo8.Lines.Strings[i]='' then Memo8.Lines.Delete(i);

        for i:=Memo9.Lines.Count-1 downto  0 do
          if Memo9.Lines.Strings[i]='' then Memo9.Lines.Delete(i);

        for i:=Memo10.Lines.Count-1 downto  0 do
            if Memo10.Lines.Strings[i]='' then Memo10.Lines.Delete(i);

        Memo11.SelStart:= 1;
        Memo2.SelStart:= 1;
        Memo3.SelStart:= 1;
        Memo4.SelStart:= 1;
        Memo5.SelStart:= 1;
        Memo6.SelStart:= 1;
        Memo7.SelStart:= 1;
        Memo8.SelStart:= 1;
        Memo9.SelStart:= 1;
        Memo10.SelStart:= 1;
  end;
end;

procedure RadioButtonClear;
begin
  with PassingKnowledgeControlForm.VariantsQuestionMore1 do
    begin
       RadioButton1.Checked:=false;
       RadioButton2.Checked:=false;
       RadioButton3.Checked:=false;
       RadioButton4.Checked:=false;
       RadioButton5.Checked:=false;
       RadioButton6.Checked:=false;
       RadioButton7.Checked:=false;
       RadioButton8.Checked:=false;
       RadioButton9.Checked:=false;
       RadioButton10.Checked:=false;
    end;
end;

end.
