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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses Unit3, AuthorizationData, Title_Form;

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

edit2.Visible:=false;
edit1.Visible:=false;
label2.Caption:='ФИО Обучающегося:';
label2.Left:=464;
label3.Visible:=false;
DBComboBox1.Visible:=true;
end;

procedure TAuthorizationForm.teacher_OFFClick(Sender: TObject);
begin
teacher_OFF.Visible:=false;
stydent_ON.Visible:=false;
teacher_ON.Visible:=true;
stydent_OFF.Visible:=true;

edit2.Visible:=true;
edit1.Visible:=true;
label2.Caption:='Логин:';
label2.Left:=261;
label3.Visible:=true;
DBComboBox1.Visible:=false;

end;

procedure TAuthorizationForm.SpeedButton1Click(Sender: TObject);
begin
AuthorizationForm.close;
TitleForm.Show;
TitleForm.Position:=poDesktopCenter;
end;

procedure TAuthorizationForm.SpeedButton3Click(Sender: TObject);
begin
AuthorizationForm.Close;
TitleForm.close;
end;

procedure TAuthorizationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
TitleForm.Show;
TitleForm.Position:=poDesktopCenter;
end;

procedure TAuthorizationForm.teacherAuthorization;
begin
     DataModule1.ADOModuleLecture.SQL.Clear;
     DataModule1.ADOModuleLecture.SQL.Add('SELECT password FROM Учитель WHERE login='+#39+edit2.text+#39);
     DataModule1.ADOModuleLecture.Open;
     if DataModule1.ADOModuleLecture.IsEmpty then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
     else
      begin
       if DataModule1.ADOModuleLecture.FieldByName('password').Value<>edit1.Text then
        MessageBox(0,'Неверный логин или пароль!','Авторизация', MB_OK+MB_ICONwarning)
       else
        begin
              AuthorizationData.getDataUser;
           MainMenu.show;
           MainMenu.Height:=699;
           MainMenu.Width:=1188;
            MainMenu.label1.Caption:=nameUser;
            MainMenu.label2.Caption:=familyUser;
            if (roleUser='teacher') then MainMenu.Label3.Caption:='Преподаватель';

    AuthorizationForm.Visible:=false;
    MainMenu.SpeedButton1.Caption:='Редактирование данных контроля знаний';
    MainMenu.SpeedButton2.Caption:='Формирование отчетов';
        end;
end;
    end;
procedure TAuthorizationForm.stydentAuthorization;
begin
      DataModule1.ADOModuleLecture.SQL.Clear;
      DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Ученик WHERE login='+#39+DBComboBox1.Text+#39);
      DataModule1.ADOModuleLecture.Open;
      if DataModule1.ADOModuleLecture.IsEmpty then
        MessageBox(0,'Данный пользователь не найден!','Авторизация', MB_OK+MB_ICONwarning)
      else
            begin
           KodUser:=DBGrid1.DataSource.DataSet.FieldByName('КодУченика').AsInteger;
                AuthorizationData.getDataUser;
              MainMenu.show;
            label1.Caption:=inttostr(KodUser);
               if AuthorizationData.roleUser='stydent' then MainMenu.SpeedButton5.Visible:=false;
              MainMenu.Height:=699;
              MainMenu.Width:=1188;
                 MainMenu.label1.Caption:=nameUser;
                  MainMenu.label2.Caption:=familyUser;
                   if (roleUser='stydent') then MainMenu.Label3.Caption:='Обучающийся';
             AuthorizationForm.Visible:=false;

           // Перенести этот кусок кода в конфиг!!!!
                 MainMenu.SpeedButton1.Caption:='Контроль знаний';
                 MainMenu.SpeedButton2.Caption:='Журнал';
          //=============================
            end;
    end;

end.
