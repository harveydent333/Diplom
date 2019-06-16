unit UpdateLecture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Buttons;

type
  TUpdateLectureModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateLectureModalForm: TUpdateLectureModalForm;
   nameTema, nameRazdela:string;
    kodTema, kodRazdela:integer;
     unique_lecture,unique_number_lecture:boolean;

implementation

uses config, basa_dan, UpdateUnit;
{$R *.dfm}

procedure TUpdateLectureModalForm.ComboBox1Change(Sender: TObject);
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

procedure TUpdateLectureModalForm.ComboBox2Change(Sender: TObject);
begin
    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TUpdateLectureModalForm.SpeedButton1Click(Sender: TObject);       // Кнопка сохранить изменения
begin
    unique_lecture:=false;
    unique_number_lecture:=false;
    if ComboBox2.Visible=false then
      MessageBox(0,'Выберите раздел!','', MB_OK+MB_ICONwarning)
    else
      if Edit2.Visible=false then
         MessageBox(0,'Выберите тему!','', MB_OK+MB_ICONwarning)
      else
        begin
           if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
           if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;

           if ((Edit1.Text<>'') and (Edit2.Text<>'') and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
              checkUniqueData;

           if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_lecture<>false) and(unique_number_lecture<>false)  and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
              saveDataInBD;
        end;
end;

procedure TUpdateLectureModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Лекции SET '+
      ' КодТемы='+#39+IntToStr(kodTema)+#39+','+
      ' НазваниеЛекции='+#39+Edit1.Text+#39+','+
      ' НомерЛекции='+#39+Edit2.Text+#39+
      ' WHERE КодЛекции ='+IntToStr(updateKodLecture)
    );
    MessageBox(0,'Лекция была успешно Изменена!','Редактирование Лекции', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

end;

procedure TUpdateLectureModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Лекции WHERE НазваниеЛекции='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodLecture=BD.Request.DataSet.FieldByName('КодЛекции').AsInteger)) then
      unique_lecture:=true
    else
      MessageBox(0,'Данная лекция уже сущетсвует!','Создание лекции', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Лекции WHERE НомерЛекции='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodLecture=BD.Request.DataSet.FieldByName('КодЛекции').AsInteger)) then
      unique_number_lecture:=true
    else
      MessageBox(0,'Данный номер лекции уже сущетсвует!','Создание лекции', MB_OK+MB_ICONwarning);
end;

procedure TUpdateLectureModalForm.defaultSetting;
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

procedure TUpdateLectureModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateLectureModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in []) then Key := #0;
end;

procedure TUpdateLectureModalForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
       Key:=#0;
       label6.Visible:=true;
       label7.Visible:=false;
      end;
end;

procedure TUpdateLectureModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TUpdateLectureModalForm.Edit1Change(Sender: TObject);
begin
    label8.Visible:=false;
end;

procedure TUpdateLectureModalForm.FormCreate(Sender: TObject);
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
   config.selectRequestSQL('SELECT * FROM Лекции WHERE КодЛекции='+IntToStr(updateKodLecture));
   Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеЛекции').AsString;
   Edit2.Text:=BD.Request.DataSet.FieldByName('НомерЛекции').AsString;

    kodRazdela:=updateKodRazdela;
    kodTema:=updateKodTema;
end;

end.
