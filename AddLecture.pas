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
begin    {
Edit1.Visible:=true;
label2.Visible:=true;
Panel2.Visible:=true;
nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger; }
end;

end.
