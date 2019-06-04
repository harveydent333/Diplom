unit AddTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, jpeg , basa_dan , Control,
  Grids, DBGrids;

type
  TAddTemaModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTemaModalForm: TAddTemaModalForm;
  kodRazdel:integer;
  nameRazdel,str:string;
  unique_tema,unique_number_tema:boolean;
implementation

uses config, AuthorizationData;

{$R *.dfm}

procedure TAddTemaModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:='';
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
        BD.Request.DataSet.Next;
      end;
    BD.Request.DataSet.First;
    ComboBox1.ItemIndex:=0;

    if ComboBox1.ItemIndex=-1 then
      begin
        Edit1.Text:='';
        Edit1.Visible:=false;
        label2.Visible:=false;
        Panel2.Visible:=false;
      end
    else
      begin
        Edit1.Text:='';
        Edit1.Visible:=true;
        label2.Visible:=true;
        Panel2.Visible:=true;

        nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
        config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39);
        kodRazdel:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
      end;
end;

procedure TAddTemaModalForm.ComboBox1Change(Sender: TObject);    // Выбор раздела
begin
    Edit1.Text:='';
    Edit1.Visible:=true;
    label2.Visible:=true;
    Panel2.Visible:=true;
    nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];

    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39);
    kodRazdel:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
    if ComboBox1.ItemIndex=-1 then
      begin
        Edit1.Text:='';
        Edit1.Visible:=false;
        label2.Visible:=false;
        Panel2.Visible:=false;
      end;
end;

procedure TAddTemaModalForm.SpeedButton1Click(Sender: TObject);     // Сохранение созданой темы
begin
    unique_tema:=false;
    unique_number_tema:=false;

    if Edit2.Text='' then label4.Visible:=true;
    if Edit1.Text='' then label7.Visible:=true;

    if ((Edit1.Text<>'') and (Edit2.Text<>''))  then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_tema<>false) and(unique_number_tema<>false)) then
        saveDataInBD;
end;

procedure TAddTemaModalForm.saveDataInBD; // Внесение данных в БД
begin
    config.execRequestSQL('INSERT INTO Тема (КодРаздела, НазваниеТемы, НомерТемы, КодУчителя) VALUES('+
      IntToStr(kodRazdel)+','+
      #39+Edit1.Text+#39+','+
      #39+Edit2.Text+#39+','+
      IntToStr(kodUser)+')'
    );
    MessageBox(0,'Тема была успешно Создана!','Создание Темы', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
    Edit1.Text:='';
    Edit2.Text:='';
end;

procedure TAddTemaModalForm.checkUniqueData; // Проверка на уникальные данные
begin
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_tema:=true
    else
      MessageBox(0,'Данная тема уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM Тема WHERE НомерТемы='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_tema:=true
    else
          MessageBox(0,'Данный номер темы уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);
end;


procedure TAddTemaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddTemaModalForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
       Key:=#0;
       label6.Visible:=true;
       label4.Visible:=false;
      end;
end;

procedure TAddTemaModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TAddTemaModalForm.Edit1Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

end.
