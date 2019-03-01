unit basa_dan;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    AddQuestionSource: TDataSource;
    AddQuestionADO: TADOQuery;
    SearchQuestADO: TADOQuery;
    SearchQuest: TDataSource;
    AddRazdelADO: TADOQuery;
    AddRazdel: TDataSource;
    ShowRazdel: TDataSource;
    ShowRazdelADO: TADOQuery;
    ShowTemaADO: TADOQuery;
    ShowTema: TDataSource;
    SearchKodRazdela: TDataSource;
    ADOQuery3: TADOQuery;
    GetDataUserSource: TDataSource;
    GetDataUserADO: TADOQuery;
    KodRazdelaForTree: TADOQuery;
    KodRazdelaTree: TDataSource;
    ShowControlADO: TADOQuery;
    ShowControl: TDataSource;
    EditRazdel: TDataSource;
    EditRazdelADO: TADOQuery;
    Test: TADOQuery;
    Tests: TDataSource;
    EditTemaADO: TADOQuery;
    EditTema: TDataSource;
    EditControl: TDataSource;
    EditControlADO: TADOQuery;
    SearchKodControl: TDataSource;
    SearchKodControlADO: TADOQuery;
    ShyrnalADO: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    Auth_YchenikADO: TADOQuery;
    Auth_Ychenik: TDataSource;
    ModuleLecture: TDataSource;
    ADOModuleLecture: TADOQuery;
    TemaCRUD: TDataSource;
    ADOTemaCRUD: TADOQuery;
    ModulePractic1: TDataSource;
    ADOModulePractic1: TADOQuery;
    RazdelCRUD: TDataSource;
    ADORazdelCRUD: TADOQuery;
    LectureCRUD: TDataSource;
    ADOLectureCRUD: TADOQuery;
    PracticCRUD: TDataSource;
    ADOPracticCRUD: TADOQuery;
    ControlCRUD: TDataSource;
    ADOControlCRUD: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
