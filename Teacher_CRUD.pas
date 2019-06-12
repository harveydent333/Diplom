unit Teacher_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TTeacherCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    stydent_ON: TImage;
    teacher_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TeacherCRUD: TTeacherCRUD;

implementation

uses Title_Form, Unit2, Manager_Users, Add_Question, basa_dan, config,
  UpdateUnit, AuthorizationData, Menu_Teacher, Registration_Teacher, ShellAPI;

{$R *.dfm}

procedure TTeacherCRUD.BitBtn1Click(Sender: TObject);
begin
   with RegistrationTeacher do
      begin
        Show;
        first_name.Text:='';
        second_name.Text:='';
        last_name.Text:='';
        login.Text:='';
        password.Text:='';
        email.Text:='';
        Label9.Visible:=true;
        bed_edit6.Visible:=true;
        defolt_edit6.Visible:=true;
        good_edit6.Visible:=true;
        password.Visible:=true;
        SpeedButton1.Visible:=true;
        SpeedButton6.Visible:=false;
        SpeedButton7.Visible:=false;
        Position:=poDesktopCenter;
        Caption:='Регистрация преподавателя';
      end;

    AuthorizationData.defoltConfigRegistrationTeacherForm;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Учитель WHERE login='+#39+DBGrid1.DataSource.DataSet.FieldByName('login').AsString+#39);
    updateKodTeacher:=BD.Request.DataSet.FieldByName('КодУчителя').AsInteger;
    with RegistrationTeacher do
      begin
          Show;
          Position:=poDesktopCenter;
          last_name.Text:=BD.Request.DataSet.FieldByName('Фамилия').AsString;
          first_name.Text:=BD.Request.DataSet.FieldByName('Имя').AsString;
          second_name.Text:=BD.Request.DataSet.FieldByName('Отчество').AsString;
          email.Text:=BD.Request.DataSet.FieldByName('email').AsString;
          login.Text:=BD.Request.DataSet.FieldByName('login').AsString;
          Label9.Visible:=false;
          bed_edit6.Visible:=false;
          defolt_edit6.Visible:=false;
          good_edit6.Visible:=false;
          password.Visible:=false;
          SpeedButton1.Visible:=false;
          SpeedButton6.Visible:=true;
          SpeedButton7.Visible:=true;
          Caption:='Редактирование преподавателя';
      end;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.BitBtn3Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM Учитель WHERE login='+#39+DBGrid1.DataSource.DataSet.FieldByName('login').AsString+#39);
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные преподавателя были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;
procedure TTeacherCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TTeacherCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.SpeedButton2Click(Sender: TObject);
begin
    ManagerUsers.show;
    ManagerUsers.position:=poDesktopCenter;
    TeacherCRUD.Visible:=false;
end;

procedure TTeacherCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
