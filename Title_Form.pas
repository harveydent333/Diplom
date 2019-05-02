unit Title_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, Grids, DBGrids, basa_dan, StdCtrls, AuthorizationData;

type
  TTitleForm = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Image2: TImage;
    SpeedButton4: TSpeedButton;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    Button12: TButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TitleForm: TTitleForm;

implementation

uses Unit2, Add_Question, Control, PassingKnowledgeControl, Menu_Lectures,
  Menu_Practic, Tema_CRUD, Razdel_CRUD, Lecture_CRUD, Practic_CRUD,
  Control_CRUD, Ycheniki_CRUD, Unit3, config, UpdateUnit, Menu_Control,
  Main_Menu;

{$R *.dfm}

procedure TTitleForm.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TTitleForm.FormCreate(Sender: TObject);
begin
with TitleForm do
  begin
    Height:=699;
    Width:=1188;
  end;
end;

procedure TTitleForm.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
   AuthorizationForm.Show;
   AuthorizationForm.Position:=poDesktopCenter;
  // TitleForm.Top:=-2000;
   dbgrid1.DataSource.DataSet.First;
   for i:=1 to dbgrid1.DataSource.DataSet.RecordCount do
      begin
        AuthorizationForm.DBComboBox1.Items.Add(dbgrid1.DataSource.DataSet.FieldByName('login').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;

end;

procedure TTitleForm.Button1Click(Sender: TObject);    //  ������ �  ������ - ������
begin
    MenuLectures.show;
    MenuLectures.ComboBox1.Items.Clear;
    config.selectRequestSQL('SELECT * FROM ������');  //���������� ComboBox ��� ��������
    DBGrid2.DataSource.DataSet.First;
    While (DBGrid2.DataSource.DataSet.Eof=false) do
      begin
        MenuLectures.ComboBox1.Items.Add(DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid2.DataSource.DataSet.Next;
      end;
    DBGrid2.DataSource.DataSet.First;
    MenuLectures.ComboBox1.Text:=DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString;  //  ����� ��������
end;

procedure TTitleForm.Button2Click(Sender: TObject);     //  ������ �  �������������� - ������
begin
    MenuPractic.show;
    MenuPractic.ComboBox2.Items.Clear;
    config.selectRequestSQL('SELECT * FROM ������');  //���������� ComboBox ��� ��������
    DBGrid2.DataSource.DataSet.First;
    While (DBGrid2.DataSource.DataSet.Eof=false) do
      begin
        MenuPractic.ComboBox1.Items.Add(DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid2.DataSource.DataSet.Next;
      end;
    DBGrid2.DataSource.DataSet.First;
    MenuPractic.ComboBox1.Text:=DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString;  //  ����� ��������
end;

procedure TTitleForm.Button10Click(Sender: TObject);  //  ������ � ��������� ������ - ������
begin
    MenuControl.show;
    MenuControl.ComboBox2.Items.Clear;
    config.selectRequestSQL('SELECT * FROM ������');  //���������� ComboBox ��� ��������
    DBGrid2.DataSource.DataSet.First;
    While (DBGrid2.DataSource.DataSet.Eof=false) do
      begin
        MenuControl.ComboBox1.Items.Add(DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString);
        DBGrid2.DataSource.DataSet.Next;
      end;
    DBGrid2.DataSource.DataSet.First;
    MenuControl.ComboBox1.Text:=DBGrid2.DataSource.DataSet.FieldByName('���������������').AsString;  //  ����� ��������
end;

procedure TTitleForm.Button3Click(Sender: TObject);
begin
    TemaCRUD.show;
end;

procedure TTitleForm.Button4Click(Sender: TObject);
begin
    PracticCRUD.show;
end;

procedure TTitleForm.Button5Click(Sender: TObject);
begin
    RazdelCRUD.Show;
end;

procedure TTitleForm.Button6Click(Sender: TObject);
begin
    LectureCRUD.show;
end;

procedure TTitleForm.Button7Click(Sender: TObject);
begin
    ControlCRUD.show;
end;

procedure TTitleForm.Button8Click(Sender: TObject);
begin
    YchenikiCRUD.show;
end;

procedure TTitleForm.Button9Click(Sender: TObject);
begin
    Mainmenu.show;
end;

procedure TTitleForm.Button11Click(Sender: TObject);
var str:string;
i,j,beg:integer;
ar:array[1..50] of string;
begin
  str:='qq`ss`dd`ff`ee`sd`';
  label2.Caption:=inttostr(length(str));
  beg:=1;
  j:=1;
  for i:=1 to length(str) do begin
    if(str[i]='`') then
      begin
        ar[j]:=Copy(str, beg, i-beg);
        beg:=i+1;
        inc(j);
      end;
     if (pos(str[i],str)= length(str)) then
       ar[j]:=Copy(str, beg, (length(str))-beg);
    end;


 for i:=1 to length(ar) do
  stringgrid1.Cells[i,0]:=ar[i];

end;



procedure TTitleForm.Button12Click(Sender: TObject);
begin
    Add_Questions.Show;
end;

end.
