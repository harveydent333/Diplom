unit Menu_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls,
  ComCtrls;

type
  TMenuControl = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    Image1: TImage;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    procedure processingSingleQuestion;
    procedure processingMoreQuestion;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuControl: TMenuControl;
    nameRazdela,str,nameTema,nameControl:string;
    kodRazdela,kodTema:integer;
    CONST TYPE_SINGLE_QUESTIONS = 1;
    CONST TYPE_MORE_QUESTIONS = 2;

implementation

uses config, Title_Form, UpdateUnit, PassingKnowledgeControl, basa_dan,
  defoltTest,
  Main_Menu,
  Unit2,
  AuthorizationData,
  Result, Add_Question, PassControlMore, PassControlSingle;

{$R *.dfm}

procedure TMenuControl.ComboBox1Change(Sender: TObject);
begin
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;
    label7.Visible:=false;
    Panel1.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39); // Получение кода раздела
    kodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
     // Проверка на наличие потомков у Раздела
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // Проверка на наличие тем в разделе
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TMenuControl.ComboBox2Change(Sender: TObject);
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;
    label7.Visible:=false;
    Panel1.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;

    config.selectRequestSQL('SELECT * FROM Контроль WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(BD.Request.DataSet.FieldByName('НазваниеКонтроля').AsString);
        BD.Request.DataSet.Next;
        ComboBox3.Text:=ComboBox3.Items.Strings[0];
    end;

    if ComboBox3.Items.Count>0 then     // Проверка на наличие контроля знаний в теме
        begin
          label3.Visible:=true;
          Combobox3.Visible:=true;
        end
    else
      label7.Visible:=true;
end;

procedure TMenuControl.ComboBox3Change(Sender: TObject);
begin
    nameControl:=ComboBox3.Items.Strings[Combobox3.ItemIndex];
    Panel1.Visible:=true;
    SpeedButton1.Visible:=true;
    label20.Caption:=nameControl+'"';
    ResultForm.Label20.Caption:=nameControl+'"';

    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+nameControl+#39);
    updateKodControl:=BD.Request.DataSet.FieldByName('КодКонтроля').AsInteger;
    ResultForm.Label20.Caption:=BD.Request.DataSet.FieldByName('НазваниеКонтроля').AsString+'"';
    config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));
    label14.Caption:=IntToStr(BD.Request.DataSet.RecordCount);
    updateUnit.countQuestion:=BD.Request.DataSet.RecordCount;

    if BD.Request.DataSet.RecordCount>0 then
      SpeedButton1.Enabled:=true
    else
      SpeedButton1.Enabled:=false;
end;

procedure TMenuControl.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TMenuControl.SpeedButton1Click(Sender: TObject);
begin
    DateTimePicker1.DateTime:=Now;
    config.execRequestSQL('INSERT INTO ЖурналОценок (КодУченика, КодТемы, КодКонтроля,  ДатаПроведения) VALUES('+
      IntToStr(KodUser)+', '+IntToStr(KodTema)+', '+#39+IntToStr(updateKodControl)+#39+', '+
      #39+DateToStr(DateTimePicker1.Date)+#39+')');
    config.selectRequestSQL('SELECT * FROM ЖурналОценок');
    BD.Request.DataSet.Last;
    kodLastControl:=BD.Request.DataSet.FieldByName('КодЖурнала').AsInteger;  // код Начавшегося теста
    config.countBall:=0;
    config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));

    with PassingKnowledgeControlForm do
      begin
        VariantsQuestionSingle1.Visible:=false;
        VariantsQuestionMore1.Visible:=false;
        Show;
        Button1.Caption:='Следующий вопрос';
        Enabled:=true;

        kodVoprosa:=BD.Request.DataSet.FieldByName('КодВопроса').AsInteger;
        Memo1.Text:=BD.Request.DataSet.FieldByName('СодержаниеВопроса').AsString;

        if BD.Request.DataSet.FieldByName('КодТипа').AsInteger=TYPE_SINGLE_QUESTIONS then processingSingleQuestion;
        if BD.Request.DataSet.FieldByName('КодТипа').AsInteger=TYPE_MORE_QUESTIONS then processingMoreQuestion;

        ResultForm.Label14.Caption:=IntToStr(updateUnit.countQuestion);
        ResultForm.Label22.Caption:=IntToStr(updateUnit.countQuestion);
      end;
end;

procedure TMenuControl.processingSingleQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionSingle1.Visible:=true;
    PassControlSingle.singleMemoClear;
    PassControlSingle.RadioButtonClear;
    PassControlSingle.countQuest(BD.Request.DataSet.FieldByName('КоличествоОтветов').AsInteger); // Устанавливаем кол-во полей с вариантами
    PassControlSingle.setQuestionInMemo(BD.Request.DataSet.FieldByName('ВариантыОтветов').AsString);  // Проставляем варианты в поля memo
    PassControlSingle.clearStrokiMemo; // Чистим лишнии пустые строки в Memo
end;

procedure TMenuControl.processingMoreQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionMore1.Visible:=true;
    PassControlMore.moreMemoClear;
    PassControlMore.CheckBoxClear;
    PassControlMore.countQuest(BD.Request.DataSet.FieldByName('КоличествоОтветов').AsInteger); // Устанавливаем кол-во полей с вариантами
    PassControlMore.setQuestionInMemo(BD.Request.DataSet.FieldByName('ВариантыОтветов').AsString);  // Проставляем варианты в поля memo
    PassControlMore.setRightQuestionInArrayAnswers(BD.Request.DataSet.FieldByName('ВерныйОтвет').AsString); // Получаем массив верных ответов
    PassControlMore.clearStrokiMemo; // Чистим лишнии пустые строки в Memo
end;


procedure TMenuControl.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuControl.Visible:=false;
end;

procedure TMenuControl.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MenuControl.Visible:=false;
end;

end.
