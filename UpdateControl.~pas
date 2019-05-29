unit UpdateControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TUpdateControlModalForm = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Timer1: TTimer;
    Label6: TLabel;
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
  UpdateControlModalForm: TUpdateControlModalForm;
   nameTema, nameRazdela:string;
    kodTema, kodRazdela:integer;
    unique_control,unique_number_control:boolean;
implementation

uses basa_dan, config, UpdateUnit;

{$R *.dfm}

procedure TUpdateControlModalForm.FormCreate(Sender: TObject);
begin
   // Получение всех разделов
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
      ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
      BD.Request.DataSet.Next;
    end;

    // Получение Раздела к которому относиться наша изменяемый контроль
    config.selectRequestSQL('SELECT * FROM Раздел WHERE КодРаздела='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;

    // Получение всех Тем раздела к которомой относиться наш изменяемый контроль знаний
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+IntToStr(updateKodRazdela));

    ComboBox2.Visible:=true;
    label3.Visible:=true;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
      end;

   // Получение название Темы нашего изменяемого Контроля знаний
   config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
   ComboBox2.Text:=BD.Request.DataSet.FieldByName('НазваниеТемы').AsString;

   // Получение названия Контроля знаний, который изменяем
   Edit1.Visible:=true;
   Edit2.Visible:=true;
   label2.Visible:=true;
   label4.Visible:=true;

   config.selectRequestSQL('SELECT * FROM Контроль WHERE КодКонтроля='+IntToStr(updateKodControl));
   Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеКонтроля').AsString;
   Edit2.Text:=BD.Request.DataSet.FieldByName('НомерКонтроля').AsString;
    kodRazdela:=updateKodRazdela;
    kodTema:=updateKodTema;
end;

procedure TUpdateControlModalForm.ComboBox1Change(Sender: TObject);
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

procedure TUpdateControlModalForm.ComboBox2Change(Sender: TObject);
begin
    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TUpdateControlModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_control:=false;
    unique_number_control:=false;

    if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
    if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>'') and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_control<>false) and(unique_number_control<>false)  and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
        saveDataInBD;
end;

procedure TUpdateControlModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Контроль SET КодТемы='+#39+IntToStr(kodTema)+#39+', НазваниеКонтроля='+#39+Edit1.Text+#39+', НомерКонтроля='+#39+Edit2.Text+#39+' WHERE КодКонтроля ='+IntToStr(updateKodControl));
    MessageBox(0,'Контроль знаний был успешно изменен!','Редактирование контроля знаний', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

end;

procedure TUpdateControlModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Контроль WHERE НазваниеКонтроля='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodControl=BD.Request.DataSet.FieldByName('КодКонтроля').AsInteger)) then
      unique_control:=true
    else
      MessageBox(0,'Данный контроль знаний уже сущетсвует!','Редактирование контроля знаний', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Контроль WHERE НомерКонтроля='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodControl=BD.Request.DataSet.FieldByName('КодКонтроля').AsInteger)) then
      unique_number_control:=true
    else
      MessageBox(0,'Данный номер контроля знаний уже сущетсвует!','Редактирование контроля знаний', MB_OK+MB_ICONwarning);
end;

procedure TUpdateControlModalForm.defaultSetting;
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

procedure TUpdateControlModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateControlModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateControlModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
        label7.Visible:=false;
      end;
end;

procedure TUpdateControlModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TUpdateControlModalForm.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    label8.Visible:=false;
end;

end.
