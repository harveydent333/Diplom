unit AddPractic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons;

type
  TAddPracticModalForm = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddPracticModalForm: TAddPracticModalForm;
    nameRazdela,str,nameTema:string;
    kodRazdela,kodTema:integer;
    unique_practic,unique_number_practic:boolean;
implementation

uses basa_dan, config;

{$R *.dfm}

procedure TAddPracticModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:='';                                                                               //Заполнение ComboBox при создании
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
    begin
      ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
      BD.Request.DataSet.Next;
    end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;           //  конец создания
end;

procedure TAddPracticModalForm.ComboBox1Change(Sender: TObject);
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

procedure TAddPracticModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;
    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);  // Получение код темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TAddPracticModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_practic:=false;
    unique_number_practic:=false;

    if Edit2.Text='' then label7.Visible:=true;
    if Edit1.Text='' then label8.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_practic<>false) and(unique_number_practic<>false)) then
        saveDataInBD;
end;

procedure TAddPracticModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Практические(КодТемы, НазваниеПрактической, НомерПрактической) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+')');
    MessageBox(0,'Практическая была успешно создана!','Создание Практической', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;
end;

procedure TAddPracticModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Практические WHERE НазваниеПрактической='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_practic:=true
    else
      MessageBox(0,'Данная практическая уже сущетсвует!','Создание практической', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Практические WHERE НомерПрактической='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_practic:=true
    else
      MessageBox(0,'Данный номер практической уже сущетсвует!','Создание практической работы', MB_OK+MB_ICONwarning);
end;

procedure TAddPracticModalForm.defaultSetting;
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

procedure TAddPracticModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddPracticModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddPracticModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
        label7.Visible:=false;
      end;
end;

procedure TAddPracticModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TAddPracticModalForm.Edit1Change(Sender: TObject);
begin
    label8.Visible:=false;
end;

end.



