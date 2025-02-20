program DevelopAndProtectedWebApps;

uses
  Forms,
  Title_Form in 'Title_Form.pas' {TitleForm},
  Unit2 in 'Unit2.pas' {AuthorizationForm},
  Menu_Teacher in 'Menu_Teacher.pas' {RegistrationForm},
  basa_dan in 'basa_dan.pas' {BD: TDataModule},
  Add_Question in 'Add_Question.pas' {Add_Questions},
  AddRazdel in 'AddRazdel.pas' {AddRazdelModalForm},
  AddTema in 'AddTema.pas' {AddTemaModalForm},
  AuthorizationData in 'AuthorizationData.pas',
  PassingKnowledgeControl in 'PassingKnowledgeControl.pas' {PassingKnowledgeControlForm},
  AddControl in 'AddControl.pas' {AddControlModalForm},
  DocumentForm in 'DocumentForm.pas' {Shyrnal},
  defoltTest in 'defoltTest.pas',
  Result in 'Result.pas' {ResultForm},
  Tema_CRUD in 'Tema_CRUD.pas' {TemaCRUD},
  Razdel_CRUD in 'Razdel_CRUD.pas' {RazdelCRUD},
  Lecture_CRUD in 'Lecture_CRUD.pas' {LectureCRUD},
  Practic_CRUD in 'Practic_CRUD.pas' {PracticCRUD},
  Control_CRUD in 'Control_CRUD.pas' {ControlCRUD},
  AddLecture in 'AddLecture.pas' {AddLectureModalForm},
  AddPractic in 'AddPractic.pas' {AddPracticModalForm},
  Ycheniki_CRUD in 'Ycheniki_CRUD.pas' {YchenikiCRUD},
  UpdateTema in 'UpdateTema.pas' {UpdateTemaModalForm},
  UpdateLecture in 'UpdateLecture.pas' {UpdateLectureModalForm},
  UpdateUnit in 'UpdateUnit.pas',
  config in 'config.pas',
  UpdateRazdel in 'UpdateRazdel.pas' {UpdateRazdelModalForm},
  UpdatePractic in 'UpdatePractic.pas' {UpdatePracticModalForm},
  UpdateControl in 'UpdateControl.pas' {UpdateControlModalForm},
  ControlCenter in 'ControlCenter.pas' {DataManagementCenter},
  Main_Menu in 'Main_Menu.pas' {MainMenu},
  Variants_Question in 'Variants_Question.pas' {VariantsQuestionSingle: TFrame},
  Variants_Question_More in 'Variants_Question_More.pas' {VariantsQuestionMore: TFrame},
  Variants_Question_Write in 'Variants_Question_Write.pas' {VariantsQuestionWrite: TFrame},
  QuestionsMemo in 'QuestionsMemo.pas',
  AddQuestionModal in 'AddQuestionModal.pas' {AddQuestionModalForm},
  EditLecture in 'EditLecture.pas' {Edit_Lecture},
  MultiMedia_CRUD in 'MultiMedia_CRUD.pas' {MultiMediaCRUD},
  AddMultimedia in 'AddMultimedia.pas' {AddMultimediaModalForm},
  UpdateMultimedia in 'UpdateMultimedia.pas' {UpdateMultimediaModalForm},
  Registration_Teacher in 'Registration_Teacher.pas' {RegistrationTeacher},
  Teacher_CRUD in 'Teacher_CRUD.pas' {TeacherCRUD},
  Manager_Users in 'Manager_Users.pas' {ManagerUsers},
  QuestionsMoreMemo in 'QuestionsMoreMemo.pas',
  PassControlSingle in 'PassControlSingle.pas',
  PassControlMore in 'PassControlMore.pas',
  Change_Pass in 'Change_Pass.pas' {ChangePass},
  All_Lecture_Practic_Control in 'All_Lecture_Practic_Control.pas' {AllComponents};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '���������������� � ������ WEB - ����������';
  Application.CreateForm(TTitleForm, TitleForm);
  Application.CreateForm(TAuthorizationForm, AuthorizationForm);
  Application.CreateForm(TRegistrationForm, RegistrationForm);
  Application.CreateForm(TBD, BD);
  Application.CreateForm(TAdd_Questions, Add_Questions);
  Application.CreateForm(TShyrnal, Shyrnal);
  Application.CreateForm(TResultForm, ResultForm);
  Application.CreateForm(TTemaCRUD, TemaCRUD);
  Application.CreateForm(TRazdelCRUD, RazdelCRUD);
  Application.CreateForm(TLectureCRUD, LectureCRUD);
  Application.CreateForm(TPracticCRUD, PracticCRUD);
  Application.CreateForm(TControlCRUD, ControlCRUD);
  Application.CreateForm(TYchenikiCRUD, YchenikiCRUD);
  Application.CreateForm(TDataManagementCenter, DataManagementCenter);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.CreateForm(TEdit_Lecture, Edit_Lecture);
  Application.CreateForm(TPassingKnowledgeControlForm, PassingKnowledgeControlForm);
  Application.CreateForm(TMultiMediaCRUD, MultiMediaCRUD);
  Application.CreateForm(TRegistrationTeacher, RegistrationTeacher);
  Application.CreateForm(TTeacherCRUD, TeacherCRUD);
  Application.CreateForm(TManagerUsers, ManagerUsers);
  Application.CreateForm(TAddMultimediaModalForm, AddMultimediaModalForm);
  Application.CreateForm(TUpdateMultimediaModalForm, UpdateMultimediaModalForm);
  Application.CreateForm(TChangePass, ChangePass);
  Application.CreateForm(TAllComponents, AllComponents);
  Application.CreateForm(TAddPracticModalForm, AddPracticModalForm);
  Application.CreateForm(TUpdatePracticModalForm, UpdatePracticModalForm);
  Application.Run;
end.
