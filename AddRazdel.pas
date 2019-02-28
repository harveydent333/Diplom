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
var unique_razdel:boolean;   str:string;
begin
unique_razdel:=false;
DataModule1.ADOModuleLecture.SQL.Clear;
  if Edit1.Text<>'' then
  begin
      DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Edit1.Text+#39);
      DataModule1.ADOModuleLecture.Open;
      if DataModule1.ADOModuleLecture.IsEmpty then unique_razdel:=true
      else
       MessageBox(0,'Данный раздел уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);
   end;
 if ((Edit1.Text<>'')and(unique_razdel<>false)) then
    begin
    DataModule1.ShowRazdelADO.Append;
    DataModule1.ShowRazdelADO.Edit;
    DataModule1.ShowRazdelADO.FieldByName('НазваниеРаздела').AsString:=edit1.Text;
    DataModule1.ShowRazdelADO.Post;
    MessageBox(0,'Раздел был успешно Создан!','Создание Раздела', MB_OK+MB_ICONINFORMATION);
    DataModule1.ADORazdelCRUD.Active:=False;
    DataModule1.ADORazdelCRUD.Active:=True;
   end;
end;

procedure TAddRazdelModalForm.FormCreate(Sender: TObject);
begin
Edit1.Text:='';
end;

end.
