unit PassControlSingle;

interface

procedure singleMemoClear;
procedure RadioButtonClear;
procedure clearStrokiMemo;
procedure checkUserAnswer;
procedure countQuest(count:integer);
procedure setQuestionInMemo(Answers:string);
procedure putRightAnswer(rightAnswer:string);
Function getClearString(answer :string ): String;

var i,j,beg:integer;
ArrayAnswers:array[1..10] of string;

implementation

uses Add_Question, Variants_Question, Variants_Question_Write,
  basa_dan, SysUtils, PassingKnowledgeControl,StdCtrls,
  config;

procedure checkUserAnswer;
begin
    posetivAnswer:=getClearString(BD.Request.DataSet.FieldByName('ВерныйОтвет').AsString);

    with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
      begin
        if ((RadioButton1.Checked = true) and (posetivAnswer <>'')) then
            begin
              userAnswer:=getClearString(Memo1.Text);
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

procedure setQuestionInMemo(Answers:string);
begin
    for i:=1 to 10 do ArrayAnswers[i]:='';
    beg:=1;
    j:=1;
    for i:=1 to length(Answers) do
        begin
            if(Answers[i]='©') then
              begin
                  ArrayAnswers[j]:=Copy(Answers, beg, i-beg);
                  beg:=i+1;
                  inc(j);
              end;
        end;
    with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
      begin
        Memo1.Lines.Add(getClearString(ArrayAnswers[1]));
        Memo1.ScrollBars:=ssVertical;
        Memo1.SelStart:=0;
        Memo1.SelLength := 0;
        Memo1.ScrollBars:=ssnone;

        Memo2.Lines.Add(getClearString(ArrayAnswers[2]));
        memo2.ScrollBars:=ssVertical;
        Memo2.SelStart:=0;
        Memo2.SelLength := 0;
        memo2.ScrollBars:=ssnone;

        Memo3.Lines.Add(getClearString(ArrayAnswers[3]));
        Memo3.ScrollBars:=ssVertical;
        Memo3.SelStart:=0;
        Memo3.SelLength := 0;
        Memo3.ScrollBars:=ssnone;

        Memo4.Lines.Add(getClearString(ArrayAnswers[4]));
        Memo4.ScrollBars:=ssVertical;
        Memo4.SelStart:=0;
        Memo4.SelLength := 0;
        Memo4.ScrollBars:=ssnone;

        Memo5.Lines.Add(getClearString(ArrayAnswers[5]));
        Memo5.ScrollBars:=ssVertical;
        Memo5.SelStart:=0;
        Memo5.SelLength := 0;
        Memo5.ScrollBars:=ssnone;

        Memo6.Lines.Add(getClearString(ArrayAnswers[6]));
        Memo6.Lines.Add(getClearString(ArrayAnswers[6]));
        Memo6.ScrollBars:=ssVertical;
        Memo6.SelStart:=0;
        Memo6.SelLength := 0;
        Memo6.ScrollBars:=ssnone;

        Memo7.Lines.Add(getClearString(ArrayAnswers[7]));
        Memo7.ScrollBars:=ssVertical;
        Memo7.SelStart:=0;
        Memo7.SelLength := 0;
        Memo7.ScrollBars:=ssnone;

        Memo8.Lines.Add(getClearString(ArrayAnswers[8]));
        Memo8.ScrollBars:=ssVertical;
        Memo8.SelStart:=0;
        Memo8.SelLength := 0;
        Memo8.ScrollBars:=ssnone;

        Memo9.Lines.Add(getClearString(ArrayAnswers[9]));
        Memo9.ScrollBars:=ssVertical;
        Memo9.SelStart:=0;
        Memo9.SelLength := 0;
        Memo9.ScrollBars:=ssnone;

        Memo10.Lines.Add(getClearString(ArrayAnswers[10]));
        Memo10.ScrollBars:=ssVertical;
        Memo10.SelStart:=0;
        Memo10.SelLength := 0;
        Memo10.ScrollBars:=ssnone;
      end;
end;

procedure putRightAnswer(rightAnswer:string);
begin
    with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
      begin
        if getClearString(rightAnswer) = Memo1.Text then RadioButton1.Checked:=true;
        if getClearString(rightAnswer) = Memo2.Text then RadioButton2.Checked:=true;
        if getClearString(rightAnswer) = Memo3.Text then RadioButton3.Checked:=true;
        if getClearString(rightAnswer) = Memo4.Text then RadioButton4.Checked:=true;
        if getClearString(rightAnswer) = Memo5.Text then RadioButton5.Checked:=true;
        if getClearString(rightAnswer) = Memo6.Text then RadioButton6.Checked:=true;
        if getClearString(rightAnswer) = Memo7.Text then RadioButton7.Checked:=true;
        if getClearString(rightAnswer) = Memo8.Text then RadioButton8.Checked:=true;
        if getClearString(rightAnswer) = Memo9.Text then RadioButton9.Checked:=true;
        if getClearString(rightAnswer) = Memo10.Text then RadioButton10.Checked:=true;
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
          with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
  with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
  with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
    with PassingKnowledgeControlForm.VariantsQuestionSingle1 do
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
