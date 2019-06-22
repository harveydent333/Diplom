unit Practic_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, Grids, DBGrids, Buttons, jpeg, ExtCtrls, StdCtrls;

type
  TPracticCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid21: TDBGrid;
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PracticCRUD: TPracticCRUD;
     nameTema, nameRazdela, PathFile2:string;
        kodTema, kodRazdela,i:integer;
        unique_user:boolean;
            temp:word;
implementation

uses AddPractic, Title_Form, updateUnit, config, UpdatePractic,
  Unit2, ControlCenter, AuthorizationData, ShellAPI, UpdateMultimedia,
  MultiMedia_CRUD;
{$R *.dfm}

procedure TPracticCRUD.SpeedButton10Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM ������������ WHERE ��������������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39);
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ������������ ������ ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

{
  ��������� ������� ������ �������� ������������
}
procedure TPracticCRUD.BitBtn1Click(Sender: TObject);
begin

    AddPracticModalForm.Edit1.Text:='';
    AddPracticModalForm.ComboBox1.Clear;
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
        AddPracticModalForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
        BD.Request.DataSet.Next;
      end;
    BD.Request.DataSet.First;
    AddPracticModalForm.ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;
    AddPracticModalForm.Show;
    AddPracticModalForm.BitBtn2.Visible:=false;
    AddPracticModalForm.Label7.Visible:=false;
    AddPracticModalForm.Label9.Visible:=false;
    Path:='';
    PracticCRUD.Enabled:=false;
end;

{
  ��������� ������� ������ ������������� ������������
}
procedure TPracticCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
        performingEditing
    else
        MessageBox(0,'� ��� ��� ���� �� �������������� ������ ������������ ������!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� ������� ������ ������� ������������
}
procedure TPracticCRUD.BitBtn3Click(Sender: TObject);
begin
  config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39
   );
  if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
    begin
      temp:=MessageBox(0,'�� ����� ������ ������� ������ ������������ ������?','',MB_YESNO+MB_ICONQUESTION);
      if idyes=temp then
        performingRemoval;
    end
  else
     MessageBox(0,'� ��� ��� ���� �� �������� ������ ������������ ������!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� �������������� ������������-
}
procedure TPracticCRUD.performingEditing;
begin
    updateKodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;           // ��� ����, ���������� ��������
    updateKodPractic:=BD.Request.DataSet.FieldByName('���������������').AsInteger;      // ��� ���������� ��������
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    updateKodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;    // ��� ������� ���������� ��������

    config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39
    );

    PathFile2:='';
    str:=BD.Request.DataSet.FieldByName('����').AsString;
    for i:=14 to Length(str) do
      PathFile2:=PathFile2+str[i];

    UpdatePracticModalForm.Show;
    UpdatePracticModalForm.Position:=poDesktopCenter;
    PracticCRUD.Enabled:=false;

     // ��������� ���� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            UpdatePracticModalForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
            BD.Request.DataSet.Next;
    end;

    // ��������� ������� � �������� ���������� ���� ���������� ������
    config.selectRequestSQL('SELECT * FROM ������ WHERE ����������='+IntToStr(updateKodRazdela));
    UpdatePracticModalForm.ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;

    // ��������� ���� ��� ������� � ��������� ���������� ���� ���������� ������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+IntToStr(updateKodRazdela));

    UpdatePracticModalForm.ComboBox2.Visible:=true;
    UpdatePracticModalForm.label3.Visible:=true;
    While (BD.Request.DataSet.Eof=false) do
      begin
        UpdatePracticModalForm.ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
      end;

   // ��������� �������� ���� ����� ��������� ������
   config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
   UpdatePracticModalForm.ComboBox2.Text:=BD.Request.DataSet.FieldByName('������������').AsString;

   // ��������� �������� ����������� � ��������� ���������� ���� ���������� �����������+
   UpdatePracticModalForm.Edit1.Visible:=true;
   UpdatePracticModalForm.label2.Visible:=true;
   UpdatePracticModalForm.Edit2.Visible:=true;
   UpdatePracticModalForm.label4.Visible:=true;
   config.selectRequestSQL('SELECT * FROM ������������ WHERE ���������������='+IntToStr(updateKodPractic));
   UpdatePracticModalForm.Edit1.Text:=BD.Request.DataSet.FieldByName('��������������������').AsString;
   UpdatePracticModalForm.Edit2.Text:=BD.Request.DataSet.FieldByName('�����������������').AsString;
   UpdatePracticModalForm.Label7.Visible:=false;
   UpdatePracticModalForm.Label8.Visible:=false;

   kodRazdela:=updateKodRazdela;
   kodTema:=updateKodTema;
end;

{
  ��������� �������� ������������+
}
procedure TPracticCRUD.performingRemoval;
begin
    config.execRequestSQL('DELETE FROM ������������ WHERE ��������������������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ������������ ������ ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TPracticCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    PracticCRUD.Visible:=false;
end;

procedure TPracticCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    PracticCRUD.Visible:=false;
end;

procedure TPracticCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    PracticCRUD.Visible:=false;
end;

procedure TPracticCRUD.SpeedButton4Click(Sender: TObject);
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������', MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TPracticCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
