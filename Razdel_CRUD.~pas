unit Razdel_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, basa_dan, Buttons, StdCtrls,ShellAPI, config;

type
  TRazdelCRUD = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RazdelCRUD: TRazdelCRUD;

implementation

uses Title_Form, AddRazdel, UpdateUnit, UpdateRazdel,
  ControlCenter, Unit2, AuthorizationData;

{$R *.dfm}

procedure TRazdelCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TRazdelCRUD.BitBtn1Click(Sender: TObject);
begin
   with TAddRazdelModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;
{
  Обработка нажатия кнопки редактировать раздел
}
procedure TRazdelCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        performingEditing
    else
        MessageBox(0,'У вас нет прав на редактирование данного раздела!','', MB_OK+MB_ICONwarning);
end;

{
  Обработка нажатия кнопки удалить раздел
}
procedure TRazdelCRUD.BitBtn3Click(Sender: TObject);
begin
 config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39
  );
  if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        performingRemoval
    else
        MessageBox(0,'У вас нет прав на удаление данного раздела!','', MB_OK+MB_ICONwarning);
end;

{
  Процедура редактирования раздела
}
procedure TRazdelCRUD.performingEditing;
begin
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
    with TUpdateRazdelModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

{
  Процедура удаления раздела
}
procedure TRazdelCRUD.performingRemoval;
begin
   config.execRequestSQL('DELETE FROM Раздел '+
      ' WHERE НазваниеРаздела='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные раздела были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TRazdelCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
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

end.
