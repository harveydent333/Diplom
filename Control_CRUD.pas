unit Control_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls;

type
  TControlCRUD = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlCRUD: TControlCRUD;

implementation

uses Title_Form;

{$R *.dfm}

procedure TControlCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

end.
