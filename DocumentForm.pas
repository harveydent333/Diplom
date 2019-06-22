unit DocumentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, jpeg, ExtCtrls, RpCon,
  RpConDS, RpDefine, RpRave, QuickRpt, QRCtrls,ShellAPI,
  ComCtrls;

type
  TShyrnal = class(TForm)
    DBGrid1: TDBGrid;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    last_name: TQRDBText;
    first_name: TQRDBText;
    second_name: TQRDBText;
    control: TQRDBText;
    date: TQRDBText;
    mark: TQRDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageFooterBand1: TQRBand;
    Label9: TLabel;
    TitleBand1: TQRBand;
    Image2: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Image3: TImage;
    DateTimePicker1: TDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox3: TCheckBox;
    Image4: TImage;
    Label14: TLabel;
    teacher_ON: TImage;
    stydent_ON: TImage;
    ColumnHeaderBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    CheckBox8: TCheckBox;
    Label15: TLabel;
    ComboBox4: TComboBox;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Shyrnal: TShyrnal;

implementation
     uses basa_dan, Unit3, Unit2, AuthorizationData, Title_Form, Main_Menu,
  ControlCenter,
  config;
{$R *.dfm}

procedure TShyrnal.SpeedButton1Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.SpeedButton3Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.SpeedButton6Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

procedure TShyrnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.Position:=poDesktopCenter;
    Shyrnal.Visible:=false;
end;

procedure TShyrnal.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked=true then ComboBox1.Enabled:=true else ComboBox1.Enabled:=false;
end;

procedure TShyrnal.CheckBox2Click(Sender: TObject);
begin
    if CheckBox2.Checked=true then ComboBox2.Enabled:=true else ComboBox2.Enabled:=false;
end;

procedure TShyrnal.CheckBox3Click(Sender: TObject);
begin
    if CheckBox3.Checked=true then
       DateTimePicker1.Enabled:=true
    else
       DateTimePicker1.Enabled:=false;
end;

procedure TShyrnal.CheckBox4Click(Sender: TObject);
begin
    if CheckBox4.Checked=true then ComboBox3.Enabled:=true else ComboBox3.Enabled:=false;
end;

procedure TShyrnal.CheckBox5Click(Sender: TObject);
begin
    if CheckBox5.Checked=true then Edit2.Enabled:=true else Edit2.Enabled:=false;
end;

procedure TShyrnal.CheckBox6Click(Sender: TObject);
begin
    if CheckBox6.Checked=true then Edit3.Enabled:=true else Edit3.Enabled:=false;
end;

procedure TShyrnal.CheckBox7Click(Sender: TObject);
begin
     if CheckBox7.Checked=true then Edit4.Enabled:=true else Edit4.Enabled:=false;
end;

procedure TShyrnal.CheckBox8Click(Sender: TObject);
begin
    if CheckBox8.Checked=true then ComboBox4.Enabled:=true else ComboBox4.Enabled:=false;
end;

procedure TShyrnal.Button3Click(Sender: TObject);
var default:string;
begin
    if roleUser='teacher' then
      begin
        default:=getShyrnalData+' WHERE 1=1';
        if CheckBox5.Checked = true then
          default:=default+' AND Фамилия='+#39+edit2.Text+#39;

        if CheckBox6.Checked = true then
          default:=default+' AND Имя='+#39+edit3.Text+#39;

        if CheckBox7.Checked = true then
          default:=default+' AND Отчество='+#39+edit4.Text+#39;

        if CheckBox1.Checked = true then
          default:=default+' AND НазваниеТемы='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND НазваниеКонтроля='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND Оценка='+#39+ComboBox3.Text+#39;

        config.selectRequestSQL(default);
        if((CheckBox5.Checked = true) and (CheckBox6.Checked = true) and (CheckBox7.Checked = true) and (CheckBox1.Checked = true) and
          (CheckBox2.Checked = true) and (CheckBox4.Checked = true)) then
            config.selectRequestSQL(getShyrnalData);
      end;

    if roleUser='stydent' then
      begin
        default:=getShyrnalData +' WHERE Фамилия='+#39+familyUser+#39+' AND Имя='+#39+nameUser+#39+' AND Отчество='+#39+secondNameUser+#39;
        if CheckBox1.Checked = true then
          default:=default+' AND НазваниеТемы='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND НазваниеКонтроля='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND Оценка='+#39+ComboBox3.Text+#39;

        config.selectRequestSQL(default);
        if((CheckBox5.Checked = true) and (CheckBox6.Checked = true) and (CheckBox7.Checked = true) and (CheckBox1.Checked = true) and
          (CheckBox2.Checked = true) and (CheckBox4.Checked = true)) then
            config.selectRequestSQL(default);
      end;
end;

procedure TShyrnal.SpeedButton2Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TShyrnal.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TShyrnal.ComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

{
  Процедура обработки нажатия на иконку "Поиск", формирует SQL запрос на основе выбранных свойств
}
procedure TShyrnal.SpeedButton7Click(Sender: TObject);
var default:string;
begin
    if roleUser='teacher' then
      begin
        default:=getShyrnalData+' WHERE ЖурналОценок.КодУчителя='+IntToStr(kodUser);
        if CheckBox5.Checked = true then
          default:=default+' AND Фамилия='+#39+edit2.Text+#39;

        if CheckBox6.Checked = true then
          default:=default+' AND Имя='+#39+edit3.Text+#39;

        if CheckBox7.Checked = true then
          default:=default+' AND Отчество='+#39+edit4.Text+#39;

        if CheckBox1.Checked = true then
          default:=default+' AND НазваниеТемы='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND НазваниеКонтроля='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND Оценка='+#39+ComboBox3.Text+#39;

        if CheckBox3.Checked = true then
          default:=default+' AND ДатаПроведения ='+#39+DateToStr(DateTimePicker1.Date)+#39;

        if CheckBox8.Checked = true then
          default:=default+' AND Ученик.КодГруппы='+IntToStr(ComboBox4.ItemIndex+1);

        config.selectRequestSQL(default);
      end;

    if roleUser='stydent' then
      begin
        default:=getShyrnalData +' WHERE Фамилия='+#39+familyUser+#39+' AND'+
        ' Имя='+#39+nameUser+#39+' AND'+
        ' Отчество='+#39+secondNameUser+#39;

        if CheckBox1.Checked = true then
          default:=default+' AND НазваниеТемы='+#39+ComboBox1.Text+#39;

        if CheckBox2.Checked = true then
          default:=default+' AND НазваниеКонтроля='+#39+ComboBox2.Text+#39;

        if CheckBox4.Checked = true then
          default:=default+' AND Оценка='+#39+ComboBox3.Text+#39;
          config.selectRequestSQL(default);

        if CheckBox3.Checked = true then
          default:=default+' AND ДатаПроведения ='+#39+DateToStr(DateTimePicker1.Date)+#39;

        config.selectRequestSQL(default);
      end;
end;

procedure TShyrnal.SpeedButton4Click(Sender: TObject);
begin
   last_name.DataField:='Фамилия';
    first_name.DataField:='Имя';
    second_name.DataField:='Отчество';
    control.DataField:='НазваниеКонтроля';
    date.DataField:='ДатаПроведения';
    mark.DataField:='Оценка';
    if roleUser='teacher' then
      QuickRep1.Preview;
end;

procedure TShyrnal.SpeedButton8Click(Sender: TObject);
var default:string;
begin
    default:=getShyrnalData+' WHERE 1=1';
    CheckBox1.Checked:=false;
    CheckBox2.Checked:=false;
    CheckBox3.Checked:=false;
    CheckBox4.Checked:=false;
    CheckBox5.Checked:=false;
    CheckBox6.Checked:=false;
    CheckBox7.Checked:=false;
    if roleUser='teacher' then
      begin
        config.selectRequestSQL(default);
        if((CheckBox5.Checked = true)
          and (CheckBox6.Checked = true)
          and (CheckBox7.Checked = true)
          and (CheckBox1.Checked = true)
          and (CheckBox2.Checked = true)
          and (CheckBox4.Checked = true))
        then
          config.selectRequestSQL(getShyrnalData);
      end;
    if roleUser='stydent' then
      begin
        config.selectRequestSQL(getShyrnalData+' WHERE'+
          ' Фамилия='+#39+familyUser+#39+' AND'+
          ' Имя='+#39+nameUser+#39+' AND'+
          ' Отчество='+#39+secondNameUser+#39
        );
      end;
end;

end.

procedure TShyrnal.SpeedButton7Click(Sender: TObject);
begin

end;


