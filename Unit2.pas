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
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure stydent_OFFClick(Sender: TObject);
    procedure teacher_OFFClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
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

uses AuthorizationData, Title_Form, config, Main_Menu;

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
    Label2.Caption:='ФИО Обучающегося:';
    Label2.Left:=464;
    Label3.Visible:=false;
    DBComboBox1.Visible:=true;
end;

procedure TAuthorizationForm.teacher_OFFClick(Sender: TObject);
begin
    teacher_OFF.Visible:=false;
    stydent_ON.Visible:=false;
    teacher_ON.Visible:=true;
    stydent_OFF.Visible:=true;

    Edit2.Visible:=true;
    Edit1.Visible:=true;
    Label2.Caption:='Логин:';
    Label2.Left:=261;
    Label3.Visible:=true;
    DBComboBox1.Visible:=false;
end;

procedure TAuthorizationForm.SpeedButton1Click(Sender: TObject);
begin
    AuthorizationForm.close;
    TitleForm.Show;
end;

procedure TAuthorizationForm.SpeedButton3Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TAuthorizationForm.teacherAuthorization;
begin
     config.selectRequestSQL('SELECT password FROM Учитель WHERE login='+#39+edit2.text+#39);
     if DataModule1.ADOModuleLecture.IsEmpty then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
     else
       if DataModule1.ADOModuleLecture.FieldByName('password').Value<>edit1.Text then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
       else
        begin
           AuthorizationData.getDataUser;
           MainMenu.show;
           AuthorizationForm.Visible:=false;
        end;
end;

procedure TAuthorizationForm.stydentAuthorization;
begin
      config.selectRequestSQL('SELECT * FROM Ученик WHERE login='+#39+DBComboBox1.Text+#39);
      if DataModule1.ADOModuleLecture.IsEmpty then
        MessageBox(0,'Данный пользователь не найден!','Авторизация', MB_OK+MB_ICONwarning)
      else
           begin
            KodUser:=DBGrid1.DataSource.DataSet.FieldByName('КодУченика').AsInteger;
            AuthorizationData.getDataUser;
            MainMenu.show;
            label1.Caption:=inttostr(KodUser);
            AuthorizationForm.Visible:=false;

           // Перенести этот кусок кода в конфиг!!!!
                 MainMenu.SpeedButton1.Caption:='Контроль знаний';
                 MainMenu.SpeedButton2.Caption:='Журнал';
          //=============================
            end;
    end;



end.
