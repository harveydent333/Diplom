unit Title_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, Grids, DBGrids, basa_dan, StdCtrls, AuthorizationData,
  ShellAPI;

type
  TTitleForm = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Image2: TImage;
    SpeedButton4: TSpeedButton;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TitleForm: TTitleForm;

implementation

uses Unit2, Menu_Lectures, Menu_Practic, Menu_Control, Tema_CRUD,
  Practic_CRUD, Razdel_CRUD, Lecture_CRUD, Control_CRUD, Ycheniki_CRUD,
  Main_Menu, Add_Question, EditLecture, config;


{$R *.dfm}

procedure TTitleForm.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
   AuthorizationForm.Show;
   AuthorizationForm.Position:=poDesktopCenter;
   TitleForm.Visible:=false;

   AuthorizationForm.Position:=poDesktopCenter;
   config.selectRequestSQL('SELECT * FROM Ученик');
   DBGrid1.DataSource.DataSet.First;
   for i:=1 to DBGrid1.DataSource.DataSet.RecordCount do
      begin
        AuthorizationForm.DBComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('login').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;

end;

procedure TTitleForm.SpeedButton1Click(Sender: TObject);
begin
   ShellExecute(Handle, nil, 'https://www.simbirsoft.com', nil, nil, SW_SHOW);
end;

procedure TTitleForm.SpeedButton2Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

end.
