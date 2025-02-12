unit Add_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, jpeg, ExtCtrls, Menus, DBCtrls, Buttons , basa_dan,
  Mask, Grids, DBGrids , AuthorizationData, Variants_Question,
  Variants_Question_More, Variants_Question_Write;

type
  TAdd_Questions = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TMemo;
    ListBox1: TListBox;
    VariantsQuestionSingle1: TVariantsQuestionSingle;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    VariantsQuestionMore1: TVariantsQuestionMore;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    teacher_ON: TImage;
    stydent_ON: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure VariantsQuestionSingle1BitBtn3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure VariantsQuestionMore1BitBtn2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    procedure fillingAnswerChoices;
    procedure processingSingleVariants;
    procedure processingMoreVariants;
    procedure defaultSettings;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Questions: TAdd_Questions;
  countQuestion,kodVoprosa, indexList:integer;
  varianti,otvet,memoText:string;
implementation

uses Unit3, Unit2, Title_Form, Control, Main_Menu, UpdateUnit, config,
  QuestionsMemo, AddQuestionModal, Control_CRUD, QuestionsMoreMemo, ShellAPI;

{$R *.dfm}

procedure TAdd_Questions.SpeedButton3Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    Add_Questions.Visible:=false;
end;

procedure TAdd_Questions.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TAdd_Questions.Button1Click(Sender: TObject);
begin
    with TAddQuestionModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TAdd_Questions.SpeedButton1Click(Sender: TObject);
begin
    Add_Questions.visible:=false;
    ControlCRUD.Visible:=true;
    ControlCRUD.Position:=poDesktopCenter;
    Add_Questions.Panel2.Visible:=false;
    Add_Questions.Panel1.Visible:=false;
end;

procedure TAdd_Questions.VariantsQuestionSingle1BitBtn3Click(
  Sender: TObject);
begin
  VariantsQuestionSingle1.BitBtn3Click(Sender);
end;

procedure TAdd_Questions.ListBox1Click(Sender: TObject);
begin
    indexList:=ListBox1.ItemIndex;
    defaultSettings;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������������='+#39+ListBox1.Items[ListBox1.Itemindex]+#39);
    kodVoprosa:=BD.Request.DataSet.FieldByName('����������').AsInteger;
    Memo1.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;
    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then
        processingSingleVariants;

    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then
         processingMoreVariants;
end;

procedure TAdd_Questions.VariantsQuestionMore1BitBtn2Click(Sender: TObject);
begin
  with Add_Questions.VariantsQuestionMore1 do
    begin
      countQuestion:=3;
      moreMemoClear;
      CheckBoxClear;
      Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
      Memo4.Visible:=false; label4.Visible:=false; CheckBox4.Visible:=false;
      Memo5.Visible:=false; label5.Visible:=false; CheckBox5.Visible:=false;
      Memo6.Visible:=false; label6.Visible:=false; CheckBox6.Visible:=false;
      Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
      Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
      Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
      Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
    end;
end;

procedure TAdd_Questions.BitBtn2Click(Sender: TObject);
var temp:word;
begin
 temp:=MessageBox(0,'�� ����� ������ �������� ������ �������?','',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
     with Add_Questions.VariantsQuestionMore1 do
            begin
               countQuestion:=3;
               moreMemoClear;
               CheckBoxClear;
               Memo3.Visible:=true; label3.Visible:=true; CheckBox3.Visible:=true;
               Memo4.Visible:=false; label4.Visible:=false; CheckBox4.Visible:=false;
               Memo5.Visible:=false; label5.Visible:=false; CheckBox5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; CheckBox6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; CheckBox7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; CheckBox8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; CheckBox9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; CheckBox10.Visible:=false;
            end;
end;

procedure TAdd_Questions.BitBtn6Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ �������� ������ �������?','',MB_YESNO+MB_ICONQUESTION);
      if idyes=temp then
        begin
          with Add_Questions.VariantsQuestionSingle1 do
            begin
               countQuestion:=3;
               singleMemoClear;
               RadioButtonClear;
               Memo3.Visible:=true; label3.Visible:=true; RadioButton3.Visible:=true;
               Memo4.Visible:=false; label4.Visible:=false; RadioButton4.Visible:=false;
               Memo5.Visible:=false; label5.Visible:=false; RadioButton5.Visible:=false;
               Memo6.Visible:=false; label6.Visible:=false; RadioButton6.Visible:=false;
               Memo7.Visible:=false; label7.Visible:=false; RadioButton7.Visible:=false;
               Memo8.Visible:=false; label8.Visible:=false; RadioButton8.Visible:=false;
               Memo9.Visible:=false; label9.Visible:=false; RadioButton9.Visible:=false;
               Memo10.Visible:=false; label10.Visible:=false; RadioButton10.Visible:=false;
            end;
 end;
end;

procedure TAdd_Questions.BitBtn3Click(Sender: TObject);
begin
    VariantsQuestionMore1.BitBtn4.Click;
    if countQuestion = 10 then Add_Questions.BitBtn3.Enabled:=false;
    if countQuestion = 3 then Add_Questions.BitBtn4.Enabled:=true;
end;

procedure TAdd_Questions.BitBtn4Click(Sender: TObject);
begin
    VariantsQuestionMore1.BitBtn3.Click;
    if countQuestion = 2 then Add_Questions.BitBtn4.Enabled:=false;
    if countQuestion = 9 then Add_Questions.BitBtn3.Enabled:=true;
end;

procedure TAdd_Questions.BitBtn7Click(Sender: TObject);
begin
    VariantsQuestionSingle1.BitBtn3.Click;
    if countQuestion = 10 then
      begin
         BitBtn7.Enabled:=false;
         Add_Questions.VariantsQuestionSingle1.RadioButton10.Checked:=false;
      end;

     if countQuestion = 3 then BitBtn8.Enabled:=true;
end;

procedure TAdd_Questions.BitBtn8Click(Sender: TObject);
begin
    VariantsQuestionSingle1.BitBtn4.Click;
     if countQuestion = 2 then Add_Questions.BitBtn8.Enabled:=false;
     if countQuestion = 9 then Add_Questions.BitBtn7.Enabled:=true;
end;

procedure TAdd_Questions.BitBtn5Click(Sender: TObject);
var indexLists:integer;
begin
    indexLists:=ListBox1.ItemIndex;
    varianti:='';
    with VariantsQuestionSingle1 do
      begin
         varianti:=varianti+Memo1.Text+'�';
         varianti:=varianti+Memo2.Text+'�';
         varianti:=varianti+Memo3.Text+'�';
         varianti:=varianti+Memo4.Text+'�';
         varianti:=varianti+Memo5.Text+'�';
         varianti:=varianti+Memo6.Text+'�';
         varianti:=varianti+Memo7.Text+'�';
         varianti:=varianti+Memo8.Text+'�';
         varianti:=varianti+Memo9.Text+'�';
         varianti:=varianti+Memo10.Text+'�';

        if RadioButton1.Checked=true then otvet:=Memo1.Text;
        if RadioButton2.Checked=true then otvet:=Memo2.Text;
        if RadioButton3.Checked=true then otvet:=Memo3.Text;
        if RadioButton4.Checked=true then otvet:=Memo4.Text;
        if RadioButton5.Checked=true then otvet:=Memo5.Text;
        if RadioButton6.Checked=true then otvet:=Memo6.Text;
        if RadioButton7.Checked=true then otvet:=Memo7.Text;
        if RadioButton8.Checked=true then otvet:=Memo8.Text;
        if RadioButton9.Checked=true then otvet:=Memo9.Text;
        if RadioButton10.Checked=true then otvet:=Memo10.Text;
      end;

    randomize;
    if Add_Questions.Memo1.Text=''then
       memoText:='������ '+IntToStr(random(999999))
    else memoText:=Add_Questions.Memo1.Text;

    config.execRequestSQL('UPDATE ������� SET '+
      ' �����������������='+IntToStr(countQuestion)+','+
      ' �����������������='+#39+memoText+#39+','+
      ' ���������������='+#39+varianti+#39+','+
      ' �����������='+#39+otvet+#39+
      ' WHERE ����������='+IntToStr(kodVoprosa)
    );

    MessageBox(0,'������ ������� ���� ������� ���������!','', MB_OK+MB_ICONINFORMATION);

    Add_Questions.ListBox1.Clear;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������='+IntToStr(updateKodControl));
       with Add_Questions do
                begin
                    ListBox1.Clear;
                    BD.Request.DataSet.First;
                    While (BD.Request.DataSet.Eof=false) do
                        begin
                            ListBox1.Items.Add(BD.Request.DataSet.FieldByName('�����������������').AsString);
                            BD.Request.DataSet.Next;
                        end;
                end;
    ListBox1.ItemIndex:=indexLists;
end;

procedure TAdd_Questions.BitBtn1Click(Sender: TObject);
var varianti,otveti,memoText:string;
indexLists:integer;
begin
    indexLists:=ListBox1.ItemIndex;
    otveti:='';
    varianti:='';
    with VariantsQuestionMore1 do
      begin
         varianti:=varianti+Memo11.Text+'�';
         varianti:=varianti+Memo2.Text+'�';
         varianti:=varianti+Memo3.Text+'�';
         varianti:=varianti+Memo4.Text+'�';
         varianti:=varianti+Memo5.Text+'�';
         varianti:=varianti+Memo6.Text+'�';
         varianti:=varianti+Memo7.Text+'�';
         varianti:=varianti+Memo8.Text+'�';
         varianti:=varianti+Memo9.Text+'�';
         varianti:=varianti+Memo10.Text+'�';

        if CheckBox1.Checked=true  then otveti:=otveti+Memo11.Text+'�';
        if CheckBox2.Checked=true then otveti:=otveti+Memo2.Text+'�';
        if CheckBox3.Checked=true then otveti:=otveti+Memo3.Text+'�';
        if CheckBox4.Checked=true then otveti:=otveti+Memo4.Text+'�';
        if CheckBox5.Checked=true then otveti:=otveti+Memo5.Text+'�';
        if CheckBox6.Checked=true then otveti:=otveti+Memo6.Text+'�';
        if CheckBox7.Checked=true then otveti:=otveti+Memo7.Text+'�';
        if CheckBox8.Checked=true then otveti:=otveti+Memo8.Text+'�';
        if CheckBox9.Checked=true then otveti:=otveti+Memo9.Text+'�';
        if CheckBox10.Checked=true then otveti:=otveti+Memo10.Text+'�';
      end;

    randomize;
    if Add_Questions.Memo1.Text=''then
       memoText:='������ '+IntToStr(random(999999))
    else memoText:=Add_Questions.Memo1.Text;

    config.execRequestSQL('UPDATE ������� SET �����������������='+IntToStr(countQuestion)+', �����������������='+#39+memoText+#39+', ���������������='+
    #39+varianti+#39+', �����������='+#39+otveti+#39+' WHERE ����������='+IntToStr(kodVoprosa));

    MessageBox(0,'������ ������� ���� ������� ���������!','', MB_OK+MB_ICONINFORMATION);
    
    Add_Questions.ListBox1.Clear;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������='+IntToStr(updateKodControl));
       with Add_Questions do
                begin
                    ListBox1.Clear;
                    BD.Request.DataSet.First;
                    While (BD.Request.DataSet.Eof=false) do
                        begin
                            ListBox1.Items.Add(BD.Request.DataSet.FieldByName('�����������������').AsString);
                            BD.Request.DataSet.Next;
                        end;
                end;
    ListBox1.ItemIndex:=indexLists;
end;

procedure TAdd_Questions.Button2Click(Sender: TObject);
begin
    if ListBox1.Items.Count=0 then
      Button2.Enabled:=false;

    config.execRequestSQL('DELETE FROM ������� WHERE ����������='+IntToStr(kodVoprosa));
    ListBox1.Clear;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������='+IntToStr(updateKodControl));
    ListBox1.Clear;

    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
          ListBox1.Items.Add(BD.Request.DataSet.FieldByName('�����������������').AsString);
          BD.Request.DataSet.Next;
        end;

    Button2.Enabled:=false;
    VariantsQuestionSingle1.Visible:=false;
    VariantsQuestionMore1.Visible:=false;

    Panel1.Visible:=false;
    Panel2.Visible:=false;
    Memo1.Clear;
    Memo1.ReadOnly:=true;
    MessageBox(0,'������ ��� ������� ������! ','', MB_OK+MB_ICONINFORMATION);
end;

procedure TAdd_Questions.SpeedButton2Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TAdd_Questions.ComboBox1Change(Sender: TObject);
begin
     varianti:='';
     with VariantsQuestionSingle1 do
      begin
          varianti:=varianti+Memo1.Text+'�';
          varianti:=varianti+Memo2.Text+'�';
          varianti:=varianti+Memo3.Text+'�';
          varianti:=varianti+Memo4.Text+'�';
          varianti:=varianti+Memo5.Text+'�';
          varianti:=varianti+Memo6.Text+'�';
          varianti:=varianti+Memo7.Text+'�';
          varianti:=varianti+Memo8.Text+'�';
          varianti:=varianti+Memo9.Text+'�';
          varianti:=varianti+Memo10.Text+'�';
      end;

    randomize;
    if Add_Questions.Memo1.Text=''then
       memoText:='������ '+IntToStr(random(999999))
    else memoText:=Add_Questions.Memo1.Text;

    if ComboBox1.ItemIndex=1 then
       config.execRequestSQL('UPDATE ������� SET '+
      ' �����������������='+IntToStr(countQuestion)+','+
      ' �����������������='+#39+memoText+#39+','+
      ' ���������������='+#39+varianti+#39+','+
      ' �����������='+#39+''+#39+', '+
      ' �������=2'+
      ' WHERE ����������='+IntToStr(kodVoprosa)
    );

    defaultSettings;
    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������������='+#39+ListBox1.Items[ListBox1.Itemindex]+#39);
    kodVoprosa:=BD.Request.DataSet.FieldByName('����������').AsInteger;
    Memo1.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;
    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then
        processingSingleVariants;

    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then
         processingMoreVariants;
end;

{
  ��������� ��������� ��������� � ComboBox
  ���������� ��� �������
}
procedure TAdd_Questions.ComboBox2Change(Sender: TObject);
begin
    varianti:='';
    fillingAnswerChoices; // ����� ��������� ���������� ��������� ������� � ����������

    randomize;
    if Add_Questions.Memo1.Text=''then
       memoText:='������ '+IntToStr(random(999999))
    else
       memoText:=Add_Questions.Memo1.Text;

    if ComboBox1.ItemIndex=1 then
       config.execRequestSQL('UPDATE �������'+
                               ' SET �����������������='+IntToStr(countQuestion)+','+
                                   ' �����������������='+#39+memoText+#39+','+
                                   ' ���������������='+#39+varianti+#39+','+
                                   ' �����������='+#39+''+#39+', '+
                                   ' �������=1'+
                             ' WHERE ����������='+IntToStr(kodVoprosa)
       );

    defaultSettings; // ����� ��������� ���������� ����������� �������� ��� �����������

    config.selectRequestSQL('SELECT * FROM ������� WHERE �����������������='+#39+ListBox1.Items[ListBox1.Itemindex]+#39);
    kodVoprosa:=BD.Request.DataSet.FieldByName('����������').AsInteger;
    Memo1.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;

    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then
        processingSingleVariants;

    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then
         processingMoreVariants;
end;

procedure TAdd_Questions.processingSingleVariants;
begin
    VariantsQuestionSingle1.Visible:=true;
    Panel1.Visible:=true;
    ComboBox1.ItemIndex:=0;
    QuestionsMemo.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    QuestionsMemo.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    QuestionsMemo.putRightAnswer(BD.Request.DataSet.FieldByName('�����������').AsString); // ����������� ������ ������
    QuestionsMemo.clearStrokiMemo; // ������ ������ ������ ������ � Memo
end;

procedure TAdd_Questions.processingMoreVariants;
begin
    VariantsQuestionMore1.Visible:=true;
    Panel2.Visible:=true;
    ComboBox2.ItemIndex:=1;
    QuestionsMoreMemo.moreMemoClear;
    QuestionsMoreMemo.CheckBoxClear;
    QuestionsMoreMemo.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    QuestionsMoreMemo.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    QuestionsMoreMemo.setRightQuestionInArrayAnswers(BD.Request.DataSet.FieldByName('�����������').AsString); // �������� ������ ������ �������
    QuestionsMoreMemo.putRightAnswer; // ����������� ������ CheckBox
    QuestionsMoreMemo.clearStrokiMemo; // ������ ������ ������ ������ � Memo
end;

procedure TAdd_Questions.fillingAnswerChoices;
begin
   with VariantsQuestionMore1 do
      begin
         varianti:=varianti+Memo11.Text+'�';
         varianti:=varianti+Memo2.Text+'�';
         varianti:=varianti+Memo3.Text+'�';
         varianti:=varianti+Memo4.Text+'�';
         varianti:=varianti+Memo5.Text+'�';
         varianti:=varianti+Memo6.Text+'�';
         varianti:=varianti+Memo7.Text+'�';
         varianti:=varianti+Memo8.Text+'�';
         varianti:=varianti+Memo9.Text+'�';
         varianti:=varianti+Memo10.Text+'�';
      end;
end;

procedure TAdd_Questions.defaultSettings;
begin
    VariantsQuestionSingle1.Visible:=false;
    VariantsQuestionMore1.Visible:=false;
    Panel1.Visible:=false;
    Panel2.Visible:=false;
    Button2.Enabled:=true;
    Memo1.ReadOnly:=false;
end;

end.



