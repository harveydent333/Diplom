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
    Image2: TImage;
    SpeedButton4: TSpeedButton;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  Main_Menu, Add_Question, EditLecture, config,
  MultiMedia_CRUD,
  Menu_Multimedai;


{$R *.dfm}

procedure TTitleForm.SpeedButton4Click(Sender: TObject);
var i:integer; fio:string;
begin
   AuthorizationForm.Show;
   AuthorizationForm.Position:=poDesktopCenter;
   TitleForm.Visible:=false;

   AuthorizationForm.Position:=poDesktopCenter;

   AuthorizationForm.ComboBox1.Clear;
   AuthorizationForm.ComboBox2.Clear;
   config.selectRequestSQL('SELECT * FROM Ученик WHERE КодГруппы=1');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        with BD.Request.DataSet do
          begin
              fio:=FieldByName('Фамилия').AsString+' '+FieldByName('Имя').AsString+' '+FieldByName('Отчество').AsString;
          end;
        AuthorizationForm.ComboBox2.Items.Add(fio);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox2.ItemIndex:=0;
   config.selectRequestSQL('SELECT * FROM Группа');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        AuthorizationForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеГруппы').AsString);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox1.ItemIndex:=0;
end;

procedure TTitleForm.SpeedButton1Click(Sender: TObject);
begin
    ShellExecute(Handle, nil, 'https://www.simbirsoft.com', nil, nil, SW_SHOW);
end;

procedure TTitleForm.SpeedButton2Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

procedure TTitleForm.Button1Click(Sender: TObject);
begin
 config.selectRequestSQL('SELECT * FROM Раздел');
    with MenuMultimedia do
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
            SpeedButton1.Visible:=false;
            SpeedButton1.Enabled:=false;
        end;

    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            MenuMultimedia.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
            BD.Request.DataSet.Next;
        end;

    BD.Request.DataSet.First;
    MenuMultimedia.ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;
    MenuMultimedia.show;
    MenuMultimedia.Position:=poDesktopCenter;
    //MainMenu.Visible:=false;
end;

end.
