unit AuthorizationData;

interface
uses basa_dan, Unit2;

var
nameUser, familyUser, secondNameUser, loginUser, roleUser, DataControl:string;
KodControla, Mark, KodUser:integer;

Good_Ball,Bed_Ball:real;


procedure getDataUser;
procedure freeDataUser;
procedure defoltConfigRegistrationForm;
procedure defoltKnowledgeControl;
procedure defoltKnowledgeControlStydent;
procedure getDataAuthUser;

implementation

uses Unit3 ,Menu_Teacher, Control, config;



procedure getDataUser;
begin
if AuthorizationForm.teacher_ON.Visible = true then
  begin
    config.selectRequestSQL('SELECT * FROM ”˜ËÚÂÎ¸ WHERE login='+#39+AuthorizationForm.edit2.text+#39);
    getDataAuthUser;
    roleUser:='teacher';
  end;
if AuthorizationForm.stydent_ON.Visible = true then
    begin
      config.selectRequestSQL('SELECT * FROM ”˜ÂÌËÍ WHERE login='+#39+AuthorizationForm.DBComboBox1.Text+#39);
      getDataAuthUser;
      roleUser:='stydent';
    end;
end;

procedure getDataAuthUser;
begin
    nameUser:=DataModule1.ADOModuleLecture.FieldByName('»Ïˇ').AsString;
    familyUser:=DataModule1.ADOModuleLecture.FieldByName('‘‡ÏËÎËˇ').AsString;
    secondNameUser:=DataModule1.ADOModuleLecture.FieldByName('ŒÚ˜ÂÒÚ‚Ó').AsString;      // ¬€“»¿Ÿ»“‹ ›“Œ √Œ¬ÕŒ ¬ Œƒ»Õ Ã≈“Œƒ
    loginUser:=DataModule1.ADOModuleLecture.FieldByName('login').AsString;
end;


procedure freeDataUser;
begin
   nameUser:='';
   familyUser:='';
   secondNameUser:='';
   loginUser:='';
   roleUser:='';
   kodUser:=0;
end;

procedure defoltConfigRegistrationForm;
begin
with RegistrationForm do
  begin
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

procedure defoltKnowledgeControl;
begin
with KnowledgeControl do
  begin
    if Treeview1.Items.Count=0 then
      begin
        speedbutton8.Visible:=false;
        label1.Visible:=false;
        dbedit1.Visible:=false;
        speedbutton12.Visible:=false;
        defolt_edit1.Visible:=false;
        good_edit1.Visible:=false;
        bed_edit1.Visible:=false;
      end
      else
      begin
         label1.Visible:=true;
         label7.Caption:=nameUser;
         dbedit1.Visible:=true;
         speedbutton12.Visible:=true;
         defolt_edit1.Visible:=true;
         good_edit1.Visible:=false;
         bed_edit1.Visible:=false;
         speedbutton8.Visible:=true;
         speedbutton8.Left:=344; speedbutton8.Top:=144;
      end;
        label2.Visible:=false;
        label8.Caption:=familyUser;
        dbedit2.Visible:=false;
        speedbutton13.Visible:=false;

        label3.Visible:=false;
        dbedit3.Visible:=false;
        speedbutton14.Visible:=false;
      speedbutton1.Visible:=true;
      speedbutton9.Visible:=false;
      speedbutton7.Visible:=false;
      speedbutton11.Visible:=false;
      speedbutton8.Visible:=true;
      speedbutton10.Visible:=false;

      speedbutton8.Left:=344;
     speedbutton8.Top:=144;

     speedbutton6.Left:=344;
     speedbutton6.Top:=192;
     panel1.Visible:=false;
     speedbutton15.visible:=false;

  end;
end;

procedure defoltKnowledgeControlStydent;
begin
with KnowledgeControl do
begin
panel1.Visible:=false;
speedbutton15.visible:=false;
  speedbutton1.visible:=false;
  speedbutton6.visible:=false;
  speedbutton7.visible:=false;
  speedbutton8.visible:=false;
  speedbutton9.visible:=false;
  speedbutton10.visible:=false;
  speedbutton11.visible:=false;
  speedbutton12.visible:=false;
  speedbutton13.visible:=false;
  speedbutton14.visible:=false;
  label1.visible:=false;
  label2.visible:=false;
  label3.visible:=false;
  label4.visible:=false;
  label5.visible:=false;
  label6.visible:=false;
  label9.visible:=false;
  label10.visible:=false;
  label11.visible:=false;
  dbedit1.Visible:=false;
  dbedit2.Visible:=false;
  dbedit3.Visible:=false;
  good_edit1.Visible:=false;
  defolt_edit1.Visible:=false;
  bed_edit1.visible:=false;

label7.Caption:=nameUser;
label8.Caption:=familyUser;
   end;
end;

end.
