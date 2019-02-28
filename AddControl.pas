unit AddControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, jpeg;

type
  TAddTestModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    bed_edit: TImage;
    good_edit: TImage;
    defolt_edit: TImage;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTestModalForm: TAddTestModalForm;

implementation

uses Control, basa_dan;

{$R *.dfm}

procedure TAddTestModalForm.FormCreate(Sender: TObject);
begin
                                                                    //ЭТО ЕСЛИ ВЫБРАНА ТЕМА
if ((KnowledgeControl.treeview1.Selected.Parent<>nil) and (KnowledgeControl.treeview1.Selected.Parent.Parent=nil))then
  begin
KnowledgeControl.label4.Caption:=KnowledgeControl.treeview1.Selected.Text;
NameTemaForAddControl:='SELECT КодТемы FROM Тема WHERE НазваниеТемы='+#39+KnowledgeControl.label4.Caption+#39;
KnowledgeControl.label4.Caption:=NameTemaForAddControl;
DataModule1.ADOQuery3.SQL.Clear;
DataModule1.ADOQuery3.SQL.Add(NameTemaForAddControl);
DataModule1.ADOQuery3.Open;
KnowledgeControl.label6.Caption:=KnowledgeControl.dbgrid3.DataSource.DataSet.FieldByName('КодТемы').AsString;
label3.Caption:=KnowledgeControl.dbgrid3.DataSource.DataSet.FieldByName('КодТемы').AsString;
//...
DataModule1.ShowControlADO.Append;
good_edit.Visible:=false;
label2.Visible:=false;
bed_edit.Visible:=false;
defolt_edit.Visible:=true;
end
  else
    begin
        KnowledgeControl.label4.Caption:=KnowledgeControl.treeview1.Selected.Parent.Text;
        NameRazdelForAddTema:='SELECT КодРаздела FROM Раздел WHERE НазваниеРаздела='+#39+KnowledgeControl.label4.Caption+#39;
        KnowledgeControl.label4.Caption:=NameRazdelForAddTema;
        DataModule1.ADOQuery3.SQL.Clear;
        DataModule1.ADOQuery3.SQL.Add(NameRazdelForAddTema);
        DataModule1.ADOQuery3.Open;
        KnowledgeControl.label6.Caption:=KnowledgeControl.dbgrid3.DataSource.DataSet.FieldByName('КодРаздела').AsString;
        label3.Caption:=KnowledgeControl.dbgrid3.DataSource.DataSet.FieldByName('КодРаздела').AsString;

        DataModule1.ShowTemaADO.Append;

        good_edit.Visible:=false;
        label2.Visible:=false;
        bed_edit.Visible:=false;
        defolt_edit.Visible:=true;
    end;

end;

procedure TAddTestModalForm.SpeedButton1Click(Sender: TObject);
var unique_user:boolean;
begin
unique_user:=false;
DataModule1.ADOQuery3.SQL.Clear;
if DBEdit2.Text='' then   //ПОЛЕ ПРИ НАЖАТИИ КНОПКИ ДОБАВИТЬ
  begin
    label2.Visible:=true;
    defolt_edit.Visible:=false;
    good_edit.Visible:=false;
    bed_edit.Visible:=true;
  end;
  if DBEdit2.Text<>'' then
  begin
      DataModule1.ADOQuery3.SQL.Add('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+DBEdit2.Text+#39);
      DataModule1.ADOQuery3.Open;
      if DataModule1.ADOQuery3.IsEmpty then unique_user:=true
      else
       MessageBox(0,'Данный контроль уже сущетсвует!','Создание контроля', MB_OK+MB_ICONwarning);
   end;
 if ((DBEdit2.Text<>'')and(unique_user<>false)) then
    begin
    MessageBox(0,'Контроль был успешно Создан!','Создание Контроля', MB_OK+MB_ICONINFORMATION);

  if MyNode.Parent<>nil then
    KnowledgeControl.Treeview1.Items.AddChild(MyNode,DBEdit2.Text)
  else
      KnowledgeControl.Treeview1.Items.AddChild(MyNode,DBEdit2.Text);


  DataModule1.ShowControlADO.FieldByName('КодТемы').Value:=label3.Caption;
     DataModule1.ShowControlADO.Post;
     DataModule1.ShowControlADO.Append;
      label2.Visible:=false;
    defolt_edit.Visible:=true;
    good_edit.Visible:=false;
    bed_edit.Visible:=false;
    end;
end;

end.
