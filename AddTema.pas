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
    Label3: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTemaModalForm: TAddTemaModalForm;
  kodRazdel:integer;
  nameRazdel,str:string;
  unique_user:boolean;

implementation

uses config;

{$R *.dfm}

procedure TAddTemaModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:='';
    config.selectRequestSQL('SELECT * FROM Раздел');
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
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
        kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
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
    kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
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
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+Edit1.Text+#39);
        if DataModule1.ADOModuleLecture.IsEmpty then
          unique_user:=true
        else
          MessageBox(0,'Данная тема уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);
      end;

    if ((Edit1.Text<>'')and(unique_user<>false)) then
      begin
        // Добавление новой темы
        config.execRequestSQL('INSERT INTO Тема (КодРаздела, НазваниеТемы) VALUES('+IntToStr(kodRazdel)+','+#39+Edit1.Text+#39+')');
        MessageBox(0,'Тема была успешно Создана!','Создание Темы', MB_OK+MB_ICONINFORMATION);
        config.rebootRequestsCRUD;
        Edit1.Text:='';
        //default setting creat ModalForm
      end;
end;

procedure TAddTemaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.
