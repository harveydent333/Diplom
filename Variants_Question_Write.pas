unit Variants_Question_Write;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TVariantsQuestionWrite = class(TFrame)
    Edit1: TEdit;
    Label3: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    hint: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TVariantsQuestionWrite.Button1Click(Sender: TObject);
begin
  if Edit1.Text<>'' then
    begin
      ListBox1.Items.Add(Edit1.Text);
      Edit1.Text:='';
    end;
end;

procedure TVariantsQuestionWrite.Button2Click(Sender: TObject);
begin
    ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

end.
