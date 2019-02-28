unit Stydent_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, jpeg, ExtCtrls;

type
  TStydentCRUD = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StydentCRUD: TStydentCRUD;

implementation

{$R *.dfm}

end.
