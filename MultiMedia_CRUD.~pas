unit MultiMedia_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MPlayer, Grids, DBGrids, Buttons, jpeg;

type
  TMultiMediaCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MultiMediaCRUD: TMultiMediaCRUD;

implementation

uses config, basa_dan, ControlCenter, Title_Form, Unit2, AuthorizationData,
  AddMultimedia, UpdateUnit, UpdateMultimedia;

{$R *.dfm}

procedure TMultiMediaCRUD.SpeedButton1Click(Sender: TObject);
begin
 with TAddMultimediaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TMultiMediaCRUD.SpeedButton6Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеМультимедии').AsString+#39);
    updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы, изменяемой Мультимедии
    updateKodPractic:=BD.Request.DataSet.FieldByName('КодМультимедии').AsInteger;      // Код изменяемой Мультимедии
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    updateKodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;    // Код Раздела изменяемой Мультимедии

    with TUpdateMultimediaModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

procedure TMultiMediaCRUD.SpeedButton7Click(Sender: TObject);
begin
    config.execRequestSQL('DELETE FROM Мультимедиа WHERE НазваниеМультимедии='+#39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеМультимедии').AsString+#39);
    config.rebootRequestsCRUD;
end;

procedure TMultiMediaCRUD.SpeedButton2Click(Sender: TObject);
begin
    MultiMediaCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
end;

procedure TMultiMediaCRUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MultiMediaCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
end;

procedure TMultiMediaCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MultimediaCRUD.Visible:=false;
end;

procedure TMultiMediaCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

end.
