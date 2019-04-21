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
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemaCRUD: TTemaCRUD;

implementation

uses Title_Form, UpdateTema, UpdateUnit, config;

{$R *.dfm}

procedure TTemaCRUD.SpeedButton1Click(Sender: TObject);   // Добавление Темы
begin
    with TAddTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TTemaCRUD.SpeedButton6Click(Sender: TObject);     // Изменение Темы
begin
    // Запрашиваем код раздела и код темы
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('КодТемы').AsInteger;
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
    with TUpdateTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TTemaCRUD.SpeedButton7Click(Sender: TObject);  // Удаление Темы
begin
    config.execRequestSQL('DELETE FROM Тема WHERE НазваниеТемы='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TTemaCRUD.SpeedButton4Click(Sender: TObject);  // Завершение работы программы
begin
    TitleForm.close;
end;

end.
