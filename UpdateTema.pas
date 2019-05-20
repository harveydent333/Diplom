unit UpdateTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons;

type
  TUpdateTemaModalForm = class(TForm)
    Image1: TImage;
    DBGrid11: TDBGrid;
    Edit1: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTemaModalForm: TUpdateTemaModalForm;
  nameRazdel, nameTema,str:string;
  kodTema,kodRazdel:integer;
  unique_tema,unique_number_tema:boolean;

implementation

uses basa_dan, UpdateUnit, config;

{$R *.dfm}

procedure TUpdateTemaModalForm.FormCreate(Sender: TObject);
begin
    // Получение всех разделов
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
      ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
      BD.Request.DataSet.Next;
    end;

    // Получение Раздела к которому относиться наша изменяемая тема
    config.selectRequestSQL('SELECT * FROM Раздел WHERE КодРаздела='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;

    // Получение Темы
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеТемы').AsString;
    Edit2.Text:=BD.Request.DataSet.FieldByName('НомерТемы').AsString;
end;

procedure TUpdateTemaModalForm.ComboBox1Change(Sender: TObject);     // Выбор Раздела
begin
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+ComboBox1.Text+#39);
    updateKodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
end;

procedure TUpdateTemaModalForm.SpeedButton1Click(Sender: TObject);      // Сохранение изменений
begin
    unique_tema:=false;
    unique_number_tema:=false;
    if ((Edit1.Text<>'') and (Edit2.Text<>''))  then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_tema<>false) and(unique_number_tema<>false)) then
        saveDataInBD;
end;

procedure TUpdateTemaModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('UPDATE Тема SET КодРаздела='+#39+IntToStr(updateKodRazdela)+#39+',НомерТемы='+#39+Edit2.Text+#39+', НазваниеТемы='+#39+edit1.Text+#39+' WHERE КодТемы ='+IntToStr(updateKodTema));
    MessageBox(0,'Тема была успешно Создана!','Создание Темы', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
end;

procedure TUpdateTemaModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodTema=BD.Request.DataSet.FieldByName('КодТемы').AsInteger)) then
      unique_tema:=true
    else
      MessageBox(0,'Данная тема уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Тема WHERE НомерТемы='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodTema=BD.Request.DataSet.FieldByName('КодТемы').AsInteger)) then
      unique_number_tema:=true
    else
          MessageBox(0,'Данный номер темы уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);
end;

procedure TUpdateTemaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateTemaModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.

