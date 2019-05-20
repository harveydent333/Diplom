unit UpdateTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons;

type
  TUpdateTemaModalForm = class(TForm)
    Image1: TImage;
    DBGrid11: TDBGrid;
    Edit1: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure saveDataInBD;
    procedure checkUniqueData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTemaModalForm: TUpdateTemaModalForm;
  nameRazdel, nameTema,str:string;
  kodTema,kodRazdel:integer;
  unique_tema,unique_number_tema:boolean;

implementation

uses basa_dan, UpdateUnit, config;

{$R *.dfm}

procedure TUpdateTemaModalForm.FormCreate(Sender: TObject);
begin
    // ��������� ���� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
      begin
      ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
      BD.Request.DataSet.Next;
    end;

    // ��������� ������� � �������� ���������� ���� ���������� ����
    config.selectRequestSQL('SELECT * FROM ������ WHERE ����������='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;

    // ��������� ����
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    Edit1.Text:=BD.Request.DataSet.FieldByName('������������').AsString;
    Edit2.Text:=BD.Request.DataSet.FieldByName('���������').AsString;
end;

procedure TUpdateTemaModalForm.ComboBox1Change(Sender: TObject);     // ����� �������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+ComboBox1.Text+#39);
    updateKodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;
end;

procedure TUpdateTemaModalForm.SpeedButton1Click(Sender: TObject);      // ���������� ���������
begin
    unique_tema:=false;
    unique_number_tema:=false;
    if ((Edit1.Text<>'') and (Edit2.Text<>''))  then
        checkUniqueData;

    if ((Edit1.Text<>'')and (Edit2.Text<>'') and (unique_tema<>false) and(unique_number_tema<>false)) then
        saveDataInBD;
end;

procedure TUpdateTemaModalForm.saveDataInBD; // �������� ������ � ��
begin
    config.execRequestSQL('UPDATE ���� SET ����������='+#39+IntToStr(updateKodRazdela)+#39+',���������='+#39+Edit2.Text+#39+', ������������='+#39+edit1.Text+#39+' WHERE ������� ='+IntToStr(updateKodTema));
    MessageBox(0,'���� ���� ������� �������!','�������� ����', MB_OK+MB_ICONINFORMATION);
    config.rebootRequestsCRUD;
end;

procedure TUpdateTemaModalForm.checkUniqueData; // �������� �� ���������� ������
begin
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+Edit1.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodTema=BD.Request.DataSet.FieldByName('�������').AsInteger)) then
      unique_tema:=true
    else
      MessageBox(0,'������ ���� ��� ����������!','�������� ����', MB_OK+MB_ICONwarning);

    config.selectRequestSQL('SELECT * FROM ���� WHERE ���������='+#39+Edit2.Text+#39);
    if ((BD.RequestSQL.IsEmpty) or (updateKodTema=BD.Request.DataSet.FieldByName('�������').AsInteger)) then
      unique_number_tema:=true
    else
          MessageBox(0,'������ ����� ���� ��� ����������!','�������� ����', MB_OK+MB_ICONwarning);
end;

procedure TUpdateTemaModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdateTemaModalForm.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

end.

