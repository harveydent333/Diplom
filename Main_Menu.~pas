unit Main_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids;

type
  TMainMenu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    procedure getDataControlForShyrnal;
    procedure getDataTemaForShyrnal;
    procedure settingForShyrnal(value:boolean);
  public
    { Public declarations }
  end;

var
  MainMenu: TMainMenu;

implementation

uses ControlCenter, DocumentForm, Menu_Lectures, AuthorizationData, config,
  Unit2, Title_Form, Menu_Practic, Menu_Control,
  Ycheniki_CRUD;

{$R *.dfm}

procedure TMainMenu.SpeedButton1Click(Sender: TObject); // Редактирование данных
begin
    DataManagementCenter.show;
    DataManagementCenter.Position:=poDesktopCenter;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton2Click(Sender: TObject); // Редактирование пользователей
begin
    MainMenu.Visible:=false;
    YchenikiCRUD.show;
    YchenikiCRUD.Position:=poDesktopCenter;
  // Создать меню, где учитель будет выбирать CRUD учеников или учителей (в раздумке)
end;

procedure TMainMenu.SpeedButton5Click(Sender: TObject); // Изучить лекции {Ученик}
begin
    config.selectRequestSQL('SELECT * FROM Раздел');
    with MenuLectures do
      begin
        ComboBox1.Clear;
        ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;
        show;
        Position:=poDesktopCenter;

        Label2.Visible:=false;
        Label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        ComboBox3.Visible:=false;
        ComboBox3.Items.Clear;
        Label5.visible:=false;
        Label7.Visible:=false;
        SpeedButton1.Visible:=false;
      end;
    MenuLectures.ComboBox1.Items.Clear;
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuLectures.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton8Click(Sender: TObject); // Выполнить практические работы {Ученик}
begin
    config.selectRequestSQL('SELECT * FROM Раздел');
    with MenuPractic do
      begin
        ComboBox1.Clear;
        ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;
        Show;
        Position:=poDesktopCenter;
        Label2.Visible:=false;
        Label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        ComboBox3.Visible:=false;
        ComboBox3.Items.Clear;
        Label5.visible:=false;
        Label7.Visible:=false;
      end;
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuPractic.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton9Click(Sender: TObject); // Пройти контроль знаний {Ученик}
begin
    config.selectRequestSQL('SELECT * FROM Раздел');
    with MenuControl do
      begin
        ComboBox1.Items.Clear;
        ComboBox2.Items.Clear;
        label2.Visible:=false;
        label3.Visible:=false;
        ComboBox2.Visible:=false;
        ComboBox2.Items.Clear;
        ComboBox3.Visible:=false;
        ComboBox3.Items.Clear;
        label5.visible:=false;
        label7.Visible:=false;
        Panel1.Visible:=false;
        SpeedButton1.Visible:=false;
        SpeedButton1.Enabled:=false;
      end;
    DBGrid1.DataSource.DataSet.First;
    While (DBGrid1.DataSource.DataSet.Eof=false) do
      begin
        MenuControl.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);
        DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
    MenuControl.ComboBox1.Text:=DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString;
    MenuControl.show;
    MenuControl.Position:=poDesktopCenter;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton6Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MainMenu.Visible:=false;
end;

procedure TMainMenu.SpeedButton10Click(Sender: TObject);
begin
    MainMenu.Visible:=false;
    Shyrnal.show;
    Shyrnal.Position:=poDesktopCenter;

    if roleUser='stydent' then
      begin
        settingForShyrnal(false);
        getDataTemaForShyrnal;
        getDataControlForShyrnal;
        config.selectRequestSQL('SELECT * FROM Ученик WHERE login='+#39+loginUser+#39);
        config.selectRequestSQL('SELECT * FROM Журнал WHERE КодУченика='+DBGrid1.DataSource.DataSet.fieldbyName('КодУченика').AsString);
      end;

    if roleUser='teacher' then
      begin
        settingForShyrnal(true);
        getDataTemaForShyrnal;
        getDataControlForShyrnal;
        config.selectRequestSQL('SELECT * FROM Журнал');
      end;
end;

procedure TMainMenu.getDataTemaForShyrnal;
begin
    config.selectRequestSQL('SELECT * FROM Тема');
    While (DBGrid1.DataSource.DataSet.Eof=false) do
        begin
          Shyrnal.ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеТемы').AsString);
          DBGrid1.DataSource.DataSet.Next;
          Shyrnal.ComboBox1.Text:=Shyrnal.ComboBox1.Items.Strings[0];
        end;
end;

procedure TMainMenu.settingForShyrnal(value:boolean);
begin
    with Shyrnal do
      begin
        ComboBox1.Clear;
        ComboBox2.Clear;
        CheckBox5.Visible:=value;
        CheckBox6.Visible:=value;
        CheckBox7.Visible:=value;
        Edit2.Visible:=value;
        Edit3.Visible:=value;
        Edit4.Visible:=value;
        label3.Visible:=value;
        label4.Visible:=value;
        label5.Visible:=value;
      end;
end;

procedure TMainMenu.getDataControlForShyrnal;
begin
    config.selectRequestSQL('SELECT * FROM Контроль');
    While (DBGrid1.DataSource.DataSet.Eof=false) do
        begin
          Shyrnal.ComboBox2.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеКонтроля').AsString);
          DBGrid1.DataSource.DataSet.Next;
          Shyrnal.ComboBox2.Text:=Shyrnal.ComboBox2.Items.Strings[0];
        end;
end;

procedure TMainMenu.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',
    MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
      TitleForm.close;
end;

end.
