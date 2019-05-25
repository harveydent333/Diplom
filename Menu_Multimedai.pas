unit Menu_Multimedai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TMenuMultimedia = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuMultimedia: TMenuMultimedia;
      nameRazdela,str,nameTema,nameControl:string;
      kodRazdela,kodTema:integer;

implementation

uses basa_dan, Result, config, ShellAPI, Unit2, Main_Menu,
  AuthorizationData;

{$R *.dfm}

procedure TMenuMultimedia.ComboBox1Change(Sender: TObject);
begin
    label2.Visible:=false;
    label3.Visible:=false;
    ComboBox2.Visible:=false;
    ComboBox2.Items.Clear;
    ComboBox3.Visible:=false;
    ComboBox3.Items.Clear;
    label5.visible:=false;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameRazdela:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdela+#39); // Получение кода раздела
    kodRazdela:=BD.Request.DataSet.FieldByName('КодРаздела').AsInteger;
     // Проверка на наличие потомков у Раздела
    config.selectRequestSQL('SELECT * FROM Тема WHERE КодРаздела='+inttostr(kodRazdela));

    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox2.Items.Add(BD.Request.DataSet.FieldByName('НазваниеТемы').AsString);
        BD.Request.DataSet.Next;
        ComboBox2.Text:=ComboBox2.Items.Strings[0];
      end;

    if ComboBox2.Items.Count>0 then    // Проверка на наличие тем в разделе
      begin
        label2.Visible:=true;
        combobox2.Visible:=true;
        nameTema:=ComboBox2.Items.Strings[0];
        config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39); // Получение кода темы
        kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;
      end
    else
      label5.Visible:=true;
end;

procedure TMenuMultimedia.ComboBox2Change(Sender: TObject);
begin
    ComboBox3.Visible:=false;
    label3.Visible:=false;
    ComboBox3.Items.Clear;
    label7.Visible:=false;
    SpeedButton1.Visible:=false;
    SpeedButton1.Enabled:=false;

    nameTema:=ComboBox2.Items.Strings[Combobox2.ItemIndex];
    config.selectRequestSQL('SELECT * FROM Тема WHERE НазваниеТемы='+#39+nameTema+#39);
    kodTema:=BD.Request.DataSet.FieldByName('КодТемы').AsInteger;

    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE КодТемы='+inttostr(kodTema));
    While (BD.Request.DataSet.Eof=false) do
      begin
        ComboBox3.Items.Add(BD.Request.DataSet.FieldByName('НазваниеМультимедии').AsString);
        BD.Request.DataSet.Next;
        ComboBox3.Text:=ComboBox3.Items.Strings[0];
    end;

    if ComboBox3.Items.Count>0 then     // Проверка на наличие контроля знаний в теме
        begin
          label3.Visible:=true;
          Combobox3.Visible:=true;
        end
    else
      label7.Visible:=true;
end;

procedure TMenuMultimedia.ComboBox3Change(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM Мультимедиа WHERE НазваниеМультимедии='+#39+ComboBox3.Items.Strings[Combobox3.ItemIndex]+#39);
    SpeedButton1.Visible:=true;
    if FileExists('./'+BD.Request.DataSet.FieldByName('Путь').AsString+'.mp4') then
      SpeedButton1.Enabled:=true
    else
      begin
        MessageBox(0,'Файл данной мультимедии отсутствует','Программирование и защита Web - приложений', MB_OK+MB_ICONWARNING);
        SpeedButton1.Enabled:=false;
      end;
end;

procedure TMenuMultimedia.SpeedButton1Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('.\'+BD.Request.DataSet.FieldByName('Путь').AsString+'.mp4'), nil, nil, SW_SHOWNORMAL);
end;

procedure TMenuMultimedia.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    MenuMultimedia.Visible:=false;
end;

procedure TMenuMultimedia.SpeedButton2Click(Sender: TObject);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuMultimedia.Visible:=false;
end;

procedure TMenuMultimedia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainMenu.show;
    MainMenu.position:=poDesktopCenter;
    MenuMultimedia.Visible:=false;
end;

end.
