unit StydentWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TForm111 = class(TForm)
    Image1: TImage;
    stydent_ON: TImage;
    teacher_ON: TImage;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    TreeView1: TTreeView;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form111: TForm111;

implementation

{$R *.dfm}

procedure TForm111.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin

end;

end.
