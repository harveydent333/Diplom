unit Control_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls, ShellAPI;

type
  TControlCRUD = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    procedure editingQuestions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlCRUD: TControlCRUD;

implementation

uses Title_Form, config, UpdateUnit, AddControl, UpdateControl,
  Add_Question, Unit2, AuthorizationData, ControlCenter;
{$R *.dfm}

{
  Обработка нажатия кнопки добавить контроль знаний
}
procedure TControlCRUD.BitBtn1Click(Sender: TObject);
begin
 with TAddControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

{
  Обработка нажатия кнопки редактировать контроль знаний
}
procedure TControlCRUD.BitBtn2Click(Sender: TObject);
begin
   config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
   if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
      performingEditing
   else
      MessageBox(0,'У вас нет прав на редактирование данного контроля знаний!','', MB_OK+MB_ICONwarning);
end;

{
  Обработка нажатия кнопки удалить контроль знаний
}
procedure TControlCRUD.BitBtn3Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
    if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        performingRemoval
    else
        MessageBox(0,'У вас нет прав на удаление данного контроля знаний!','', MB_OK+MB_ICONwarning);
end;

{
  Обработка нажатия кнопки открыть редактор вопросов
}
procedure TControlCRUD.BitBtn4Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
    if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        editingQuestions
    else
        MessageBox(0,'У вас нет прав на редактирование вопросов данного контроля знаний!','', MB_OK+MB_ICONwarning);
end;

{
  Процедура редактирования контроля знаний
}
procedure TControlCRUD.performingEditing;
begin
  updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы, изменяемого Контроля
    updateKodControl:=BD.Request.DataSet.FieldByName('КодКонтроля').AsInteger;      // Код изменяемого Контроля
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    updateKodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;    // Код Раздела изменяемой лекции

    with TUpdateControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

{
  Процедура удаления контроля знаний
}
procedure TControlCRUD.performingRemoval;        
begin
    config.execRequestSQL('DELETE FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные контроля знаний были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;

{
  Процедура открытия редактора вопросов
}
procedure TControlCRUD.editingQuestions;
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
    updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
    updateKodControl:=BD.Request.DataSet.FieldByName('КодКонтроля').AsInteger;

    Add_Questions.ListBox1.Clear;
    config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));
    with Add_Questions do
        begin
          ListBox1.Clear;
          BD.Request.DataSet.First;
          While (BD.Request.DataSet.Eof=false) do
            begin
              ListBox1.Items.Add(BD.Request.DataSet.FieldByName('СодержаниеВопроса').AsString);
              BD.Request.DataSet.Next;
            end;
          VariantsQuestionSingle1.Visible:=false;
          VariantsQuestionMore1.Visible:=false;
          Button2.Enabled:=false;
          Show;
          Memo1.Clear;
          Memo1.ReadOnly:=true;
          Position:=poDesktopCenter;
        end;
    ControlCRUD.Visible:=false;
end;

procedure TControlCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    ControlCRUD.Visible:=false;
end;

procedure TControlCRUD.SpeedButton2Click(Sender: TObject);
begin
    ControlCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
end;

procedure TControlCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений', MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TControlCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
