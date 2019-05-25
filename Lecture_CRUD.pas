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
    SpeedButton8: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LectureCRUD: TLectureCRUD;

implementation

uses Title_Form, AddLecture, UpdateLecture, config, UpdateUnit,
  EditLecture, ControlCenter, Unit2, AuthorizationData;
{$R *.dfm}

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

procedure TLectureCRUD.SpeedButton8Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Лекции WHERE НазваниеЛекции='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеЛекции').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы,
    updateKodLecture:=DBGrid2.DataSource.DataSet.FieldByName('КодЛекции').AsInteger;      // Код  Лекции
    config.selectRequestSQL('SELECT * FROM Лекции WHERE КодЛекции='+IntToStr(updateKodLecture));
    LectureCRUD.Visible:=false;
    with Edit_Lecture do
      begin
        Show;
        Position:=poDesktopCenter;
        Memo1.Clear;
        Memo1.Lines.Add(DBGrid2.DataSource.DataSet.FieldByName('Содержание').AsString);
        Height:=920;
        Width:=1201;
        Memo1.Height:=833;
        Memo1.Width:=1190;
        Button1.Left:=8;
        Button1.Visible:=true;
        Button3.Left:=128;
        Button4.Visible:=true;
        Button5.Visible:=true;
        Button6.Left:=632;
        Button7.Visible:=false;
        Button8.Visible:=false;
        Memo1.ReadOnly:=false;
      end;
end;

procedure TLectureCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    LectureCRUD.Visible:=false;
end;

procedure TLectureCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    LectureCRUD.Visible:=false;
end;

procedure TLectureCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    LectureCRUD.Visible:=false;
end;

procedure TLectureCRUD.SpeedButton4Click(Sender: TObject);  // Завершение работы программы
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

end.
