unit Menu_Lectures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, basa_dan, StdCtrls, DBCtrls, Grids,
  DBGrids, OleServer, WordXP;

type
  TMenuLectures = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuLectures: TMenuLectures;

implementation

uses Title_Form;

{$R *.dfm}


procedure TMenuLectures.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TMenuLectures.ComboBox1Change(Sender: TObject);
var
nameRazdela,str:string;
kodRazdela:integer;

begin
//===================БЛОК В КОНФИГ===========
ComboBox3.Visible:=false;
label2.Visible:=false;
label3.Visible:=false;
ComboBox2.Visible:=false;                                                        // НАШЛИ КОД РАЗДЕЛА ИЗ ТАБЛИЦЫ РАЗДЕЛ
ComboBox2.Items.Clear;
//=============================================
                                                                                 //
nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];                       //
DataModule1.ADOModuleLecture.SQL.Clear;                                          //
str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39;          //
DataModule1.ADOModuleLecture.SQL.Add(str);                                       //
DataModule1.ADOModuleLecture.Open;                                               //
kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;      //
                                                                                 //
DataModule1.ADOModuleLecture.SQL.Clear;                                          // Далее ищем все записи из таблицы темы, у кого код
str:='SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela);                // раздела совпадает с нашим
DataModule1.ADOModuleLecture.SQL.Add(str);                                       //
DataModule1.ADOModuleLecture.Open;                                               //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                  //
 begin                                                                           //
    ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString);
    DBGrid1.DataSource.DataSet.Next;                                             //
    ComboBox2.Text:='Тема';                                                      //
  end;


if ComboBox2.Items.Count>0 then                                            //
begin                                                                      // Проверка на наличие тем в разделе
  label2.Visible:=true;                                                    //
  combobox2.Visible:=true;                                                 //
end;

end;



procedure TMenuLectures.ComboBox2Change(Sender: TObject);
var
kodTema:integer;
nameTema,str:string;
begin
ComboBox3.Visible:=false;
label3.Visible:=false;
ComboBox3.Items.Clear;


nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
kodTema:=DBGrid1.DataSource.DataSet.FieldByName('КодТемы').AsInteger;

DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Лекции WHERE КодТемы='+inttostr(kodTema);
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
While (DBGrid1.DataSource.DataSet.Eof=false) do
 begin
    ComboBox3.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеЛекции').AsString);
    DBGrid1.DataSource.DataSet.Next;
    ComboBox3.Text:='Лекция';
  end;


if ComboBox3.Items.Count>0 then                                               //
  begin                                                                       // Проверка на наличие лекций в теме
    label3.Visible:=true;                                                     //
    combobox3.Visible:=true;                                                  //
  end;



end;

end.



