unit AuthorizationData;

interface
uses basa_dan, Unit2;

var
nameUser, familyUser, secondNameUser, loginUser, roleUser, groupUser, DataControl:string;
KodControla, Mark, KodUser:integer;

Good_Ball,Bed_Ball:real;


procedure getDataUser;
procedure freeDataUser;
procedure getDataAuthUser;
procedure SetNameAndFamilyAuthUsers;
procedure defoltConfigRegistrationForm;
procedure defoltConfigRegistrationTeacherForm;

implementation

uses Unit3 ,Menu_Teacher, Control, config, Main_Menu, Control_CRUD,
  ControlCenter, Lecture_CRUD, Menu_Control, Menu_Lectures, Menu_Practic,
  Practic_CRUD, Razdel_CRUD, Tema_CRUD, Ycheniki_CRUD, Add_Question,
  DocumentForm, SysUtils,
  MultiMedia_CRUD,
  AddControl,
  Manager_Users,
  Teacher_CRUD,
  Registration_Teacher, Menu_Multimedai;

procedure getDataUser;
begin
    if AuthorizationForm.teacher_ON.Visible = true then
        begin
            config.selectRequestSQL('SELECT * FROM Учитель WHERE login='+#39+AuthorizationForm.edit2.text+#39);
            getDataAuthUser;            // Заполнение авторизованного пользователя данными
            SetNameAndFamilyAuthUsers;  // Заполнение Имя и Фамилии Авторизованным пользователям
            roleUser:='teacher';
        end;

    if AuthorizationForm.stydent_ON.Visible = true then
        begin
            getDataAuthUser;            // Заполнение авторизованного пользователя данными
            SetNameAndFamilyAuthUsers; // Заполнение Имя и Фамилии Авторизованным пользователям
            KodUser:=BD.Request.DataSet.FieldByName('КодУченика').AsInteger;
            roleUser:='stydent';
            groupUser:=IntToStr(AuthorizationForm.ComboBox1.ItemIndex+1);
        end;
end;

procedure getDataAuthUser;
begin
    with BD.RequestSQL do
        begin
            nameUser:=FieldByName('Имя').AsString;
            familyUser:=FieldByName('Фамилия').AsString;
            secondNameUser:=FieldByName('Отчество').AsString;
        end;
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
   config.selectRequestSQL('SELECT * FROM Ученик WHERE КодГруппы=1');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        with BD.Request.DataSet do
          begin
              fio:=FieldByName('Фамилия').AsString+' '+FieldByName('Имя').AsString+' '+FieldByName('Отчество').AsString;
          end;
        AuthorizationForm.ComboBox2.Items.Add(fio);
        BD.Request.DataSet.Next;
      end;
   AuthorizationForm.ComboBox2.ItemIndex:=0;
   config.selectRequestSQL('SELECT * FROM Группа');
   BD.Request.DataSet.First;
   for i:=1 to BD.Request.DataSet.RecordCount do
      begin
        AuthorizationForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеГруппы').AsString);
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
