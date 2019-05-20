unit UpdateRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, basa_dan, config, Grids, UpdateUnit,
  DBGrids;

type
  TUpdateRazdelModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure saveDataInBD;
    procedure checkUniqueData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateRazdelModalForm: TUpdateRazdelModalForm;
  unique_razdel,unique_number_razdel:boolean;

implementation

{$R *.dfm}

procedure TUpdateRazdelModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;
    Edit2.Text:=BD.Request.DataSet.FieldByName('������������').AsString;
end;

procedure TUpdateRazdelModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_razdel:=false;
    unique_number_razdel:=false;

    if ((Edit1.Text<>'') and (Edit2.Text<>'')) then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and(unique_razdel<>false) and (unique_number_razdel<>false)) then
        saveDataInBD;
end;

procedure TUpdateRazdelModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('UPDATE ������ SET ���������������='+#39+Edit1.Text+#39+', ������������='+#39+Edit2.Text+#39+' WHERE ���������� ='+IntToStr(updateKodRazdela));
    MessageBox(0,'������ ��� ������� �������!','�������������� �������', MB_OK+MB_ICONINFORMATION);;
    config.rebootRequestsCRUD;
end;

procedure TUpdateRazdelModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodRazdela=BD.Request.DataSet.FieldByName('����������').AsInteger)) then
      unique_razdel:=true
    else
      MessageBox(0,'������ ������ ��� ����������!','�������� �������', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ������ WHERE ������������='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodRazdela=BD.Request.DataSet.FieldByName('����������').AsInteger)) then
      unique_number_razdel:=true
    else
          MessageBox(0,'������ ����� ������� ��� ����������!','�������� �������', MB_OK+MB_ICONwarning);
end;

procedure TUpdateRazdelModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.
