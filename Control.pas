unit Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, jpeg, StdCtrls , basa_dan, Grids,
  DBGrids, Menus , AddRazdel, Mask, DBCtrls ;

type
  TKnowledgeControl = class(TForm)
    TreeView1: TTreeView;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid4: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBEdit1: TDBEdit;
    DBGrid5: TDBGrid;
    Label1: TLabel;
    defolt_edit1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    bed_edit1: TImage;
    good_edit1: TImage;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid6: TDBGrid;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    DBGrid7: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid8: TDBGrid;
    SpeedButton15: TSpeedButton;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBGrid9: TDBGrid;
    Label21: TLabel;
    Label22: TLabel;
    DateTimePicker1: TDateTimePicker;
    DBGrid10: TDBGrid;
    DBGrid11: TDBGrid;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton17: TSpeedButton;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KnowledgeControl: TKnowledgeControl;
  t:integer;
  MyNode: TTreeNode;
  NameRazdelForAddTema:string;
  NameTemaForAddControl:string;
implementation

uses AddTema, AddControl, Title_Form, Add_Question, Unit3, AuthorizationData,
  Unit2, PassingKnowledgeControl , defoltTest, Result, Main_Menu;


{$R *.dfm}

procedure TKnowledgeControl.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
t:= node.AbsoluteIndex;
MyNode:=node;
end;

procedure TKnowledgeControl.FormCreate(Sender: TObject);
var NameRazdela, NameTema, KodRazdela,str, KodTema, NameControl,KodControl, NameVar:string;
i:integer;
begin
    //РАЗДЕЛ
dbgrid1.DataSource.DataSet.First;
while not dbgrid1.DataSource.DataSet.Eof do
  begin
     NameRazdela:=dbgrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;
     Treeview1.Items.Add(MyNode,NameRazdela);
     dbgrid1.DataSource.DataSet.Next;
  end;
     //ТЕМА
dbgrid2.DataSource.DataSet.First;
while not dbgrid2.DataSource.DataSet.Eof do
  begin
     KodRazdela:=dbgrid2.DataSource.DataSet.FieldByName('КодРаздела').AsString;
     NameTema:=dbgrid2.DataSource.DataSet.FieldByName('НазваниеТемы').AsString;
     DataModule1.ADOModuleLecture.SQL.Clear;
     str:='SELECT * FROM Раздел WHERE КодРаздела='+KodRazdela;
    DataModule1.ADOModuleLecture.SQL.Add(str);
     DataModule1.ADOModuleLecture.Open;
     NameRazdela:=DataModule1.ADOModuleLecture.FieldByName('НазваниеРаздела').AsString;
     for i := 0 to TreeView1.Items.Count - 1 do
      begin
        TreeView1.Selected:= TreeView1.Items[i];
        if Treeview1.Selected.Text=NameRazdela then
             Treeview1.Items.AddChild(MyNode,NameTema);
      end;
       dbgrid2.DataSource.DataSet.Next;
    end;        
    //КОНТРОЛЬ
       dbgrid4.DataSource.DataSet.First;
while not dbgrid4.DataSource.DataSet.Eof do
  begin
     KodTema:=dbgrid4.DataSource.DataSet.FieldByName('КодТемы').AsString;
     NameControl:=dbgrid4.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString;
     DataModule1.ADOModuleLecture.SQL.Clear;
     str:='SELECT * FROM Тема WHERE КодТемы='+KodTema;
    DataModule1.ADOModuleLecture.SQL.Add(str);
     DataModule1.ADOModuleLecture.Open;
     NameTema:=DataModule1.ADOModuleLecture.FieldByName('НазваниеТемы').AsString;
     for i := 0 to TreeView1.Items.Count - 1 do
      begin
        TreeView1.Selected:= TreeView1.Items[i];
        if Treeview1.Selected.Text=NameTema then
             Treeview1.Items.AddChild(MyNode,NameControl);
      end;
       dbgrid4.DataSource.DataSet.Next;
    end;
end;

procedure TKnowledgeControl.SpeedButton2Click(Sender: TObject);
begin
KnowLedgeControl.Close;
MainMenu.show;
MainMenu.Position:=poDesktopCenter;
end;

procedure TKnowledgeControl.TreeView1Click(Sender: TObject);
var str:string;   Kod:integer;
begin
if AuthorizationData.roleUser='teacher' then
  begin
    //НАЖАЛИ НА РАЗДЕЛ
    if (treeview1.Selected.Parent=nil) then
      begin
        speedbutton7.visible:=false; //добавить контроль
        speedbutton8.visible:=true; // удалить раздел
        speedbutton6.visible:=true;   //добавить тему
        speedbutton1.visible:=true; //добавить раздел
        speedbutton9.visible:=false; //удалить тему
        speedbutton10.visible:=false; //удалить контроль
        speedbutton11.visible:=false; //редактор вопросов
        speedbutton13.Visible:=false;
        speedbutton14.Visible:=false;
        speedbutton8.Left:=344;
        speedbutton8.Top:=144;

        speedbutton6.Left:=344;
        speedbutton6.Top:=192;

        label1.Visible:=true;
        speedbutton12.Visible:=true;
        speedbutton12.Enabled:=false;
        dbedit1.Visible:=true;
        bed_edit1.Visible:=false; good_edit1.Visible:=false; defolt_edit1.Visible:=true;

        label2.Visible:=false; label3.Visible:=false;
        dbedit2.Visible:=false;
        dbedit3.Visible:=false;
      end;
      // НАЖАЛИ НА ТЕМУ
      if treeview1.Selected.Parent<>nil then
        if treeview1.Selected.Parent.Parent=nil then
          begin
            speedbutton1.Visible:=false; //добавить раздел
            speedbutton6.Visible:=false; //добавить тему
            speedbutton8.Visible:=false; // удалить раздел
            speedbutton9.Visible:=true;  //удалить тему
            speedbutton10.Visible:=false; //удалить контроль
            speedbutton7.Visible:=true; //добавить контроль
            speedbutton11.Visible:=false; //редактор вопросов
            speedbutton7.Left:=344;
            speedbutton7.Top:=96;

            speedbutton9.Left:=344;
            speedbutton9.Top:=144;

            label1.Visible:=false;speedbutton12.visible:=false;dbedit1.Visible:=false;
            bed_edit1.Visible:=false; good_edit1.Visible:=false; defolt_edit1.Visible:=false;
            dbedit3.Visible:=false; label3.Visible:=false; speedbutton14.Visible:=false;

            label2.Visible:=true; dbedit2.Visible:=true; speedbutton13.Visible:=true;

            label2.Left:=392; label2.Top:=248;
            dbedit2.Left:=608; dbedit2.Top:=255;
            speedbutton13.Left:=992; speedbutton13.Top:=245;
            speedbutton13.Enabled:=false;
          end;

      // НАЖАЛИ НА КОНТРОЛЬ
      if treeview1.Selected.Parent<>nil then
        if treeview1.Selected.Parent.Parent<>nil then
          begin
            speedbutton1.Visible:=false; //добавить раздел
            speedbutton6.Visible:=false; //добавить тему
            speedbutton8.Visible:=false; // удалить раздел
            speedbutton9.Visible:=false;  //удалить тему
            speedbutton10.Visible:=true; //удалить контроль
            speedbutton7.Visible:=false; //добавить контроль
            speedbutton11.Visible:=false; //редактор вопросов  !!!!!!

            speedbutton11.Left:=344;
            speedbutton11.Top:=96;

            speedbutton10.Left:=344;
            speedbutton10.Top:=144;

            label1.Visible:=false;speedbutton12.visible:=false;dbedit1.Visible:=false;
            bed_edit1.Visible:=false; good_edit1.Visible:=false; defolt_edit1.Visible:=false;
            dbedit2.Visible:=false; label2.Visible:=false; speedbutton13.Visible:=false;

            dbedit3.Visible:=True; label3.Visible:=True; speedbutton14.Visible:=True;

            label3.Left:=336; label3.Top:=248;
            dbedit3.Left:=608; dbedit3.Top:=255;
            speedbutton14.Left:=992; speedbutton14.Top:=245;
            speedbutton14.Enabled:=false;
          end;
          //Изменение Раздела
          DataModule1.EditRazdelADO.SQL.Clear;
          str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Treeview1.Selected.Text+#39;
          DataModule1.EditRazdelADO.SQL.Add(str);
          DataModule1.EditRazdelADO.Open;
          //Изменение Темы
          DataModule1.EditTemaADO.SQL.Clear;
          str:='SELECT * FROM Тема WHERE НазваниеТемы='+#39+Treeview1.Selected.Text+#39;
          DataModule1.EditTemaADO.SQL.Add(str);
          DataModule1.EditTemaADO.Open;
          //Изменение Контроля
          DataModule1.EditControlADO.SQL.Clear;
          str:='SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+Treeview1.Selected.Text+#39;
          DataModule1.EditControlADO.SQL.Add(str);
          DataModule1.EditControlADO.Open;
  end
  else
    begin                                                  //ТУТ КНОПКА НАЧАТЬ ТЕСТ!!!!!!!!!!!
  if treeview1.Selected.Parent<>nil then
    if treeview1.Selected.Parent.Parent<>nil then
      begin
         panel1.Visible:=true;
         speedbutton15.Visible:=true;
        label20.Caption:=treeview1.Selected.Text;
        label20.Caption:=label20.Caption+'"';
        DataModule1.ADOModuleLecture.SQL.Clear;
        str:='SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+TreeView1.Selected.Text+#39;
        DataModule1.ADOModuleLecture.SQL.Add(str);
        DataModule1.ADOModuleLecture.Open;
        Kod:=DBGrid9.DataSource.DataSet.FieldByName('КодКонтроля').AsInteger;
        DataModule1.ADOModuleLecture.SQL.Clear;
        str:='SELECT * FROM Вопросы WHERE КодКонтроля='+inttostr(Kod);
        label21.Caption:=inttostr(Kod);
        DataModule1.ADOModuleLecture.SQL.Add(str);
        DataModule1.ADOModuleLecture.Open;
        label14.Caption:=inttostr(DBGrid9.DataSource.DataSet.RecordCount);
        if label14.Caption='0' then
          speedbutton15.Enabled:=false else speedbutton15.Enabled:=true;
      end
      else
        begin
          panel1.Visible:=false;
          speedbutton15.Visible:=false;
        end;
    end;
end;

procedure TKnowledgeControl.SpeedButton4Click(Sender: TObject);
begin
KnowledgeControl.Close;
TitleForm.close;
end;

procedure TKnowledgeControl.SpeedButton1Click(Sender: TObject);
begin
with TAddRazdelModalForm.Create(nil) do
try
  ShowModal;
  finally
  Free;
  end;
end;

procedure TKnowledgeControl.SpeedButton6Click(Sender: TObject);
begin
 with TAddTemaModalForm.Create(nil) do
try
  ShowModal;
  finally
  Free;
  end;
end;

procedure TKnowledgeControl.SpeedButton8Click(Sender: TObject);
var str:string;
begin

DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Treeview1.Selected.Text+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.Open;
    if (not (DataModule1.ADOModuleLecture.IsEmpty)) then
      begin
    DataModule1.ADOModuleLecture.Delete;
    Treeview1.Selected.Delete;
  end;
end;

procedure TKnowledgeControl.SpeedButton9Click(Sender: TObject);
var str:string;
begin
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Тема WHERE НазваниеТемы='+#39+Treeview1.Selected.Text+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
DataModule1.ADOModuleLecture.Delete;
Treeview1.Selected.Delete;
end;

procedure TKnowledgeControl.SpeedButton10Click(Sender: TObject);
var str:string;
begin
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+Treeview1.Selected.Text+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
DataModule1.ADOModuleLecture.Delete;
Treeview1.Selected.Delete;
end;

procedure TKnowledgeControl.SpeedButton12Click(Sender: TObject);
begin
DataModule1.EditRazdelADO.Edit;//ADOQuery1.Insert;
DataModule1.EditRazdelADO.FieldByName('НазваниеРаздела').AsString:=DBEdit1.Text;
Treeview1.Selected.Text:=DBEdit1.Text;
end;

procedure TKnowledgeControl.SpeedButton13Click(Sender: TObject);
begin
DataModule1.EditTemaADO.Edit;//ADOQuery1.Insert;
DataModule1.EditTemaADO.FieldByName('НазваниеТемы').AsString:=DBEdit2.Text;
Treeview1.Selected.Text:=DBEdit2.Text;
end;

procedure TKnowledgeControl.SpeedButton14Click(Sender: TObject);
begin
DataModule1.EditControlADO.Edit;//ADOQuery1.Insert;
DataModule1.EditControlADO.FieldByName('НазваниеКонтроля').AsString:=DBEdit3.Text;
Treeview1.Selected.Text:=DBEdit3.Text;
end;

procedure TKnowledgeControl.SpeedButton11Click(Sender: TObject);
var str:string;
begin
//Add_Questions.label9.Caption:=nameUser;
//Add_Questions.label10.Caption:=familyUser;
//if treeview1.Selected.Parent<>nil then
 // if treeview1.Selected.Parent.Parent<>nil then
   // begin
   // str:='SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+treeview1.Selected.text+#39;
   //  DataModule1.SearchKodControlADO.SQL.Clear;
   // DataModule1.SearchKodControlADO.SQL.Add(str);
   // DataModule1.SearchKodControlADO.Open;
  //  label10.Caption:=DBGrid8.DataSource.DataSet.FieldByName('КодКонтроля').AsString;
 //   AuthorizationData.KodControla:=strtoint(label10.Caption);
  // end;

//str:='SELECT * FROM Вопросы WHERE КодВарианта='+label10.Caption;
//DataModule1.AddQuestionADO.SQL.Clear;
//DataModule1.AddQuestionADO.SQL.Add(str);
//DataModule1.AddQuestionADO.Open;
    Add_Questions.show;

//КОД ДЛЯ КНОПКИ СОЗДАНИЯ ВОПРОСОВ///
with Add_Questions do
  begin
  label5.Caption:='0';
  label2.caption:=inttostr(DataModule1.AddQuestionADO.RecordCount);



  end;
end;

procedure TKnowledgeControl.SpeedButton5Click(Sender: TObject);
begin
AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;
AuthorizationForm.show;
AuthorizationForm.Position:=poDesktopCenter;
KnowledgeControl.Close;
MainMenu.close;
end;

procedure TKnowledgeControl.DBEdit2Change(Sender: TObject);
begin
defolt_edit1.Visible:=false;
if dbedit2.Text='' then
  begin
    good_edit1.Visible:=false;
    bed_edit1.Visible:=true;
     speedbutton13.Enabled:=false;
  end
else
  begin
    good_edit1.Visible:=true;
    bed_edit1.Visible:=false;
    speedbutton13.Enabled:=true;
  end;
end;

procedure TKnowledgeControl.DBEdit3Change(Sender: TObject);
begin
defolt_edit1.Visible:=false;
if dbedit3.Text='' then
  begin
    good_edit1.Visible:=false;
    bed_edit1.Visible:=true;
     speedbutton14.Enabled:=false;
  end
else
  begin
    good_edit1.Visible:=true;
    bed_edit1.Visible:=false;
    speedbutton14.Enabled:=true;
  end;
end;

procedure TKnowledgeControl.DBEdit1Change(Sender: TObject);
begin
defolt_edit1.Visible:=false;
if dbedit1.Text='' then
  begin
    good_edit1.Visible:=false;
    bed_edit1.Visible:=true;
     speedbutton12.Enabled:=false;
  end
else
  begin
    good_edit1.Visible:=true;
    bed_edit1.Visible:=false;
    speedbutton12.Enabled:=true;
  end;

end;

procedure TKnowledgeControl.SpeedButton15Click(Sender: TObject);
var i:integer; str2,str:string;
begin
PassingKnowledgeControlForm.RadioButton1.Enabled:=true;
PassingKnowledgeControlForm.RadioButton2.Enabled:=true;
PassingKnowledgeControlForm.RadioButton3.Enabled:=true;
PassingKnowledgeControlForm.RadioButton4.Enabled:=true;
PassingKnowledgeControlForm.RadioButton5.Enabled:=true;
PassingKnowledgeControlForm.RadioButton6.Enabled:=true;
PassingKnowledgeControlForm.RadioButton7.Enabled:=true;
PassingKnowledgeControlForm.RadioButton8.Enabled:=true;
PassingKnowledgeControlForm.RadioButton9.Enabled:=true;
PassingKnowledgeControlForm.DBMemo6.Enabled:=true;
PassingKnowledgeControlForm.Button1.Caption:='Далее';

PassingKnowledgeControlForm.Caption:=treeview1.Selected.text;

DateTimePicker1.Date:=now;
DataControl:=datetostr(DateTimePicker1.Date);
DataModule1.Test.SQL.Clear;
str:='SELECT * FROM Вопросы WHERE КодКонтроля='+label21.Caption;
DataModule1.Test.SQL.Add(str);
DataModule1.Test.Open;
PassingKnowledgeControlForm.show;
PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.First;
AuthorizationData.Good_Ball:=0;
AuthorizationData.Bed_Ball:=0;
PassingKnowledgeControlForm.Button1.Enabled:=false;


PassingKnowledgeControlForm.label5.Caption:='2';
for i:=2 to 9 do
  begin
  str2:=PassingKnowledgeControlForm.DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString;
str:='SELECT СодержаниеОтвета'+inttostr(i)+' FROM Вопросы WHERE СодержаниеВопроса='+#39+str2+#39+';';
DataModule1.ADOModuleLecture.SQL.Clear;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
str:=inttostr(i);
if PassingKnowledgeControlForm.dbgrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета'+str).AsString<>'' then
 label5.Caption:=inttostr(i);
end;
i:=strtoint(PassingKnowledgeControlForm.label5.Caption);
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


//+ ДОБАВЫЛЕНИЕ В ЖУРНАЛ///
DataModule1.ShyrnalADO.Append;
DataModule1.ShyrnalADO.Edit;
DataModule1.ShyrnalADO.FieldByName('КодУченика').Value:=KodUser;
DataModule1.ShyrnalADO.FieldByName('ДатаПроведения').Value:=DataControl;
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Тема WHERE НазваниеТемы='+#39+treeview1.Selected.Parent.Text+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
label23.Caption:=DBGrid11.DataSource.DataSet.FieldByName('КодТемы').AsString;
DataModule1.ShyrnalADO.FieldByName('КодТемы').Value:=label23.Caption;

DataModule1.ShyrnalADO.FieldByName('Имя').Value:=nameUser;
DataModule1.ShyrnalADO.FieldByName('Фамилия').Value:=familyUser;
DataModule1.ShyrnalADO.FieldByName('Отчество').Value:=secondNameUser;
DataModule1.ShyrnalADO.FieldByName('НазваниеТемы').Value:=treeview1.Selected.Parent.Text;
  //              DataModule1.ShyrnalADO.Edit;
//DataModule1.ShyrnalADO.FieldByName('Оценка').Value:=Mark;
//DataModule1.ShyrnalADO.Post;
//////////////////////////


//ИТОГ///
ResultForm.Label20.Caption:=TreeView1.Selected.Text;
ResultForm.Label20.Caption:=ResultForm.Label20.Caption+'"';
ResultForm.label14.Caption:=inttostr(DBGrid9.DataSource.DataSet.RecordCount);
ResultForm.Label22.Caption:=inttostr(DBGrid9.DataSource.DataSet.RecordCount);

/////////



end;

procedure TKnowledgeControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
MainMenu.show;
end;

end.
