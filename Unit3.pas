unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Buttons, StdCtrls, DBCtrls , AuthorizationData,
  Grids, DBGrids;

type
  TMainMenu1 = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMenu1: TMainMenu1;

implementation

uses Unit2, Menu_Teacher, Title_Form, basa_dan, Control, DocumentForm,
  config, ControlCenter, Menu_Lectures, Main_Menu;

{$R *.dfm}

procedure TMainMenu1.SpeedButton1Click(Sender: TObject);
begin
    DataManagementCenter.show;
end;

procedure TMainMenu1.SpeedButton5Click(Sender: TObject);
begin
    MenuLectures.show;
    MenuLectures.ComboBox1.Items.Clear;
    config.selectRequestSQL('SELECT * FROM Раздел');  //Заполнение ComboBox при создании
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuLectures.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MenuLectures.ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;  //  конец создания
end;

end.
