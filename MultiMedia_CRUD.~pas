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
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MultiMediaCRUD: TMultiMediaCRUD;
   nameTema, nameRazdela:string;
        kodTema, kodRazdela,i:integer;
        unique_user:boolean;

implementation

uses config, basa_dan, ControlCenter, Title_Form, Unit2, AuthorizationData,
  AddMultimedia, UpdateUnit, UpdateMultimedia, ShellAPI;

{$R *.dfm}

procedure TMultiMediaCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TMultiMediaCRUD.BitBtn1Click(Sender: TObject);
begin
    AddMultimediaModalForm.ComboBox1.Clear;
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin

            AddMultimediaModalForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
            BD.Request.DataSet.Next;
        end;
    BD.Request.DataSet.First;
    AddMultimediaModalForm.ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;
    AddMultimediaModalForm.Show;
    AddMultimediaModalForm.Label7.Visible:=false;
    AddMultimediaModalForm.Label8.Visible:=false;
    Path:='';
    MultiMediaCRUD.Enabled:=false;
end;

{
  Обработка нажатия кнопки редактировать мультимеида
}
procedure TMultiMediaCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеМультимедии').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        performingEditing
    else
        MessageBox(0,'У вас нет прав на редактирование данной мультимедиа!','', MB_OK+MB_ICONwarning);
end;

{
  Обработка нажатия кнопки удалить мультимедиа
}
procedure TMultiMediaCRUD.BitBtn3Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеМультимедии').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('КодУчителя').AsInteger then
        performingRemoval
    else
        MessageBox(0,'У вас нет прав на удаление данной темы!','', MB_OK+MB_ICONwarning);
end;

{
  Процедура редактирования мультимедиа
}
procedure TMultiMediaCRUD.performingEditing;
begin
    PathFile:='';
    updateKodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;           // Код Темы, изменяемой Мультимедии
    updateKodMultimedia:=BD.Request.DataSet.FieldByName('КодМультимедии').AsInteger;      // Код изменяемой Мультимедии
    str:=BD.Request.DataSet.FieldByName('Путь').AsString;
    for i:=13 to Length(str) do
      PathFile:=PathFile+str[i];
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
    updateKodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;    // Код Раздела изменяемой Мультимедии
    UpdateMultimediaModalForm.Show;
    UpdateMultimediaModalForm.Position:=poDesktopCenter;
    MultiMediaCRUD.Enabled:=false;

     // Получение всех разделов
    config.selectRequestSQL('SELECT * FROM Раздел');
    BD.Request.DataSet.First;
    While (BD.Request.DataSet.Eof=false) do
        begin
            UpdateMultimediaModalForm.ComboBox1.Items.Add(BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString);
            BD.Request.DataSet.Next;
    end;

    // Получение Раздела к которому относиться наша изменяемая лекция
    config.selectRequestSQL('SELECT * FROM Раздел WHERE КодРаздела='+IntToStr(updateKodRazdela));
    UpdateMultimediaModalForm.ComboBox1.Text:=BD.Request.DataSet.FieldByName('НазваниеРаздела').AsString;

    // Получение всех Тем раздела к которомой относиться наша изменяемая лекция
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+IntToStr(updateKodRazdela));

    UpdateMultimediaModalForm.ComboBox2.Visible:=true;
    UpdateMultimediaModalForm.label3.Visible:=true;
    While (BD.Request.DataSet.Eof=false) do
      begin
        UpdateMultimediaModalForm.ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
      end;

   // Получение название Темы нашей зменяемой лекции
   config.selectRequestSQL('SELECT * FROM Тема WHERE КодТемы='+IntToStr(updateKodTema));
   UpdateMultimediaModalForm.ComboBox2.Text:=BD.Request.DataSet.FieldByName('НазваниеТемы').AsString;

   // Получение названия мультимедиа к которомой относитсья наша изменяемая мультимедиа+
   UpdateMultimediaModalForm.Edit1.Visible:=true;
   UpdateMultimediaModalForm.label2.Visible:=true;
   UpdateMultimediaModalForm.Edit2.Visible:=true;
   UpdateMultimediaModalForm.label4.Visible:=true;
   config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE КодМультимедии='+IntToStr(updateKodMultimedia));
   UpdateMultimediaModalForm.Edit1.Text:=BD.Request.DataSet.FieldByName('НазваниеМультимедии').AsString;
   UpdateMultimediaModalForm.Edit2.Text:=BD.Request.DataSet.FieldByName('НомерМультимедии').AsString;
   UpdateMultimediaModalForm.Label7.Visible:=false;
   UpdateMultimediaModalForm.Label8.Visible:=false;

   kodRazdela:=updateKodRazdela;
   kodTema:=updateKodTema;
end;

{
  Процедура удаления мультимеида
}
procedure TMultiMediaCRUD.performingRemoval;
begin
    config.execRequestSQL('DELETE FROM Мультимедиа WHERE НазваниеМультимедии='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('НазваниеМультимедии').AsString+#39
    );
    config.rebootRequestsCRUD;
    MessageBox(0,'Данные мультимедии были успешно удалены!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TMultiMediaCRUD.SpeedButton2Click(Sender: TObject);
begin
    MultiMediaCRUD.Visible:=false;
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    SetCurrentDir(currentDir);
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
    SetCurrentDir(currentDir);
end;

procedure TMultiMediaCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

end.
