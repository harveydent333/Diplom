unit AddLecture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls;

type
  TAddLectureModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddLectureModalForm: TAddLectureModalForm;

implementation

uses basa_dan;

{$R *.dfm}

procedure TAddLectureModalForm.FormCreate(Sender: TObject);
begin                                                                                        //Заполнение ComboBox при создании
DataModule1.ADOModuleLecture.SQL.Clear;                                                       //Заполнение Раздела
DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Раздел');                                 //
DataModule1.ADOModuleLecture.Open;                                                            //
DBGrid1.DataSource.DataSet.First;                                                             //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                               //
 begin                                                                                        //
    ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);  //
    DBGrid1.DataSource.DataSet.Next;                                                          //
  end;                                                                                        //
DBGrid1.DataSource.DataSet.First;                                                             //
ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;           //  конец создания
end;
         {//
Edit1.Text:='';
Edit1.Visible:=true;
label2.Visible:=true;
Panel2.Visible:=true;
nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
if ComboBox1.ItemIndex=-1 then
  begin
    Edit1.Text:='';
    Edit1.Visible:=false;
    label2.Visible:=false;
    Panel2.Visible:=false;

  end;

        }
procedure TAddLectureModalForm.ComboBox1Change(Sender: TObject);
var
nameRazdela,str:string;
kodRazdela:integer;
begin
//===================БЛОК В КОНФИГ===========
Edit1.Visible:=false;
Edit1.Text:='';
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
  label3.Visible:=true;                                                    //
  combobox2.Visible:=true;                                                 //
end;

end;

end.
