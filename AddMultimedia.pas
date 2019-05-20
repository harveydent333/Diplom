unit AddMultimedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Grids, DBGrids, Buttons;

type
  TAddMultimediaModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddMultimediaModalForm: TAddMultimediaModalForm;
    nameRazdela,str,nameTema:string;
    kodRazdela,kodTema:integer;
    unique_multimedia,unique_number_multimedia:boolean;

implementation

uses config, basa_dan, UpdateUnit;

{$R *.dfm}

procedure TAddMultimediaModalForm.FormCreate(Sender: TObject);
begin                                                                              //���������� ComboBox ��� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
            BD.Request.DataSet.Next;
        end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;
end;

procedure TAddMultimediaModalForm.ComboBox1Change(Sender: TObject);
begin
    defaultSetting;

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

procedure TAddMultimediaModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);  // ��������� ��� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
    label2.Visible:=true;
end;

procedure TAddMultimediaModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_multimedia:=false;
    unique_number_multimedia:=false;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
      checkUniqueData;

    if ((Edit1.Text<>'')and(Edit2.Text<>'')and(unique_multimedia<>false) and(unique_number_multimedia<>false)) then
      saveDataInBD;
end;

procedure TAddMultimediaModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('INSERT INTO ����������� (�������, �������������������, ����������������) VALUES('+IntToStr(kodTema)+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+')');
    MessageBox(0,'����������� ���� ������� �������!','�������� �����������', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;
end;

procedure TAddMultimediaModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ����������� WHERE �������������������='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_multimedia:=true
    else
      MessageBox(0,'������ ����������� ��� ����������!','�������� �����������', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ����������� WHERE ����������������='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_multimedia:=true
    else
      MessageBox(0,'������ ����� ����������� ��� ����������!','�������� �����������', MB_OK+MB_ICONwarning);
end;

procedure TAddMultimediaModalForm.defaultSetting;
begin
    Edit1.Visible:=false;
    Edit2.Visible:=false;
    Edit1.Text:='';
    Edit2.Text:='';
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
end;

procedure TAddMultimediaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddMultimediaModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddMultimediaModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.
