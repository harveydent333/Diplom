unit Tema_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, jpeg, ExtCtrls, basa_dan, StdCtrls, AddTema;

type
  TTemaCRUD = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemaCRUD: TTemaCRUD;

implementation

uses Title_Form;

{$R *.dfm}

procedure TTemaCRUD.SpeedButton1Click(Sender: TObject);
begin
with TAddTemaModalForm.Create(nil) do
try
  ShowModal;
  finally
  Free;
  end;
end;


procedure TTemaCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TTemaCRUD.SpeedButton7Click(Sender: TObject);
var str:string;
begin
  str:='DELETE FROM Тема WHERE НазваниеТемы='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString+#39;
  DataModule1.ADOModuleLecture.SQL.Clear;
  DataModule1.ADOModuleLecture.SQL.Add(str);
  DataModule1.ADOModuleLecture.ExecSQL;
  DataModule1.ADOTemaCRUD.Active:=False;
  DataModule1.ADOTemaCRUD.Active:=True;
end;



end.
