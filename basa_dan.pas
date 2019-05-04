unit basa_dan;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    AddQuestionSource: TDataSource;
    AddQuestionADO: TADOQuery;
    ShowRazdel: TDataSource;
    ShowRazdelADO: TADOQuery;
    ShowTemaADO: TADOQuery;
    ShowTema: TDataSource;
    ShowControlADO: TADOQuery;
    ShowControl: TDataSource;
    EditRazdel: TDataSource;
    EditRazdelADO: TADOQuery;
    EditTemaADO: TADOQuery;
    EditTema: TDataSource;
    EditControl: TDataSource;
    EditControlADO: TADOQuery;
    ShyrnalADO: TADOQuery;
    Shyrnal: TDataSource;
    YchenikADO: TADOQuery;
    Ychenik: TDataSource;
    ModuleLecture: TDataSource;
    ADOModuleLecture: TADOQuery;
    TemaCRUD: TDataSource;
    ADOTemaCRUD: TADOQuery;
    RazdelCRUD: TDataSource;
    ADORazdelCRUD: TADOQuery;
    LectureCRUD: TDataSource;
    ADOLectureCRUD: TADOQuery;
    PracticCRUD: TDataSource;
    ADOPracticCRUD: TADOQuery;
    ControlCRUD: TDataSource;
    ADOControlCRUD: TADOQuery;
    Update: TDataSource;
    ADOUpdate: TADOQuery;
    ShowLectureADO: TADOQuery;
    ShowLecture: TDataSource;
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
