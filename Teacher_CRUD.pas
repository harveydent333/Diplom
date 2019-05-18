unit Teacher_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TTeacherCRUD = class(TForm)
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
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TeacherCRUD: TTeacherCRUD;

implementation

uses Title_Form, Unit2, Manager_Users, Add_Question, basa_dan, config,
  UpdateUnit, AuthorizationData, Menu_Teacher, Registration_Teacher;

{$R *.dfm}

procedure TTeacherCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

procedure TTeacherCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.SpeedButton2Click(Sender: TObject);
begin
    ManagerUsers.show;
    ManagerUsers.position:=poDesktopCenter;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ManagerUsers.show;
    ManagerUsers.position:=poDesktopCenter;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.SpeedButton1Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM ������� WHERE login='+#39+DBGrid1.DataSource.DataSet.FieldByName('login').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TTeacherCRUD.SpeedButton6Click(Sender: TObject);
begin
    RegistrationTeacher.Show;
    AuthorizationData.defoltConfigRegistrationTeacherForm;
    TeacherCRUD.Visible:=false;
end;

end.
