unit UpdateUnit;

interface

var
updateKodRazdela,
updateKodTema,
updateKodLecture,
updateKodControl,
updateKodPractic,
updateKodMultimedia,
countQuestion,
kodLastControl,
kodVoprosa,
pathMutimedia,
updateKodYchenika,
updateKodTeacher:integer;
currentDir:string;

implementation

uses UpdateTema, UpdateLecture, Lecture_CRUD, Tema_CRUD;

end.
