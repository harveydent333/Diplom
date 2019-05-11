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
    DBGrid2: TDBGrid;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YchenikiCRUD: TYchenikiCRUD;
       login:string;

implementation

uses basa_dan, Title_Form, Menu_Teacher, AuthorizationData, config, UpdateUnit,
  ControlCenter,
  Unit2;

{$R *.dfm}

procedure TYchenikiCRUD.SpeedButton6Click(Sender: TObject);       // ���������� ������ �������
begin
    RegistrationForm.Show;
    DataModule1.YchenikADO.Append;
    RegistrationForm.SpeedButton2.Visible:=true;
    AuthorizationData.defoltConfigRegistrationForm;
end;

procedure TYchenikiCRUD.SpeedButton1Click(Sender: TObject);       // �������� �������
begin
    config.execRequestSQL('DELETE FROM ������ WHERE login='+#39+login+#39);
    config.rebootRequestsCRUD;
end;

procedure TYchenikiCRUD.SpeedButton7Click(Sender: TObject);
begin
    login:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+' '+
      DBGrid1.DataSource.DataSet.FieldByName('���').AsString+' '+
      DBGrid1.DataSource.DataSet.FieldByName('��������').AsString;
    config.selectRequestSQL('SELECT * FROM ������ WHERE login='+#39+login+#39);
    updateKodYchenika:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;
end;

procedure TYchenikiCRUD.SpeedButton3Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;
procedure TYchenikiCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

end.
