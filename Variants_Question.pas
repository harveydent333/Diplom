unit Variants_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TVariantsQuestion = class(TFrame)
    Label4: TLabel;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    Memo1: TMemo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
