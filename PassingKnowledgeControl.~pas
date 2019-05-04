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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassingKnowledgeControlForm: TPassingKnowledgeControlForm;

implementation

uses AuthorizationData, Result, Control;
{$R *.dfm}

procedure TPassingKnowledgeControlForm.Button1Click(Sender: TObject);
begin
      DBGrid1.DataSource.DataSet.Next;
      Memo1.Clear;
      Memo1.Lines.Add(DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString);
      defoltTest.countQuest(DBGrid1.DataSource.DataSet.FieldByName('КоличествоОтветов').AsInteger);
      defoltTest.setMemoLines;
      defoltTest.clearStrokiMemo;
end;

end.
