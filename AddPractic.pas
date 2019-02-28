unit AddPractic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons;

type
  TAddPracticModalForm = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddPracticModalForm: TAddPracticModalForm;

implementation

uses basa_dan;

{$R *.dfm}

procedure TAddPracticModalForm.FormCreate(Sender: TObject);
begin
Edit1.Text:='';                                                                               //Заполнение ComboBox при создании
DataModule1.ADOModulePractic.SQL.Clear;                                                       //Заполнение Раздела
DataModule1.ADOModulePractic.SQL.Add('SELECT * FROM Раздел');                                 //
DataModule1.ADOModulePractic.Open;                                                            //
DBGrid1.DataSource.DataSet.First;                                                             //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                               //
 begin                                                                                        //
    ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);  //
    DBGrid1.DataSource.DataSet.Next;                                                          //
  end;                                                                                        //
DBGrid1.DataSource.DataSet.First;                                                             //
ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;           //  конец создания
end;

end.



