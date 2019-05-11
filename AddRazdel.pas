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
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
    AddRazdelModalForm: TAddRazdelModalForm;
    unique_razdel:boolean;
    str:string;
    
implementation

uses Control, config;

{$R *.dfm}

procedure TAddRazdelModalForm.SpeedButton1Click(Sender: TObject);   //  Нажатие кнопки "Добавить"
begin
    unique_razdel:=false;

    if Edit1.Text<>'' then
      checkUniqueData;

    if ((Edit1.Text<>'')and(unique_razdel<>false)) then
      saveDataInBD;
end;

procedure TAddRazdelModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Раздел (НазваниеРаздела) VALUES ('+#39+Edit1.Text+#39+')');
    MessageBox(0,'Раздел был успешно Создан!','Создание Раздела', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
    Edit1.Text:='';
end;

procedure TAddRazdelModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Edit1.Text+#39);
    if DataModule1.ADOModuleLecture.IsEmpty then
      unique_razdel:=true
    else
       MessageBox(0,'Данный раздел уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);
end;

end.
