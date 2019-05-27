unit UpdateMultimedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, jpeg;

type
  TUpdateMultimediaModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Edit2: TEdit;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    function ReverseString(s: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateMultimediaModalForm: TUpdateMultimediaModalForm;
  unique_multimedia,unique_number_multimedia:boolean;
    nameRazdela,str,nameTema, path,PathFile:string;
    kodRazdela,kodTema:integer;

implementation

uses basa_dan, config, UpdateUnit, MultiMedia_CRUD, Menu_Multimedai;

{$R *.dfm}

procedure TUpdateMultimediaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateMultimediaModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateMultimediaModalForm.ComboBox1Change(Sender: TObject);
begin
   defaultSetting;

    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+ComboBox1.Text+#39);
    kodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;

    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;
    if ComboBox2.Items.Count>0 then
      begin                                                                      // Проверка на наличие тем в разделе
        label3.Visible:=true;
        Combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TUpdateMultimediaModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;
    BitBtn1.Visible:=true;

    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
    updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TUpdateMultimediaModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_multimedia:=false;
    unique_number_multimedia:=false;

    if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
    if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;
    if Path='' then
       MessageBox(0,'Файл мультимедии не выбран!','', MB_OK+MB_ICONwarning);

    if ((Edit1.Text<>'') and (Edit2.Text<>'') and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_multimedia<>false) and(unique_number_multimedia<>false)  and (Edit1.Visible<>false) and (Edit2.Visible<>false)and (Path<>'')) then
        saveDataInBD;
end;

procedure TUpdateMultimediaModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Мультимедиа SET КодТемы='+#39+IntToStr(updateKodTema)+#39+', НазваниеМультимедии='+#39+Edit1.Text+#39+', НомерМультимедии='+#39+Edit2.Text+#39+', Путь='+#39+'Multimedia\'+PathFile+#39+' WHERE КодМультимедии='+IntToStr(updateKodMultimedia));
    MessageBox(0,'Мультимелиа была успешно изменена!','Редактирование мультимедии', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

end;

procedure TUpdateMultimediaModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodMultimedia=BD.Request.DataSet.FieldByName('КодМультимедии').AsInteger)) then
      unique_multimedia:=true
    else
     MessageBox(0,'Даннная мультимедиа уже сущетсвует!','Редактирование мультимедии', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НомерМультимедии='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodMultimedia=BD.Request.DataSet.FieldByName('КодМультимедии').AsInteger)) then
      unique_number_multimedia:=true
    else
      MessageBox(0,'Данный номер мультимедии уже сущетсвует!','Редактирование мультимедии', MB_OK+MB_ICONwarning);
end;

procedure TUpdateMultimediaModalForm.defaultSetting; // дефолтные
begin
     Edit1.Visible:=false;
    Edit2.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    BitBtn1.Visible:=false;
end;

procedure TUpdateMultimediaModalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UpdateMultimediaModalForm.Visible:=false;
   MultiMediaCRUD.Enabled:=true;
end;

procedure TUpdateMultimediaModalForm.BitBtn1Click(Sender: TObject);
var allPath:string; i:integer;
begin
      PathFile:='';
      allPath:='';
      Path:='';
   if OpenDialog1.Execute then
      allPath:=OpenDialog1.FileName;
   for i:=Length(allPath) downto 1 do
    if allPath[i]<>'\' then Path:=Path+allPath[i] else break;
   Path:=ReverseString(path);
   for i:=1 to Length(Path)-4 do
    PathFile:=PathFile+Path[i];
end;

function TUpdateMultimediaModalForm.ReverseString(s: string): string;
var
  i: integer;
begin
  Result := '';
  if Trim(s) <> '' then
    for i := Length(s) downto 1 do
      Result := Result + s[i];
end;

procedure TUpdateMultimediaModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TUpdateMultimediaModalForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', #8]) then
      begin
       Key:=#0;
       label6.Visible:=true;
       label7.Visible:=false;
      end;
end;

procedure TUpdateMultimediaModalForm.Edit1Change(Sender: TObject);
begin
    label8.Visible:=false;
end;

end.
