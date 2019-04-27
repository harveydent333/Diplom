unit AddLecture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls;

type
  TAddLectureModalForm = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddLectureModalForm: TAddLectureModalForm;
   nameRazdela,str,nameTema:string;
   kodRazdela,kodTema:integer;
   unique_user:boolean;

implementation

uses basa_dan, config;

{$R *.dfm}

procedure TAddLectureModalForm.FormCreate(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Раздел');  //Заполнение ComboBox при создании
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;           //  конец создания
end;

procedure TAddLectureModalForm.ComboBox1Change(Sender: TObject);
begin
    Edit1.Visible:=false;
    Edit1.Text:='';
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    label5.visible:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39); // Получение кода раздела
    kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
     // Проверка на наличие потомков у Раздела
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela));

    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString);
        DBGrid1.DataSource.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then
      begin                                                                      // Проверка на наличие тем в разделе
        label3.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=DBGrid1.DataSource.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TAddLectureModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);  // Получение код темы
    kodTema:=DBGrid1.DataSource.DataSet.FieldByName('КодТемы').AsInteger;
    label2.Visible:=true;
end;

procedure TAddLectureModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM Лекции WHERE НазваниеЛекции='+#39+Edit1.Text+#39);
        if DataModule1.ADOModuleLecture.IsEmpty then
          unique_user:=true
        else
          MessageBox(0,'Данная лекция уже сущетсвует!','Создание лекции', MB_OK+MB_ICONwarning);
      end;

    if ((Edit1.Text<>'')and(unique_user<>false)) then
      begin
        // Добавление новой Лекции
        config.execRequestSQL('INSERT INTO Лекции (КодТемы, НазваниеЛекции) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+')');
        MessageBox(0,'Лекция была успешно создана!','Создание Лекции', MB_OK+MB_ICONINFORMATION);
        config.rebootRequestsCRUD;

        Edit1.Visible:=false;
        Edit1.Text:='';
        label2.Visible:=false;
        label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        label5.visible:=false;
      end;
end;

procedure TAddLectureModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;


procedure TAddLectureModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.
