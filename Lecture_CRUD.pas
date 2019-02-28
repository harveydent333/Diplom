unit Lecture_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TLectureCRUD = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LectureCRUD: TLectureCRUD;

implementation

uses Title_Form, AddLecture;

{$R *.dfm}

procedure TLectureCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TLectureCRUD.SpeedButton1Click(Sender: TObject);
begin
with TAddLectureModalForm.Create(nil) do
try
  ShowModal;
  finally
  Free;
  end;
end;

end.
