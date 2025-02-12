unit Tema_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, jpeg, ExtCtrls, basa_dan, StdCtrls, AddTema;

type
  TTemaCRUD = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    stydent_ON: TImage;
    teacher_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemaCRUD: TTemaCRUD;
   temp:word;
implementation

uses Title_Form, UpdateTema, UpdateUnit, config,
  ControlCenter, Unit2, AuthorizationData, ShellAPI;

{$R *.dfm}

{
  ��������� ������� ������ �������� ����
}
procedure TTemaCRUD.BitBtn1Click(Sender: TObject);
begin
 with TAddTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;
{
  ��������� ������� ������ ������������� ����
}
procedure TTemaCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39);
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
        performingEditing
    else
        MessageBox(0,'� ��� ��� ���� �� �������������� ������ ����!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� ������� ������ ������� ����
}
procedure TTemaCRUD.BitBtn3Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
      begin
        temp:=MessageBox(0,'�� ����� ������ ������� ����?','',MB_YESNO+MB_ICONQUESTION);
        if idyes=temp then
            performingRemoval;
      end
    else
      MessageBox(0,'� ��� ��� ���� �� �������� ������ ����!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� �������������� ����
}
procedure TTemaCRUD.performingEditing;
begin
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;
    with TUpdateTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;

end;

{
  ��������� �������� ����
}
procedure TTemaCRUD.performingRemoval;
begin
    config.execRequestSQL('DELETE FROM ���� '+
        ' WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ���� ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TTemaCRUD.SpeedButton4Click(Sender: TObject);  // ���������� ������ ���������
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TTemaCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    TemaCRUD.Visible:=false;
end;

procedure TTemaCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    TemaCRUD.Visible:=false;
end;

procedure TTemaCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    TemaCRUD.Visible:=false;
end;

procedure TTemaCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
