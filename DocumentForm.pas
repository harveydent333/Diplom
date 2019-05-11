unit DocumentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls, RpCon,
  RpConDS, RpDefine, RpRave, QuickRpt, QRCtrls,
  ComCtrls;

type
  TShyrnal = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    Label9: TLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Button3: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Shyrnal: TShyrnal;

implementation
     uses basa_dan, Unit3, Unit2, AuthorizationData, Title_Form, Main_Menu,
  ControlCenter,
  config;
{$R *.dfm}

procedure TShyrnal.SpeedButton1Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.SpeedButton3Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.SpeedButton6Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TShyrnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.Button1Click(Sender: TObject);
begin
if roleUser='teacher' then
//QuickRep2.Preview else
//QuickRep1.Preview;
end;

procedure TShyrnal.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked=true then ComboBox1.Enabled:=true else ComboBox1.Enabled:=false;
end;

procedure TShyrnal.CheckBox2Click(Sender: TObject);
begin
    if CheckBox2.Checked=true then ComboBox2.Enabled:=true else ComboBox2.Enabled:=false;
end;

procedure TShyrnal.CheckBox4Click(Sender: TObject);
begin
    if CheckBox4.Checked=true then ComboBox3.Enabled:=true else ComboBox3.Enabled:=false;
end;

procedure TShyrnal.CheckBox5Click(Sender: TObject);
begin
    if CheckBox5.Checked=true then Edit2.Enabled:=true else Edit2.Enabled:=false;
end;

procedure TShyrnal.CheckBox6Click(Sender: TObject);
begin
    if CheckBox6.Checked=true then Edit3.Enabled:=true else Edit3.Enabled:=false;
end;

procedure TShyrnal.CheckBox7Click(Sender: TObject);
begin
     if CheckBox7.Checked=true then Edit4.Enabled:=true else Edit4.Enabled:=false;
end;

procedure TShyrnal.Button3Click(Sender: TObject);
var default:string;
begin
    if roleUser='teacher' then
      begin
        default:='SELECT * FROM ������ WHERE 1=1';
        if CheckBox5.Checked = true then
          default:=default+' AND �������='+#39+edit2.Text+#39;

        if CheckBox6.Checked = true then
          default:=default+' AND ���='+#39+edit3.Text+#39;

        if CheckBox7.Checked = true then
          default:=default+' AND ��������='+#39+edit4.Text+#39;

        if CheckBox1.Checked = true then
          default:=default+' AND ������������='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND ����������������='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND ������='+#39+ComboBox3.Text+#39;

        config.selectRequestSQL(default);
        if((CheckBox5.Checked = true) and (CheckBox6.Checked = true) and (CheckBox7.Checked = true) and (CheckBox1.Checked = true) and
          (CheckBox2.Checked = true) and (CheckBox4.Checked = true)) then
            config.selectRequestSQL('SELECT * FROM ������');
      end;

    if roleUser='stydent' then
      begin
        default:='SELECT * FROM ������ WHERE �������='+#39+familyUser+#39+' AND ���='+#39+nameUser+#39+' AND ��������='+#39+secondNameUser+#39;
        if CheckBox1.Checked = true then
          default:=default+' AND ������������='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND ����������������='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND ������='+#39+ComboBox3.Text+#39;

        config.selectRequestSQL(default);
        if((CheckBox5.Checked = true) and (CheckBox6.Checked = true) and (CheckBox7.Checked = true) and (CheckBox1.Checked = true) and
          (CheckBox2.Checked = true) and (CheckBox4.Checked = true)) then
            config.selectRequestSQL(default);
      end;
end;

procedure TShyrnal.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.
