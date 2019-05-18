unit Menu_Lectures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, basa_dan, StdCtrls, DBCtrls, Grids,
  DBGrids, OleServer, WordXP;

type
  TMenuLectures = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuLectures: TMenuLectures;
   nameRazdela,str,nameTema:string;
   kodRazdela,kodTema:integer;

implementation

uses Title_Form, config,
  Main_Menu,
  Unit2,
  AuthorizationData,
  UpdateUnit,
  EditLecture;

{$R *.dfm}

procedure TMenuLectures.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TMenuLectures.ComboBox1Change(Sender: TObject);
begin
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39); // ��������� ���� �������
    kodRazdela:=BD.Request.DataSet.FieldByName('����������').AsInteger;
     // �������� �� ������� �������� � �������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('������������').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // �������� �� ������� ��� � �������
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;



procedure TMenuLectures.ComboBox2Change(Sender: TObject);
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);
    kodTema:=BD.Request.DataSet.FieldByName('�������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(BD.Request.DataSet.FieldByName('��������������').AsString);
        BD.Request.DataSet.Next;
        ComboBox3.Text:=ComboBox3.Items.Strings[0];
    end;

    if ComboBox3.Items.Count>0 then     // �������� �� ������� ������ � ����
        begin
          label3.Visible:=true;
          Combobox3.Visible:=true;
        end
    else
      label7.Visible:=true;
end;

procedure TMenuLectures.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuLectures.Visible:=false;
end;

procedure TMenuLectures.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MenuLectures.Visible:=false;
end;

procedure TMenuLectures.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuLectures.Visible:=false;
end;

procedure TMenuLectures.ComboBox3Change(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+#39+ComboBox3.Text+#39);
    updateKodLecture:=BD.Request.DataSet.FieldByName('���������').AsInteger;      // ���  ������
    SpeedButton1.Visible:=true;
end;

procedure TMenuLectures.SpeedButton1Click(Sender: TObject);
begin
    Edit_Lecture.show;
    Edit_Lecture.Position:=poDesktopCenter;
    MenuLectures.Visible:=false;
    Edit_Lecture.Memo1.Clear;
    Edit_Lecture.Memo1.Lines.Add(BD.Request.DataSet.FieldByName('����������').AsString);

    //������ � �������
    with Edit_Lecture do
      begin
        Height:=920;
        Width:=1201;
        Memo1.Height:=833;
        Memo1.Width:=1190;
        Memo1.ReadOnly:=true;
        Button6.Left:=128;
        Button1.Visible:=false;
        Button4.Visible:=false;
        Button5.Visible:=false;
        Button3.Left:=3;
      end;
    //
end;

procedure TMenuLectures.ComboBox1KeyPress(Sender: TObject; var Key: Char); // ���������� ������ "������"
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuLectures.ComboBox2KeyPress(Sender: TObject; var Key: Char); // ���������� ������ "����"
begin
    if not (Key in []) then Key := #0;
end;

procedure TMenuLectures.ComboBox3KeyPress(Sender: TObject; var Key: Char);  // ���������� ������ "������"
begin
    if not (Key in []) then Key := #0;
end;

end.



