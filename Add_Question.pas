unit Add_Question;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, jpeg, ExtCtrls, Menus, DBCtrls, Buttons , basa_dan,
  Mask, Grids, DBGrids , AuthorizationData;

type
  TAdd_Questions = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupListBox1: TDBLookupListBox;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label4: TLabel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    BitBtn3: TBitBtn;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    DBMemo9: TDBMemo;
    DBMemo10: TDBMemo;     
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    N2: TMenuItem;
    Label2: TLabel;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure N1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo3KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo4KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo5KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo7KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo8KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo9KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Questions: TAdd_Questions;

implementation

uses Unit3, Unit2, Title_Form, Control;

{$R *.dfm}

procedure TAdd_Questions.N1Click(Sender: TObject);
begin
DataModule1.AddQuestionADO.Append;
DataModule1.AddQuestionADO.FieldByName('СодержаниеВопроса').Value:='Вопрос №'+inttostr(strtoint(label2.Caption)+1)+' ';
DataModule1.AddQuestionADO.FieldByName('КодКонтроля').Value:=AuthorizationData.KodControla;
//DataModule1.AddQuestionADO.FieldByName('КодКонтроля').Value:=2;
label2.Caption:=inttostr(strtoint(label2.caption)+1);

end;

procedure TAdd_Questions.BitBtn3Click(Sender: TObject);
begin
if label5.Caption='0'then label5.Caption:=inttostr(strtoint(label5.Caption)+1);
case strtoint(label5.Caption) of
1:begin    //для 6 ответов
  with DBMemo1 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=299;
    end;
    with DBMemo3 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=358;
    end;
    with DBMemo4 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=417;
    end;
    with DBMemo5 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=476;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=58; Width:=795; Left:=376; Top:=535;
    end;
    RadioButton1.Top:=264;
    RadioButton2.Top:=322;
    RadioButton3.Top:=380;
    RadioButton4.Top:=438;
    RadioButton5.Top:=496;
    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=554;
    label5.Caption:='2';
  end;

2: begin   //для 7 ответов
  with DBMemo1 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=289;
    end;
    with DBMemo3 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=338;
    end;
    with DBMemo4 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=387;
    end;
    with DBMemo5 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=436;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=48; Width:=795; Left:=376; Top:=485;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=48; Width:=795; Left:=376; Top:=534;
    end;
    RadioButton1.Top:=256;
    RadioButton2.Top:=304;
    RadioButton3.Top:=352;
    RadioButton4.Top:=400;
    RadioButton5.Top:=448;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=496;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=544;

    label5.Caption:='3';
  end;
  3: begin //для 8 ответов
  with DBMemo1 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=283;
    end;
    with DBMemo3 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=326;
    end;
    with DBMemo4 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=369;
    end;
    with DBMemo5 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=412;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=455;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=498;
    end;
     with DBMemo9 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=541;
    end;

    RadioButton1.Top:=252;
    RadioButton2.Top:=295;
    RadioButton3.Top:=338;
    RadioButton4.Top:=381;
    RadioButton5.Top:=424;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=467;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=510;

    RadioButton8.Left:=328;
    RadioButton8.Visible:=true;
    RadioButton8.Top:=553;

    label5.Caption:='4';
  end;
 4: begin //для 8 ответов
  with DBMemo1 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=277;
    end;
    with DBMemo3 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=314;
    end;
    with DBMemo4 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=351;
    end;
    with DBMemo5 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=388;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=425;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=462;
    end;
     with DBMemo9 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=499;
    end;
    with DBMemo10 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=536
    end;

    RadioButton1.Top:=252;
    RadioButton2.Top:=289;
    RadioButton3.Top:=326;
    RadioButton4.Top:=363;
    RadioButton5.Top:=400;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=437;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=474;

    RadioButton8.Left:=328;
    RadioButton8.Visible:=true;
    RadioButton8.Top:=511;

    RadioButton9.Left:=328;
    RadioButton9.Visible:=true;
    RadioButton9.Top:=548;

    label5.Caption:='5';
  end;

end;//end case

end;//end процедуры

procedure TAdd_Questions.DBLookupListBox1Click(Sender: TObject);
var i:integer;      str,str2:string;
begin
//===============================DEFOLT================================
 with Add_Questions do
  begin
  label5.Caption:='0';
   DBMemo7.Visible:=false; RadioButton6.Visible:=false;
   DBMemo8.Visible:=false;  RadioButton7.Visible:=false;
   DBMemo9.Visible:=false;  RadioButton8.Visible:=false;
   DBMemo10.Visible:=false;  RadioButton9.Visible:=false;

   with DBMemo1 do
    begin
       Height:=67; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=308;
    end;
    with DBMemo3 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=376;
    end;
    with DBMemo4 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=444;
    end;
    with DBMemo5 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=512;
    end;
    RadioButton1.Top:=260;
    RadioButton2.Top:=329;
    RadioButton3.Top:=398;
    RadioButton4.Top:=467;
    RadioButton5.Top:=536;
  end;






//=======================================================================
for i:=6 to 9 do
  begin
  str2:=DBLookupListBox1.SelectedItem;
str:='SELECT СодержаниеОтвета'+inttostr(i)+' FROM Вопросы WHERE СодержаниеВопроса='+#39+str2+#39+';';
DataModule1.ADOModuleLecture.SQL.Clear;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
str:=inttostr(i);
if dbgrid1.DataSource.DataSet.FieldByName('СодержаниеОтвета'+str).AsString<>'' then
 label5.Caption:=inttostr(strtoint(label5.Caption)+i-5);
  end;

//======================================ADD====================
 case strtoint(label5.Caption) of
1:begin    //для 6 ответов
  with DBMemo1 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=299;
    end;
    with DBMemo3 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=358;
    end;
    with DBMemo4 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=417;
    end;
    with DBMemo5 do
    begin
       Height:=58; Width:=795; Left:=376; Top:=476;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=58; Width:=795; Left:=376; Top:=535;
    end;
    RadioButton1.Top:=264;
    RadioButton2.Top:=322;
    RadioButton3.Top:=380;
    RadioButton4.Top:=438;
    RadioButton5.Top:=496;
    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=554;
    label5.Caption:='2';
  end;

2: begin   //для 7 ответов
  with DBMemo1 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=289;
    end;
    with DBMemo3 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=338;
    end;
    with DBMemo4 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=387;
    end;
    with DBMemo5 do
    begin
       Height:=48; Width:=795; Left:=376; Top:=436;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=48; Width:=795; Left:=376; Top:=485;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=48; Width:=795; Left:=376; Top:=534;
    end;
    RadioButton1.Top:=256;
    RadioButton2.Top:=304;
    RadioButton3.Top:=352;
    RadioButton4.Top:=400;
    RadioButton5.Top:=448;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=496;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=544;

    label5.Caption:='3';
  end;
  3: begin //для 8 ответов
  with DBMemo1 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=283;
    end;
    with DBMemo3 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=326;
    end;
    with DBMemo4 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=369;
    end;
    with DBMemo5 do
    begin
       Height:=42; Width:=795; Left:=376; Top:=412;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=455;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=498;
    end;
     with DBMemo9 do
    begin
        Visible:=true;
       Height:=42; Width:=795; Left:=376; Top:=541;
    end;

    RadioButton1.Top:=252;
    RadioButton2.Top:=295;
    RadioButton3.Top:=338;
    RadioButton4.Top:=381;
    RadioButton5.Top:=424;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=467;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=510;

    RadioButton8.Left:=328;
    RadioButton8.Visible:=true;
    RadioButton8.Top:=553;

    label5.Caption:='4';
  end;
 4: begin //для 8 ответов
  with DBMemo1 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=277;
    end;
    with DBMemo3 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=314;
    end;
    with DBMemo4 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=351;
    end;
    with DBMemo5 do
    begin
       Height:=36; Width:=795; Left:=376; Top:=388;
    end;
      with DBMemo7 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=425;
    end;
    with DBMemo8 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=462;
    end;
     with DBMemo9 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=499;
    end;
    with DBMemo10 do
    begin
        Visible:=true;
       Height:=36; Width:=795; Left:=376; Top:=536
    end;

    RadioButton1.Top:=252;
    RadioButton2.Top:=289;
    RadioButton3.Top:=326;
    RadioButton4.Top:=363;
    RadioButton5.Top:=400;

    RadioButton6.Left:=328;
    RadioButton6.Visible:=true;
    RadioButton6.Top:=437;

    RadioButton7.Left:=328;
    RadioButton7.Visible:=true;
    RadioButton7.Top:=474;

    RadioButton8.Left:=328;
    RadioButton8.Visible:=true;
    RadioButton8.Top:=511;

    RadioButton9.Left:=328;
    RadioButton9.Visible:=true;
    RadioButton9.Top:=548;

    label5.Caption:='5';
  end;

end;//end case

//========================================CHECKBOX===========
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo1.Text then RadioButton1.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo2.Text then RadioButton2.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo3.Text then RadioButton3.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo4.Text then RadioButton4.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo5.Text then RadioButton5.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo6.Text then RadioButton6.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo7.Text then RadioButton7.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo8.Text then RadioButton8.Checked:=true;
if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString=DBMemo9.Text then RadioButton9.Checked:=true;
 if DBGrid2.DataSource.DataSet.FieldByName('ВерныйОтвет').AsString='' then
  begin
     RadioButton1.Checked:=true;
     RadioButton2.Checked:=true;
     RadioButton3.Checked:=true;
     RadioButton4.Checked:=true;
     RadioButton5.Checked:=true;
     RadioButton6.Checked:=true;
     RadioButton7.Checked:=true;
     RadioButton8.Checked:=true;
     RadioButton9.Checked:=true;
  end;

 bitbtn1.Enabled:=false;


end;

procedure TAdd_Questions.BitBtn2Click(Sender: TObject);
begin
  with Add_Questions do
  begin
  label5.Caption:='0';
   DBMemo7.Visible:=false; RadioButton6.Visible:=false;
   DBMemo8.Visible:=false;  RadioButton7.Visible:=false;
   DBMemo9.Visible:=false;  RadioButton8.Visible:=false;
   DBMemo10.Visible:=false;  RadioButton9.Visible:=false;

   with DBMemo1 do
    begin
       Height:=67; Width:=795; Left:=376; Top:=240;
    end;
   with DBMemo2 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=308;
    end;
    with DBMemo3 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=376;
    end;
    with DBMemo4 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=444;
    end;
    with DBMemo5 do
    begin
       Height:=66; Width:=795; Left:=376; Top:=512;
    end;
    RadioButton1.Top:=260; RadioButton1.Checked:=false;
    RadioButton2.Top:=329; RadioButton2.Checked:=false;
    RadioButton3.Top:=398; RadioButton3.Checked:=false;
    RadioButton4.Top:=467; RadioButton4.Checked:=false;
    RadioButton5.Top:=536; RadioButton5.Checked:=false;
  end;
  DBMemo1.Text:=''; DBMemo2.Text:='';DBMemo3.Text:='';
  DBMemo4.Text:=''; DBMemo5.Text:='';DBMemo7.Text:='';
  DBMemo8.Text:=''; DBMemo9.Text:=''; DBMemo10.Text:='';
DataModule1.AddQuestionADO.Edit;//ADOQuery1.Insert;
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета1').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета2').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета3').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета4').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета5').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета6').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета7').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета8').AsString:='';
DataModule1.AddQuestionADO.FieldByName('СодержаниеОтвета9').AsString:='';
DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:='';
DataModule1.AddQuestionADO.Post;




end;

procedure TAdd_Questions.BitBtn1Click(Sender: TObject);
begin
if RadioButton1.Checked=true then
  if DBMemo1.Text<>''then
    begin
        DataModule1.AddQuestionADO.Edit;
        DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo1.Text;
    end;

if RadioButton2.Checked=true then
  if DBMemo2.Text<>''then
    begin
       DataModule1.AddQuestionADO.Edit;
        DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo2.Text;
    end;

if RadioButton3.Checked=true then
  if DBMemo3.Text<>''then
    begin
        DataModule1.AddQuestionADO.Edit;
        DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo3.Text;
    end;

if RadioButton4.Checked=true then
  if DBMemo4.Text<>''then
    begin
        DataModule1.AddQuestionADO.Edit;
        DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo4.Text;
    end;

if RadioButton5.Checked=true then
  if DBMemo5.Text<>''then
    begin
      DataModule1.AddQuestionADO.Edit;
      DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo5.Text;
    end;

if RadioButton6.Checked=true then
  if DBMemo7.Text<>''then
    begin
      DataModule1.AddQuestionADO.Edit;
      DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo7.Text;
    end;

if RadioButton7.Checked=true then
  if DBMemo8.Text<>''then
    begin
      DataModule1.AddQuestionADO.Edit;
      DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo8.Text;
    end;

if RadioButton8.Checked=true then
  if DBMemo9.Text<>''then
    begin
      DataModule1.AddQuestionADO.Edit;
      DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo9.Text;
    end;

if RadioButton9.Checked=true then
  if DBMemo10.Text<>''then
    begin
      DataModule1.AddQuestionADO.Edit;
      DataModule1.AddQuestionADO.FieldByName('ВерныйОтвет').AsString:=DBMemo10.Text;
    end;

DataModule1.AddQuestionADO.UpdateRecord;
bitbtn1.Enabled:=false;



end;

procedure TAdd_Questions.N2Click(Sender: TObject);
begin
DataModule1.AddQuestionADO.Delete;
end;

procedure TAdd_Questions.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo3KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo4KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo5KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo7KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo8KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo9KeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.FormKeyPress(Sender: TObject; var Key: Char);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.DBMemo6Change(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.FormCreate(Sender: TObject);
begin
bitbtn1.Enabled:=false;
end;

procedure TAdd_Questions.SpeedButton1Click(Sender: TObject);
begin
Add_Questions.Close;
KnowledgeControl.show;
end;

procedure TAdd_Questions.SpeedButton3Click(Sender: TObject);
begin
AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;
AuthorizationForm.show;
AuthorizationForm.Position:=poDesktopCenter;
Add_Questions.Close;
MainMenu.Close;
end;

procedure TAdd_Questions.RadioButton1Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton2Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton3Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton4Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton5Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton6Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton7Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton8Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.RadioButton9Click(Sender: TObject);
begin
bitbtn1.Enabled:=true;
end;

procedure TAdd_Questions.SpeedButton4Click(Sender: TObject);
begin
Add_Questions.Close;
TitleForm.close;
end;

procedure TAdd_Questions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
KnowledgeControl.Show;
end;

end.
