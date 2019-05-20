unit AddRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, jpeg, StdCtrls, Mask, DBCtrls , basa_dan;

type
  TAddRazdelModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
    AddRazdelModalForm: TAddRazdelModalForm;
    unique_razdel,unique_number_razdel:boolean;
    
implementation

uses Control, config;

{$R *.dfm}

procedure TAddRazdelModalForm.SpeedButton1Click(Sender: TObject);   //  ������� ������ "��������"
begin
    unique_razdel:=false;
    unique_number_razdel:=false;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
      checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_razdel<>false) and (unique_number_razdel<>false)) then
      saveDataInBD;
end;

procedure TAddRazdelModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('INSERT INTO ������ (���������������, ������������) VALUES ('+#39+Edit1.Text+#39', '+#39+Edit2.Text+#39+')');
    MessageBox(0,'������ ��� ������� ������!','�������� �������', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
    Edit1.Text:='';
    Edit2.Text:='';
end;

procedure TAddRazdelModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+Edit1.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_razdel:=true
    else
      MessageBox(0,'������ ������ ��� ����������!','�������� �������', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ������ WHERE ������������='+#39+Edit2.Text+#39);
    if BD.RequestSQL.IsEmpty then
      unique_number_razdel:=true
    else
          MessageBox(0,'������ ����� ������� ��� ����������!','�������� �������', MB_OK+MB_ICONwarning);
end;

procedure TAddRazdelModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.
