unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Buttons, StdCtrls, DBCtrls , AuthorizationData,
  Grids, DBGrids;

type
  TMainMenu = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMenu: TMainMenu;

implementation

uses Unit2, Menu_Teacher, Title_Form, basa_dan, Control, DocumentForm;

{$R *.dfm}

procedure TMainMenu.SpeedButton5Click(Sender: TObject);
begin
RegistrationForm.Show;
DataModule1.YchenikADO.Append;
DataModule1.ADOModuleLecture.Close;
DataModule1.ADOModuleLecture.SQL.Clear;
RegistrationForm.SpeedButton2.Visible:=true;
RegistrationForm.Height:=699;
RegistrationForm.Width:=1188;
MainMenu.Close;
RegistrationForm.Position:=poDesktopCenter;
AuthorizationData.defoltConfigRegistrationForm;

  RegistrationForm.label7.Caption:=nameUser;
  RegistrationForm.label8.Caption:=familyUser;
end;

procedure TMainMenu.SpeedButton6Click(Sender: TObject);
begin
AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;

AuthorizationForm.Visible:=true;;
MainMenu.Visible:=false;
TitleForm.Height:=699;
TitleForm.Width:=1188;
end;

procedure TMainMenu.SpeedButton1Click(Sender: TObject);
begin
KnowledgeControl.show;
if KnowLedgeControl.TreeView1.Items.Count<>0 then
  KnowledgeControl.TreeView1.Selected:=KnowledgeControl.TreeView1.Items[0];
  if AuthorizationData.roleUser='teacher' then
    AuthorizationData.defoltKnowledgeControl
  else
    AuthorizationData.defoltKnowledgeControlStydent;
    if (roleUser='teacher') then KnowledgeControl.Label27.Caption:='Преподаватель' else KnowledgeControl.Label27.Caption:='Обучающийся';
end;

procedure TMainMenu.FormCreate(Sender: TObject);
begin
label1.Caption:=AuthorizationData.nameUser;
end;

procedure TMainMenu.SpeedButton4Click(Sender: TObject);
begin
MainMenu.Close;
TitleForm.Close;
end;

procedure TMainMenu.SpeedButton2Click(Sender: TObject);
var str:string;
begin
MainMenu.Close;
Shyrnal.show;
Shyrnal.Label1.Caption:=nameUser;
Shyrnal.Label2.Caption:=familyUser;

if roleUser='stydent' then
  begin
    str:='SELECT * FROM Ученик WHERE login='+#39+loginUser+#39;
    DataModule1.ADOModuleLecture.SQL.clear;
    DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.Open;
    str:='SELECT * FROM Журнал WHERE КодУченика='+dbgrid1.DataSource.DataSet.fieldbyName('КодУченика').AsString;
    DataModule1.ShyrnalADO.SQL.clear;
    DataModule1.ShyrnalADO.SQL.Add(str);
    DataModule1.ShyrnalADO.Open;
    if (roleUser='teacher') then Shyrnal.Label3.Caption:='Преподаватель' else Shyrnal.Label3.Caption:='Обучающийся';
  end;
end;

end.
