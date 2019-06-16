unit Menu_Teacher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, AuthorizationData;

type
  TRegistrationForm = class(TForm)
    defolt_edit1: TImage;
    bed_edit1: TImage;
    good_edit1: TImage;
    defolt_edit2: TImage;
    bed_edit2: TImage;
    good_edit2: TImage;
    good_edit3: TImage;
    defolt_edit3: TImage;
    bed_edit3: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    last_name: TEdit;
    first_name: TEdit;
    second_name: TEdit;
    Image1: TImage;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton6: TSpeedButton;
    stydent_ON: TImage;
    teacher_ON: TImage;
    procedure last_name3Change(Sender: TObject);
    procedure first_name3Change(Sender: TObject);
    procedure second_name3Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure login_fieldChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure last_nameKeyPress(Sender: TObject; var Key: Char);
    procedure first_nameKeyPress(Sender: TObject; var Key: Char);
    procedure second_nameKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;
       login:string;

implementation

uses Unit3, basa_dan, Unit2, Title_Form, config, Main_Menu,
  Ycheniki_CRUD, UpdateUnit, ShellAPI;

{$R *.dfm}

procedure TRegistrationForm.last_name3Change(Sender: TObject);
begin
    defolt_edit1.Visible:=false;
    if last_name.Text='' then
      begin
        good_edit1.Visible:=false;
        bed_edit1.Visible:=true;
        label2.Visible:=true;
      end
    else
      begin
        good_edit1.Visible:=true;
        bed_edit1.Visible:=false;
        label2.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationForm.first_name3Change(Sender: TObject);
begin
    defolt_edit2.Visible:=false;
    if first_name.Text='' then
      begin
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
        label3.Visible:=true;
      end
    else
      begin
        good_edit2.Visible:=true;
        bed_edit2.Visible:=false;
        label3.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationForm.second_name3Change(Sender: TObject);
begin
    defolt_edit3.Visible:=false;
    if second_name.Text='' then
      begin
        good_edit3.Visible:=false;
        bed_edit3.Visible:=true;
        label4.Visible:=true;
      end
    else
      begin
        good_edit3.Visible:=true;
        bed_edit3.Visible:=false;
        label4.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationForm.login_fieldChange(Sender: TObject);
begin
    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationForm.SpeedButton2Click(Sender: TObject);
begin
    RegistrationForm.visible:=false;
    YchenikiCRUD.show;
    YchenikiCRUD.position:=poDesktopCenter;
end;

procedure TRegistrationForm.SpeedButton1Click(Sender: TObject);    // КНОПКА ЗАРЕГИСТРИРОВАТЬ
begin
    if last_name.Text='' then   // ПУСТОЕ ПОЛЕ ФАМИЛИЯ ПРИ НАЖАТИИ КНОПКИ ЗАРЕГЕСТРИРОВАТЬ
      begin
        label1.Visible:=true;
        label2.Visible:=true;
        defolt_edit1.Visible:=false;
        good_edit1.Visible:=false;
        bed_edit1.Visible:=true;
      end;

    if first_name.Text='' then        //ПУСТОЕ ПОЛЕ ИМЯ ПРИ НАЖАТИИ КНОПКИ ЗАРЕГЕСТРИРОВАТЬ
      begin
        label1.Visible:=true;
        label3.Visible:=true;
        defolt_edit2.Visible:=false;
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
      end;

    if second_name.Text='' then       //ПУСТОЕ ПОЛЕ ОТЧЕСТВО ПРИ НАЖАТИИ КНОПКИ ЗАРЕГИСТРИРОВАТЬ
      begin
        label1.Visible:=true;
        label4.Visible:=true;
        defolt_edit3.Visible:=false;
        good_edit3.Visible:=false;
        bed_edit3.Visible:=true;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')) then
      begin
        config.execRequestSQL('INSERT INTO Ученик(Фамилия, Имя, Отчество, КодГруппы) VALUES('+
          #39+last_name.Text+#39+','+
          #39+first_name.Text+#39+','+
          #39+second_name.Text+#39+','+
          #39+IntToStr(ComboBox1.ItemIndex+1)+#39+')'
        );
        config.rebootRequestsCRUD;
        label1.Visible:=false;

        defolt_edit1.Visible:=true;
        defolt_edit2.Visible:=true;
        defolt_edit3.Visible:=true;

        good_edit1.Visible:=false;
        good_edit2.Visible:=false;
        good_edit3.Visible:=false;

        bed_edit1.Visible:=false;
        bed_edit2.Visible:=false;
        bed_edit3.Visible:=false;

        label1.Visible:=false;
        label2.Visible:=false;
        label3.Visible:=false;
        label4.Visible:=false;

        last_name.Text:='';
        first_name.Text:='';
        second_name.text:='';
        MessageBox(0,'Обучающийся был успешно зарегистрирован!','Регистриация обучающегося', MB_OK+MB_ICONINFORMATION);
      end;
end;

procedure TRegistrationForm.SpeedButton6Click(Sender: TObject); // КНОПКА ИЗМЕНИТЬ
begin
    if last_name.Text='' then   // ПУСТОЕ ПОЛЕ ФАМИЛИЯ ПРИ НАЖАТИИ КНОПКИ ИЗМЕНИТЬ
      begin
        label1.Visible:=true;
        label2.Visible:=true;
        defolt_edit1.Visible:=false;
        good_edit1.Visible:=false;
        bed_edit1.Visible:=true;
      end;

    if first_name.Text='' then        //ПУСТОЕ ПОЛЕ ИМЯ ПРИ НАЖАТИИ КНОПКИ ИЗМЕНИТЬ
      begin
        label1.Visible:=true;
        label3.Visible:=true;
        defolt_edit2.Visible:=false;
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
      end;

    if second_name.Text='' then       //ПУСТОЕ ПОЛЕ ОТЧЕСТВО ПРИ НАЖАТИИ КНОПКИ ИЗМЕНИТЬ
      begin
        label1.Visible:=true;
        label4.Visible:=true;
        defolt_edit3.Visible:=false;
        good_edit3.Visible:=false;
        bed_edit3.Visible:=true;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>'')) then
      begin
        config.execRequestSQL('UPDATE Ученик SET Фамилия='+
          #39+last_name.Text+#39+', Имя='+
          #39+first_name.Text+#39+', Отчество='+
          #39+second_name.Text+#39+', КодГруппы='+
          IntToStr(ComboBox1.ItemIndex+1)+' WHERE КодУченика='+IntToStr(updateKodYchenika)
        );
        config.rebootRequestsCRUD;
        label1.Visible:=false;

        defolt_edit1.Visible:=true;
        defolt_edit2.Visible:=true;
        defolt_edit3.Visible:=true;

        good_edit1.Visible:=false;
        good_edit2.Visible:=false;
        good_edit3.Visible:=false;

        bed_edit1.Visible:=false;
        bed_edit2.Visible:=false;
        bed_edit3.Visible:=false;

        label1.Visible:=false;
        label2.Visible:=false;
        label3.Visible:=false;
        label4.Visible:=false;
        MessageBox(0,'Данные обучающегося был успешно изменены!','Редактирование обучающегося', MB_OK+MB_ICONINFORMATION);
      end;
end;

procedure TRegistrationForm.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    RegistrationForm.Visible:=false;
end;

procedure TRegistrationForm.last_nameKeyPress(Sender: TObject; var Key: Char);
begin
    defolt_edit1.Visible:=false;
    if ((key=#8) and ((length(last_name.Text)=1) or (length(last_name.Text)=0))) then
      begin
        good_edit1.Visible:=false;
        bed_edit1.Visible:=true;
        label2.Visible:=true;
      end
    else
      begin
        good_edit1.Visible:=true;
        bed_edit1.Visible:=false;
        label2.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

{
  Обработка события нажатия клавиши в поле "Имя"
  Проверяется на нажатие кнопки и BackSpace и валидация пустого поля
}
procedure TRegistrationForm.first_nameKeyPress(Sender: TObject; var Key: Char);
begin
    defolt_edit2.Visible:=false;
    if ((key=#8) and ((length(first_name.Text)=1) or (length(first_name.Text)=0))) then
      begin
        good_edit2.Visible:=false;
        bed_edit2.Visible:=true;
        label3.Visible:=true;
      end
    else
      begin
        good_edit2.Visible:=true;
        bed_edit2.Visible:=false;
        label3.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
    Label1.Visible:=false;
end;

procedure TRegistrationForm.second_nameKeyPress(Sender: TObject; var Key: Char);
begin
   defolt_edit3.Visible:=false;
    if ((key=#8) and ((length(second_name.Text)=1) or (length(second_name.Text)=0))) then
      begin
        good_edit3.Visible:=false;
        bed_edit3.Visible:=true;
        label4.Visible:=true;
      end
    else
      begin
        good_edit3.Visible:=true;
        bed_edit3.Visible:=false;
        label4.Visible:=false;
      end;

    if((last_name.Text<>'') and (first_name.Text<>'') and (second_name.Text<>''))then
      label1.Visible:=false;
end;

procedure TRegistrationForm.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TRegistrationForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in []) then Key := #0;
end;

procedure TRegistrationForm.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'Вы точно хотите выйти из программы?','Программирование и защита Web - приложений',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

end.
