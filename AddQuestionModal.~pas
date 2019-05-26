unit AddQuestionModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TAddQuestionModalForm = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddQuestionModalForm: TAddQuestionModalForm;

implementation

uses UpdateUnit, Control_CRUD, Add_Question, config, basa_dan;

{$R *.dfm}

procedure TAddQuestionModalForm.SpeedButton1Click(Sender: TObject);
var  unique_user:boolean;
begin
    if Edit1.Text='' then label7.Visible:=true;

    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM Вопросы WHERE СодержаниеВопроса='+#39+Edit1.Text+#39);
        if BD.RequestSQL.IsEmpty then
          unique_user:=true
        else
          MessageBox(0,'Данный вопрос уже существует!','Создание вопроса', MB_OK+MB_ICONwarning);
      end;

      if ((Edit1.Text<>'')and(unique_user<>false)) then
      begin
        config.execRequestSQL('INSERT INTO Вопросы (КодКонтроля, СодержаниеВопроса, КоличествоОтветов, КодТипа) VALUES('+IntToStr(updateKodControl)+','+#39+Edit1.Text+#39+','+ComboBox1.Items[ComboBox1.ItemIndex]+', '+IntToStr(ComboBox2.ItemIndex+1)+')');
        MessageBox(0,'Вопрос был успешно создан!','Создание вопроса', MB_OK+MB_ICONINFORMATION);

        config.selectRequestSQL('SELECT * FROM Вопросы WHERE КодКонтроля='+IntToStr(updateKodControl));
        Add_Questions.ListBox1.Clear;
        Add_Questions.DBGrid1.DataSource.DataSet.First;
        While (Add_Questions.DBGrid1.DataSource.DataSet.Eof=false) do
          begin
            Add_Questions.ListBox1.Items.Add(Add_Questions.DBGrid1.DataSource.DataSet.FieldByName('СодержаниеВопроса').AsString);
            Add_Questions.DBGrid1.DataSource.DataSet.Next;
          end;
        Edit1.Text:='';
      end;

end;

procedure TAddQuestionModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddQuestionModalForm.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddQuestionModalForm.Edit1Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

end.
