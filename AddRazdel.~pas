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
    Edit2: TEdit;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
    AddRazdelModalForm: TAddRazdelModalForm;
    unique_razdel,unique_number_razdel:boolean;
    
implementation

uses Control, config, AuthorizationData;

{$R *.dfm}

procedure TAddRazdelModalForm.SpeedButton1Click(Sender: TObject);   //  Нажатие кнопки "Добавить"
begin
    unique_razdel:=false;
    unique_number_razdel:=false;

    if Edit2.Text='' then label3.Visible:=true;
    if Edit1.Text='' then label7.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
      checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_razdel<>false) and (unique_number_razdel<>false)) then
      saveDataInBD;
end;

procedure TAddRazdelModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Раздел (НазваниеРаздела, НомерРаздела, КодУчителя) VALUES ('+
      #39+Edit1.Text+#39', '+
      #39+Edit2.Text+#39+', '+
      IntToStr(kodUser)+')'
    );

    MessageBox(0,'Раздел был успешно Создан!','Создание Раздела', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
    Edit1.Text:='';
    Edit2.Text:='';
end;

procedure TAddRazdelModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_razdel:=true
    else
      MessageBox(0,'Данный раздел уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Раздел WHERE НомерРаздела='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_razdel:=true
    else
          MessageBox(0,'Данный номер раздела уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);
end;

procedure TAddRazdelModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
        label3.Visible:=false;
      end;
end;

procedure TAddRazdelModalForm.Edit1Change(Sender: TObject);
begin
  label7.Visible:=false;
end;

procedure TAddRazdelModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

end.
