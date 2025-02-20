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
    Label4: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
  private
    procedure beginControl;
    procedure beginLecture;
    procedure beginPractic;
    procedure beginMutimedia;
    procedure processingSingleQuestion;
    procedure processingMoreQuestion;
    procedure getPathWork;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AllComponents: TAllComponents;
       nameRazdela,str,nameTema,work, kodYchitel, Path, PathFile:string;
        kodRazdela,kodTema, List, AllList,i,j, pos1:integer;
        position:integer;
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
    label4.Visible:=false;
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

    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39); // ��������� ���� �������
    kodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;
     // �������� �� ������� �������� � �������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(
          '� '+ BD.Request.DataSet.FieldByName('���������').AsString+'|'+
          BD.Request.DataSet.FieldByName('������������').AsString
        );
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // �������� �� ������� ��� � �������
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TAllComponents.ComboBox2Change(Sender: TObject);
var i:integer;
begin
    label4.Visible:=false;
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

    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '� '+BD.Request.DataSet.FieldByName('�����������').AsString+' ������ | '+
          BD.Request.DataSet.FieldByName('��������������').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM ����������� WHERE �������='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '� '+BD.Request.DataSet.FieldByName('����������������').AsString+' ����������� | '+
          BD.Request.DataSet.FieldByName('�������������������').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM ������������ WHERE �������='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '� '+BD.Request.DataSet.FieldByName('�����������������').AsString+' ������������ | '+
          BD.Request.DataSet.FieldByName('��������������������').AsString
        );
        BD.Request.DataSet.Next;
    end;

    config.selectRequestSQL('SELECT * FROM �������� WHERE �������='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(
          '� '+BD.Request.DataSet.FieldByName('�������������').AsString+' �������� | '+
          BD.Request.DataSet.FieldByName('����������������').AsString
        );
        BD.Request.DataSet.Next;
    end;

    ComboBox3.Sorted:=true;
    ComboBox3.Text:=ComboBox3.Items.Strings[0];
    label3.Visible:=true;
    Combobox3.Visible:=true;

    if ComboBox3.Items.Count=0 then
      begin
        Combobox3.Visible:=false;
        label4.Visible:=true;
        label3.Visible:=false;
      end;
end;

procedure TAllComponents.ComboBox3Change(Sender: TObject);
begin
    Panel1.Visible:=false;
    SpeedButton1.Visible:=false;

    work:=ComboBox3.Items.Strings[Combobox3.ItemIndex];
    pos1:= AnsiPos('������',work);
    if pos1 <> 0 then
      begin
        getPathWork;
        beginLecture;
      end;

    pos1:= AnsiPos('��������',work);
    if pos1 <> 0 then
      begin
        getPathWork;
        beginControl;
      end;

    pos1:= AnsiPos('������������',work);
    if pos1 <> 0 then
      begin
        getPathWork;
        beginPractic;
      end;

    pos1:= AnsiPos('�����������',work);
    if pos1 <> 0 then
      begin
        getPathWork;
        beginMutimedia;
      end;
end;

procedure TAllComponents.getPathWork;
begin
    work:=Copy(work,AnsiPos('|',work)+2,Length(work)-AnsiPos('|',work));
end;

{
  ��������� ������� �����������
}
procedure TAllComponents.beginMutimedia;
begin
    Path:='';
    PathFile:='';
    config.rebootRequestsCRUD;
    config.selectRequestSQL('SELECT * FROM ����������� WHERE �������������������='+#39+work+#39);
    Path:=BD.Request.DataSet.FieldByName('����').AsString;
    for i:=1 to Length(Path)-4 do
      PathFile:=PathFile+Path[i];
    if ((FileExists('./'+PathFile+'.mp4')) or (FileExists('./'+PathFile+'.avi'))) then
      ShellExecute(handle,'open', PChar('.\'+BD.Request.DataSet.FieldByName('����').AsString), nil, nil, SW_SHOWNORMAL)
    else
        MessageBox(0,'���� ������ ����������� ����������� ��� �������� �������� ����������','', MB_OK+MB_ICONWARNING);
end;

procedure TAllComponents.beginPractic;
begin
    Path:='';
    PathFile:='';
    config.rebootRequestsCRUD;
    config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+#39+work+#39);
    Path:=BD.Request.DataSet.FieldByName('����').AsString;
    for i:=1 to Length(Path)-4 do
      PathFile:=PathFile+Path[i];
    if ((FileExists('./'+PathFile+'.pdf')) or (FileExists('./'+PathFile+'.doc'))or (FileExists('./'+PathFile+'.docx'))) then
      ShellExecute(handle,'open', PChar('.\'+BD.Request.DataSet.FieldByName('����').AsString), nil, nil, SW_SHOWNORMAL)
    else
      MessageBox(0,'���� ������ ������������ ������ ����������� ��� �������� �������� ����������','���������������� � ������ Web - ����������',
    MB_OK+MB_ICONWARNING);

end;

procedure TAllComponents.beginLecture;
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+#39+work+#39);
    updateKodLecture:=BD.Request.DataSet.FieldByName('���������').AsInteger;      // ���  ������
    //������ � �������
    with Edit_Lecture do
      begin
        for i:=1 to 30 do ArrayListText[i]:='';
        show;
        Position:=poDesktopCenter;
        Memo1.Clear;
        Memo1.Lines.Add(BD.Request.DataSet.FieldByName('����������').AsString);

        AllList:=Round(Memo1.Lines.Count/25)-1;
        for i:=0 to 25 do
          ArrayListText[1]:=ArrayListText[1]+Memo1.Lines[i];

        for i:=1 to Round(Memo1.Lines.Count/25)-1 do
            for j:=i*25 to i*25+24 do
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
end;

procedure TAllComponents.beginControl;
begin
    Panel1.Visible:=true;
    SpeedButton1.Visible:=true;
    label20.Caption:=work+'"';
    ResultForm.Label20.Caption:=work+'"';

    config.selectRequestSQL('SELECT * FROM �������� WHERE ����������������='+#39+work+#39);
    kodYchitel:=BD.Request.DataSet.FieldByName('����������').AsString;
    updateKodControl:=BD.Request.DataSet.FieldByName('�����������').AsInteger;
    ResultForm.Label20.Caption:=BD.Request.DataSet.FieldByName('����������������').AsString+'"';
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������='+IntToStr(updateKodControl));
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
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TAllComponents.SpeedButton1Click(Sender: TObject);
begin
    DateTimePicker1.DateTime:=Now;
    config.execRequestSQL('INSERT INTO ������������ (����������, �������, �����������,  ��������������,����������) VALUES('+
      IntToStr(KodUser)+', '+
      IntToStr(KodTema)+', '+
      #39+IntToStr(updateKodControl)+#39+', '+
      #39+DateToStr(DateTimePicker1.Date)+#39+','+
      kodYchitel+')');
    config.selectRequestSQL('SELECT * FROM ������������');
    BD.Request.DataSet.Last;
    kodLastControl:=BD.Request.DataSet.FieldByName('����������').AsInteger;  // ��� ����������� �����
    config.countBall:=0;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������='+IntToStr(updateKodControl));

    with PassingKnowledgeControlForm do
      begin
        VariantsQuestionSingle1.Visible:=false;
        VariantsQuestionMore1.Visible:=false;
        Show;
        Button1.Caption:='��������� ������';
        Enabled:=true;
        AutoScroll:=false;

        kodVoprosa:=BD.Request.DataSet.FieldByName('����������').AsInteger;
        Memo1.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;

        if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then processingSingleQuestion;
        if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then processingMoreQuestion;

        ResultForm.Label14.Caption:=IntToStr(updateUnit.countQuestion);
        ResultForm.Label22.Caption:=IntToStr(updateUnit.countQuestion);
      end;
end;

procedure TAllComponents.processingSingleQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionSingle1.Visible:=true;
    PassControlSingle.singleMemoClear;
    PassControlSingle.RadioButtonClear;
    PassControlSingle.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    PassControlSingle.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    PassControlSingle.clearStrokiMemo; // ������ ������ ������ ������ � Memo
end;

procedure TAllComponents.processingMoreQuestion;
begin
    PassingKnowledgeControlForm.VariantsQuestionMore1.Visible:=true;
    PassControlMore.moreMemoClear;
    PassControlMore.CheckBoxClear;
    PassControlMore.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    PassControlMore.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    PassControlMore.setRightQuestionInArrayAnswers(BD.Request.DataSet.FieldByName('�����������').AsString); // �������� ������ ������ �������
    PassControlMore.clearStrokiMemo; // ������ ������ ������ ������ � Memo
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

procedure TAllComponents.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAllComponents.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAllComponents.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.
