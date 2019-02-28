unit PassingKnowledgeControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, basa_dan, Grids, DBGrids , defoltTest;

type
  TPassingKnowledgeControlForm = class(TForm)
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    RadioButton1: TRadioButton;
    DBMemo6: TDBMemo;
    Button1: TButton;
    Label1: TLabel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    DBMemo9: TDBMemo;
    DBMemo10: TDBMemo;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassingKnowledgeControlForm: TPassingKnowledgeControlForm;

implementation

uses AuthorizationData, Result, Control;
{$R *.dfm}

procedure TPassingKnowledgeControlForm.Button1Click(Sender: TObject);
var i:integer; str2,str:string;
TrueAnswer,UserAnswer:string;   Vsego:integer; x:real;
begin

vsego:=KnowledgeControl.DBGrid9.DataSource.DataSet.RecordCount;
if DBGrid1.DataSource.DataSet.Eof = false then
begin
  TrueAnswer:=DBGrid1.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString;
  if RadioButton1.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета1').AsString;
  if RadioButton2.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета2').AsString;
  if RadioButton3.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета3').AsString;
  if RadioButton4.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета4').AsString;
  if RadioButton5.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета5').AsString;
  if RadioButton6.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета6').AsString;
  if RadioButton7.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета7').AsString;
  if RadioButton8.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета8').AsString;
  if RadioButton9.Checked = true then
    UserAnswer:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета9').AsString;

  IF ((TrueAnswer = UserAnswer) and (TrueAnswer<>'')) then Good_Ball:=Good_Ball+1
    else
      Bed_Ball:=Bed_Ball+1;

dbgrid1.DataSource.DataSet.Next;
label2.Caption:=floattostr(AuthorizationData.Good_Ball);
for i:=2 to 9 do
  begin
  str2:=DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString;
str:='SELECT СодержаниеОтвета'+inttostr(i)+' FROM Вопросы WHERE СодержаниеВопроса='+#39+str2+#39+';';
DataModule1.SearchQuestADO.SQL.Clear;
DataModule1.SearchQuestADO.SQL.Add(str);
DataModule1.SearchQuestADO.Open;
str:=inttostr(i);
if dbgrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета'+str).AsString<>'' then
 label5.Caption:=inttostr(i);
end;
i:=strtoint(label5.Caption);
case i of
  2: defoltTest.question2;
  3: defoltTest.question3;
  4: defoltTest.question4;
  5: defoltTest.question5;
  6: defoltTest.question6;
  7: defoltTest.question7;
  8: defoltTest.question8;
  9: defoltTest.question9;
    end;
    button1.Enabled:=false;
    if Good_Ball+Bed_Ball = KnowledgeControl.DBGrid9.DataSource.DataSet.RecordCount then
      begin
        button1.Caption:='Завершить';   button1.Enabled:=true;
          Radiobutton1.enabled:=false; Radiobutton2.enabled:=false; Radiobutton3.enabled:=false; Radiobutton4.enabled:=false;
Radiobutton5.enabled:=false; Radiobutton6.enabled:=false; Radiobutton7.enabled:=false; Radiobutton8.enabled:=false;
Radiobutton9.enabled:=false;
DBMemo6.Enabled:=false;
      end;
end
  else
    ResultForm.show;
    ResultForm.Label1.Caption:=floattostr(Good_Ball);
    ResultForm.Label3.Caption:=floattostr((Good_Ball/Vsego)*100);
    ResultForm.Label9.Caption:=floattostr((Good_Ball/Vsego)*100);      //% верно
    ResultForm.Label7.Caption:=floattostr((Bed_Ball/Vsego)*100);
    ResultForm.Label11.Caption:=floattostr(Good_Ball);
    ResultForm.label5.Caption:=floattostr(Bed_Ball);
   x:=((Good_Ball/Vsego)*100);
   if x<=49 then
    begin
      Mark:=2;
      ResultForm.Label23.Caption:='2';
      DataModule1.ShyrnalADO.Edit;
      DataModule1.ShyrnalADO.FieldByName('Оценка').Value:=Mark;
    end;
   if x>=85 then
    begin
      Mark:=5;
      ResultForm.Label23.Caption:='5';
     DataModule1.ShyrnalADO.Edit;
     DataModule1.ShyrnalADO.FieldByName('Оценка').Value:=Mark;
    end;
    if ((x>=50)and (x<=69)) then
    begin
      Mark:=3;
      ResultForm.Label23.Caption:='3';
     DataModule1.ShyrnalADO.Edit;
     DataModule1.ShyrnalADO.FieldByName('Оценка').Value:=Mark;
    end;
    if ((x>=70)and(x<=84)) then
    begin
      Mark:=4;
      ResultForm.Label23.Caption:='4';
      DataModule1.ShyrnalADO.Edit;
      DataModule1.ShyrnalADO.FieldByName('Оценка').Value:=Mark;
    end;
    Radiobutton1.Checked:=false; Radiobutton2.Checked:=false; Radiobutton3.Checked:=false; Radiobutton4.Checked:=false;
Radiobutton5.Checked:=false; Radiobutton6.Checked:=false; Radiobutton7.Checked:=false; Radiobutton8.Checked:=false;
Radiobutton9.Checked:=false;

end;
procedure TPassingKnowledgeControlForm.RadioButton1Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton2Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton3Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton4Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton5Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton6Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton7Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton8Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.RadioButton9Click(Sender: TObject);
begin
button1.Enabled:=true;
end;

procedure TPassingKnowledgeControlForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModule1.ShyrnalADO.Cancel;
end;

end.
