unit Practic_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, Grids, DBGrids, Buttons, jpeg, ExtCtrls, StdCtrls;

type
  TPracticCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid21: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PracticCRUD: TPracticCRUD;

implementation

uses AddPractic, Title_Form, updateUnit, config, UpdatePractic,
  Unit2,
  ControlCenter,
  AuthorizationData;

{$R *.dfm}

procedure TPracticCRUD.SpeedButton1Click(Sender: TObject);  // Добавление новой практики
begin
    with TAddPracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TPracticCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TPracticCRUD.SpeedButton6Click(Sender: TObject);    // Изменение Практики
begin
    config.selectRequestSQL('SELECT * FROM Практические WHERE НазваниеПрактической='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеПрактической').AsString+#39);
    updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы, изменяемой Практики
    updateKodPractic:=BD.Request.DataSet.FieldByName('КодПрактической').AsInteger;      // Код изменяемой Практики
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    updateKodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;    // Код Раздела изменяемой Практики

    with TUpdatePracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TPracticCRUD.SpeedButton7Click(Sender: TObject); // Удаление лекции
begin
    config.execRequestSQL('DELETE FROM Практические WHERE НазваниеПрактической='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеПрактической').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TPracticCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    PracticCRUD.Visible:=false;
end;

procedure TPracticCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    PracticCRUD.Visible:=false;
end;

procedure TPracticCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    PracticCRUD.Visible:=false;
end;

end.
