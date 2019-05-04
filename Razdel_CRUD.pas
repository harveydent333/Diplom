unit Razdel_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, basa_dan, Buttons, StdCtrls, config;

type
  TRazdelCRUD = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RazdelCRUD: TRazdelCRUD;

implementation

uses Title_Form, AddRazdel, UpdateUnit, UpdateRazdel;

{$R *.dfm}

procedure TRazdelCRUD.SpeedButton1Click(Sender: TObject);  // ���������� ������ �������
begin
    with TAddRazdelModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TRazdelCRUD.SpeedButton6Click(Sender: TObject);  // �������� ������
begin
  config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString+#39);
  updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;
  with TUpdateRazdelModalForm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
  end;
end;


procedure TRazdelCRUD.SpeedButton7Click(Sender: TObject);     // �������� �������
begin
    config.execRequestSQL('DELETE FROM ������ WHERE ���������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TRazdelCRUD.SpeedButton4Click(Sender: TObject);    // ���������� ���������
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TRazdelCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

end.
