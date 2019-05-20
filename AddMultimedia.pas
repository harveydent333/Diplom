unit AddMultimedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Grids, DBGrids, Buttons;

type
  TAddMultimediaModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddMultimediaModalForm: TAddMultimediaModalForm;
    nameRazdela,str,nameTema:string;
    kodRazdela,kodTema:integer;
    unique_multimedia,unique_number_multimedia:boolean;

implementation

uses config, basa_dan, UpdateUnit;

{$R *.dfm}

procedure TAddMultimediaModalForm.FormCreate(Sender: TObject);
begin                                                                              //Заполнение ComboBox при создании
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
            BD.Request.DataSet.Next;
        end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;
end;

procedure TAddMultimediaModalForm.ComboBox1Change(Sender: TObject);
begin
    defaultSetting;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39); // Получение кода раздела
    kodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
     // Проверка на наличие потомков у Раздела
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
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TAddMultimediaModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);  // Получение код темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
    label2.Visible:=true;
end;

procedure TAddMultimediaModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_multimedia:=false;
    unique_number_multimedia:=false;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
      checkUniqueData;

    if ((Edit1.Text<>'')and(Edit2.Text<>'')and(unique_multimedia<>false) and(unique_number_multimedia<>false)) then
      saveDataInBD;
end;

procedure TAddMultimediaModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Мультимедиа (КодТемы, НазваниеМультимедии, НомерМультимедии) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+')');
    MessageBox(0,'Мультимедиа была успешно создана!','Создание Мультимедии', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;
end;

procedure TAddMultimediaModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_multimedia:=true
    else
      MessageBox(0,'Данная Мультимедия уже сущетсвует!','Создание Мультимедии', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НомерМультимедии='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_multimedia:=true
    else
      MessageBox(0,'Данный номер мультимедии уже сущетсвует!','Создание мультимедии', MB_OK+MB_ICONwarning);
end;

procedure TAddMultimediaModalForm.defaultSetting;
begin
    Edit1.Visible:=false;
    Edit2.Visible:=false;
    Edit1.Text:='';
    Edit2.Text:='';
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
end;

procedure TAddMultimediaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddMultimediaModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddMultimediaModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.
