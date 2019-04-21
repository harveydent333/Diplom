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
    DBGrid2: TDBGrid;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LectureCRUD: TLectureCRUD;

implementation

uses Title_Form, AddLecture, UpdateLecture, config, UpdateUnit;

{$R *.dfm}

procedure TLectureCRUD.SpeedButton4Click(Sender: TObject);  // Завершение работы программы
begin
TitleForm.close;
end;

procedure TLectureCRUD.SpeedButton1Click(Sender: TObject); // Добавление новой лекции
begin
    with TAddLectureModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TLectureCRUD.SpeedButton6Click(Sender: TObject);    // Изменение Лекции
begin
    config.selectRequestSQL('SELECT * FROM Лекции WHERE НазваниеЛекции='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеЛекции').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы, изменяемой лекции
    updateKodLecture:=DBGrid2.DataSource.DataSet.FieldByName('КодЛекции').AsInteger;      // Код изменяемой Лекции
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;    // Код Раздела изменяемой лекции

    with TUpdateLectureModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TLectureCRUD.SpeedButton7Click(Sender: TObject); // Удаление лекции
begin
    config.execRequestSQL('DELETE FROM Лекции WHERE НазваниеЛекции='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеЛекции').AsString+#39);
    config.rebootRequestsCRUD;
end;

end.
