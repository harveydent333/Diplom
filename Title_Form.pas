unit Title_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, Grids, DBGrids, basa_dan, StdCtrls, AuthorizationData;

type
  TTitleForm = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Image2: TImage;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Button2: TButton;
    DBGrid3: TDBGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
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
  Control_CRUD;

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

procedure TTitleForm.Button1Click(Sender: TObject);
begin

MenuLectures.show;
MenuLectures.ComboBox1.Items.Clear;

DataModule1.ADOModuleLectrue.SQL.Clear;
DataModule1.ADOModuleLectrue.SQL.Add('SELECT * FROM –‡Á‰ÂÎ');
DataModule1.ADOModuleLectrue.Open;

DBGrid2.DataSource.DataSet.First;

While (DBGrid2.DataSource.DataSet.Eof=false) do
  begin
    MenuLectures.ComboBox1.Items.Add(DBGrid2.DataSource.DataSet.FieldByName('Õ‡Á‚‡ÌËÂ–‡Á‰ÂÎ‡').AsString);
    DBGrid2.DataSource.DataSet.Next;
    MenuLectures.ComboBox1.Text:='–‡Á‰ÂÎ';    // “”“ «¿Ã≈Õ»“‹ Õ¿ –¿«ƒ≈À œ≈–€… , ¬ —œ»— ≈
  end;

end;

procedure TTitleForm.Button2Click(Sender: TObject);
begin
MenuPractic.show;
MenuPractic.ComboBox1.Items.Clear;

DataModule1.ADOModulePractic.SQL.Clear;
DataModule1.ADOModulePractic.SQL.Add('SELECT * FROM –‡Á‰ÂÎ');
DataModule1.ADOModulePractic.Open;

DBGrid3.DataSource.DataSet.First;

While (DBGrid3.DataSource.DataSet.Eof=false) do
  begin
    MenuPractic.ComboBox1.Items.Add(DBGrid3.DataSource.DataSet.FieldByName('Õ‡Á‚‡ÌËÂ–‡Á‰ÂÎ‡').AsString);
    DBGrid3.DataSource.DataSet.Next;
    MenuPractic.ComboBox1.Text:='–‡Á‰ÂÎ';    // “”“ «¿Ã≈Õ»“‹ Õ¿ –¿«ƒ≈À œ≈–€… , ¬ —œ»— ≈
  end;
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

end.
