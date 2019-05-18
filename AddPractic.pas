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
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddPracticModalForm: TAddPracticModalForm;
    nameRazdela,str,nameTema:string;
    kodRazdela,kodTema:integer;
    unique_user:boolean;

implementation

uses basa_dan, config;

{$R *.dfm}

procedure TAddPracticModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:='';                                                                               //���������� ComboBox ��� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
    begin
      ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
      BD.Request.DataSet.Next;
    end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;           //  ����� ��������
end;

procedure TAddPracticModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddPracticModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddPracticModalForm.ComboBox1Change(Sender: TObject);
begin
    Edit1.Visible:=false;
    Edit1.Text:='';
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    label5.visible:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39); // ��������� ���� �������
    kodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;
     // �������� �� ������� �������� � �������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then
      begin                                                                      // �������� �� ������� ��� � �������
        label3.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TAddPracticModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);  // ��������� ��� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
    label2.Visible:=true;
end;

procedure TAddPracticModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+#39+Edit1.Text+#39);
        if BD.RequestSQL.IsEmpty then
          unique_user:=true
        else
          MessageBox(0,'������ ������������ ��� ����������!','�������� ������������', MB_OK+MB_ICONwarning);
      end;

    if ((Edit1.Text<>'')and(unique_user<>false)) then
      begin
        // ���������� ����� ������
        config.execRequestSQL('INSERT INTO ������������ (�������, ��������������������) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+')');
        MessageBox(0,'������������ ���� ������� �������!','�������� ������������', MB_OK+MB_ICONINFORMATION);
        config.rebootRequestsCRUD;

        Edit1.Visible:=false;
        Edit1.Text:='';
        label2.Visible:=false;
        label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        label5.visible:=false;
      end;
end;

end.



