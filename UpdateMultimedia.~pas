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
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateMultimediaModalForm: TUpdateMultimediaModalForm;
   nameTema, nameRazdela:string;
        kodTema, kodRazdela:integer;
        unique_user:boolean;

implementation

uses basa_dan, config, UpdateUnit;

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

procedure TUpdateMultimediaModalForm.FormCreate(Sender: TObject);
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
   label2.Visible:=true;
   config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE КодМультимедии='+IntToStr(updateKodPractic));
   Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеМультимедии').AsString;

    kodRazdela:=updateKodRazdela;
    kodTema:=updateKodTema;
end;

procedure TUpdateMultimediaModalForm.ComboBox1Change(Sender: TObject);
begin
    Edit1.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    label5.visible:=false;

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
        edit1.visible:=true;
        label2.Visible:=true;
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
    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
end;

procedure TUpdateMultimediaModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+Edit1.Text+#39);
        if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('КодМультимедии').AsInteger)) then
          unique_user:=true
        else
          MessageBox(0,'Даннная мультимедиа уже сущетсвует!','Редактирование Мультимедии', MB_OK+MB_ICONwarning);
      end;

      if ((Edit1.Text<>'')and(unique_user<>false) and (Edit1.Visible=true)) then
        begin
          config.execRequestSQL('UPDATE Мультимедиа SET КодТемы='+#39+IntToStr(kodTema)+#39+', НазваниеМультимедии='+#39+Edit1.Text+#39+' WHERE КодМультимедии ='+IntToStr(updateKodPractic));
          config.rebootRequestsCRUD;
          MessageBox(0,'Мультимедиа была успешно Изменена!','Редактирование Мультимедии', MB_OK+MB_ICONINFORMATION);
        end;
end;

end.
