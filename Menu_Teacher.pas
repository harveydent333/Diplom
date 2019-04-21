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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    last_name: TEdit;
    first_name: TEdit;
    second_name: TEdit;
    number_group: TEdit;
    procedure last_name3Change(Sender: TObject);
    procedure first_name3Change(Sender: TObject);
    procedure second_name3Change(Sender: TObject);
    procedure number_group3Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure login_fieldChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure last_nameChange(Sender: TObject);
    procedure first_nameChange(Sender: TObject);
    procedure second_nameChange(Sender: TObject);
    procedure number_groupChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;
       login:string;

implementation

uses Unit3, basa_dan, Unit2, Title_Form, config;

{$R *.dfm}

procedure TRegistrationForm.last_name3Change(Sender: TObject);
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
and (number_group.text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.first_name3Change(Sender: TObject);
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
and (number_group.text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.second_name3Change(Sender: TObject);
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
and (number_group.text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.number_group3Change(Sender: TObject);
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
and (number_group.text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.login_fieldChange(Sender: TObject);
begin
  if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')
and (number_group.text<>''))then label1.Visible:=false;

end;

procedure TRegistrationForm.SpeedButton2Click(Sender: TObject);
begin
RegistrationForm.Close;
MainMenu.Show;
MainMenu.Position:=poDesktopCenter;
end;

procedure TRegistrationForm.SpeedButton1Click(Sender: TObject);    //  ÕŒœ ¿ «¿–≈√»—“–»–Œ¬¿“‹
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

if number_group.Text='' then     //œ”—“Œ≈ œŒÀ≈ √–”œœ¿ œ–» Õ¿∆¿“»»  ÕŒœ » «¿–≈√»—“–»–Œ¬¿“‹
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
    login:=last_name.Text+' '+first_name.Text+' '+second_name.Text;
    config.execRequestSQL('INSERT INTO ”˜ÂÌËÍ(‘‡ÏËÎËˇ, »Ïˇ, ŒÚ˜ÂÒÚ‚Ó, √ÛÔÔ‡, login) VALUES('+
      #39+last_name.Text+#39+','+
      #39+first_name.Text+#39+','+
      #39+second_name.Text+#39+','+
      #39+number_group.Text+#39+', '+
      #39+login+#39+')'
    );
    config.rebootRequestsCRUD;
    label1.Visible:=false;

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

    last_name.Text:='';
    first_name.Text:='';
    second_name.text:='';
    number_group.text:='';
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
//MainMenu.Show;
end;

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
and (number_group.text<>''))then label1.Visible:=false;
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
and (number_group.text<>''))then label1.Visible:=false;
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
and (number_group.text<>''))then label1.Visible:=false;
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
and (number_group.text<>''))then label1.Visible:=false;
end;

end.
