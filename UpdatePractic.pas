unit UpdatePractic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TUpdatePracticModalForm = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdatePracticModalForm: TUpdatePracticModalForm;
       nameTema, nameRazdela:string;
        kodTema, kodRazdela:integer;
       unique_practic,unique_number_practic:boolean;

implementation

uses config, basa_dan, UpdateUnit;
{$R *.dfm}

procedure TUpdatePracticModalForm.FormCreate(Sender: TObject);
begin
 // Получение всех разделов
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
            BD.Request.DataSet.Next;
    end;

    // Получение Раздела к которому относиться наша изменяемая лекция
    config.selectRequestSQL('SELECT * FROM Раздел WHERE КодРаздела='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;

    // Получение всех Тем раздела к которомой относиться наша изменяемая лекция
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+IntToStr(updateKodRazdela));

    ComboBox2.Visible:=true;
    label3.Visible:=true;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
      end;

   // Получение название Темы нашей зменяемой лекции
   config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
   ComboBox2.Text:=BD.Request.DataSet.FieldByName('НазваниеТемы').AsString;

   // Получение названия Практики к которомой относитсья наша изменяемая Практическая             +
   Edit1.Visible:=true;
   Edit2.Visible:=true;
   label2.Visible:=true;
   label4.Visible:=true;
   config.selectRequestSQL('SELECT * FROM Практические WHERE КодПрактической='+IntToStr(updateKodPractic));
   Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеПрактической').AsString;
   Edit2.Text:=BD.Request.DataSet.FieldByName('НомерПрактической').AsString;

    kodRazdela:=updateKodRazdela;
    kodTema:=updateKodTema;
end;

procedure TUpdatePracticModalForm.ComboBox2Change(Sender: TObject);
begin
    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TUpdatePracticModalForm.ComboBox1Change(Sender: TObject);
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
    // Если раздел не пустой
    if ComboBox2.Items.Count>0 then
      begin
        Edit1.visible:=true;
        Edit2.Visible:=true;
        label2.Visible:=true;
        label3.Visible:=true;
        label4.Visible:=true;
        Combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TUpdatePracticModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_practic:=false;
    unique_number_practic:=false;

    if ((Edit2.Text='') and (Edit2.Visible=true)) then label8.Visible:=true;
    if ((Edit1.Text='') and (Edit1.Visible=true)) then label7.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'') and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_practic<>false) and(unique_number_practic<>false)  and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
        saveDataInBD;
end;

procedure TUpdatePracticModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Практические SET КодТемы='+#39+IntToStr(kodTema)+#39+', НазваниеПрактической='+#39+Edit1.Text+#39+', НомерПрактической='+#39+Edit2.Text+#39+' WHERE КодПрактической ='+IntToStr(updateKodPractic));
    MessageBox(0,'Практическая была успешно Изменена!','Редактирование Практической', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
end;

procedure TUpdatePracticModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Практические WHERE НазваниеПрактической='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('КодПрактической').AsInteger)) then
      unique_practic:=true
    else
      MessageBox(0,'Данная практическая уже сущетсвует!','Создание практической', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Практические WHERE НомерПрактической='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('КодПрактической').AsInteger)) then
      unique_number_practic:=true
    else
      MessageBox(0,'Данный номер лекции уже сущетсвует!','Создание лекции', MB_OK+MB_ICONwarning);
end;

procedure TUpdatePracticModalForm.defaultSetting;
begin
    Edit1.Visible:=false;
    Edit2.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
end;

procedure TUpdatePracticModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdatePracticModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;


procedure TUpdatePracticModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
       Key:=#0;
       label6.Visible:=true;
       label8.Visible:=false;
      end;
end;

procedure TUpdatePracticModalForm.Edit1Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

procedure TUpdatePracticModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

end.
