unit DocumentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls, RpCon,
  RpConDS, RpDefine, RpRave, QuickRpt, QRCtrls;

type
  TShyrnal = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Shyrnal: TShyrnal;

implementation
     uses basa_dan, Unit3, Unit2, AuthorizationData, Title_Form, Main_Menu;
{$R *.dfm}

procedure TShyrnal.SpeedButton1Click(Sender: TObject);
begin
    MainMenu.show;
    Shyrnal.Close;
end;

procedure TShyrnal.SpeedButton3Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.show;
    Shyrnal.Close;
    MainMenu.Close;
end;

procedure TShyrnal.SpeedButton6Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TShyrnal.FormClose(Sender: TObject; var Action: TCloseAction);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TShyrnal.Button1Click(Sender: TObject);
begin
if roleUser='teacher' then
//QuickRep2.Preview else
//QuickRep1.Preview;
end;

end.
