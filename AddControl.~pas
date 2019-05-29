unit AddControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, jpeg, Grids, DBGrids;

type
  TAddControlModalForm = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddControlModalForm: TAddControlModalForm;
  nameRazdela,str,nameTema:string;
  kodRazdela,kodTema:integer;
  unique_control,unique_number_control:boolean;
implementation

uses Control, basa_dan, config;

{$R *.dfm}

procedure TAddControlModalForm.FormCreate(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Раздел');  //Заполнение ComboBox при создании
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
        BD.Request.DataSet.Next;
      end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;           //  конец создания
end;

procedure TAddControlModalForm.ComboBox1Change(Sender: TObject);
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

procedure TAddControlModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;
    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);  // Получение код темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TAddControlModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_control:=false;
    unique_number_control:=false;

    if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
    if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_control<>false) and(unique_number_control<>false)) then
        saveDataInBD;

end;

procedure TAddControlModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Контроль (КодТемы, НазваниеКонтроля, НомерКонтроля) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+')');
    MessageBox(0,'Контроль знаний был успешно создан!','Создание контроля знаний', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;
end;

procedure TAddControlModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_control:=true
    else
      MessageBox(0,'Данный контроль знаний уже сущетсвует!','Создание контроля знаний', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Контроль WHERE НомерКонтроля='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_control:=true
    else
      MessageBox(0,'Данный номер контроля знаний уже сущетсвует!','Создание контроля знаний', MB_OK+MB_ICONwarning);
end;

procedure TAddControlModalForm.defaultSetting;
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

procedure TAddControlModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddControlModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddControlModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
        label7.Visible:=false;
      end;
end;

procedure TAddControlModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TAddControlModalForm.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    label8.Visible:=true;
end;

end.
