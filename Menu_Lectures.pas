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
//===================���� � ������===========
ComboBox3.Visible:=false;
label2.Visible:=false;
label3.Visible:=false;
ComboBox2.Visible:=false;                                                        // ����� ��� ������� �� ������� ������
ComboBox2.Items.Clear;
//=============================================
                                                                                 //
nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];                       //
DataModule1.ADOModuleLecture.SQL.Clear;                                          //
str:='SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39;          //
DataModule1.ADOModuleLecture.SQL.Add(str);                                       //
DataModule1.ADOModuleLecture.Open;                                               //
kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('����������').AsInteger;      //
                                                                                 //
DataModule1.ADOModuleLecture.SQL.Clear;                                          // ����� ���� ��� ������ �� ������� ����, � ���� ���
str:='SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela);                // ������� ��������� � �����
DataModule1.ADOModuleLecture.SQL.Add(str);                                       //
DataModule1.ADOModuleLecture.Open;                                               //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                  //
 begin                                                                           //
    ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('������������').AsString);
    DBGrid1.DataSource.DataSet.Next;                                             //
    ComboBox2.Text:='����';                                                      //
  end;


if ComboBox2.Items.Count>0 then                                            //
begin                                                                      // �������� �� ������� ��� � �������
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
str:='SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;

DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM ������ WHERE �������='+inttostr(kodTema);
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
While (DBGrid1.DataSource.DataSet.Eof=false) do
 begin
    ComboBox3.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString);
    DBGrid1.DataSource.DataSet.Next;
    ComboBox3.Text:='������';
  end;


if ComboBox3.Items.Count>0 then                                               //
  begin                                                                       // �������� �� ������� ������ � ����
    label3.Visible:=true;                                                     //
    combobox3.Visible:=true;                                                  //
  end;



end;

end.



