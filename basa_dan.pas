unit basa_dan;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TBD = class(TDataModule)
    ADOConnection1: TADOConnection;
    YchenikADO: TADOQuery;
    Ychenik: TDataSource;
    Request: TDataSource;
    RequestSQL: TADOQuery;
    Tema: TDataSource;
    TemaADO: TADOQuery;
    Razdel: TDataSource;
    RazdelADO: TADOQuery;
    Lecture: TDataSource;
    LectureADO: TADOQuery;
    Practic: TDataSource;
    PracticADO: TADOQuery;
    Control: TDataSource;
    ControlADO: TADOQuery;
    MultimediaADO: TADOQuery;
    Multimedia: TDataSource;
    TeacherADO: TADOQuery;
    Teacher: TDataSource;
    PassControlADO: TADOQuery;
    PassControl: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BD: TBD;

implementation

{$R *.dfm}

end.
