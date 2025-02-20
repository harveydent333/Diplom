unit QuestionsMemo;

interface

procedure singleMemoClear;
procedure RadioButtonClear;
procedure clearStrokiMemo;
procedure countQuest(count:integer);
procedure setQuestionInMemo(Answers:string);
procedure putRightAnswer(rightAnswer:string);
Function getClearString(answer :string ): String;

var i,j,beg:integer;
ArrayAnswers:array[1..10] of string;

implementation

uses Add_Question, Variants_Question, Variants_Question_Write,
  basa_dan;

procedure setQuestionInMemo(Answers:string);
begin
    for i:=1 to 10 do ArrayAnswers[i]:='';
    beg:=1;
    j:=1;
    for i:=1 to length(Answers) do
        begin
            if(Answers[i]='�') then
              begin
                  ArrayAnswers[j]:=Copy(Answers, beg, i-beg);
                  beg:=i+1;
                  inc(j);
              end;
        end;
    with Add_Questions.VariantsQuestionSingle1 do
      begin
        Memo1.Lines.Add(ArrayAnswers[1]);
        Memo2.Lines.Add(ArrayAnswers[2]);
        Memo3.Lines.Add(ArrayAnswers[3]);
        Memo4.Lines.Add(ArrayAnswers[4]);
        Memo5.Lines.Add(ArrayAnswers[5]);
        Memo6.Lines.Add(ArrayAnswers[6]);
        Memo7.Lines.Add(ArrayAnswers[7]);
        Memo8.Lines.Add(ArrayAnswers[8]);
        Memo9.Lines.Add(ArrayAnswers[9]);
        Memo10.Lines.Add(ArrayAnswers[10]);
      end;
end;

procedure putRightAnswer(rightAnswer:string);
begin
    with Add_Questions.VariantsQuestionSingle1 do
      begin
        if getClearString(rightAnswer) = getClearString(Memo1.Text) then RadioButton1.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo2.Text) then RadioButton2.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo3.Text) then RadioButton3.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo4.Text) then RadioButton4.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo5.Text) then RadioButton5.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo6.Text) then RadioButton6.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo7.Text) then RadioButton7.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo8.Text) then RadioButton8.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo9.Text) then RadioButton9.Checked:=true;
        if getClearString(rightAnswer) = getClearString(Memo10.Text) then RadioButton10.Checked:=true;
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

procedure countQuest(count:integer);
begin
    case count of
      3:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=3;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=false; label4.Visible:=false; RadioButton4.Visible:=false;
               Memo5.Visible:=false; label5.Visible:=false; RadioButton5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; RadioButton6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; RadioButton7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      4:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=4;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=false; label5.Visible:=false; RadioButton5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; RadioButton6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; RadioButton7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      5:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=5;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=false; label6.Visible:=false; RadioButton6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; RadioButton7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      6:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=6;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; RadioButton6.Visible:=true;
               Memo7.Visible:=false; label7.Visible:=false; RadioButton7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      7:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=7;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; RadioButton6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; RadioButton7.Visible:=true;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      8:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
              countQuestion:=8;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; RadioButton6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; RadioButton7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; RadioButton8.Visible:=true;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
      9:
       begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=9;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; RadioButton6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; RadioButton7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; RadioButton8.Visible:=true;
               Memo9.Visible:=true; label9.Visible:=true; RadioButton9.Visible:=true;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
        end;
     10:
      begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=10;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; RadioButton4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; RadioButton5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; RadioButton6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; RadioButton7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; RadioButton8.Visible:=true;
               Memo9.Visible:=true; label9.Visible:=true; RadioButton9.Visible:=true;
               Memo10.Visible:=true; label10.Visible:=true; RadioButton10.Visible:=true;
            end;
        end;
    end;
end;

procedure singleMemoClear;
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
begin
    with Add_Questions.VariantsQuestionSingle1 do
      begin
        for i:=Memo1.Lines.Count-1 downto  0 do if Memo1.Lines.Strings[i]='' then Memo1.Lines.Delete(i);
        for i:=Memo2.Lines.Count-1 downto  0 do if Memo2.Lines.Strings[i]='' then Memo2.Lines.Delete(i);
        for i:=Memo3.Lines.Count-1 downto  0 do if Memo3.Lines.Strings[i]='' then Memo3.Lines.Delete(i);
        for i:=Memo4.Lines.Count-1 downto  0 do if Memo4.Lines.Strings[i]='' then Memo4.Lines.Delete(i);
        for i:=Memo5.Lines.Count-1 downto  0 do if Memo5.Lines.Strings[i]='' then Memo5.Lines.Delete(i);
        for i:=Memo6.Lines.Count-1 downto  0 do if Memo6.Lines.Strings[i]='' then Memo6.Lines.Delete(i);
        for i:=Memo7.Lines.Count-1 downto  0 do if Memo7.Lines.Strings[i]='' then Memo7.Lines.Delete(i);
        for i:=Memo8.Lines.Count-1 downto  0 do if Memo8.Lines.Strings[i]='' then Memo8.Lines.Delete(i);
        for i:=Memo9.Lines.Count-1 downto  0 do if Memo9.Lines.Strings[i]='' then Memo9.Lines.Delete(i);
        for i:=Memo10.Lines.Count-1 downto  0 do if Memo10.Lines.Strings[i]='' then Memo10.Lines.Delete(i);
      end;
end;

end.
