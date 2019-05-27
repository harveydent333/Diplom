unit ControlCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Buttons, StdCtrls;

type
  TDataManagementCenter = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataManagementCenter: TDataManagementCenter;

implementation

uses Tema_CRUD, Razdel_CRUD, Lecture_CRUD, Practic_CRUD, Control_CRUD,
  Title_Form,
  Unit2,
  Main_Menu,
  AuthorizationData,
  MultiMedia_CRUD, config;

{$R *.dfm}

procedure TDataManagementCenter.SpeedButton1Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    TemaCRUD.show;
    TemaCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton2Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    RazdelCRUD.Show;
    RazdelCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton3Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    LectureCRUD.show;
    LectureCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton4Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    PracticCRUD.show;
    PracticCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton5Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    ControlCRUD.show;
    ControlCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton6Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TDataManagementCenter.SpeedButton8Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton7Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

procedure TDataManagementCenter.SpeedButton9Click(Sender: TObject);
begin
    rebootRequestsCRUD;
    MultiMediaCRUD.show;
    MultiMediaCRUD.Position:=poDesktopCenter;
    DataManagementCenter.Visible:=false;
end;

end.
