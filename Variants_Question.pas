unit Variants_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TVariantsQuestionSingle = class(TFrame)
    hint: TLabel;
    Memo1: TMemo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Add_Question, Variants_Question_Write, basa_dan,
  Manager_Users, Menu_Control, Menu_Lectures, Menu_Multimedai,
  Menu_Practic, Menu_Teacher,  PassingKnowledgeControl,
   QuestionsMemo,Unit2, AuthorizationData, config, ControlCenter, defoltTest,
  DocumentForm;


{$R *.dfm}

procedure TVariantsQuestionSingle.BitBtn4Click(Sender: TObject);
begin
  if countQuestion>2 then
    dec(countQuestion);
  case countQuestion of
    2: begin
          label3.Visible:=false;
          Memo3.Visible:=false;
          Memo3.Clear;
          BitBtn4.Enabled:=false;
          RadioButton3.Visible:=false;
          RadioButton3.Checked:=false;
        end;
    3: begin
          label4.Visible:=false;
          Memo4.Visible:=false;
          Memo4.Clear;
          RadioButton4.Visible:=false;
          RadioButton4.Checked:=false;
        end;
    4:  begin
          label5.Visible:=false;
          Memo5.Visible:=false;
          Memo5.Clear;
          RadioButton5.Visible:=false;
          RadioButton5.Checked:=false;
        end;
    5: begin
          label6.Visible:=false;
          Memo6.Visible:=false;
          Memo6.Clear;
          RadioButton6.Visible:=false;
          RadioButton6.Checked:=false;
        end;
    6: begin
          label7.Visible:=false;
          Memo7.Visible:=false;
          Memo7.Clear;
          RadioButton7.Visible:=false;
          RadioButton7.Checked:=false;
        end;
    7: begin
          label8.Visible:=false;
          Memo8.Visible:=false;
          Memo8.Clear;
          RadioButton8.Visible:=false;
          RadioButton8.Checked:=false;
        end;
    8: begin
          label9.Visible:=false;
          Memo9.Visible:=false;
          Memo9.Clear;
          RadioButton9.Visible:=false;
          RadioButton9.Checked:=false;
        end;
    9:  begin
          label10.Visible:=false;
          Memo10.Visible:=false;
          Memo10.Clear;
          RadioButton10.Visible:=false;
          RadioButton10.Checked:=false;
        end;
  end;
end;

procedure TVariantsQuestionSingle.BitBtn3Click(Sender: TObject);
begin
  inc(countQuestion);
  case countQuestion of
    3: begin
          label3.Visible:=true;
          Memo3.Visible:=true;
          RadioButton3.Visible:=true;
        end;
    4: begin
          label4.Visible:=true;
          Memo4.Visible:=true;
          RadioButton4.Visible:=true;
        end;
    5:  begin
          label5.Visible:=true;
          Memo5.Visible:=true;
          RadioButton5.Visible:=true;
        end;
    6: begin
          label6.Visible:=true;
          Memo6.Visible:=true;
          RadioButton6.Visible:=true;
        end;
    7: begin
          label7.Visible:=true;
          Memo7.Visible:=true;
          RadioButton7.Visible:=true;
        end;
    8: begin
          label8.Visible:=true;
          Memo8.Visible:=true;
          RadioButton8.Visible:=true;
        end;
    9: begin
          label9.Visible:=true;
          Memo9.Visible:=true;
          RadioButton9.Visible:=true;
        end;
    10:  begin
          label10.Visible:=true;
          Memo10.Visible:=true;
          RadioButton10.Visible:=true;
        end;
  end;
end;

end.
