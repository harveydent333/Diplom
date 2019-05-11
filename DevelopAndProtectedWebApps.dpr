program DevelopAndProtectedWebApps;

uses
  Forms,
  Title_Form in '..\Программирование и защита WEB приложений\Title_Form.pas' {TitleForm},
  Unit2 in '..\Программирование и защита WEB приложений\Unit2.pas' {AuthorizationForm},
  Menu_Teacher in '..\Программирование и защита WEB приложений\Menu_Teacher.pas' {RegistrationForm},
  basa_dan in '..\Программирование и защита WEB приложений\basa_dan.pas' {DataModule1: TDataModule},
  Add_Question in '..\Программирование и защита WEB приложений\Add_Question.pas' {Add_Questions},
  AddRazdel in '..\Программирование и защита WEB приложений\AddRazdel.pas' {AddRazdelModalForm},
  AddTema in '..\Программирование и защита WEB приложений\AddTema.pas' {AddTemaModalForm},
  AuthorizationData in '..\Программирование и защита WEB приложений\AuthorizationData.pas',
  PassingKnowledgeControl in '..\Программирование и защита WEB приложений\PassingKnowledgeControl.pas' {PassingKnowledgeControlForm},
  AddControl in '..\Программирование и защита WEB приложений\AddControl.pas' {AddControlModalForm},
  DocumentForm in '..\Программирование и защита WEB приложений\DocumentForm.pas' {Shyrnal},
  defoltTest in '..\Программирование и защита WEB приложений\defoltTest.pas',
  Result in '..\Программирование и защита WEB приложений\Result.pas' {ResultForm},
  Menu_Lectures in '..\Программирование и защита WEB приложений\Menu_Lectures.pas' {MenuLectures},
  Menu_Practic in '..\Программирование и защита WEB приложений\Menu_Practic.pas' {MenuPractic},
  Tema_CRUD in '..\Программирование и защита WEB приложений\Tema_CRUD.pas' {TemaCRUD},
  Razdel_CRUD in '..\Программирование и защита WEB приложений\Razdel_CRUD.pas' {RazdelCRUD},
  Lecture_CRUD in '..\Программирование и защита WEB приложений\Lecture_CRUD.pas' {LectureCRUD},
  Practic_CRUD in '..\Программирование и защита WEB приложений\Practic_CRUD.pas' {PracticCRUD},
  Control_CRUD in '..\Программирование и защита WEB приложений\Control_CRUD.pas' {ControlCRUD},
  AddLecture in '..\Программирование и защита WEB приложений\AddLecture.pas' {AddLectureModalForm},
  AddPractic in '..\Программирование и защита WEB приложений\AddPractic.pas' {AddPracticModalForm},
  Ycheniki_CRUD in '..\Программирование и защита WEB приложений\Ycheniki_CRUD.pas' {YchenikiCRUD},
  UpdateTema in '..\Программирование и защита WEB приложений\UpdateTema.pas' {UpdateTemaModalForm},
  UpdateLecture in '..\Программирование и защита WEB приложений\UpdateLecture.pas' {UpdateLectureModalForm},
  UpdateUnit in '..\Программирование и защита WEB приложений\UpdateUnit.pas',
  config in '..\Программирование и защита WEB приложений\config.pas',
  UpdateRazdel in '..\Программирование и защита WEB приложений\UpdateRazdel.pas' {UpdateRazdelModalForm},
  UpdatePractic in '..\Программирование и защита WEB приложений\UpdatePractic.pas' {UpdatePracticModalForm},
  UpdateControl in '..\Программирование и защита WEB приложений\UpdateControl.pas' {UpdateControlModalForm},
  ControlCenter in '..\Программирование и защита WEB приложений\ControlCenter.pas' {DataManagementCenter},
  Menu_Control in '..\Программирование и защита WEB приложений\Menu_Control.pas' {MenuControl},
  Main_Menu in '..\Программирование и защита WEB приложений\Main_Menu.pas' {MainMenu},
  Variants_Question in '..\Программирование и защита WEB приложений\Variants_Question.pas' {VariantsQuestionSingle: TFrame},
  Variants_Question_More in '..\Программирование и защита WEB приложений\Variants_Question_More.pas' {VariantsQuestionMore: TFrame},
  Variants_Question_Write in '..\Программирование и защита WEB приложений\Variants_Question_Write.pas' {VariantsQuestionWrite: TFrame},
  QuestionsMemo in '..\Программирование и защита WEB приложений\QuestionsMemo.pas',
  AddQuestionModal in '..\Программирование и защита WEB приложений\AddQuestionModal.pas' {AddQuestionModalForm},
  EditLecture in '..\Программирование и защита WEB приложений\EditLecture.pas' {Edit_Lecture},
  MultiMedia_CRUD in '..\Программирование и защита WEB приложений\MultiMedia_CRUD.pas' {MultiMediaCRUD},
  AddMultimedia in '..\Программирование и защита WEB приложений\AddMultimedia.pas' {AddMultimediaModalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Программирование и защита WEB - приложений';
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
  Application.CreateForm(TMultiMediaCRUD, MultiMediaCRUD);
  Application.CreateForm(TAddMultimediaModalForm, AddMultimediaModalForm);
  Application.Run;
end.
