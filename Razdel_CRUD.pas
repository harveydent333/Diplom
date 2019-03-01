unit Razdel_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, basa_dan, Buttons, StdCtrls;

type
  TRazdelCRUD = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RazdelCRUD: TRazdelCRUD;

implementation

uses Title_Form, AddRazdel;

{$R *.dfm}

procedure TRazdelCRUD.SpeedButton7Click(Sender: TObject);
var str:string;
begin
  str:='DELETE FROM –‡Á‰ÂÎ WHERE Õ‡Á‚‡ÌËÂ–‡Á‰ÂÎ‡='+#39+DBGrid1.DataSource.DataSet.FieldByName('Õ‡Á‚‡ÌËÂ–‡Á‰ÂÎ‡').AsString+#39;
  DataModule1.ADOModuleLecture.SQL.Clear;
  DataModule1.ADOModuleLecture.SQL.Add(str);
  DataModule1.ADOModuleLecture.ExecSQL;

 //==============¡ÀŒ  Œ¡ÕŒ¬À≈Õ»ﬂ “¿¡À»÷ œŒ—À≈ ”ƒ¿À≈Õ»ﬂ –¿«ƒ≈À¿===============

  DataModule1.ADORazdelCRUD.Active:=False;
  DataModule1.ADORazdelCRUD.Active:=True;

  DataModule1.ADOTemaCRUD.Active:=False;
  DataModule1.ADOTemaCRUD.Active:=True;

  DataModule1.ADOLectureCRUD.Active:=False;
  DataModule1.ADOLectureCRUD.Active:=True;

  DataModule1.ADOPracticCRUD.Active:=False;
  DataModule1.ADOPracticCRUD.Active:=True;
//================œŒ ¿ “¿ ==================================================

end;

procedure TRazdelCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TRazdelCRUD.SpeedButton1Click(Sender: TObject);
begin
with TAddRazdelModalForm.Create(nil) do
try
  ShowModal;
  finally
  Free;
  end;
end;

end.
