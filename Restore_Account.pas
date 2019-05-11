unit Restore_Account;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, StdCtrls, idmessage;

type
  TRestoreAccount = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    IdSMTP1: TIdSMTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestoreAccount: TRestoreAccount;

implementation

{$R *.dfm}

end.
