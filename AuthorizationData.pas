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
procedure getDataAuthUser;
procedure SetNameAndFamilyAuthUsers;

implementation

uses Unit3 ,Menu_Teacher, Control, config, Main_Menu, Control_CRUD,
  ControlCenter, Lecture_CRUD, Menu_Control, Menu_Lectures, Menu_Practic,
  Practic_CRUD, Razdel_CRUD, Tema_CRUD, Ycheniki_CRUD, Add_Question;

procedure getDataUser;
begin
if AuthorizationForm.teacher_ON.Visible = true then
  begin
    config.selectRequestSQL('SELECT * FROM ������� WHERE login='+#39+AuthorizationForm.edit2.text+#39);
    getDataAuthUser;            // ���������� ��������������� ������������ �������
    SetNameAndFamilyAuthUsers;  // ���������� ��� � ������� �������������� �������������
    roleUser:='teacher';

  end;
if AuthorizationForm.stydent_ON.Visible = true then
    begin
      config.selectRequestSQL('SELECT * FROM ������ WHERE login='+#39+AuthorizationForm.DBComboBox1.Text+#39);
      getDataAuthUser;            // ���������� ��������������� ������������ �������
      SetNameAndFamilyAuthUsers; // ���������� ��� � ������� �������������� �������������
      roleUser:='stydent';
    end;
end;

procedure getDataAuthUser;
begin
    nameUser:=DataModule1.ADOModuleLecture.FieldByName('���').AsString;
    familyUser:=DataModule1.ADOModuleLecture.FieldByName('�������').AsString;
    secondNameUser:=DataModule1.ADOModuleLecture.FieldByName('��������').AsString;
    loginUser:=DataModule1.ADOModuleLecture.FieldByName('login').AsString;
end;

procedure SetNameAndFamilyAuthUsers;
begin
  MainMenu.label1.Caption:=nameUser;
  MainMenu.label2.Caption:=familyUser;

  ControlCRUD.label1.Caption:=nameUser;
  ControlCRUD.label2.Caption:=familyUser;

  DataManagementCenter.label1.Caption:=nameUser;
  DataManagementCenter.label2.Caption:=familyUser;

  LectureCRUD.label1.Caption:=nameUser;
  LectureCRUD.label2.Caption:=familyUser;

  MenuControl.label4.Caption:=nameUser;
  MenuControl.label6.Caption:=familyUser;

  MenuLectures.label4.Caption:=nameUser;
  MenuLectures.label6.Caption:=familyUser;

  MenuPractic.label4.Caption:=nameUser;
  MenuPractic.label6.Caption:=familyUser;

  PracticCRUD.label1.Caption:=nameUser;
  PracticCRUD.label2.Caption:=familyUser;

  RazdelCRUD.label1.Caption:=nameUser;
  RazdelCRUD.label2.Caption:=familyUser;

  RegistrationForm.Label7.Caption:=nameUser;
  RegistrationForm.Label8.Caption:=familyUser;

  YchenikiCRUD.label1.Caption:=nameUser;
  YchenikiCRUD.label2.Caption:=familyUser;

  TemaCRUD.label1.Caption:=nameUser;
  TemaCRUD.label2.Caption:=familyUser;

  Add_Questions.Label9.Caption:=nameUser;
  Add_Questions.Label10.Caption:=familyUser;
end;

procedure freeDataUser;       // logOut
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

end.
