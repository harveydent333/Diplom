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
    Image2: TImage;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    SpeedButton10: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemaCRUD: TTemaCRUD;

implementation

uses Title_Form, UpdateTema, UpdateUnit, config,
  ControlCenter, Unit2, AuthorizationData, ShellAPI;

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
    config.execRequestSQL('DELETE FROM ���� '+
      ' WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ���� ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TTemaCRUD.SpeedButton4Click(Sender: TObject);  // ���������� ������ ���������
var temp:word;
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

procedure TTemaCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TTemaCRUD.SpeedButton10Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM ���� '+
      ' WHERE ������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('������������').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ���� ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TTemaCRUD.Image3Click(Sender: TObject);
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

procedure TTemaCRUD.SpeedButton8Click(Sender: TObject);
begin
  with TAddTemaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TTemaCRUD.SpeedButton9Click(Sender: TObject);
begin
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

end.
