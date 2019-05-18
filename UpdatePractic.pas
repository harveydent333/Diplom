unit UpdatePractic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TUpdatePracticModalForm = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdatePracticModalForm: TUpdatePracticModalForm;
       nameTema, nameRazdela:string;
        kodTema, kodRazdela:integer;
        unique_user:boolean;

implementation

uses config, basa_dan, UpdateUnit;
{$R *.dfm}

procedure TUpdatePracticModalForm.FormCreate(Sender: TObject);
begin
 // ��������� ���� ��������
    config.selectRequestSQL('SELECT * FROM ������');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('���������������').AsString);
            BD.Request.DataSet.Next;
    end;

    // ��������� ������� � �������� ���������� ���� ���������� ������
    config.selectRequestSQL('SELECT * FROM ������ WHERE ����������='+IntToStr(updateKodRazdela));
    ComboBox1.Text:=BD.Request.DataSet.FieldByName('���������������').AsString;

    // ��������� ���� ��� ������� � ��������� ���������� ���� ���������� ������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+IntToStr(updateKodRazdela));

    ComboBox2.Visible:=true;
    label3.Visible:=true;
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
      end;

   // ��������� �������� ���� ����� ��������� ������
   config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
   ComboBox2.Text:=BD.Request.DataSet.FieldByName('������������').AsString;

   // ��������� �������� �������� � ��������� ���������� ���� ���������� ������������             +
   Edit1.Visible:=true;
   label2.Visible:=true;
   config.selectRequestSQL('SELECT * FROM ������������ WHERE ���������������='+IntToStr(updateKodPractic));
   Edit1.Text:=BD.Request.DataSet.FieldByName('��������������������').AsString;

    kodRazdela:=updateKodRazdela;
    kodTema:=updateKodTema;
end;

procedure TUpdatePracticModalForm.ComboBox2Change(Sender: TObject);
begin
    nameTema:=Combobox2.Text;
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
end;

procedure TUpdatePracticModalForm.ComboBox1Change(Sender: TObject);
begin
    Edit1.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    label5.visible:=false;

    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+ComboBox1.Text+#39);
    kodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then
      begin                                                                      // �������� �� ������� ��� � �������
        label3.Visible:=true;
        edit1.visible:=true;
        label2.Visible:=true;
        Combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TUpdatePracticModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM ������������ WHERE ��������������������='+#39+Edit1.Text+#39);
        if ((BD.RequestSQL.IsEmpty) or (updateKodPractic=BD.Request.DataSet.FieldByName('���������������').AsInteger)) then
          unique_user:=true
        else
          MessageBox(0,'������� �������� ������ ��� ����������!','�������������� �������� ������', MB_OK+MB_ICONwarning);
      end;

      if ((Edit1.Text<>'')and(unique_user<>false) and (Edit1.Visible=true)) then
        begin
          config.execRequestSQL('UPDATE ������������ SET �������='+#39+IntToStr(kodTema)+#39+', ��������������������='+#39+Edit1.Text+#39+' WHERE ��������������� ='+IntToStr(updateKodPractic));
          config.rebootRequestsCRUD;
          MessageBox(0,'������������ ���� ������� ��������!','�������������� ������������', MB_OK+MB_ICONINFORMATION);
        end;
end;

procedure TUpdatePracticModalForm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TUpdatePracticModalForm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;


end.
