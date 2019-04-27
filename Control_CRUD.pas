unit Control_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls;

type
  TControlCRUD = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlCRUD: TControlCRUD;

implementation

uses Title_Form, config, UpdateUnit, AddControl, UpdateControl;

{$R *.dfm}

procedure TControlCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TControlCRUD.SpeedButton1Click(Sender: TObject);    // ���������� ������ ��������
begin
 with TAddControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TControlCRUD.SpeedButton7Click(Sender: TObject);  // �������� ��������
begin
    config.execRequestSQL('DELETE FROM �������� WHERE ����������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('����������������').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TControlCRUD.SpeedButton6Click(Sender: TObject);   // ��������� ��������
begin
    config.selectRequestSQL('SELECT * FROM �������� WHERE ����������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('����������������').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;           // ��� ����, ����������� ��������
    updateKodControl:=DBGrid2.DataSource.DataSet.FieldByName('�����������').AsInteger;      // ��� ����������� ��������
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;    // ��� ������� ���������� ������

    with TUpdateControlModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

end.
