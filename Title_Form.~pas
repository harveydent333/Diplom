unit Title_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, Grids, DBGrids, basa_dan, StdCtrls, AuthorizationData,
  ShellAPI;

type
  TTitleForm = class(TForm)
    stydent_ON: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image3: TImage;
    SpeedButton5: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Image4: TImage;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure openAuthorizationForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TitleForm: TTitleForm;

implementation

uses Unit2, Menu_Lectures, Menu_Practic, Menu_Control, Tema_CRUD,
  Practic_CRUD, Razdel_CRUD, Lecture_CRUD, Control_CRUD, Ycheniki_CRUD,
  Main_Menu, Add_Question, EditLecture, config,
  MultiMedia_CRUD,
  Menu_Multimedai, Media_Player, UpdateUnit, StydentWork;

{$R *.dfm}

procedure TTitleForm.SpeedButton4Click(Sender: TObject);
begin
    Try
      with BD.ADOConnection1 do
        begin
          Connected := false;
          Connected := True;
          config.rebootRequestsCRUD;
          openAuthorizationForm;
        end;
    Except
      MessageBox(0,'Не  удается подключиться к базе данных! ','', MB_OK+MB_ICONERROR);
      BitBtn1.Enabled:=false;
    end;
end;

procedure TTitleForm.openAuthorizationForm;
var i:integer; fio:string;
begin
   TitleForm.Visible:=false;
   with AuthorizationForm do
      begin
          Show;
          Position:=poDesktopCenter;
          ComboBox1.Clear;
          ComboBox2.Clear;

          config.selectRequestSQL('SELECT * FROM Ученик WHERE КодГруппы=1');
          BD.Request.DataSet.First;
          for i:=1 to BD.Request.DataSet.RecordCount do
              begin
                with BD.Request.DataSet do
                  begin
                      fio:=FieldByName('Фамилия').AsString+' '+FieldByName('Имя').AsString+' '+FieldByName('Отчество').AsString;
                  end;
                ComboBox2.Items.Add(fio);
                BD.Request.DataSet.Next;
              end;
          ComboBox2.ItemIndex:=0;

          config.selectRequestSQL('SELECT * FROM Группа');
          BD.Request.DataSet.First;
          for i:=1 to BD.Request.DataSet.RecordCount do
            begin
              ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеГруппы').AsString);
              BD.Request.DataSet.Next;
            end;
          ComboBox1.ItemIndex:=0;
      end;
end;

procedure TTitleForm.FormCreate(Sender: TObject);
begin
    currentDir:=GetCurrentDir;
    getShyrnalData:='SELECT Ученик.Фамилия,'+
                          ' Ученик.Имя,'+
                          ' Ученик.Отчество,'+
                          ' Группа.НазваниеГруппы,'+
                          ' Тема.НазваниеТемы,'+
                          ' Контроль.НазваниеКонтроля,'+
                          ' ЖурналОценок.ДатаПроведения,'+
                          ' ЖурналОценок.Оценка'+
                     ' FROM Группа'+
               ' INNER JOIN (Тема INNER JOIN ((Ученик INNER JOIN ЖурналОценок ON Ученик.КодУченика = ЖурналОценок.КодУченика)'+
               ' INNER JOIN Контроль'+
                       ' ON ЖурналОценок.КодКонтроля = Контроль.КодКонтроля)'+
                       ' ON (Тема.КодТемы = Контроль.КодТемы) AND (Тема.КодТемы = ЖурналОценок.КодТемы))'+
                       ' ON Группа.КодГруппы = Ученик.КодГруппы';
end;

{
  Процедура обработки нажатия кнопки "Настройка БД"
  Открывает модальное окно компонента OpenDialog, после выбранного файла БД, подключает его
}
procedure TTitleForm.SpeedButton5Click(Sender: TObject);
begin
   if OpenDialog1.Execute then
      begin
          Try
            with BD.ADOConnection1 do
              begin
                  Connected := false;
                  ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;'+
                    'Data Source='+OpenDialog1.FileName+';'+
                    'Persist Security Info=false';
                  Connected := True;
                  config.rebootRequestsCRUD;
                  BitBtn1.Enabled:=true;
                  MessageBox(0,'База данных успешно подключена! ','', MB_OK+MB_ICONINFORMATION);
              end;
          Except
            MessageBox(0,'Не  удается подключиться к этой базе данных! ','', MB_OK+MB_ICONERROR);
            BitBtn1.Enabled:=false;
          end;
      end;
end;

procedure TTitleForm.SpeedButton2Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TTitleForm.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TTitleForm.BitBtn1Click(Sender: TObject);
begin
    SetCurrentDir(currentDir);
    Try
      with BD.ADOConnection1 do
        begin
          Connected := false;
          Connected := True;
          config.rebootRequestsCRUD;
          openAuthorizationForm;
        end;
    Except
      MessageBox(0,'Не  удается подключиться к базе данных! ','', MB_OK+MB_ICONERROR);
      BitBtn1.Enabled:=false;
    end;
end;

end.

 {  getControlData:='SELECT Раздел.НазваниеРаздела,
                          ' Тема.НазваниеТемы,'+
                          ' Контроль.НомерКонтроля,'+
                          ' Контроль.НазваниеКонтроля'+
                     ' FROM (Раздел INNER JOIN Тема ON Раздел.КодРаздела = Тема.КодРаздела)'+
               ' INNER JOIN Контроль ON Тема.КодТемы = Контроль.КодТемы'+
                 ' ORDER BY Контроль.НомерКонтроля';     }
