unit AddRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, jpeg, StdCtrls, Mask, DBCtrls , basa_dan;

type
  TAddRazdelModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddRazdelModalForm: TAddRazdelModalForm;

implementation

uses Control; //kodRazdel:integer;

{$R *.dfm}

procedure TAddRazdelModalForm.SpeedButton1Click(Sender: TObject);
var unique_user:boolean;   str:string;
begin
{  begin
    unique_user:=false;
    DataModule1.AddRazdelADO.SQL.Clear;
    if DBEdit1.Text<>'' then
      begin
        DataModule1.AddRazdelADO.SQL.Add('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+DBEdit1.Text+#39);
        DataModule1.AddRazdelADO.Open;
        if DataModule1.AddRazdelADO.IsEmpty then unique_user:=true
        else
          MessageBox(0,'Данный раздел уже существует!','Создание раздела', MB_OK+MB_ICONwarning);
      end;
    if ((DBEdit1.Text<>'')and(unique_user<>false)) then
      begin
        MessageBox(0,'Раздел был успешно Создан!','Создание Раздела', MB_OK+MB_ICONINFORMATION);
        KnowledgeControl.label2.Caption:=DBEdit1.Text;

    if MyNode.Parent=nil then
      KnowledgeControl.Treeview1.Items.Add(MyNode,DBEdit1.Text)
    else
      KnowledgeControl.Treeview1.Items.Add(MyNode.Parent,DBEdit1.Text);

      DataModule1.ShowRazdelADO.Post;
      DataModule1.ShowRazdelADO.Append;
    end;
  end;         }

{
unique_user:=false;
DataModule1.ProverkaTemADO.SQL.Clear;
  if Edit1.Text<>'' then
  begin
      DataModule1.ProverkaTemADO.SQL.Add('SELECT * FROM Тема WHERE НазваниеТемы='+#39+Edit1.Text+#39);
      DataModule1.ProverkaTemADO.Open;
      if DataModule1.ProverkaTemADO.IsEmpty then unique_user:=true
      else
       MessageBox(0,'Данная тема уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);
   end;
 if ((Edit1.Text<>'')and(unique_user<>false)) then
    begin
    DataModule1.ShowTemaADO.Append;
    DataModule1.ShowTemaADO.Edit;
    DataModule1.ShowTemaADO.FieldByName('НазваниеТемы').AsString:=edit1.Text;
    DataModule1.ShowTemaADO.FieldByName('КодРаздела').AsInteger:=kodRazdel;
    DataModule1.ShowTemaADO.Post;
    MessageBox(0,'Тема была успешно Создана!','Создание Темы', MB_OK+MB_ICONINFORMATION);
    DataModule1.ADOTemaCRUD.Active:=False;
    DataModule1.ADOTemaCRUD.Active:=True;
   end;
                }


end;

procedure TAddRazdelModalForm.FormCreate(Sender: TObject);
begin
Edit1.Text:='';
end;

end.
