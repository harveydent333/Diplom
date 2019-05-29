unit Razdel_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, basa_dan, Buttons, StdCtrls,ShellAPI, config;

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
    teacher_ON: TImage;
    stydent_ON: TImage;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RazdelCRUD: TRazdelCRUD;

implementation

uses Title_Form, AddRazdel, UpdateUnit, UpdateRazdel,
  ControlCenter,
  Unit2,
  AuthorizationData;

{$R *.dfm}

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
    config.execRequestSQL('DELETE FROM Раздел '+
      ' WHERE НазваниеРаздела='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные раздела были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TRazdelCRUD.SpeedButton4Click(Sender: TObject);    // Завершение программы
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

procedure TRazdelCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    RazdelCRUD.Visible:=false;
end;

procedure TRazdelCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    RazdelCRUD.Visible:=false;
end;

procedure TRazdelCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    RazdelCRUD.Visible:=false;
end;

procedure TRazdelCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
