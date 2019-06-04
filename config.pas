unit config;

interface
uses basa_dan, Control_CRUD, Control,defoltTest, DocumentForm, Lecture_CRUD, Menu_CRUD,
Menu_Lectures, Menu_Practic, Menu_Teacher, PassingKnowledgeControl, Practic_CRUD, Result,
Stydent_CRUD,  Tema_CRUD, Title_Form, Unit2, UpdateLecture, UpdateTema, UpdateUnit, Ycheniki_CRUD, AddTema, DateUtils;

var  x:integer;
countBall,exitPoint:integer;
posetivAnswer, userAnswer, getShyrnalData:string;

procedure selectRequestSQL(request:string);
procedure evaluationCalculation(result:real);
procedure execRequestSQL(request:string);
procedure rebootRequestsCRUD;
procedure countingResults;
procedure checkOnThePresenceOfTheCompositionsOfRazdels;
procedure checkOnThePresenceOfTheCompositionsOfTems;
procedure checkOnThePresenceOfTheCompositionsOfLectures;
procedure checkOnThePresenceOfTheCompositionsOfPractics;
procedure checkOnThePresenceOfTheCompositionsOfControls;
procedure checkOnThePresenceOfTheCompositionsOfYcheniks;
procedure checkOnThePresenceOfTheCompositionsOfMultimedia;
procedure checkOnThePresenceOfTheCompositionsOfTeachers;

implementation

uses Add_Question, AddLecture, Razdel_CRUD, Teacher_CRUD, MultiMedia_CRUD,
  AddControl, PassControlMore, PassControlSingle, QuestionsMemo,
  QuestionsMoreMemo, SysUtils, Graphics;

procedure selectRequestSQL(request:string);   // ������ ������ �� ��
begin
    with BD.RequestSQL do
      begin
         SQL.Clear;
         SQL.Add(request);
         Open;
      end;
end;

procedure execRequestSQL(request:string);   // ������ �� �������������� ������ � ��
begin
    with BD.RequestSQL do
      begin
         SQL.Clear;
         SQL.Add(request);
         ExecSQL;
      end;
end;

procedure rebootRequestsCRUD;       // ������������ ������ �����������
var i:integer; bool:boolean;
begin
bool:=false;
    with BD do
      begin
        for i:=1 to 2 do
          begin
            RazdelADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfRazdels;
            TemaADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfTems;
            LectureADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfLectures;
            PracticADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfPractics;
            ControlADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfControls;
            YchenikADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfYcheniks;
            MultimediaADO.Active:=bool;
            checkOnThePresenceOfTheCompositionsOfMultimedia;
            TeacherADO.Active:=false;
            TeacherADO.Active:=true;
            checkOnThePresenceOfTheCompositionsOfTeachers;
            bool:=true;
          end;
      end;
end;

procedure countingResults;  // ������������ ������ � ����� ResultForm
begin
  with ResultForm do
    begin
      Show;
      Label1.Caption:=IntToStr(countBall);
      Label11.Caption:=IntToStr(countBall);
      Label5.Caption:=IntToStr(updateUnit.countQuestion-countBall);
    if updateUnit.countQuestion <> countBall then
      begin
          Label3.Caption:=FloatToStrF(countBall*100/updateUnit.countQuestion,ffFixed,0,2);
          Label9.Caption:=FloatToStrF(countBall*100/updateUnit.countQuestion,ffFixed,0,2);        // ��������� � %
      end
    else
      begin
          Label3.Caption:='100,00';
          Label9.Caption:='100,00';
      end;
    if countBall <> 0 then
      Label7.Caption:=FloatToStrF(100-(countBall*100/updateUnit.countQuestion),ffFixed,0,1)
    else
      Label7.Caption:='100,00';
      evaluationCalculation(countBall*100/updateUnit.countQuestion);
    end;
end;

procedure evaluationCalculation(result:real);
begin
    if result < 50 then
      begin
        ResultForm.Label23.Caption:='2';
        ResultForm.Label23.Font.Color:=clRed;
        config.execRequestSQL('UPDATE ������������ SET ������='+#39+'2'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;
    if ((result >= 50) and (result<75)) then
      begin
        ResultForm.Label23.Caption:='3';
        ResultForm.Label23.Font.Color:=clOlive;
        config.execRequestSQL('UPDATE ������������ SET ������='+#39+'3'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;
    if ((result >= 75) and (result<85)) then
      begin
        ResultForm.Label23.Caption:='4';
        ResultForm.Label23.Font.Color:=clYellow;
        config.execRequestSQL('UPDATE ������������ SET ������='+#39+'4'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;
    if result>=85 then
      begin
        ResultForm.Label23.Caption:='5';
        ResultForm.Label23.Font.Color:=clLime;
        config.execRequestSQL('UPDATE ������������ SET ������='+#39+'5'+#39+' WHERE ����������='+IntToStr(kodLastControl));
      end;

end;

procedure checkOnThePresenceOfTheCompositionsOfTeachers;
begin
   if TeacherCRUD.DBGrid1.DataSource.DataSet.RecordCount = 1 then
      begin
          TeacherCRUD.SpeedButton11.Enabled:=false;
      end
    else
      begin
          TeacherCRUD.SpeedButton11.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfRazdels;
begin
   if RazdelCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          RazdelCRUD.SpeedButton9.Enabled:=false;
          RazdelCRUD.SpeedButton10.Enabled:=false;
      end
    else
      begin
          RazdelCRUD.SpeedButton9.Enabled:=true;
          RazdelCRUD.SpeedButton10.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfTems;
begin
    if TemaCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          TemaCRUD.SpeedButton9.Enabled:=false;
          TemaCRUD.SpeedButton10.Enabled:=false;
      end
    else
      begin
          TemaCRUD.SpeedButton9.Enabled:=true;
          TemaCRUD.SpeedButton10.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfLectures;
begin
 if LectureCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          LectureCRUD.SpeedButton10.Enabled:=false;
          LectureCRUD.SpeedButton11.Enabled:=false;
          LectureCRUD.SpeedButton1.Enabled:=false;
      end
    else
      begin
          LectureCRUD.SpeedButton10.Enabled:=true;
          LectureCRUD.SpeedButton11.Enabled:=true;
          LectureCRUD.SpeedButton1.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfPractics;
begin
   if PracticCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          PracticCRUD.SpeedButton9.Enabled:=false;
          PracticCRUD.SpeedButton10.Enabled:=false;
      end
    else
      begin
          PracticCRUD.SpeedButton9.Enabled:=true;
          PracticCRUD.SpeedButton10.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfControls;
begin
  if ControlCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          ControlCRUD.SpeedButton10.Enabled:=false;
          ControlCRUD.SpeedButton11.Enabled:=false;
          ControlCRUD.SpeedButton1.Enabled:=false;
      end
    else
      begin
          ControlCRUD.SpeedButton10.Enabled:=true;
          ControlCRUD.SpeedButton11.Enabled:=true;
          ControlCRUD.SpeedButton1.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfYcheniks;
begin
    if YchenikiCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          YchenikiCRUD.SpeedButton10.Enabled:=false;
          YchenikiCRUD.SpeedButton11.Enabled:=false;
      end
    else
      begin
          YchenikiCRUD.SpeedButton10.Enabled:=true;
          YchenikiCRUD.SpeedButton11.Enabled:=true;
      end;
end;

procedure checkOnThePresenceOfTheCompositionsOfMultimedia;
begin
  if MultiMediaCRUD.DBGrid1.DataSource.DataSet.IsEmpty=true then
      begin
          MultiMediaCRUD.SpeedButton9.Enabled:=false;
          MultiMediaCRUD.SpeedButton1.Enabled:=false;
      end
    else
      begin
          MultiMediaCRUD.SpeedButton9.Enabled:=true;
          MultiMediaCRUD.SpeedButton1.Enabled:=true;
      end;
end;

end.

