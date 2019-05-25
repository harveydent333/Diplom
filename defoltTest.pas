unit defoltTest;

interface

procedure checkOtvet;
Function getClearString(answer :string ): String;

var countBall,exitPoint:integer;
posetivAnswer, userAnswer:string;

implementation

uses PassingKnowledgeControl, Variants_Question_More, Control_CRUD,
  Add_Question, Menu_Control, SysUtils;

procedure checkOtvet;
begin   {
    posetivAnswer:=getClearString(PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString);

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
  end;     }
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

end.
