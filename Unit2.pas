unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, StdCtrls, jpeg, Buttons , basa_dan, Grids,
  DBGrids, DBCtrls ;

type
    TAuthorizationForm = class(TForm)
    Edit2: TEdit;
    Edit1: TEdit;
    SpeedButton2: TSpeedButton;
    teacher_ON: TImage;
    teacher_OFF: TImage;
    stydent_ON: TImage;
    stydent_OFF: TImage;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Image5: TImage;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure stydent_OFFClick(Sender: TObject);
    procedure teacher_OFFClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure teacherAuthorization;
    procedure stydentAuthorization;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorizationForm: TAuthorizationForm;
implementation

uses AuthorizationData, Title_Form, config, Main_Menu,
  Restore_Account;

{$R *.dfm}

procedure TAuthorizationForm.SpeedButton2Click(Sender: TObject);   // Нажатие кнопки  "Войти"
var KodUser:integer;
begin
    if teacher_ON.Visible = true then         // Авторизация под учителем
      teacherAuthorization;

    if stydent_ON.Visible = true then         // Авторизация под студентом
      stydentAuthorization;
end;

procedure TAuthorizationForm.stydent_OFFClick(Sender: TObject);
begin
    teacher_ON.Visible:=false;
    stydent_OFF.Visible:=false;
    teacher_OFF.Visible:=true;
    stydent_ON.Visible:=true;


    Edit2.Visible:=false;
    Edit1.Visible:=false;
    Label2.Caption:='Группа:';
    Label3.Caption:='ФИО:';
    Label3.Left:=280;
    ComboBox1.Visible:=true;
    ComboBox2.Visible:=true;
end;

procedure TAuthorizationForm.teacher_OFFClick(Sender: TObject);
begin
    teacher_ON.Visible:=true;
    teacher_OFF.Visible:=false;
    stydent_OFF.Visible:=true;
    stydent_ON.Visible:=false;

    Edit2.Visible:=true;
    Edit1.Visible:=true;
    Label2.Caption:='Логин:';
    Label3.Caption:='Пароль:';
    Label3.Left:=256;
    ComboBox1.Visible:=false;
    ComboBox2.Visible:=false;
end;

procedure TAuthorizationForm.SpeedButton1Click(Sender: TObject);
begin
    AuthorizationForm.Visible:=false;
    TitleForm.Show;
    TitleForm.Position:=poDesktopCenter;
end;

procedure TAuthorizationForm.teacherAuthorization;
begin
    config.selectRequestSQL('SELECT pass FROM Учитель WHERE login='+#39+edit2.text+#39);
    if BD.RequestSQL.IsEmpty then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
    else
       if BD.RequestSQL.FieldByName('pass').Value<>edit1.Text then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
       else
        begin
           AuthorizationData.getDataUser;
           MainMenu.show;
           MainMenu.Position:=poDesktopCenter;
           AuthorizationForm.Visible:=false;
        end;
    with MainMenu do
      begin
         SpeedButton5.Visible:=false;
         SpeedButton8.Visible:=false;
         SpeedButton9.Visible:=false;
         SpeedButton1.Visible:=true;
         SpeedButton2.Visible:=true;
         SpeedButton3.Visible:=false;
         SpeedButton10.top:=328;
       //  MessageBox(0,'Авторизация прошла успешно. Добро пожаловать!','', MB_OK+MB_ICONINFORMATION);
      end;
end;

procedure TAuthorizationForm.stydentAuthorization;
var str:string;
i,j,beg:integer;
ar:array[1..50] of string;
begin
    str:=ComboBox2.Text+' ';
    beg:=1;
    j:=1;
    for i:=1 to length(str) do
        begin
            if(str[i]=' ') then
              begin
                  ar[j]:=Copy(str, beg, i-beg);
                  beg:=i+1;
                  inc(j);
              end;
        end;
    config.selectRequestSQL('SELECT * FROM Ученик WHERE Имя='+
      #39+ar[2]+#39+' AND Фамилия='+
      #39+ar[1]+#39+' AND Отчество='+
      #39+ar[3]+#39+' AND КодГруппы='+IntToStr(ComboBox1.ItemIndex+1));
      
    if BD.RequestSQL.IsEmpty then
        MessageBox(0,'Данный пользователь не найден!','Авторизация', MB_OK+MB_ICONwarning)
    else
      begin
          KodUser:=BD.Request.DataSet.FieldByName('КодУченика').AsInteger;
          AuthorizationData.getDataUser;
          MainMenu.show;
          MainMenu.Position:=poDesktopCenter;
          AuthorizationForm.Visible:=false;
      end;
    with MainMenu do
        begin
          SpeedButton5.Visible:=true;
          SpeedButton8.Visible:=true;
          SpeedButton9.Visible:=true;
          SpeedButton1.Visible:=false;
          SpeedButton2.Visible:=false;
          SpeedButton3.Visible:=true;
          SpeedButton10.top:=384;
        end;
    end;

procedure TAuthorizationForm.ComboBox1Change(Sender: TObject);
var i:integer; fio:string;
begin
   ComboBox2.Clear;
   config.selectRequestSQL('SELECT * FROM Ученик WHERE КодГруппы='+IntToStr(ComboBox1.ItemIndex+1));
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        with BD.Request.DataSet do
            fio:=FieldByName('Фамилия').AsString+' '+FieldByName('Имя').AsString+' '+FieldByName('Отчество').AsString;
        AuthorizationForm.ComboBox2.Items.Add(fio);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox2.ItemIndex:=0;
end;

procedure TAuthorizationForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    AuthorizationForm.Visible:=false;
    TitleForm.Show;
    TitleForm.Position:=poDesktopCenter;
end;

procedure TAuthorizationForm.SpeedButton3Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TAuthorizationForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then SpeedButton2.Click;
end;

procedure TAuthorizationForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then SpeedButton2.Click;
end;

procedure TAuthorizationForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then SpeedButton2.Click;
end;

procedure TAuthorizationForm.ComboBox1KeyPress(Sender: TObject;var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TAuthorizationForm.ComboBox2KeyPress(Sender: TObject;var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

end.
