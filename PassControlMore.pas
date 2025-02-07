unit PassControlMore;

interface

procedure moreMemoClear;
procedure CheckBoxClear;
procedure clearStrokiMemo;
procedure checkUserAnswer;
procedure countQuest(count:integer);
procedure setQuestionInMemo(Answers:string);
procedure setRightQuestionInArrayAnswers(RightAnswers:string);
Function getClearString(answer :string ): String;

var i,j,beg:integer;
ArrayAnswers:array[1..10] of string;
ArrayRightAnswers:array[1..10] of string;

implementation

uses PassControlSingle, PassingKnowledgeControl, Add_Question, SysUtils, basa_dan,
  config, StdCtrls;

procedure checkUserAnswer;
begin
  userAnswer:='';
  with PassingKnowledgeControlForm.VariantsQuestionMore1 do
    begin
      if CheckBox1.Checked=true then userAnswer:=userAnswer+Memo11.Text+'�';
      if CheckBox2.Checked=true then userAnswer:=userAnswer+Memo2.Text+'�';
      if CheckBox3.Checked=true then userAnswer:=userAnswer+Memo3.Text+'�';
      if CheckBox4.Checked=true then userAnswer:=userAnswer+Memo4.Text+'�';
      if CheckBox5.Checked=true then userAnswer:=userAnswer+Memo5.Text+'�';
      if CheckBox6.Checked=true then userAnswer:=userAnswer+Memo6.Text+'�';
      if CheckBox7.Checked=true then userAnswer:=userAnswer+Memo7.Text+'�';
      if CheckBox8.Checked=true then userAnswer:=userAnswer+Memo8.Text+'�';
      if CheckBox9.Checked=true then userAnswer:=userAnswer+Memo9.Text+'�';
      if CheckBox10.Checked=true then userAnswer:=userAnswer+Memo10.Text+'�';
    end;
 posetivAnswer:=BD.Request.DataSet.FieldByName('�����������').AsString;
 if getClearString(posetivAnswer) = getClearString(userAnswer) then
   inc(countBall);
end;

procedure setRightQuestionInArrayAnswers(RightAnswers:string);
begin
    for i:=1 to 10 do ArrayRightAnswers[i]:='';

    if getClearString(RightAnswers) <>'' then
      begin
        beg:=1;
        j:=1;
        for i:=1 to length(RightAnswers) do
          begin
            if(RightAnswers[i]='�') then
              begin
                  ArrayRightAnswers[j]:=Copy(RightAnswers, beg, i-beg);
                  beg:=i+1;
                  inc(j);
              end;
          end;
      end;
end;

procedure setQuestionInMemo(Answers:string);
begin
    for i:=1 to 10 do ArrayAnswers[i]:='';

    if Answers<>'' then
      begin
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

    with PassingKnowledgeControlForm.VariantsQuestionMore1 do
      begin
        Memo11.Lines.Add(getClearString(ArrayAnswers[1]));
        Memo11.ScrollBars:=ssVertical;
        Memo11.SelStart:=0;
        Memo11.SelLength := 0;
        Memo11.ScrollBars:=ssnone;

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
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=3;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=false; label4.Visible:=false; CheckBox4.Visible:=false;
               Memo5.Visible:=false; label5.Visible:=false; CheckBox5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; CheckBox6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      4:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=4;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=false; label5.Visible:=false; CheckBox5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; CheckBox6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      5:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=5;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=false; label6.Visible:=false; CheckBox6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      6:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=6;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; CheckBox6.Visible:=true;
               Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      7:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=7;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; CheckBox6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; CheckBox7.Visible:=true;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      8:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=8;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; CheckBox6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; CheckBox7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; CheckBox8.Visible:=true;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
      9:
       begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=9;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; CheckBox6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; CheckBox7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; CheckBox8.Visible:=true;
               Memo9.Visible:=true; label9.Visible:=true; CheckBox9.Visible:=true;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
        end;
     10:
      begin
          with PassingKnowledgeControlForm.VariantsQuestionMore1 do
            begin
               countQuestion:=10;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=true; label4.Visible:=true; CheckBox4.Visible:=true;
               Memo5.Visible:=true; label5.Visible:=true; CheckBox5.Visible:=true;
               Memo6.Visible:=true; label6.Visible:=true; CheckBox6.Visible:=true;
               Memo7.Visible:=true; label7.Visible:=true; CheckBox7.Visible:=true;
               Memo8.Visible:=true; label8.Visible:=true; CheckBox8.Visible:=true;
               Memo9.Visible:=true; label9.Visible:=true; CheckBox9.Visible:=true;
               Memo10.Visible:=true; label10.Visible:=true; CheckBox10.Visible:=true;
            end;
        end;
    end;
end;

procedure moreMemoClear;
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

procedure CheckBoxClear;
begin
  with PassingKnowledgeControlForm.VariantsQuestionMore1 do
    begin
       CheckBox1.Checked:=false;
       CheckBox2.Checked:=false;
       CheckBox3.Checked:=false;
       CheckBox4.Checked:=false;
       CheckBox5.Checked:=false;
       CheckBox6.Checked:=false;
       CheckBox7.Checked:=false;
       CheckBox8.Checked:=false;
       CheckBox9.Checked:=false;
       CheckBox10.Checked:=false;
    end;
end;

procedure clearStrokiMemo;
var i:integer;
begin
    with PassingKnowledgeControlForm.VariantsQuestionMore1 do
      begin
        for i:=Memo11.Lines.Count-1 downto  0 do if Memo11.Lines.Strings[i]='' then Memo11.Lines.Delete(i);
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
