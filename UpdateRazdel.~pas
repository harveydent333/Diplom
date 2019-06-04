unit UpdateRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, basa_dan, config, Grids, UpdateUnit,
  DBGrids;

type
  TUpdateRazdelModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateRazdelModalForm: TUpdateRazdelModalForm;
  unique_razdel,unique_number_razdel:boolean;

implementation

{$R *.dfm}

procedure TUpdateRazdelModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;
    Edit2.Text:=BD.Request.DataSet.FieldByName('НомерРаздела').AsString;
end;

procedure TUpdateRazdelModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_razdel:=false;
    unique_number_razdel:=false;

    if Edit2.Text='' then label1.Visible:=true;
    if Edit1.Text='' then label7.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_razdel<>false) and (unique_number_razdel<>false)) then
        saveDataInBD;
end;

procedure TUpdateRazdelModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Раздел SET НазваниеРаздела='+#39+Edit1.Text+#39+', НомерРаздела='+#39+Edit2.Text+#39+' WHERE КодРаздела ='+IntToStr(updateKodRazdela));
    MessageBox(0,'Раздел был успешно изменен!','Редактирование раздела', MB_OK+MB_ICONINFORMATION);;
    config.rebootRequestsCRUD;
end;

procedure TUpdateRazdelModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodRazdela=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger)) then
      unique_razdel:=true
    else
      MessageBox(0,'Данный раздел уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Раздел WHERE НомерРаздела='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodRazdela=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger)) then
      unique_number_razdel:=true
    else
          MessageBox(0,'Данный номер раздела уже сущетсвует!','Создание раздела', MB_OK+MB_ICONwarning);
end;

procedure TUpdateRazdelModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    label1.Visible:=false;
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
      end;
end;

procedure TUpdateRazdelModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TUpdateRazdelModalForm.Edit1Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

end.
