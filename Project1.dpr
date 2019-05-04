program Project1;

uses
  Forms,
  Title_Form in 'Title_Form.pas' {TitleForm},
  Unit2 in 'Unit2.pas' {AuthorizationForm},
  Menu_Teacher in 'Menu_Teacher.pas' {RegistrationForm},
  basa_dan in 'basa_dan.pas' {DataModule1: TDataModule},
  Add_Question in 'Add_Question.pas' {Add_Questions},
  AddRazdel in 'AddRazdel.pas' {AddRazdelModalForm},
  AddTema in 'AddTema.pas' {AddTemaModalForm},
  AuthorizationData in 'AuthorizationData.pas',
  PassingKnowledgeControl in 'PassingKnowledgeControl.pas' {PassingKnowledgeControlForm},
  AddControl in 'AddControl.pas' {AddControlModalForm},
  DocumentForm in 'DocumentForm.pas' {Shyrnal},
  defoltTest in 'defoltTest.pas',
  Result in 'Result.pas' {ResultForm},
  Menu_Lectures in 'Menu_Lectures.pas' {MenuLectures},
  Menu_Practic in 'Menu_Practic.pas' {MenuPractic},
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
  Menu_Control in 'Menu_Control.pas' {MenuControl},
  Main_Menu in 'Main_Menu.pas' {MainMenu},
  Variants_Question in 'Variants_Question.pas' {VariantsQuestionSingle: TFrame},
  Variants_Question_More in 'Variants_Question_More.pas' {VariantsQuestionMore: TFrame},
  Variants_Question_Write in 'Variants_Question_Write.pas' {VariantsQuestionWrite: TFrame},
  QuestionsMemo in 'QuestionsMemo.pas',
  AddQuestionModal in 'AddQuestionModal.pas' {AddQuestionModalForm},
  EditLecture in 'EditLecture.pas' {Edit_Lecture};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTitleForm, TitleForm);
  Application.CreateForm(TAuthorizationForm, AuthorizationForm);
  Application.CreateForm(TRegistrationForm, RegistrationForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TAdd_Questions, Add_Questions);
  Application.CreateForm(TShyrnal, Shyrnal);
  Application.CreateForm(TResultForm, ResultForm);
  Application.CreateForm(TMenuLectures, MenuLectures);
  Application.CreateForm(TMenuPractic, MenuPractic);
  Application.CreateForm(TTemaCRUD, TemaCRUD);
  Application.CreateForm(TRazdelCRUD, RazdelCRUD);
  Application.CreateForm(TLectureCRUD, LectureCRUD);
  Application.CreateForm(TPracticCRUD, PracticCRUD);
  Application.CreateForm(TControlCRUD, ControlCRUD);
  Application.CreateForm(TYchenikiCRUD, YchenikiCRUD);
  Application.CreateForm(TDataManagementCenter, DataManagementCenter);
  Application.CreateForm(TMenuControl, MenuControl);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.CreateForm(TEdit_Lecture, Edit_Lecture);
  Application.CreateForm(TPassingKnowledgeControlForm, PassingKnowledgeControlForm);
  Application.Run;
end.
