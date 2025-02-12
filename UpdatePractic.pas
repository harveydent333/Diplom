unit UpdatePractic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TUpdatePracticModalForm = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
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
  UpdatePracticModalForm: TUpdatePracticModalForm;
       nameTema, nameRazdela, str, path:string;
        kodTema, kodRazdela:integer;
       unique_practic,unique_number_practic:boolean;

implementation

uses config, basa_dan, UpdateUnit, Practic_CRUD, AuthorizationData,
  AddMultimedia;
{$R *.dfm}

procedure TUpdatePracticModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;
    BitBtn2.Visible:=true;

    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
end;

procedure TUpdatePracticModalForm.ComboBox1Change(Sender: TObject);
begin
    defaultSetting;

    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+ComboBox1.Text+#39);
    kodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;
    // ���� ������ �� ������
    if ComboBox2.Items.Count>0 then
      begin
        Edit1.visible:=true;
        Edit2.Visible:=true;
        BitBtn2.Visible:=true;
        label2.Visible:=true;
        label3.Visible:=true;
        label4.Visible:=true;
        Combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TUpdatePracticModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_practic:=false;
    unique_number_practic:=false;

    if ComboBox2.Visible=false then
      MessageBox(0,'�������� ������!','', MB_OK+MB_ICONwarning)
    else
      if Edit2.Visible=false then
        MessageBox(0,'�������� ����!','', MB_OK+MB_ICONwarning)
      else
        begin
          if PathFile2='' then
              MessageBox(0,'���� ������������ �� ������!','', MB_OK+MB_ICONwarning);

          if ((Edit2.Text='') and (Edit2.Visible=true)) then label8.Visible:=true;
          if ((Edit1.Text='') and (Edit1.Visible=true)) then label7.Visible:=true;

          if ((Edit1.Text<>'') and (Edit2.Text<>'') and (Edit1.Visible<>false) and (Edit2.Visible<>false)) then
              checkUniqueData;

          if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_practic<>false) and(unique_number_practic<>false)  and (Edit1.Visible<>false) and (Edit2.Visible<>false)  and (PathFile2<>'')) then
              saveDataInBD;
        end;
end;

procedure TUpdatePracticModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('UPDATE ������������ SET �������='+
      #39+IntToStr(UpdatekodTema)+#39+','+
      ' ��������������������='+#39+Edit1.Text+#39+','+
      ' �����������������='+#39+Edit2.Text+#39+','+
      ' ����='+#39+'������������\'+PathFile2+#39+
      ' WHERE ��������������� ='+IntToStr(updateKodPractic));
    MessageBox(0,'������������ ���� ������� ��������!','�������������� ������������', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
end;

procedure TUpdatePracticModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('���������������').AsInteger)) then
      unique_practic:=true
    else
      MessageBox(0,'������ ������������ ��� ����������!','�������� ������������', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ������������ WHERE �����������������='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('���������������').AsInteger)) then
      unique_number_practic:=true
    else
      MessageBox(0,'������ ����� ������ ��� ����������!','�������� ������', MB_OK+MB_ICONwarning);
end;

procedure TUpdatePracticModalForm.defaultSetting;
begin
    Edit1.Visible:=false;
    Edit2.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    BitBtn2.Visible:=false;
end;

procedure TUpdatePracticModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    label8.Visible:=false;
    if not (Key in ['0'..'9', #8]) then
      begin
       Key:=#0;
       label6.Visible:=true;
      end;
end;

procedure TUpdatePracticModalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    UpdatePracticModalForm.Hide;
    PracticCRUD.Enabled:=true;
    defaultSetting;
end;

procedure TUpdatePracticModalForm.Edit1Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

procedure TUpdatePracticModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TUpdatePracticModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdatePracticModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdatePracticModalForm.BitBtn2Click(Sender: TObject);
var allPath:string; i:integer;
begin
    PathFile2:='';
    allPath:='';
    Path:='';
    if OpenDialog1.Execute then
      allPath:=OpenDialog1.FileName;
    for i:=Length(allPath) downto 1 do
      if allPath[i]<>'\' then
        PathFile2:=PathFile2+allPath[i]
      else
        break;
    PathFile:=ReverseString(PathFile2);
    SetCurrentDir(currentDir);
end;

function TUpdatePracticModalForm.ReverseString(s: string): string;
var
  i: integer;
begin
  Result := '';
  if Trim(s) <> '' then
    for i := Length(s) downto 1 do
      Result := Result + s[i];
end;

end.
