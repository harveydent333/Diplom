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
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    Timer1: TTimer;
    Label8: TLabel;
    Label7: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    function ReverseString(s: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddMultimediaModalForm: TAddMultimediaModalForm;
    nameRazdela,str,nameTema, path,PathFile:string;
    kodRazdela,kodTema:integer;
    unique_multimedia,unique_number_multimedia:boolean;

implementation

uses config, basa_dan, UpdateUnit, MultiMedia_CRUD, AuthorizationData;

{$R *.dfm}

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
    BitBtn1.Visible:=true;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];

    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);  // ��������� ��� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
    label2.Visible:=true;
end;

procedure TAddMultimediaModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_multimedia:=false;
    unique_number_multimedia:=false;
    if ComboBox2.Visible=false then
      MessageBox(0,'�������� ������!','', MB_OK+MB_ICONwarning)
    else
      if Edit2.Visible=false then
            MessageBox(0,'�������� ����!','', MB_OK+MB_ICONwarning)
      else
        begin
            if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
            if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;
            if PathFile='' then
                MessageBox(0,'���� ����������� �� ������!','', MB_OK+MB_ICONwarning);

            if ((Edit1.Text<>'') and (Edit2.Text<>'') and (PathFile<>'')) then
                checkUniqueData;

            if ((Edit1.Text<>'')and(Edit2.Text<>'')and(unique_multimedia<>false) and(unique_number_multimedia<>false) and (PathFile<>'')) then
                saveDataInBD;
        end;
end;

procedure TAddMultimediaModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('INSERT INTO ����������� (�������,'+
                                                  ' �������������������,'+
                                                  ' ����������������,'+
                                                  ' ����,'+
                                                  ' ����������)'+
                              ' VALUES('+IntToStr(kodTema)+','+
                                        #39+Edit1.Text+#39+','+
                                        #39+Edit2.Text+#39+', '+
                                        #39+'�����������\'+PathFile+#39+', '+
                                        IntToStr(kodUser)+')'
    );

    MessageBox(0,'����������� ���� ������� �������!','�������� �����������', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;  //   ����� ��������� ����������� ��������� ��� �����������
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
    BitBtn1.Visible:=false;
end;

procedure TAddMultimediaModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
        label7.Visible:=false;
      end;
end;

procedure TAddMultimediaModalForm.BitBtn1Click(Sender: TObject);
var allPath:string; i:integer;
begin
    PathFile:='';
    allPath:='';
    Path:='';
    if OpenDialog1.Execute then
      allPath:=OpenDialog1.FileName;
    for i:=Length(allPath) downto 1 do
      if allPath[i]<>'\' then
        PathFile:=PathFile+allPath[i]
      else
        break;
    PathFile:=ReverseString(PathFile);
    SetCurrentDir(currentDir);
end;

procedure TAddMultimediaModalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    AddMultimediaModalForm.Hide;
    MultiMediaCRUD.Enabled:=true;
    defaultSetting;
end;

function  TAddMultimediaModalForm.ReverseString(s: string): string;
var
  i: integer;
begin
  Result := '';
  if Trim(s) <> '' then
    for i := Length(s) downto 1 do
      Result := Result + s[i];
end;

procedure TAddMultimediaModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TAddMultimediaModalForm.Edit1Change(Sender: TObject);
begin
    label8.Visible:=false;
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

end.
