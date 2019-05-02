unit Add_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, jpeg, ExtCtrls, Menus, DBCtrls, Buttons , basa_dan,
  Mask, Grids, DBGrids , AuthorizationData, Variants_Question;

type
  TAdd_Questions = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    DBLookupListBox1: TDBLookupListBox;
    DBMemo6: TDBMemo;
    DBGrid1: TDBGrid;
    N2: TMenuItem;
    Label2: TLabel;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    procedure N1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Questions: TAdd_Questions;

implementation

uses Unit3, Unit2, Title_Form, Control, Main_Menu;

{$R *.dfm}

procedure TAdd_Questions.N1Click(Sender: TObject);
begin
DataModule1.AddQuestionADO.Append;
DataModule1.AddQuestionADO.FieldByName('СодержаниеВопроса').Value:='Вопрос №'+inttostr(strtoint(label2.Caption)+1)+' ';
DataModule1.AddQuestionADO.FieldByName('КодКонтроля').Value:=AuthorizationData.KodControla;
//DataModule1.AddQuestionADO.FieldByName('КодКонтроля').Value:=2;
label2.Caption:=inttostr(strtoint(label2.caption)+1);

end;

procedure TAdd_Questions.SpeedButton1Click(Sender: TObject);
begin
Add_Questions.Close;
KnowledgeControl.show;
end;

procedure TAdd_Questions.SpeedButton3Click(Sender: TObject);
begin
AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;
AuthorizationForm.show;
AuthorizationForm.Position:=poDesktopCenter;
Add_Questions.Close;
MainMenu.Close;
end;

procedure TAdd_Questions.SpeedButton4Click(Sender: TObject);
begin
Add_Questions.Close;
TitleForm.close;
end;

procedure TAdd_Questions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
KnowledgeControl.Show;
end;

end.
