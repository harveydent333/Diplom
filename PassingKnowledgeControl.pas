unit PassingKnowledgeControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, basa_dan, Grids, DBGrids , defoltTest,
  Variants_Question_More;

type
  TPassingKnowledgeControlForm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Memo1: TMemo;
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

procedure TPassingKnowledgeControlForm.setDataInResultForm;
begin

end;

procedure TPassingKnowledgeControlForm.setMarkForTest;
begin

end;


procedure TPassingKnowledgeControlForm.FormClose(Sender: TObject; var Action: TCloseAction);
var temp:word;
begin
   temp:=MessageBox(0,'Вы точно хотите завершить тестирование?','Программирование и защита Web - приложений',
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
