program Project1;

uses
  Forms,
  Title_Form in 'Title_Form.pas' {TitleForm},
  Unit2 in 'Unit2.pas' {AuthorizationForm},
  Unit3 in 'Unit3.pas' {MainMenu},
  Menu_Teacher in 'Menu_Teacher.pas' {RegistrationForm},
  basa_dan in 'basa_dan.pas' {DataModule1: TDataModule},
  Add_Question in 'Add_Question.pas' {Add_Questions},
  Control in 'Control.pas' {KnowledgeControl},
  AddRazdel in 'AddRazdel.pas' {AddRazdelModalForm},
  AddTema in 'AddTema.pas' {AddTemaModalForm},
  AuthorizationData in 'AuthorizationData.pas',
  PassingKnowledgeControl in 'PassingKnowledgeControl.pas' {PassingKnowledgeControlForm},
  AddControl in 'AddControl.pas' {AddTestModalForm},
  DocumentForm in 'DocumentForm.pas' {Shyrnal},
  defoltTest in 'defoltTest.pas',
  Result in 'Result.pas' {ResultForm},
  Menu_Lectures in 'Menu_Lectures.pas' {MenuLectures},
  Menu_Practic in 'Menu_Practic.pas' {MenuPractic},
  Menu_CRUD in 'Menu_CRUD.pas' {MenuCRUD},
  Tema_CRUD in 'Tema_CRUD.pas' {TemaCRUD},
  Razdel_CRUD in 'Razdel_CRUD.pas' {RazdelCRUD},
  Lecture_CRUD in 'Lecture_CRUD.pas' {LectureCRUD},
  Practic_CRUD in 'Practic_CRUD.pas' {PracticCRUD},
  Control_CRUD in 'Control_CRUD.pas' {ControlCRUD},
  Stydent_CRUD in 'Stydent_CRUD.pas' {StydentCRUD},
  AddLecture in 'AddLecture.pas' {AddLectureModalForm},
  AddPractic in 'AddPractic.pas' {AddPracticModalForm},
  Ycheniki_CRUD in 'Ycheniki_CRUD.pas' {YchenikiCRUD},
  UpdateTema in 'UpdateTema.pas' {UpdateTemaModalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTitleForm, TitleForm);
  Application.CreateForm(TAuthorizationForm, AuthorizationForm);
  Application.CreateForm(TMainMenu, MainMenu);
  Application.CreateForm(TRegistrationForm, RegistrationForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TAdd_Questions, Add_Questions);
  Application.CreateForm(TKnowledgeControl, KnowledgeControl);
  Application.CreateForm(TPassingKnowledgeControlForm, PassingKnowledgeControlForm);
  Application.CreateForm(TShyrnal, Shyrnal);
  Application.CreateForm(TResultForm, ResultForm);
  Application.CreateForm(TMenuLectures, MenuLectures);
  Application.CreateForm(TMenuPractic, MenuPractic);
  Application.CreateForm(TMenuCRUD, MenuCRUD);
  Application.CreateForm(TTemaCRUD, TemaCRUD);
  Application.CreateForm(TRazdelCRUD, RazdelCRUD);
  Application.CreateForm(TLectureCRUD, LectureCRUD);
  Application.CreateForm(TPracticCRUD, PracticCRUD);
  Application.CreateForm(TControlCRUD, ControlCRUD);
  Application.CreateForm(TStydentCRUD, StydentCRUD);
  Application.CreateForm(TYchenikiCRUD, YchenikiCRUD);
  Application.Run;
end.
