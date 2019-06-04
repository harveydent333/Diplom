unit AuthorizationData;

interface
uses basa_dan, Unit2;

var
nameUser, familyUser, secondNameUser, loginUser, roleUser, groupUser, DataControl:string;
KodControla, Mark, KodUser:integer;

Good_Ball,Bed_Ball:real;


procedure getDataUser;
procedure freeDataUser;
procedure setDataAuthUser;
procedure SetNameAndFamilyAuthUsers;
procedure defoltConfigRegistrationForm;
procedure defoltConfigRegistrationTeacherForm;
procedure setIconRole(stydent:boolean; teacher:boolean);

implementation

uses Unit3 ,Menu_Teacher, Control, config, Main_Menu, Control_CRUD,
  ControlCenter, Lecture_CRUD, Menu_Control, Menu_Lectures, Menu_Practic,
  Practic_CRUD, Razdel_CRUD, Tema_CRUD, Ycheniki_CRUD, Add_Question,
  DocumentForm, SysUtils,
  MultiMedia_CRUD,
  AddControl,
  Manager_Users,
  Teacher_CRUD,
  Registration_Teacher, Menu_Multimedai, All_Lecture_Practic_Control;

procedure getDataUser;
begin
    if AuthorizationForm.teacher_ON.Visible = true then
        begin
            config.selectRequestSQL('SELECT * FROM ������� WHERE login='+#39+AuthorizationForm.edit2.text+#39);
            setDataAuthUser;            // ���������� ��������������� ������������ �������
            SetNameAndFamilyAuthUsers;  // ���������� ��� � ������� �������������� �������������
            KodUser:=BD.Request.DataSet.FieldByName('����������').AsInteger;
            roleUser:='teacher';
            setIconRole(false,true);
        end;

    if AuthorizationForm.stydent_ON.Visible = true then
        begin
            setDataAuthUser;            // ���������� ��������������� ������������ �������
            SetNameAndFamilyAuthUsers; // ���������� ��� � ������� �������������� �������������
            KodUser:=BD.Request.DataSet.FieldByName('����������').AsInteger;
            roleUser:='stydent';
            setIconRole(true,false);
            groupUser:=IntToStr(AuthorizationForm.ComboBox1.ItemIndex+1);
        end;
end;

procedure setDataAuthUser;
begin
    with BD.RequestSQL do
        begin
            nameUser:=FieldByName('���').AsString;
            familyUser:=FieldByName('�������').AsString;
            secondNameUser:=FieldByName('��������').AsString;
        end;
end;

procedure setIconRole(stydent:boolean; teacher:boolean);
begin
    MainMenu.teacher_ON.Visible:=teacher;
    MainMenu.stydent_ON.Visible:=stydent;

    ControlCRUD.teacher_ON.Visible:=teacher;
    ControlCRUD.stydent_ON.Visible:=stydent;

    DataManagementCenter.teacher_ON.Visible:=teacher;
    DataManagementCenter.stydent_ON.Visible:=stydent;

    LectureCRUD.teacher_ON.Visible:=teacher;
    LectureCRUD.stydent_ON.Visible:=stydent;

    MenuControl.teacher_ON.Visible:=teacher;
    MenuControl.stydent_ON.Visible:=stydent;

    MenuLectures.teacher_ON.Visible:=teacher;
    MenuLectures.stydent_ON.Visible:=stydent;

    MenuPractic.teacher_ON.Visible:=teacher;
    MenuPractic.stydent_ON.Visible:=stydent;

    MultimediaCRUD.teacher_ON.Visible:=teacher;
    MultimediaCRUD.stydent_ON.Visible:=stydent;;

    PracticCRUD.teacher_ON.Visible:=teacher;
    PracticCRUD.stydent_ON.Visible:=stydent;

    RazdelCRUD.teacher_ON.Visible:=teacher;
    RazdelCRUD.stydent_ON.Visible:=stydent;

    RegistrationForm.teacher_ON.Visible:=teacher;
    RegistrationForm.stydent_ON.Visible:=stydent;

    RegistrationTeacher.teacher_ON.Visible:=teacher;
    RegistrationTeacher.stydent_ON.Visible:=stydent;

    ManagerUsers.teacher_ON.Visible:=teacher;
    ManagerUsers.stydent_ON.Visible:=stydent;

    YchenikiCRUD.teacher_ON.Visible:=teacher;
    YchenikiCRUD.stydent_ON.Visible:=stydent;

    TeacherCRUD.teacher_ON.Visible:=teacher;
    TeacherCRUD.stydent_ON.Visible:=stydent;

    TemaCRUD.teacher_ON.Visible:=teacher;
    TemaCRUD.stydent_ON.Visible:=stydent;

    Add_Questions.teacher_ON.Visible:=teacher;
    Add_Questions.stydent_ON.Visible:=stydent;

    Shyrnal.teacher_ON.Visible:=teacher;
    Shyrnal.stydent_ON.Visible:=stydent;

    MenuMultimedia.teacher_ON.Visible:=teacher;
    MenuMultimedia.stydent_ON.Visible:=stydent;

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

    AllComponents.label6.Caption:=nameUser;
    AllComponents.label7.Caption:=familyUser;

    MenuControl.label4.Caption:=nameUser;
    MenuControl.label6.Caption:=familyUser;

    MenuLectures.label4.Caption:=nameUser;
    MenuLectures.label6.Caption:=familyUser;

    MenuPractic.label4.Caption:=nameUser;
    MenuPractic.label6.Caption:=familyUser;

    MultimediaCRUD.label1.Caption:=nameUser;
    MultimediaCRUD.label2.Caption:=familyUser;

    PracticCRUD.label1.Caption:=nameUser;
    PracticCRUD.label2.Caption:=familyUser;

    RazdelCRUD.label1.Caption:=nameUser;
    RazdelCRUD.label2.Caption:=familyUser;

    RegistrationForm.Label7.Caption:=nameUser;
    RegistrationForm.Label8.Caption:=familyUser;

    RegistrationTeacher.Label7.Caption:=nameUser;
    RegistrationTeacher.Label8.Caption:=familyUser;

    ManagerUsers.label1.Caption:=nameUser;
    ManagerUsers.label2.Caption:=familyUser;

    YchenikiCRUD.label1.Caption:=nameUser;
    YchenikiCRUD.label2.Caption:=familyUser;

    TeacherCRUD.label1.Caption:=nameUser;
    TeacherCRUD.label2.Caption:=familyUser;

    TemaCRUD.label1.Caption:=nameUser;
    TemaCRUD.label2.Caption:=familyUser;

    Add_Questions.Label9.Caption:=nameUser;
    Add_Questions.Label10.Caption:=familyUser;

    Shyrnal.Label1.Caption:=nameUser;
    Shyrnal.Label2.Caption:=familyUser;

    MenuMultimedia.Label4.Caption:=nameUser;
    MenuMultimedia.Label6.Caption:=familyUser;
end;

procedure freeDataUser;       // logOut
var i:integer; fio:string;
begin
    nameUser:='';
    familyUser:='';
    secondNameUser:='';
    loginUser:='';
    roleUser:='';
    groupUser:='';
    kodUser:=0;

   AuthorizationForm.ComboBox1.Clear;
   AuthorizationForm.ComboBox2.Clear;
   config.selectRequestSQL('SELECT * FROM ������ WHERE ���������=1');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        with BD.Request.DataSet do
          begin
              fio:=FieldByName('�������').AsString+' '+FieldByName('���').AsString+' '+FieldByName('��������').AsString;
          end;
        AuthorizationForm.ComboBox2.Items.Add(fio);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox2.ItemIndex:=0;
   config.selectRequestSQL('SELECT * FROM ������');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        AuthorizationForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('��������������').AsString);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox1.ItemIndex:=0;
end;

procedure defoltConfigRegistrationForm;
begin
    with RegistrationForm do
        begin
            defolt_edit1.Visible:=true;
            defolt_edit2.Visible:=true;
            defolt_edit3.Visible:=true;

            good_edit1.Visible:=false;
            good_edit2.Visible:=false;
            good_edit3.Visible:=false;

            bed_edit1.Visible:=false;
            bed_edit2.Visible:=false;
            bed_edit3.Visible:=false;

            label1.Visible:=false;
            label2.Visible:=false;
            label3.Visible:=false;
            label4.Visible:=false;
        end;
end;

procedure defoltConfigRegistrationTeacherForm;
begin
    with RegistrationTeacher do
        begin
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
        end;
end;

end.
