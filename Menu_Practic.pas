unit Menu_Practic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls, basa_dan, ShellAPI;

type
  TMenuPractic = class(TForm)
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
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
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
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
  MenuPractic: TMenuPractic;
  nameRazdela,str,nameTema, namePractic:string;
   kodRazdela,kodTema, kodPractic:integer;

implementation

uses Title_Form, config,
  Main_Menu,
  Unit2,
  AuthorizationData;

{$R *.dfm}

procedure TMenuPractic.ComboBox1Change(Sender: TObject);
begin                                                                            // ����� ��� ������� �� ������� ������
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������������='+#39+nameRazdela+#39); // ��������� ���� �������
    kodRazdela:=DBGrid1.DataSource.DataSet.FieldByName('����������').AsInteger;
     // �������� �� ������� �������� � �������
    config.selectRequestSQL('SELECT * FROM ���� WHERE ����������='+inttostr(kodRazdela));

    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // �������� �� ������� ��� � �������
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39); // ��������� ���� ����
        kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TMenuPractic.ComboBox2Change(Sender: TObject);
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM ���� WHERE ������������='+#39+nameTema+#39);
    kodTema:=DBGrid1.DataSource.DataSet.FieldByName('�������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������������ WHERE �������='+inttostr(kodTema));
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('��������������������').AsString);
        DBGrid1.DataSource.DataSet.Next;
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

procedure TMenuPractic.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TMenuPractic.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuPractic.Visible:=false;
    SpeedButton1.Visible:=false;
end;

procedure TMenuPractic.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MenuPractic.Visible:=false;
end;

procedure TMenuPractic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuPractic.Visible:=false;
end;

procedure TMenuPractic.ComboBox3Change(Sender: TObject);
begin
    SpeedButton1.Visible:=true;
    namePractic:=ComboBox3.Items.Strings[Combobox3.ItemIndex];
    if FileExists('./Practic/'+namePractic+'.pdf') then
      SpeedButton1.Enabled:=true
    else
      MessageBox(0,'���� ������ ������������ ������ �����������','���������������� � ������ Web - ����������',
    MB_OK+MB_ICONWARNING);
end;

procedure TMenuPractic.SpeedButton1Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('.\Practic\'+namePractic+'.pdf'), nil, nil, SW_SHOWNORMAL);
end;

end.
