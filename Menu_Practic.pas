unit Menu_Practic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls, basa_dan;

type
  TMenuPractic = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuPractic: TMenuPractic;

implementation

uses Title_Form;

{$R *.dfm}

procedure TMenuPractic.ComboBox1Change(Sender: TObject);
var
nameRazdela,str:string;
kodRazdela:integer;

begin                                                                            // ����� ��� ������� �� ������� ������
ComboBox2.Items.Clear;                                                           //
nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];                       //
DataModule1.ADOModulePractic.SQL.Clear;                                          //
str:='SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39;          //
DataModule1.ADOModulePractic.SQL.Add(str);                                       //
DataModule1.ADOModulePractic.Open;                                               //
kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('����������').AsInteger;      //
                                                                                 //
DataModule1.ADOModulePractic.SQL.Clear;                                          // ����� ���� ��� ������ �� ������� ����, � ���� ���
str:='SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela);                // ������� ��������� � �����
DataModule1.ADOModulePractic.SQL.Add(str);                                       //
DataModule1.ADOModulePractic.Open;                                               //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                  //
 begin                                                                           //
    ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('������������').AsString);
    DBGrid1.DataSource.DataSet.Next;                                             //
    ComboBox2.Text:='����';                                                      //
  end;                                                                           //

label2.Visible:=true;
combobox2.Visible:=true;
end;

procedure TMenuPractic.ComboBox2Change(Sender: TObject);
var
kodTema:integer;
nameTema,str:string;
begin
ComboBox3.Items.Clear; 
nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
DataModule1.ADOModulePractic.SQL.Clear;
str:='SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39;
DataModule1.ADOModulePractic.SQL.Add(str);
DataModule1.ADOModulePractic.Open;
kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;

DataModule1.ADOModulePractic.SQL.Clear;
str:='SELECT * FROM ������ WHERE �������='+inttostr(kodTema);
DataModule1.ADOModulePractic.SQL.Add(str);
DataModule1.ADOModulePractic.Open;
While (DBGrid1.DataSource.DataSet.Eof=false) do
 begin
    ComboBox3.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString);
    DBGrid1.DataSource.DataSet.Next;
    ComboBox3.Text:='������';
  end;

label3.Visible:=true;
combobox3.Visible:=true;
end;

procedure TMenuPractic.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

end.
