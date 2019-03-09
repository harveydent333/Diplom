unit UpdateTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons;

type
  TUpdateTemaModalForm = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTemaModalForm: TUpdateTemaModalForm;
  kodTema,nameRazdel,kodRazdel:string;

implementation

uses basa_dan;

{$R *.dfm}

procedure TUpdateTemaModalForm.SpeedButton1Click(Sender: TObject);
var str:string;
begin
{ ЕСЛИ МЕНЯТЬ РАЗДЕЛ, ИЗ ВЫПАДАЮЩЕГО СПИСКА ПОЛУЧАЕМ ПО НАЗВАНИЮ КОД РАЗДЕЛА}

str:='UPDATE Тема SET НазваниеТемы='+#39+edit1.Text+#39+' WHERE КодТемы ='+kodTema; //через (,) SET ПОЛЕ1 = ВАЛ1, ПОЛЕ2=ВАЛ2 ....
DataModule1.ADOUpdate.SQL.Clear;
DataModule1.ADOUpdate.SQL.Add(str);
DataModule1.ADOUpdate.ExecSQL;

DataModule1.ADOTemaCRUD.Active:=false;
DataModule1.ADOTemaCRUD.Active:=true;
end;

procedure TUpdateTemaModalForm.FormCreate(Sender: TObject);
var str:string;
begin
kodTema:=DBGrid1.DataSource.DataSet.FieldByName('КодТемы').AsString;
label1.Caption:=kodTema;
Edit1.Text:='';                                                                               // Заполнение ComboBox при создании
DataModule1.ADOModuleLecture.SQL.Clear;                                                       //
DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Раздел');                                 //
DataModule1.ADOModuleLecture.Open;                                                            //
DBGrid2.DataSource.DataSet.First;                                                             //
While (DBGrid2.DataSource.DataSet.Eof=false) do                                               //
 begin                                                                                        //
    ComboBox1.Items.Add(DBGrid2.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);  //
    DBGrid2.DataSource.DataSet.Next;                                                          //
 end;                                                                                        //
DBGrid2.DataSource.DataSet.First;                                                             //
ComboBox1.ItemIndex:=0;                                                                       //
                                                                                              //  конец создания

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
    DataModule1.ADOModuleLecture.SQL.Clear;
    str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39;
    DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.Open;
    kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsString;
    end;
end;

end.

