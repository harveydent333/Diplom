unit Change_Pass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, jpeg;

type
  TChangePass = class(TForm)
    Image1: TImage;
    Label4: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    openCurrent: TImage;
    openNew: TImage;
    closeCurrent: TImage;
    closeNew: TImage;
    Label7: TLabel;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure closeCurrentClick(Sender: TObject);
    procedure openCurrentClick(Sender: TObject);
    procedure closeNewClick(Sender: TObject);
    procedure openNewClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePass: TChangePass;

implementation

uses config, UpdateUnit, basa_dan, Registration_Teacher;

{$R *.dfm}

procedure TChangePass.SpeedButton1Click(Sender: TObject);
begin
    if Edit2.Text='' then label7.Visible:=true;
    if Edit1.Text='' then label1.Visible:=true;

   if BD.Request.DataSet.FieldByName('pass').AsString = Edit2.Text then
    begin
      config.execRequestSQL('UPDATE Учитель SET pass='#39+Edit1.Text+#39+' WHERE КодУчителя='+IntToStr(updateKodTeacher));
      MessageBox(0,'Пароль успешно изменен!','Изменение пароля', MB_OK+MB_ICONINFORMATION);
      Edit2.Text:='';
      Edit1.Text:='';
    end
   else
    MessageBox(0,'Неправильный текущий пароль!','Изменение пароля', MB_OK+MB_ICONwarning);
end;

procedure TChangePass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ChangePass.Visible:=false;
    RegistrationTeacher.Enabled:=true;
end;

procedure TChangePass.closeCurrentClick(Sender: TObject);
begin
    Edit2.PasswordChar:='*';
    closeCurrent.Visible:=false;
    openCurrent.Visible:=true;
end;

procedure TChangePass.openCurrentClick(Sender: TObject);
begin
    Edit2.PasswordChar:=#0;
    closeCurrent.Visible:=true;
    openCurrent.Visible:=false;
end;

procedure TChangePass.closeNewClick(Sender: TObject);
begin
  Edit1.PasswordChar:='*';
  closeNew.Visible:=false;
  openNew.Visible:=true;
end;

procedure TChangePass.openNewClick(Sender: TObject);
begin
    Edit1.PasswordChar:=#0;
    closeNew.Visible:=true;
    openNew.Visible:=false;
end;

procedure TChangePass.Edit1Change(Sender: TObject);
begin
    label1.Visible:=false;
end;

procedure TChangePass.Edit2Change(Sender: TObject);
begin
    label7.Visible:=false;
end;

end.
