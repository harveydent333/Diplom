unit Ycheniki_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TYchenikiCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YchenikiCRUD: TYchenikiCRUD;

implementation

uses basa_dan, Title_Form, Menu_Teacher, AuthorizationData;

{$R *.dfm}

procedure TYchenikiCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TYchenikiCRUD.SpeedButton6Click(Sender: TObject);
begin
RegistrationForm.Show;
DataModule1.YchenikADO.Append;
DataModule1.ADOModuleLecture.Close;
DataModule1.ADOModuleLecture.SQL.Clear;
RegistrationForm.SpeedButton2.Visible:=true;
//RegistrationForm.Height:=699;
//RegistrationForm.Width:=1188;
//MainMenu.Close;
RegistrationForm.Position:=poDesktopCenter;
AuthorizationData.defoltConfigRegistrationForm;

  RegistrationForm.label7.Caption:=nameUser;
  RegistrationForm.label8.Caption:=familyUser;
if (roleUser='teacher') then RegistrationForm.Label6.Caption:='�������������' else RegistrationForm.Label6.Caption:='�����������';
end;

procedure TYchenikiCRUD.SpeedButton1Click(Sender: TObject);
var str,login:string;
begin
login:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+' '+
       DBGrid1.DataSource.DataSet.FieldByName('���').AsString+' '+
       DBGrid1.DataSource.DataSet.FieldByName('��������').AsString;
str:='DELETE FROM ������ WHERE login='+#39+login+#39;
 DataModule1.ADOModuleLecture.SQL.Clear;
 DataModule1.ADOModuleLecture.SQL.Add(str);
 DataModule1.ADOModuleLecture.ExecSQL;
 DataModule1.YchenikADO.Active:=false;
 DataModule1.YchenikADO.Active:=true;
end;

end.
