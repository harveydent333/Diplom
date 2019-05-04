unit Main_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TMainMenu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMenu: TMainMenu;

implementation

uses ControlCenter, DocumentForm, Menu_Lectures, AuthorizationData, config,
  Unit2, Title_Form, Menu_Practic, Menu_Control;

{$R *.dfm}

procedure TMainMenu.SpeedButton1Click(Sender: TObject); // �������������� ������
begin
    DataManagementCenter.show;
end;

procedure TMainMenu.SpeedButton2Click(Sender: TObject); // �������������� �������������
begin
  // ������� ����, ��� ������� ����� �������� CRUD �������� ��� �������� (� ��������)
end;

procedure TMainMenu.SpeedButton5Click(Sender: TObject); // ������� ������ {������}
begin
    MenuLectures.show;
    MenuLectures.ComboBox1.Items.Clear;
    config.selectRequestSQL('SELECT * FROM ������');  
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuLectures.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MenuLectures.ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString;
end;

procedure TMainMenu.SpeedButton8Click(Sender: TObject); // ��������� ������������ ������ {������}
begin
    MenuPractic.show;
    MenuPractic.ComboBox2.Items.Clear;
    config.selectRequestSQL('SELECT * FROM ������');
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuPractic.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MenuPractic.ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString;
end;

procedure TMainMenu.SpeedButton9Click(Sender: TObject); // ������ �������� ������ {������}
begin
    MenuControl.show;
    with MenuControl do
      begin
        ComboBox1.Items.Clear;
        ComboBox2.Items.Clear;
        label2.Visible:=false;
        label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        ComboBox3.Visible:=false;
        ComboBox3.Items.Clear;
        label5.visible:=false;
        label7.Visible:=false;
        Panel1.Visible:=false;
        SpeedButton1.Visible:=false;
        SpeedButton1.Enabled:=false;
      end;
    config.selectRequestSQL('SELECT * FROM ������');
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuControl.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MenuControl.ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('���������������').AsString;
end;

procedure TMainMenu.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TMainMenu.SpeedButton6Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;

    AuthorizationForm.Visible:=true;;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton10Click(Sender: TObject);
begin
MainMenu.Close;
Shyrnal.show;
Shyrnal.Label1.Caption:=nameUser;
Shyrnal.Label2.Caption:=familyUser;

if roleUser='stydent' then
  begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE login='+#39+loginUser+#39);
    config.selectRequestSQL('SELECT * FROM ������ WHERE ����������='+dbgrid1.DataSource.DataSet.fieldbyName('����������').AsString);
  end;
end;

end.
