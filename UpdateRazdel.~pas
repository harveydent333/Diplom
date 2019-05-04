unit UpdateRazdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, basa_dan, config, Grids, UpdateUnit,
  DBGrids;

type
  TUpdateRazdelModalForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateRazdelModalForm: TUpdateRazdelModalForm;
  unique_user:boolean;

implementation

{$R *.dfm}

procedure TUpdateRazdelModalForm.FormCreate(Sender: TObject);
begin
    Edit1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;
end;

procedure TUpdateRazdelModalForm.SpeedButton1Click(Sender: TObject);
begin
    unique_user:=false;
    if Edit1.Text<>'' then
      begin
        config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+Edit1.Text+#39);
        if ((DataModule1.ADOModuleLecture.IsEmpty)) then
          unique_user:=true
        else
          MessageBox(0,'Данный раздел уже сущетсвует!','Изменение раздела', MB_OK+MB_ICONwarning);
      end;

    if ((Edit1.Text<>'')and(unique_user<>false)) then
      begin
        config.execRequestSQL('UPDATE Раздел SET НазваниеРаздела='+#39+Edit1.Text+#39+' WHERE КодРаздела ='+IntToStr(updateKodRazdela));
        config.rebootRequestsCRUD;
    end;
end;

end.
