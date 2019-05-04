unit Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, jpeg, StdCtrls , basa_dan, Grids,
  DBGrids, Menus , AddRazdel, Mask, DBCtrls ;

type
  TDELETE_FORM = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DELETE_FORM: TDELETE_FORM;

implementation

uses AddTema, AddControl, Title_Form, Add_Question, Unit3, AuthorizationData,
  Unit2, PassingKnowledgeControl , defoltTest, Result, Main_Menu;


{$R *.dfm}

end.
