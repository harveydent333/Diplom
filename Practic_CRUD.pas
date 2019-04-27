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
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PracticCRUD: TPracticCRUD;

implementation

uses AddPractic, Title_Form, updateUnit, config, UpdatePractic;

{$R *.dfm}

procedure TPracticCRUD.SpeedButton1Click(Sender: TObject);  // ���������� ����� ��������
begin
    with TAddPracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TPracticCRUD.SpeedButton4Click(Sender: TObject);
begin
    TitleForm.close;
end;

procedure TPracticCRUD.SpeedButton6Click(Sender: TObject);    // ��������� ��������
begin
    config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39);
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;           // ��� ����, ���������� ��������
    updateKodPractic:=DBGrid2.DataSource.DataSet.FieldByName('���������������').AsInteger;      // ��� ���������� ��������
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;    // ��� ������� ���������� ��������

    with TUpdatePracticModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TPracticCRUD.SpeedButton7Click(Sender: TObject); // �������� ������
begin
    config.execRequestSQL('DELETE FROM ������������ WHERE ��������������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString+#39);
    config.rebootRequestsCRUD;
end;

end.
