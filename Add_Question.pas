unit Add_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, jpeg, ExtCtrls, Menus, DBCtrls, Buttons , basa_dan,
  Mask, Grids, DBGrids , AuthorizationData, Variants_Question,
  Variants_Question_More, Variants_Question_Write;

type
  TAdd_Questions = class(TForm)
    DBGrid1: TDBGrid;
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
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure VariantsQuestionSingle1BitBtn2Click(Sender: TObject);
    procedure VariantsQuestionSingle1BitBtn4Click(Sender: TObject);
    procedure VariantsQuestionSingle1BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Questions: TAdd_Questions;
  countQuestion,kodVoprosa:integer;

implementation

uses Unit3, Unit2, Title_Form, Control, Main_Menu, UpdateUnit, config,
  QuestionsMemo, AddQuestionModal,
  Control_CRUD;

{$R *.dfm}

procedure TAdd_Questions.SpeedButton3Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.show;
    Add_Questions.Visible:=false;
    AuthorizationForm.Position:=poDesktopCenter;
end;

procedure TAdd_Questions.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TAdd_Questions.ListBox1Click(Sender: TObject);
var i:integer;
begin
    Memo1.Clear;
    Button2.Enabled:=true;
    VariantsQuestionSingle1.Visible:=true;
    config.selectRequestSQL('SELECT * FROM Вопросы WHERE СодержаниеВопроса='+#39+ListBox1.Items[ListBox1.ItemIndex]+#39);
    QuestionsMemo.countQuest(DBGrid1.DataSource.DataSet.FieldByName('КоличествоОтветов').AsInteger);
    QuestionsMemo.setMemoLines;
    QuestionsMemo.setRadioButton(DBGrid1.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString);
    kodVoprosa:=DBGrid1.DataSource.DataSet.FieldByName('КодВопроса').AsInteger;
    Memo1.Lines.Add(DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString);
    for i:=Memo1.Lines.Count-1 downto  0 do
      if Memo1.Lines.Strings[i]='' then Memo1.Lines.Delete(i);
    QuestionsMemo.clearStrokiMemo;
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

procedure TAdd_Questions.VariantsQuestionSingle1BitBtn2Click(
  Sender: TObject);
begin
    QuestionsMemo.memoClear;
    QuestionsMemo.RadioButtonClear;
end;

procedure TAdd_Questions.VariantsQuestionSingle1BitBtn4Click(
  Sender: TObject);
begin
  VariantsQuestionSingle1.BitBtn4Click(Sender);

end;

procedure TAdd_Questions.VariantsQuestionSingle1BitBtn1Click(Sender: TObject);
var vernieOtvet:string;
begin
    clearStrokiMemo;  
    with Add_Questions.VariantsQuestionSingle1 do
      begin
        if RadioButton1.Checked=true then vernieOtvet:=Memo1.Text;
        if RadioButton2.Checked=true then vernieOtvet:=Memo2.Text;
        if RadioButton3.Checked=true then vernieOtvet:=Memo3.Text;
        if RadioButton4.Checked=true then vernieOtvet:=Memo4.Text;
        if RadioButton5.Checked=true then vernieOtvet:=Memo5.Text;
        if RadioButton6.Checked=true then vernieOtvet:=Memo6.Text;
        if RadioButton7.Checked=true then vernieOtvet:=Memo7.Text;
        if RadioButton8.Checked=true then vernieOtvet:=Memo8.Text;
        if RadioButton9.Checked=true then vernieOtvet:=Memo9.Text;
        if RadioButton10.Checked=true then vernieOtvet:=Memo10.Text;

 config.execRequestSQL('UPDATE Вопросы SET КодКонтроля='+IntToStr(updateKodControl)+', СодержаниеВопроса='+#39+Add_Questions.Memo1.Text+#39+', ВерныйОтвет='
 +#39+vernieOtvet+#39+', КоличествоОтветов='+#39+IntToStr(countQuestion)+#39+', Отв1='
 +#39+Memo1.Text+#39+', Отв2='+#39+Memo2.Text+#39+', Отв3='+#39+Memo3.Text+#39+', Отв4='+#39+Memo4.Text+#39+', Отв5='+#39+Memo5.Text+#39+',Отв6='
 +#39+Memo6.Text+#39+', Отв7='+#39+Memo7.Text+#39+', Отв8='+#39+Memo8.Text+#39+', Отв9='+#39+Memo9.Text+#39+', Отв10='+#39+Memo10.Text+#39+' WHERE КодВопроса='+IntToStr(kodVoprosa));

 config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));

 Add_Questions.ListBox1.Clear;
        Add_Questions.DBGrid1.DataSource.DataSet.First;
        While (Add_Questions.DBGrid1.DataSource.DataSet.Eof=false) do
          begin
            Add_Questions.ListBox1.Items.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString);
            Add_Questions.DBGrid1.DataSource.DataSet.Next;
          end;
   end;
end;

procedure TAdd_Questions.Button2Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM Вопросы WHERE КодВопроса='+DBGrid1.DataSource.DataSet.FieldByName('КодВопроса').AsString);
    config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));

    Add_Questions.ListBox1.Clear;
    Add_Questions.DBGrid1.DataSource.DataSet.First;
    While (Add_Questions.DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        Add_Questions.ListBox1.Items.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString);
        Add_Questions.DBGrid1.DataSource.DataSet.Next;
      end;
    Add_Questions.VariantsQuestionSingle1.Visible:=false;
    Add_Questions.Memo1.Clear;
    Button2.Enabled:=false;
end;

procedure TAdd_Questions.SpeedButton1Click(Sender: TObject);
begin
    Add_Questions.visible:=false;
    ControlCRUD.Visible:=true;
    ControlCRUD.Position:=poDesktopCenter;
end;

procedure TAdd_Questions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Add_Questions.visible:=false;
    ControlCRUD.Visible:=true;
    ControlCRUD.Position:=poDesktopCenter;
end;

end.
