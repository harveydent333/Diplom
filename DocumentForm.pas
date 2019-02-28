unit DocumentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls, RpCon,
  RpConDS, RpDefine, RpRave, QuickRpt, QRCtrls;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Label3: TLabel;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
     uses basa_dan, Unit3, Unit2, AuthorizationData, Title_Form;
{$R *.dfm}

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
MainMenu.show;
Form4.Close;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
AuthorizationForm.Edit1.Text:='';
AuthorizationData.freeDataUser;
AuthorizationForm.show;
Form4.Close;
MainMenu.Close;
   end;
procedure TForm4.SpeedButton6Click(Sender: TObject);
begin
form4.Close;
TitleForm.close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainMenu.Show;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
if roleUser='teacher' then
QuickRep2.Preview else
QuickRep1.Preview;
end;

end.
