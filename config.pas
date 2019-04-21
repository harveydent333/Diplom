unit config;

interface
uses basa_dan, Control, Control_CRUD, defoltTest, DocumentForm, Lecture_CRUD, Menu_CRUD,
Menu_Lectures, Menu_Practic, Menu_Teacher, PassingKnowledgeControl, Practic_CRUD, Result,
Stydent_CRUD,  Tema_CRUD, Title_Form, Unit2, Unit3, UpdateLecture, UpdateTema, UpdateUnit, Ycheniki_CRUD, AddTema;

var  x:integer;

procedure selectRequestSQL(str:string);
procedure execRequestSQL(str:string);
procedure rebootRequestsCRUD;

implementation

procedure selectRequestSQL(str:string);
begin
    DataModule1.ADOModuleLecture.SQL.Clear;
    DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.Open;
end;

procedure execRequestSQL(str:string);
begin
    DataModule1.ADOModuleLecture.SQL.Clear;
    DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.ExecSQL;
end;

procedure rebootRequestsCRUD;
begin
    DataModule1.ADORazdelCRUD.Active:=False;
    DataModule1.ADORazdelCRUD.Active:=True;

    DataModule1.ADOTemaCRUD.Active:=False;
    DataModule1.ADOTemaCRUD.Active:=True;

    DataModule1.ADOLectureCRUD.Active:=False;
    DataModule1.ADOLectureCRUD.Active:=True;

    DataModule1.ADOPracticCRUD.Active:=False;
    DataModule1.ADOPracticCRUD.Active:=True;

    DataModule1.YchenikADO.Active:=false;
    DataModule1.YchenikADO.Active:=true;
end;
end.

