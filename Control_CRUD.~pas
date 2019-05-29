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
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    teacher_ON: TImage;
    stydent_ON: TImage;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
  private
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

procedure TControlCRUD.SpeedButton1Click(Sender: TObject);    // Добавление нового контроля
begin
 with TAddControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TControlCRUD.SpeedButton7Click(Sender: TObject);  // Удаление Контроля
begin
    config.execRequestSQL('DELETE FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные контроля знаний были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TControlCRUD.SpeedButton6Click(Sender: TObject);   // Изменение Контроля
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString+#39);
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

procedure TControlCRUD.SpeedButton8Click(Sender: TObject);  // Переход в редактор вопросов
begin
    if DBGrid1.DataSource.DataSet.RecordCount = 0 then
        MessageBox(0,'Ни одного контроля знаний не выбрано!','',MB_OK+MB_ICONWARNING)
    else
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
end;

procedure TControlCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    ControlCRUD.Visible:=false;
end;

procedure TControlCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ControlCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
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
    if idyes=temp then
      TitleForm.close;
end;

procedure TControlCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
