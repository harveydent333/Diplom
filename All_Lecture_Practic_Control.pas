unit All_Lecture_Practic_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls, ShellAPI;

type
  TAllComponents = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    stydent_ON: TImage;
    Label6: TLabel;
    Label7: TLabel;
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
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure beginControl;
    procedure beginLecture;
    procedure beginPractic;
    procedure beginMutimedia;
    procedure processingSingleQuestion;
    procedure processingMoreQuestion;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AllComponents: TAllComponents;
       nameRazdela,str,nameTema,work:string;
        kodRazdela,kodTema, List, AllList,i,j, position:integer;
        CONST TYPE_SINGLE_QUESTIONS = 1;
        CONST TYPE_MORE_QUESTIONS = 2;

implementation

uses basa_dan, config, UpdateUnit, Result, Title_Form,
  PassingKnowledgeControl, AuthorizationData, Add_Question, QuestionsMemo,
  QuestionsMoreMemo, PassControlMore, PassControlSingle, AddControl,
  Variants_Question, Variants_Question_More, Variants_Question_Write,
  Main_Menu, AddQuestionModal, EditLecture, Unit2;

{$R *.dfm}

procedure TAllComponents.ComboBox1Change(Sender: TObject);
var i:integer;
begin
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    for i:=1 to Length(nameRazdela) do
      if nameRazdela[i]='|' then
        begin
          nameRazdela:=Copy(nameRazdela,i+1,Length(nameRazdela)-i);
          break;
        end;

    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39); // Получение кода раздела
    kodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
     // Проверка на наличие потомков у Раздела
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(
          '№ '+ BD.Request.DataSet.FieldByName('НомерТемы').AsString+'|'+
          BD.Request.DataSet.FieldByName('НазваниеТемы').AsString
        );
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

procedure TAllComponents.ComboBox2Change(Sender: TObject);
var i:integer;
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
      for i:=1 to Length(nameTema) do
      if nameTema[i]='|' then
        begin
          nameTema:=Copy(nameTema,i+1,Length(nameTema)-i);
          break;
        end;

    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;

    config.selectRequestSQL('SELECT * FROM Лекции WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '№ '+BD.Request.DataSet.FieldByName('НомерЛекции').AsString+' | Лекция | '+
          BD.Request.DataSet.FieldByName('НазваниеЛекции').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '№ '+BD.Request.DataSet.FieldByName('НомерМультимедии').AsString+' | Мультимедиа | '+
          BD.Request.DataSet.FieldByName('НазваниеМультимедии').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM Практические WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '№ '+BD.Request.DataSet.FieldByName('НомерПрактической').AsString+' | Практическая | '+
          BD.Request.DataSet.FieldByName('НазваниеПрактической').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM Контроль WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '№ '+BD.Request.DataSet.FieldByName('НомерКонтроля').AsString+' | Контроль | '+
          BD.Request.DataSet.FieldByName('НазваниеКонтроля').AsString
        );
        BD.Request.DataSet.Next;
    end;

    ComboBox3.Sorted:=true;
    ComboBox3.Text:=ComboBox3.Items.Strings[0];
    label3.Visible:=true;
    Combobox3.Visible:=true;
end;

procedure TAllComponents.ComboBox3Change(Sender: TObject);
var position:integer;
begin
    Panel1.Visible:=false;
    SpeedButton1.Visible:=false;

    work:=ComboBox3.Items.Strings[Combobox3.ItemIndex];
    position:= AnsiPos('Лекция',work);
    if position <> 0 then
      begin
       for j:= 1 to 2 do
          for i:=1 to length(work) do
            if ((work[i]='|') and (j=2)) then
                 work:=Copy(work,i+2,Length(work)-i);
       beginLecture;
      end;

    position := AnsiPos('Контроль',work);
    if position <> 0 then
      begin
       for j:= 1 to 2 do
          for i:=1 to length(work) do
            if ((work[i]='|') and (j=2)) then
                 work:=Copy(work,i+2,Length(work)-i);
       beginControl;
      end;

    position := AnsiPos('Практическая',work);
    if position <> 0 then
      begin
       for j:= 1 to 2 do
          for i:=1 to length(work) do
            if ((work[i]='|') and (j=2)) then
                 work:=Copy(work,i+2,Length(work)-i);
       beginPractic;
      end;

    position := AnsiPos('Мультимедиа',work);
    if position <> 0 then
      begin
       for j:= 1 to 2 do
          for i:=1 to length(work) do
            if ((work[i]='|') and (j=2)) then
                 work:=Copy(work,i+2,Length(work)-i);
       beginMutimedia;
      end;
end;

procedure TAllComponents.beginMutimedia;
begin
    config.rebootRequestsCRUD;
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+work+#39);
    if FileExists('./'+BD.Request.DataSet.FieldByName('Путь').AsString+'.mp4') then
      ShellExecute(handle,'open', PChar('.\'+BD.Request.DataSet.FieldByName('Путь').AsString+'.mp4'), nil, nil, SW_SHOWNORMAL)
    else
        MessageBox(0,'Файл данной мультимедии отсутствует','Программирование и защита Web - приложений', MB_OK+MB_ICONWARNING);
end;

procedure TAllComponents.beginPractic;
begin
    work:=ComboBox3.Items.Strings[Combobox3.ItemIndex];
    if FileExists('./Practic/'+work+'.pdf') then
      ShellExecute(handle,'open', PChar('.\Practic\'+work+'.pdf'), nil, nil, SW_SHOWNORMAL)
    else
      MessageBox(0,'Файл данной практической работы отсутствует','Программирование и защита Web - приложений',
    MB_OK+MB_ICONWARNING);

end;

procedure TAllComponents.beginLecture;
begin
    config.selectRequestSQL('SELECT * FROM Лекции WHERE НазваниеЛекции='+#39+work+#39);
    updateKodLecture:=BD.Request.DataSet.FieldByName('КодЛекции').AsInteger;      // Код  Лекции
    //сделаю в конфиге
    with Edit_Lecture do
      begin
        for i:=1 to 30 do ArrayListText[i]:='';
        show;
        Position:=poDesktopCenter;
      //  MenuLectures.Visible:=false;
        Memo1.Clear;
        Memo1.Lines.Add(BD.Request.DataSet.FieldByName('Содержание').AsString);

        AllList:=Round(Memo1.Lines.Count/34)-1;
        for i:=0 to 34 do
          ArrayListText[1]:=ArrayListText[1]+Memo1.Lines[i];

        for i:=1 to Round(Memo1.Lines.Count/34)-1 do
            for j:=i*34 to i*34+33 do
              ArrayListText[i+1]:=ArrayListText[i+1]+Memo1.Lines[j];

       Memo1.Lines.Clear;
       List:=1;
       Memo1.Lines.Add(ArrayListText[1]);


        Height:=920;
        Width:=1201;
        Memo1.Height:=833;
        Memo1.Width:=1190;
        Memo1.ReadOnly:=true;
        Button6.Left:=128;
        Button1.Visible:=false;
        Button4.Visible:=false;
        Button5.Visible:=false;
        Button7.Visible:=true;
        Button8.Visible:=true;
        Button3.Left:=3;
      end;
    //
end;

procedure TAllComponents.beginControl;
begin
    Panel1.Visible:=true;
    SpeedButton1.Visible:=true;
    label20.Caption:=work+'"';
    ResultForm.Label20.Caption:=work+'"';

    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+work+#39);
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

procedure TAllComponents.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TAllComponents.SpeedButton1Click(Sender: TObject);
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

procedure TAllComponents.processingSingleQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionSingle1.Visible:=true;
    PassControlSingle.singleMemoClear;
    PassControlSingle.RadioButtonClear;
    PassControlSingle.countQuest(BD.Request.DataSet.FieldByName('КоличествоОтветов').AsInteger); // Устанавливаем кол-во полей с вариантами
    PassControlSingle.setQuestionInMemo(BD.Request.DataSet.FieldByName('ВариантыОтветов').AsString);  // Проставляем варианты в поля memo
    PassControlSingle.clearStrokiMemo; // Чистим лишнии пустые строки в Memo
end;

procedure TAllComponents.processingMoreQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionMore1.Visible:=true;
    PassControlMore.moreMemoClear;
    PassControlMore.CheckBoxClear;
    PassControlMore.countQuest(BD.Request.DataSet.FieldByName('КоличествоОтветов').AsInteger); // Устанавливаем кол-во полей с вариантами
    PassControlMore.setQuestionInMemo(BD.Request.DataSet.FieldByName('ВариантыОтветов').AsString);  // Проставляем варианты в поля memo
    PassControlMore.setRightQuestionInArrayAnswers(BD.Request.DataSet.FieldByName('ВерныйОтвет').AsString); // Получаем массив верных ответов
    PassControlMore.clearStrokiMemo; // Чистим лишнии пустые строки в Memo
end;

procedure TAllComponents.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    AllComponents.Visible:=false;
end;

procedure TAllComponents.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    AllComponents.Visible:=false;
end;

procedure TAllComponents.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
