unit ControlCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Buttons;

type
  TDataManagementCenter = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataManagementCenter: TDataManagementCenter;

implementation

uses Tema_CRUD, Razdel_CRUD, Lecture_CRUD, Practic_CRUD, Control_CRUD;

{$R *.dfm}

procedure TDataManagementCenter.SpeedButton1Click(Sender: TObject);
begin
    TemaCRUD.show;
end;

procedure TDataManagementCenter.SpeedButton2Click(Sender: TObject);
begin
    RazdelCRUD.Show;
end;

procedure TDataManagementCenter.SpeedButton3Click(Sender: TObject);
begin
    LectureCRUD.show;
end;

procedure TDataManagementCenter.SpeedButton4Click(Sender: TObject);
begin
    PracticCRUD.show;
end;

procedure TDataManagementCenter.SpeedButton5Click(Sender: TObject);
begin
    ControlCRUD.show;
end;

end.
