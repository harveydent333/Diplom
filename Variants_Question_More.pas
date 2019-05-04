unit Variants_Question_More;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TVariantsQuestionMore = class(TFrame)
    hint: TLabel;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    Memo3: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    Memo10: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Add_Question;

{$R *.dfm}

procedure TVariantsQuestionMore.BitBtn3Click(Sender: TObject);
begin
    if countQuestion>2 then
    dec(countQuestion);
  case countQuestion of
    2: begin
          label3.Visible:=false;
          Memo3.Visible:=false;
        end;
    3: begin
          label4.Visible:=false;
          Memo4.Visible:=false;
        end;
    4:  begin
          label5.Visible:=false;
          Memo5.Visible:=false;

        end;
    5: begin
          label6.Visible:=false;
          Memo6.Visible:=false;

        end;
    6: begin
          label7.Visible:=false;
          Memo7.Visible:=false;

        end;
    7: begin
          label8.Visible:=false;
          Memo8.Visible:=false;

        end;
    8: begin
          label9.Visible:=false;
          Memo9.Visible:=false;

        end;
    9:  begin
          label10.Visible:=false;
          Memo10.Visible:=false;


        end;
  end;
end;

procedure TVariantsQuestionMore.BitBtn4Click(Sender: TObject);
begin
  inc(countQuestion);
  case countQuestion of
    3: begin
          label3.Visible:=true;
          Memo3.Visible:=true;


        end;
    4: begin
          label4.Visible:=true;
          Memo4.Visible:=true;

        end;
    5:  begin
          label5.Visible:=true;
          Memo5.Visible:=true;

        end;
    6: begin
          label6.Visible:=true;
          Memo6.Visible:=true;

        end;
    7: begin
          label7.Visible:=true;
          Memo7.Visible:=true;

        end;
    8: begin
          label8.Visible:=true;
          Memo8.Visible:=true;

        end;
    9: begin
          label9.Visible:=true;
          Memo9.Visible:=true;

        end;
    10:  begin
          label10.Visible:=true;
          Memo10.Visible:=true;
          
        end;
  end;
end;

end.
