unit PassingKnowledgeControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, basa_dan, Grids, DBGrids , defoltTest,
  Variants_Question_More, Variants_Question;

type
  TPassingKnowledgeControlForm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Memo1: TMemo;
    VariantsQuestionSingle1: TVariantsQuestionSingle;
    VariantsQuestionMore1: TVariantsQuestionMore;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VariantsQuestionMore1Label1Click(Sender: TObject);
  private
    procedure processingSingleQuestion;
    procedure processingMoreQuestion;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassingKnowledgeControlForm: TPassingKnowledgeControlForm;

implementation

uses AuthorizationData, Result, Control,DateUtils,
  config, UpdateUnit, Menu_Control, Add_Question, AddControl,
  AddQuestionModal, PassControlMore, PassControlSingle, QuestionsMemo,
  QuestionsMoreMemo;
{$R *.dfm}

{
  ��������� ��������� ������ "��������� ������", �������� ������ ����������� ������� � ������� ����
}
procedure TPassingKnowledgeControlForm.Button1Click(Sender: TObject);
begin
    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then
      PassControlSingle.checkUserAnswer;

    if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then
      PassControlMore.checkUserAnswer;

    if BD.Request.DataSet.RecNo+1 = BD.Request.DataSet.RecordCount then
      Button1.Caption:='��������� ������������';

    if BD.Request.DataSet.RecNo = BD.Request.DataSet.RecordCount then
      begin
        config.countingResults;
        PassingKnowledgeControlForm.Enabled:=false;
      end
    else
      begin
        BD.Request.DataSet.Next;

        VariantsQuestionSingle1.Visible:=false;
        VariantsQuestionMore1.Visible:=false;

        kodVoprosa:=BD.Request.DataSet.FieldByName('����������').AsInteger;
        Memo1.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;

        if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_SINGLE_QUESTIONS then
          processingSingleQuestion;
        if BD.Request.DataSet.FieldByName('�������').AsInteger=TYPE_MORE_QUESTIONS then
          processingMoreQuestion;
      end;
end;

procedure TPassingKnowledgeControlForm.processingSingleQuestion;
begin
    VariantsQuestionSingle1.Visible:=true;
    PassControlSingle.singleMemoClear;
    PassControlSingle.RadioButtonClear;
    PassControlSingle.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    PassControlSingle.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    PassControlSingle.clearStrokiMemo; // ������ ������ ������ ������ � Memo
end;

procedure TPassingKnowledgeControlForm.processingMoreQuestion;
begin
    VariantsQuestionMore1.Visible:=true;

    PassControlMore.moreMemoClear;
    PassControlMore.CheckBoxClear;
    PassControlMore.countQuest(BD.Request.DataSet.FieldByName('�����������������').AsInteger); // ������������� ���-�� ����� � ����������
    PassControlMore.setQuestionInMemo(BD.Request.DataSet.FieldByName('���������������').AsString);  // ����������� �������� � ���� memo
    PassControlMore.setRightQuestionInArrayAnswers(BD.Request.DataSet.FieldByName('�����������').AsString); // �������� ������ ������ �������
    PassControlMore.clearStrokiMemo; // ������ ������ ������ ������ � Memo
end;

procedure TPassingKnowledgeControlForm.Button2Click(Sender: TObject);
var temp:word;
begin
   temp:=MessageBox(0,'�� ����� ������ ��������� ������������?','���������������� � ������ Web - ����������', MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      begin
        ResultForm.Show;
        ResultForm.Position:=poDesktopCenter;
        PassingKnowledgeControlForm.Enabled:=false;
        config.countingResults;
      end;
end;

procedure TPassingKnowledgeControlForm.VariantsQuestionMore1Label1Click(
  Sender: TObject);
begin
   PassingKnowledgeControlForm.AutoScroll:=true;
end;

end.
