unit UpdateTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons;

type
  TUpdateTemaModalForm = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTemaModalForm: TUpdateTemaModalForm;
  nameRazdel, nameTema,str:string;
  kodTema,kodRazdel:integer;
  unique_user:boolean;

implementation

uses basa_dan, UpdateUnit, config;

{$R *.dfm}

procedure TUpdateTemaModalForm.FormCreate(Sender: TObject);
begin
    // ��������� ���� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
      ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString);
      DBGrid1.DataSource.DataSet.Next;
    end;

    // ��������� ������� � �������� ���������� ���� ���������� ����
    config.selectRequestSQL('SELECT * FROM ������ WHERE ����������='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString;

    // ��������� ����
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    Edit1.Text:=DBGrid1.DataSource.DataSet.FieldByName('������������').AsString;
end;

procedure TUpdateTemaModalForm.ComboBox1Change(Sender: TObject);     // ����� �������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+ComboBox1.Text+#39);
    updateKodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('����������').AsInteger;
end;

procedure TUpdateTemaModalForm.SpeedButton1Click(Sender: TObject);      // ���������� ���������
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+Edit1.Text+#39);
        if ((BD.RequestSQL.IsEmpty) or (updateKodTema=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger)) then
          unique_user:=true
        else
          MessageBox(0,'������ ���� ��� ����������!','�������� ����', MB_OK+MB_ICONwarning);
      end;

      if ((Edit1.Text<>'')and(unique_user<>false)) then
        begin
          config.execRequestSQL('UPDATE ���� SET ����������='+#39+IntToStr(updateKodRazdela)+#39+', ������������='+#39+edit1.Text+#39+' WHERE ������� ='+IntToStr(updateKodTema));
          config.rebootRequestsCRUD;
        end;
end;

procedure TUpdateTemaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.

