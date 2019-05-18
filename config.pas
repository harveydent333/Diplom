unit config;

interface
uses basa_dan, Control_CRUD, Control,defoltTest, DocumentForm, Lecture_CRUD, Menu_CRUD,
Menu_Lectures, Menu_Practic, Menu_Teacher, PassingKnowledgeControl, Practic_CRUD, Result,
Stydent_CRUD,  Tema_CRUD, Title_Form, Unit2, UpdateLecture, UpdateTema, UpdateUnit, Ycheniki_CRUD, AddTema, DateUtils;

var  x:integer;

procedure selectRequestSQL(str:string);
procedure execRequestSQL(str:string);
procedure rebootRequestsCRUD;

implementation

uses Add_Question;

procedure selectRequestSQL(str:string);
begin
    with BD.RequestSQL do
      begin
         SQL.Clear;
         SQL.Add(str);
         Open;
      end;
end;

procedure execRequestSQL(str:string);
begin
    with BD.RequestSQL do
      begin
         SQL.Clear;
         SQL.Add(str);
         ExecSQL;
      end;
end;

procedure rebootRequestsCRUD;
begin
    with BD do
      begin
        RazdelADO.Active:=False;
        RazdelADO.Active:=True;

        TemaADO.Active:=False;
        TemaADO.Active:=True;

        LectureADO.Active:=False;
        LectureADO.Active:=True;

        PracticADO.Active:=False;
        PracticADO.Active:=True;

        ControlADO.Active:=False;
        ControlADO.Active:=True;

        YchenikADO.Active:=false;
        YchenikADO.Active:=true;

        MultimediaADO.Active:=false;
        MultimediaADO.Active:=true;
      end;
  end;

end.

