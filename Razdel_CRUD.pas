unit Razdel_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, basa_dan, Buttons, StdCtrls, config;

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
    DBGrid2: TDBGrid;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RazdelCRUD: TRazdelCRUD;

implementation

uses Title_Form, AddRazdel, UpdateUnit, UpdateRazdel;

{$R *.dfm}

procedure TRazdelCRUD.SpeedButton4Click(Sender: TObject);    // Завершение программы
begin
TitleForm.close;
end;

procedure TRazdelCRUD.SpeedButton1Click(Sender: TObject);  // Добавление нового раздела
begin
    with TAddRazdelModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TRazdelCRUD.SpeedButton6Click(Sender: TObject);  // Изменить Раздел
begin
  config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39);
  updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
  with TUpdateRazdelModalForm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
  end;
end;


procedure TRazdelCRUD.SpeedButton7Click(Sender: TObject);     // Удаление Раздела
begin
    config.execRequestSQL('DELETE FROM Раздел WHERE НазваниеРаздела='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39);
    config.rebootRequestsCRUD;
end;


end.
