unit QuestionsMemo;

interface

procedure countQuest(count:integer);
procedure setRadioButton(otvet:string);
procedure memoClear;
procedure RadioButtonClear;
procedure setMemoLines;
procedure clearStrokiMemo;

implementation

uses Add_Question, Variants_Question, Variants_Question_Write;

procedure setMemoLines;
begin
    with Add_Questions.VariantsQuestionSingle1 do
      begin
         Memo1.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���1').AsString);
         Memo2.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���2').AsString);
         Memo3.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���3').AsString);
         Memo4.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���4').AsString);
         Memo5.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���5').AsString);
         Memo6.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���6').AsString);
         Memo7.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���7').AsString);
         Memo8.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���8').AsString);
         Memo9.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���9').AsString);
         Memo10.Lines.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���10').AsString);
      end;
end;

procedure setRadioButton(otvet:string);
var Otv1,Otv2,Otv3,Otv4,Otv5,Otv6,Otv7,Otv8,Otv9,Otv10:string;
begin
  Otv1:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���1').AsString;
  Otv2:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���2').AsString;
  Otv3:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���3').AsString;
  Otv4:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���4').AsString;
  Otv5:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���5').AsString;
  Otv6:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���6').AsString;
  Otv7:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���7').AsString;
  Otv8:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���8').AsString;
  Otv9:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���9').AsString;
  Otv10:=Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('���10').AsString;

  with Add_Questions.VariantsQuestionSingle1 do
    begin
      if Otv1=otvet then RadioButton1.Checked:=true;
      if Otv2=otvet then RadioButton2.Checked:=true;
      if Otv3=otvet then RadioButton3.Checked:=true;
      if Otv4=otvet then RadioButton4.Checked:=true;
      if Otv5=otvet then RadioButton5.Checked:=true;
      if Otv6=otvet then RadioButton6.Checked:=true;
      if Otv7=otvet then RadioButton7.Checked:=true;
      if Otv8=otvet then RadioButton8.Checked:=true;
      if Otv9=otvet then RadioButton9.Checked:=true;
      if Otv10=otvet then RadioButton10.Checked:=true;
    end;
end;


procedure countQuest(count:integer);
begin
    case count of
      3:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
          with Add_Questions.VariantsQuestionSingle1 do
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
  with Add_Questions.VariantsQuestionSingle1 do
    begin
        Memo1.Clear;
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

procedure RadioButtonClear;
begin
  with Add_Questions.VariantsQuestionSingle1 do
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

procedure clearStrokiMemo;
var i:integer;
begin
with Add_Questions.VariantsQuestionSingle1 do
begin

for i:=Memo1.Lines.Count-1 downto  0 do
  if Memo1.Lines.Strings[i]='' then Memo1.Lines.Delete(i);

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

end;

end;

end.
