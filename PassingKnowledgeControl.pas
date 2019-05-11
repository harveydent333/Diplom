unit PassingKnowledgeControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, basa_dan, Grids, DBGrids , defoltTest,
  Variants_Question_More;

type
  TPassingKnowledgeControlForm = class(TForm)
    DBGrid1: TDBGrid;
    VariantsQuestionMore1: TVariantsQuestionMore;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure setDataInResultForm;
    procedure setMarkForTest;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassingKnowledgeControlForm: TPassingKnowledgeControlForm;

implementation

uses AuthorizationData, Result, Control,DateUtils,
  config,
  UpdateUnit,
  Menu_Control;
{$R *.dfm}

procedure TPassingKnowledgeControlForm.Button1Click(Sender: TObject);
begin
    inc(exitPoint);
    if DBGrid1.DataSource.DataSet.RecNo+1=DBGrid1.DataSource.DataSet.RecordCount then
        Button1.Caption:='��������� ��������';
    defoltTest.checkOtvet;
    DBGrid1.DataSource.DataSet.Next;

    Memo1.Clear;
    Memo1.Lines.Add(DBGrid1.DataSource.DataSet.FieldByName('�����������������').AsString);
    defoltTest.countQuest(DBGrid1.DataSource.DataSet.FieldByName('�����������������').AsInteger);
    defoltTest.setMemoLines;
    defoltTest.clearStrokiMemo;

    if exitPoint>DBGrid1.DataSource.DataSet.RecordCount then
      begin
            setDataInResultForm;
            ResultForm.Show;
            ResultForm.Position:=poDesktopCenter;
            PassingKnowledgeControlForm.Enabled:=false;
      end;
end;

procedure TPassingKnowledgeControlForm.setDataInResultForm;
begin
    with ResultForm do
            begin
              label14.Caption:=IntToStr(countQuestion);  // �����: ����� ��������
              label22.Caption:=IntToStr(countQuestion);    // �����: �� <������� ��>
              label1.Caption:=IntToStr(countBall);      // �����: �� ��� ���������
              label11.Caption:=IntToStr(countBall);   // �����: ���� �����
              label5.Caption:=IntToStr(countQuestion-countBall); // �����: �� ��� ������

              label3.Caption:=FloatToStr((countBall*100)/countQuestion);  // �����: �� ��������� � %
              label7.Caption:=FloatToStr(100-(countBall*100)/countQuestion);
              label9.Caption:=FloatToStr((countBall*100)/countQuestion);   // �����: ���������

              setMarkForTest;    // ������������ ������

          end;
end;

procedure TPassingKnowledgeControlForm.setMarkForTest;
var resultProcent:real;
begin
    resultProcent:=(countBall*100)/countQuestion;
    if resultProcent < 50 then
      begin
        ResultForm.Label23.Caption:='2';  // �����: ���� ������
        ResultForm.Label23.Font.Color:=clRed;
        ResultForm.Label9.Font.Color:=clRed;
        config.execRequestSQL('UPDATE ������ SET ������='+#39+'2'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;

    if ((resultProcent >= 50) and (resultProcent < 75))  then
      begin
        ResultForm.Label23.Caption:='3';  // �����: ���� ������
        ResultForm.Label23.Font.Color:=clOlive;
        ResultForm.Label9.Font.Color:=clOlive;
        config.execRequestSQL('UPDATE ������ SET ������='+#39+'3'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;

    if ((resultProcent >= 75) and (resultProcent < 85))  then
      begin
        ResultForm.Label23.Caption:='4';  // �����: ���� ������
        ResultForm.Label23.Font.Color:=clGreen;
        ResultForm.Label9.Font.Color:=clGreen;
        config.execRequestSQL('UPDATE ������ SET ������='+#39+'4'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;
    if resultProcent >= 85  then
      begin
        ResultForm.Label23.Caption:='5';  // �����: ���� ������
        ResultForm.Label23.Font.Color:=clLime;
        ResultForm.Label9.Font.Color:=clLime;
        config.execRequestSQL('UPDATE ������ SET ������='+#39+'5'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;
end;


procedure TPassingKnowledgeControlForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var temp:word;
begin
   temp:=MessageBox(0,'�� ����� ������ ��������� ������������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      begin
        setDataInResultForm;
        ResultForm.Show;
        ResultForm.Position:=poDesktopCenter;
        PassingKnowledgeControlForm.Enabled:=false;
      end;
end;

end.
