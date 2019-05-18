unit Registration_Teacher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TRegistrationTeacher = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    bed_edit4: TImage;
    bed_edit3: TImage;
    bed_edit2: TImage;
    bed_edit1: TImage;
    good_edit4: TImage;
    good_edit3: TImage;
    good_edit2: TImage;
    good_edit1: TImage;
    defolt_edit4: TImage;
    defolt_edit3: TImage;
    defolt_edit2: TImage;
    defolt_edit1: TImage;
    bed_edit5: TImage;
    defolt_edit5: TImage;
    good_edit5: TImage;
    Label14: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    good_edit6: TImage;
    defolt_edit6: TImage;
    bed_edit6: TImage;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    last_name: TEdit;
    second_name: TEdit;
    email: TEdit;
    login: TEdit;
    password: TEdit;
    first_name: TEdit;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure last_nameChange(Sender: TObject);
    procedure first_nameChange(Sender: TObject);
    procedure second_nameChange(Sender: TObject);
    procedure emailChange(Sender: TObject);
    procedure loginChange(Sender: TObject);
    procedure passwordChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationTeacher: TRegistrationTeacher;

implementation

uses Unit2, Title_Form, Teacher_CRUD, AuthorizationData, config, basa_dan;

{$R *.dfm}

procedure TRegistrationTeacher.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    RegistrationTeacher.Visible:=false;
end;

procedure TRegistrationTeacher.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'¬˚ ÚÓ˜ÌÓ ıÓÚËÚÂ ‚˚ÈÚË ËÁ ÔÓ„‡ÏÏ˚?','œÓ„‡ÏÏËÓ‚‡ÌËÂ Ë Á‡˘ËÚ‡ Web - ÔËÎÓÊÂÌËÈ',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

procedure TRegistrationTeacher.SpeedButton2Click(Sender: TObject);
begin
    TeacherCRUD.show;
    TeacherCRUD.position:=poDesktopCenter;
    RegistrationTeacher.Visible:=false;
end;

procedure TRegistrationTeacher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TeacherCRUD.show;
    TeacherCRUD.position:=poDesktopCenter;
    RegistrationTeacher.Visible:=false;
end;

procedure TRegistrationTeacher.last_nameChange(Sender: TObject);
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
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.first_nameChange(Sender: TObject);
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
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.second_nameChange(Sender: TObject);
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
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.emailChange(Sender: TObject);
begin
  defolt_edit4.Visible:=false;
    if email.Text='' then
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
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.loginChange(Sender: TObject);
begin
    defolt_edit5.Visible:=false;
    if login.Text='' then
      begin
        good_edit5.Visible:=false;
        bed_edit5.Visible:=true;
        label6.Visible:=true;
      end
    else
      begin
        good_edit5.Visible:=true;
        bed_edit5.Visible:=false;
        label6.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.passwordChange(Sender: TObject);
begin
    defolt_edit6.Visible:=false;
    if password.Text='' then
      begin
        good_edit6.Visible:=false;
        bed_edit6.Visible:=true;
        label10.Visible:=true;
      end
    else
      begin
        good_edit6.Visible:=true;
        bed_edit6.Visible:=false;
        label10.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
    and (email.Text<>'')and (login.Text<>'')and (password.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationTeacher.SpeedButton1Click(Sender: TObject);
begin
   if last_name.Text='' then   // œ”—“Œ≈ œŒÀ≈ ‘¿Ã»À»ﬂ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√≈—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label2.Visible:=true;
        defolt_edit1.Visible:=false;
        good_edit1.Visible:=false;
        bed_edit1.Visible:=true;
      end;

    if first_name.Text='' then        //œ”—“Œ≈ œŒÀ≈ »Ãﬂ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√≈—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label3.Visible:=true;
        defolt_edit2.Visible:=false;
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
      end;

    if second_name.Text='' then       //œ”—“Œ≈ œŒÀ≈ Œ“◊≈—“¬Œ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label4.Visible:=true;
        defolt_edit3.Visible:=false;
        good_edit3.Visible:=false;
        bed_edit3.Visible:=true;
      end;

    if email.Text='' then     //œ”—“Œ≈ œŒÀ≈ Email œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label5.Visible:=true;
        defolt_edit4.Visible:=false;
        good_edit4.Visible:=false;
        bed_edit4.Visible:=true;
      end;

    if login.Text='' then     //œ”—“Œ≈ œŒÀ≈ ÀÓ„ËÌ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label6.Visible:=true;
        defolt_edit5.Visible:=false;
        good_edit5.Visible:=false;
        bed_edit5.Visible:=true;
      end;

      if password.Text='' then     //œ”—“Œ≈ œŒÀ≈ Ô‡ÓÎ¸ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
      begin
        label1.Visible:=true;
        label10.Visible:=true;
        defolt_edit6.Visible:=false;
        good_edit6.Visible:=false;
        bed_edit6.Visible:=true;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')and (login.text<>'')
    and (email.text<>'') and(password.text<>'')) then
      begin
        config.execRequestSQL('INSERT INTO ”˜ËÚÂÎ¸(‘‡ÏËÎËˇ, »Ïˇ, ŒÚ˜ÂÒÚ‚Ó, login, email, pass) VALUES('+
          #39+last_name.Text+#39+', '+
          #39+first_name.Text+#39+', '+
          #39+second_name.Text+#39+', '+
          #39+login.Text+#39+', '+
          #39+email.Text+#39+','+
          #39+password.Text+#39+')'
        );

        config.rebootRequestsCRUD;
        label1.Visible:=false;

        defolt_edit1.Visible:=true;
        defolt_edit2.Visible:=true;
        defolt_edit3.Visible:=true;
        defolt_edit4.Visible:=true;
        defolt_edit5.Visible:=true;
        defolt_edit6.Visible:=true;

        good_edit1.Visible:=false;
        good_edit2.Visible:=false;
        good_edit3.Visible:=false;
        good_edit4.Visible:=false;
        good_edit5.Visible:=false;
        good_edit6.Visible:=false;

        bed_edit1.Visible:=false;
        bed_edit2.Visible:=false;
        bed_edit3.Visible:=false;
        bed_edit4.Visible:=false;
        bed_edit5.Visible:=false;
        bed_edit6.Visible:=false;

        label1.Visible:=false;
        label2.Visible:=false;
        label3.Visible:=false;
        label4.Visible:=false;
        label5.Visible:=false;
        label6.Visible:=false;
        label10.Visible:=false;

        last_name.Text:='';
        first_name.Text:='';
        second_name.text:='';
        email.text:='';
        login.text:='';
        password.text:='';

      end;
end;

end.
