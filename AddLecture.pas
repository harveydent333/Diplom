unit AddLecture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls;

type
  TAddLectureModalForm = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Timer1: TTimer;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    procedure defaultSetting;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddLectureModalForm: TAddLectureModalForm;
   nameRazdela,str,nameTema:string;
   kodRazdela,kodTema:integer;
   unique_lecture,unique_number_lecture:boolean;

implementation

uses basa_dan, config, AuthorizationData;

{$R *.dfm}

procedure TAddLectureModalForm.FormCreate(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������');  //���������� ComboBox ��� ��������
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
        BD.Request.DataSet.Next;
      end;
    BD.Request.DataSet.First;
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;           //  ����� ��������
end;

procedure TAddLectureModalForm.ComboBox1Change(Sender: TObject);
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

procedure TAddLectureModalForm.ComboBox2Change(Sender: TObject);
begin
    Edit1.Visible:=true;
    Edit2.Visible:=true;
    label2.Visible:=true;
    label4.Visible:=true;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);  // ��������� ��� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
end;

procedure TAddLectureModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_lecture:=false;
    unique_number_lecture:=false;
    if ComboBox2.Visible=false then
      MessageBox(0,'�������� ������!','', MB_OK+MB_ICONwarning)
    else
        if Edit2.Visible=false then
            MessageBox(0,'�������� ����!','', MB_OK+MB_ICONwarning)
        else
          begin
            if ((Edit2.Text='') and (Edit2.Visible=true)) then label7.Visible:=true;
            if ((Edit1.Text='') and (Edit1.Visible=true)) then label8.Visible:=true;

            if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
                checkUniqueData;

            if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_lecture<>false) and(unique_number_lecture<>false)) then
                saveDataInBD;
          end;
end;

procedure TAddLectureModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('INSERT INTO ������ (�������, ��������������, �����������, ����������) VALUES('+
      IntToStr(kodTema)+','+
      #39+Edit1.Text+#39+','+
      #39+Edit2.Text+#39+', '+
      IntToStr(kodUser)+')'
    );
    MessageBox(0,'������ ���� ������� �������!','�������� ������', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;

    defaultSetting;
end;

procedure TAddLectureModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_lecture:=true
    else
      MessageBox(0,'������ ������ ��� ����������!','�������� ������', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ������ WHERE �����������='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_lecture:=true
    else
      MessageBox(0,'������ ����� ������ ��� ����������!','�������� ������', MB_OK+MB_ICONwarning);
end;

procedure TAddLectureModalForm.defaultSetting;
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

procedure TAddLectureModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;


procedure TAddLectureModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAddLectureModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
label7.Visible:=false;
    if not (Key in ['0'..'9', #8]) then
      begin
        Key:=#0;
        label6.Visible:=true;
      end;
end;

procedure TAddLectureModalForm.Timer1Timer(Sender: TObject);
begin
    label6.Visible:=false;
end;

procedure TAddLectureModalForm.Edit1Change(Sender: TObject);
begin
    label8.Visible:=false;
end;

end.
