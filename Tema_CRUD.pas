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
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemaCRUD: TTemaCRUD;

implementation

uses Title_Form, UpdateTema, UpdateUnit, config,
  ControlCenter,
  Unit2,
  AuthorizationData;

{$R *.dfm}

procedure TTemaCRUD.SpeedButton1Click(Sender: TObject);   // ���������� ����
begin
    with TAddTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TTemaCRUD.SpeedButton6Click(Sender: TObject);     // ��������� ����
begin
    // ����������� ��� ������� � ��� ����
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;
    with TUpdateTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TTemaCRUD.SpeedButton7Click(Sender: TObject);  // �������� ����
begin
    config.execRequestSQL('DELETE FROM ���� WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TTemaCRUD.SpeedButton4Click(Sender: TObject);  // ���������� ������ ���������
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TTemaCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    TemaCRUD.Visible:=false;
end;

procedure TTemaCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    TemaCRUD.Visible:=false;
end;

procedure TTemaCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    TemaCRUD.Visible:=false;
end;

end.
