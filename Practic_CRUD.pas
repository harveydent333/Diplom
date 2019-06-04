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

implementation

uses AddPractic, Title_Form, updateUnit, config, UpdatePractic,
  Unit2, ControlCenter, AuthorizationData, ShellAPI;
{$R *.dfm}

procedure TPracticCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
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
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������', MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TPracticCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

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
  with TAddPracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
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
        performingRemoval
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

    with TUpdatePracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
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

end.
