unit MultiMedia_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MPlayer, Grids, DBGrids, Buttons, jpeg;

type
  TMultiMediaCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MultiMediaCRUD: TMultiMediaCRUD;

implementation

uses config, basa_dan, ControlCenter, Title_Form, Unit2, AuthorizationData;

{$R *.dfm}

procedure TMultiMediaCRUD.SpeedButton2Click(Sender: TObject);
begin
    MultiMediaCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
end;

procedure TMultiMediaCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TMultiMediaCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MultiMediaCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
end;

procedure TMultiMediaCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MultimediaCRUD.Visible:=false;
end;

procedure TMultiMediaCRUD.SpeedButton1Click(Sender: TObject);
begin{
 with TAddControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;  }
end;

end.
