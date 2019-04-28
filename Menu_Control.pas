unit Menu_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls;

type
  TMenuControl = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuControl: TMenuControl;
    nameRazdela,str,nameTema:string;
    kodRazdela,kodTema:integer;

implementation

uses config, Title_Form;

{$R *.dfm}

procedure TMenuControl.ComboBox1Change(Sender: TObject);
begin
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;
    label7.Visible:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39); // ��������� ���� �������
    kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('����������').AsInteger;
     // �������� �� ������� �������� � �������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // �������� �� ������� ��� � �������
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TMenuControl.ComboBox2Change(Sender: TObject);
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;
    label7.Visible:=false;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);
    kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;

    config.selectRequestSQL('SELECT * FROM �������� WHERE �������='+inttostr(kodTema));
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('����������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
        ComboBox3.Text:=ComboBox3.Items.Strings[0];
    end;

    if ComboBox3.Items.Count>0 then     // �������� �� ������� �������� ������ � ����
        begin
          label3.Visible:=true;
          Combobox3.Visible:=true;
        end
    else
      label7.Visible:=true;
end;

procedure TMenuControl.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuControl.SpeedButton4Click(Sender: TObject);
begin
    TitleForm.close;
end;

end.
