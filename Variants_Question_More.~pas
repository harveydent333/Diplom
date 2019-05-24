unit Variants_Question_More;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGrids,
  jpeg;

type
  TVariantsQuestionMore = class(TFrame)
    hint: TLabel;
    Label1: TLabel;
    Memo11: TMemo;
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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Add_Question, Variants_Question, Variants_Question_Write, basa_dan,
  Manager_Users, Menu_Control, Menu_Lectures, Menu_Multimedai,
  Menu_Practic, Menu_Teacher,  PassingKnowledgeControl,
   QuestionsMemo,Unit2, AuthorizationData, config, ControlCenter, defoltTest,
  DocumentForm;

{$R *.dfm}

procedure TVariantsQuestionMore.BitBtn3Click(Sender: TObject);
begin
    if countQuestion>2 then
    dec(countQuestion);
  case countQuestion of
    2: begin
          label3.Visible:=false;
          Memo3.Visible:=false;
          CheckBox3.Visible:=false;
        end;
    3: begin
          label4.Visible:=false;
          Memo4.Visible:=false;
          CheckBox4.Visible:=false;
        end;
    4:  begin
          label5.Visible:=false;
          Memo5.Visible:=false;
          CheckBox5.Visible:=false;
        end;
    5: begin
          label6.Visible:=false;
          Memo6.Visible:=false;
          CheckBox6.Visible:=false;
        end;
    6: begin
          label7.Visible:=false;
          Memo7.Visible:=false;
          CheckBox7.Visible:=false;
        end;
    7: begin
          label8.Visible:=false;
          Memo8.Visible:=false;
          CheckBox8.Visible:=false;
        end;
    8: begin
          label9.Visible:=false;
          Memo9.Visible:=false;
          CheckBox9.Visible:=false;
          BitBtn3.Enabled:=true;
        end;
    9:  begin
          label10.Visible:=false;
          Memo10.Visible:=false;
          CheckBox10.Visible:=false;

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
          Memo3.Clear;
          CheckBox3.Visible:=true;
          CheckBox3.Checked:=false;
        end;
    4: begin
          label4.Visible:=true;
          Memo4.Visible:=true;
          Memo4.Clear;
          CheckBox4.Visible:=true;
          CheckBox4.Checked:=false;
        end;
    5:  begin
          label5.Visible:=true;
          Memo5.Visible:=true;
          Memo5.Clear;
          CheckBox5.Visible:=true;
          CheckBox5.Checked:=false;
          CheckBox5.Visible:=true;
        end;
    6: begin
          label6.Visible:=true;
          Memo6.Visible:=true;
          Memo6.Clear;
          CheckBox6.Visible:=true;
          CheckBox6.Checked:=false;
          CheckBox6.Visible:=true;
        end;
    7: begin
          label7.Visible:=true;
          Memo7.Visible:=true;
          Memo7.Clear;
          CheckBox7.Visible:=true;
          CheckBox7.Checked:=false;
          CheckBox7.Visible:=true;
        end;
    8: begin
          label8.Visible:=true;
          Memo8.Visible:=true;
          Memo8.Clear;
          CheckBox8.Visible:=true;
          CheckBox8.Checked:=false;
          CheckBox8.Visible:=true;
        end;
    9: begin
          label9.Visible:=true;
          Memo9.Visible:=true;
          Memo9.Clear;
          CheckBox9.Visible:=true;
          CheckBox9.Checked:=false;
          CheckBox9.Visible:=true;
        end;
    10:  begin
          label10.Visible:=true;
          Memo10.Visible:=true;
          Memo10.Clear;
          CheckBox10.Visible:=true;
          CheckBox10.Checked:=false;
          CheckBox10.Visible:=true;
        end;
  end;
end;

procedure TVariantsQuestionMore.Button1Click(Sender: TObject);
begin
    defoltTest.clearStrokiMemo;
end;

end.
