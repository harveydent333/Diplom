unit Menu_Teacher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, AuthorizationData;

type
  TRegistrationForm = class(TForm)
    fon: TImage;
    defolt_edit1: TImage;
    bed_edit1: TImage;
    good_edit1: TImage;
    defolt_edit2: TImage;
    bed_edit2: TImage;
    good_edit2: TImage;
    good_edit3: TImage;
    defolt_edit3: TImage;
    bed_edit3: TImage;
    bed_edit4: TImage;
    good_edit4: TImage;
    defolt_edit4: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    number_group: TDBEdit;
    last_name: TDBEdit;
    first_name: TDBEdit;
    second_name: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    login_field: TDBEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Image1: TImage;
    procedure last_nameChange(Sender: TObject);
    procedure first_nameChange(Sender: TObject);
    procedure second_nameChange(Sender: TObject);
    procedure number_groupChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure login_fieldChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;

implementation

uses Unit3, basa_dan, Unit2, Title_Form;

{$R *.dfm}

procedure TRegistrationForm.last_nameChange(Sender: TObject);
begin
defolt_edit1.Visible:=false;
if last_name.Text='' then
  begin
    good_edit1.Visible:=false;
    bed_edit1.Visible:=true;
    label2.Visible:=true;
  end
else
  begin
    good_edit1.Visible:=true;
    bed_edit1.Visible:=false;
    label2.Visible:=false;
  end;
  
  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'') and (login_field.Text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.first_nameChange(Sender: TObject);
begin
defolt_edit2.Visible:=false;
if first_name.Text='' then
  begin
    good_edit2.Visible:=false;
    bed_edit2.Visible:=true;
    label3.Visible:=true;
  end
else
  begin
    good_edit2.Visible:=true;
    bed_edit2.Visible:=false;
    label3.Visible:=false;
  end;

  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'') and (login_field.Text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.second_nameChange(Sender: TObject);
begin
defolt_edit3.Visible:=false;
if second_name.Text='' then
  begin
    good_edit3.Visible:=false;
    bed_edit3.Visible:=true;
    label4.Visible:=true;
  end
else
  begin
    good_edit3.Visible:=true;
    bed_edit3.Visible:=false;
    label4.Visible:=false;
  end;

  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'') and (login_field.Text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.number_groupChange(Sender: TObject);
begin
defolt_edit4.Visible:=false;
if number_group.Text='' then
  begin
    good_edit4.Visible:=false;
    bed_edit4.Visible:=true;
    label5.Visible:=true;
  end
else
  begin
    good_edit4.Visible:=true;
    bed_edit4.Visible:=false;
    label5.Visible:=false;
  end;

  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'') and (login_field.Text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.login_fieldChange(Sender: TObject);
begin
  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'') and (login_field.Text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.SpeedButton2Click(Sender: TObject);
begin
RegistrationForm.Close;
DataModule1.ADOQuery1.Cancel;
MainMenu.Show;
MainMenu.Position:=poDesktopCenter;


end;

procedure TRegistrationForm.SpeedButton1Click(Sender: TObject);    //  ÕŒœ ¿ «¿–≈√»—“–»–Œ¬¿“‹
begin
DataModule1.ADOQuery2.Close;
DataModule1.ADOQuery2.SQL.Clear;
if last_name.Text='' then   //œŒÀ≈ ‘¿Ã»À»ﬂ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√≈—“–»–Œ¬¿“‹
  begin
    label1.Visible:=true;
    label2.Visible:=true;
    defolt_edit1.Visible:=false;
    good_edit1.Visible:=false;
    bed_edit1.Visible:=true;
  end;

if first_name.Text='' then        //œŒÀ≈ »Ãﬂ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√≈—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label3.Visible:=true;
        defolt_edit2.Visible:=false;
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
      end;

if second_name.Text='' then       //œŒÀ≈ Œ“◊≈—“¬Œ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
  begin
    label1.Visible:=true;
    label4.Visible:=true;
    defolt_edit3.Visible:=false;
    good_edit3.Visible:=false;
    bed_edit3.Visible:=true;
  end;

if number_group.Text='' then     //œŒÀ≈ √–”œœ¿ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
  begin
    label1.Visible:=true;
    label5.Visible:=true;
    defolt_edit4.Visible:=false;
    good_edit4.Visible:=false;
    bed_edit4.Visible:=true;
  end;



if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>'')) then
begin
  login_field.Text:=last_name.Text+' '+first_name.Text+' '+second_name.Text;
  DataModule1.ADOQuery1.Post;
  label1.Visible:=false;
  DataModule1.ADOQuery1.Append;
    defolt_edit1.Visible:=true;
    defolt_edit2.Visible:=true;
    defolt_edit3.Visible:=true;
    defolt_edit4.Visible:=true;

    good_edit1.Visible:=false;
    good_edit2.Visible:=false;
    good_edit3.Visible:=false;
    good_edit4.Visible:=false;

    bed_edit1.Visible:=false;
    bed_edit2.Visible:=false;
    bed_edit3.Visible:=false;
    bed_edit4.Visible:=false;

    label1.Visible:=false;
    label2.Visible:=false;
    label3.Visible:=false;
    label4.Visible:=false;
    label5.Visible:=false;
end;

end;



procedure TRegistrationForm.SpeedButton5Click(Sender: TObject);
begin

AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;
AuthorizationForm.Show;
AuthorizationForm.Position:=poDesktopCenter;
RegistrationForm.Close;
MainMenu.Close;
end;

procedure TRegistrationForm.SpeedButton4Click(Sender: TObject);
begin
RegistrationForm.Close;
TitleForm.close;
end;

procedure TRegistrationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
MainMenu.Show;
end;

end.
