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
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTemaModalForm: TUpdateTemaModalForm;

implementation

uses basa_dan;

{$R *.dfm}

procedure TUpdateTemaModalForm.SpeedButton1Click(Sender: TObject);
var str,kodTema:string;
begin
{ ���� ������ ������, �� ����������� ������ �������� �� �������� ��� �������}

kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsString;
str:='UPDATE ���� SET ������������='+#39+edit1.Text+#39+' WHERE ������� ='+kodTema; //����� (,) SET ����1 = ���1, ����2=���2 ....
DataModule1.ADOUpdate.SQL.Clear;
DataModule1.ADOUpdate.SQL.Add(str);
DataModule1.ADOUpdate.ExecSQL;

DataModule1.ADOTemaCRUD.Active:=false;
DataModule1.ADOTemaCRUD.Active:=true;
end;

end.

