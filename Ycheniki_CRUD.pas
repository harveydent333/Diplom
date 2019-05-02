unit Ycheniki_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TYchenikiCRUD = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBGrid2: TDBGrid;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YchenikiCRUD: TYchenikiCRUD;
       login:string;

implementation

uses basa_dan, Title_Form, Menu_Teacher, AuthorizationData, config, UpdateUnit;

{$R *.dfm}

procedure TYchenikiCRUD.SpeedButton4Click(Sender: TObject);
begin
TitleForm.close;
end;

procedure TYchenikiCRUD.SpeedButton6Click(Sender: TObject);       // Добавление нового ученика
begin
    RegistrationForm.Show;
    DataModule1.YchenikADO.Append;
    RegistrationForm.SpeedButton2.Visible:=true;
    AuthorizationData.defoltConfigRegistrationForm;
end;

procedure TYchenikiCRUD.SpeedButton1Click(Sender: TObject);       // Удаление ученика
begin
    config.execRequestSQL('DELETE FROM Ученик WHERE login='+#39+login+#39);
    config.rebootRequestsCRUD;
end;

procedure TYchenikiCRUD.SpeedButton7Click(Sender: TObject);
begin
    login:=DBGrid1.DataSource.DataSet.FieldByName('Фамилия').AsString+' '+
      DBGrid1.DataSource.DataSet.FieldByName('Имя').AsString+' '+
      DBGrid1.DataSource.DataSet.FieldByName('Отчество').AsString;
    config.selectRequestSQL('SELECT * FROM Ученик WHERE login='+#39+login+#39);
    updateKodYchenika:=DBGrid2.DataSource.DataSet.FieldByName('КодУченика').AsInteger;
end;

end.
