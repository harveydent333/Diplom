unit Manager_Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TManagerUsers = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    teacher_ON: TImage;
    stydent_ON: TImage;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ManagerUsers: TManagerUsers;

implementation

uses basa_dan, config, UpdateUnit, Unit2, Main_Menu, Title_Form,
  Ycheniki_CRUD, Teacher_CRUD, AuthorizationData, ShellAPI;

{$R *.dfm}

procedure TManagerUsers.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    ManagerUsers.Visible:=false;
end;

procedure TManagerUsers.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    ManagerUsers.Visible:=false;
end;

procedure TManagerUsers.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

procedure TManagerUsers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    ManagerUsers.Visible:=false;
end;

procedure TManagerUsers.SpeedButton1Click(Sender: TObject);
begin
     config.rebootRequestsCRUD;
    YchenikiCRUD.show;
    YchenikiCRUD.Position:=poDesktopCenter;
    ManagerUsers.Visible:=false;
end;

procedure TManagerUsers.SpeedButton6Click(Sender: TObject);
begin
    config.rebootRequestsCRUD;
    TeacherCRUD.show;
    TeacherCRUD.Position:=poDesktopCenter;
    ManagerUsers.Visible:=false;
end;

procedure TManagerUsers.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
