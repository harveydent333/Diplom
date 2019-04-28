unit Menu_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls;

type
  Tdelete = class(TForm)
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  delete: Tdelete;

implementation

uses Title_Form;

{$R *.dfm}

procedure Tdelete.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

end.
