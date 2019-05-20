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
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YchenikiCRUD: TYchenikiCRUD;
    idGroup:integer;

implementation

uses basa_dan, Title_Form, Menu_Teacher, AuthorizationData, config, UpdateUnit,
  ControlCenter,
  Unit2,
  Manager_Users;

{$R *.dfm}

procedure TYchenikiCRUD.SpeedButton6Click(Sender: TObject);       // ���������� ������ �������
begin
    AuthorizationData.defoltConfigRegistrationForm;
    YchenikiCRUD.Visible:=false;
    with RegistrationForm do
      begin
          Show;
          last_name.text:='';
          first_name.text:='';
          second_name.text:='';
          ComboBox1.ItemIndex:=0;
          SpeedButton6.Visible:=false;
          SpeedButton1.Visible:=true;
          defoltConfigRegistrationForm;
      end;
end;

procedure TYchenikiCRUD.SpeedButton1Click(Sender: TObject);       // �������� �������
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39);

    idGroup:=BD.Request.DataSet.FieldByName('���������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+#39+' AND ���='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('���').AsString+#39+' AND ��������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('��������').AsString+#39+' AND ���������='+IntToStr(idGroup));
    updateKodYchenika:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    config.execRequestSQL('DELETE FROM ������ WHERE ����������='+IntToStr(updateKodYchenika));
    config.rebootRequestsCRUD;
end;

procedure TYchenikiCRUD.SpeedButton7Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39);

    idGroup:=BD.Request.DataSet.FieldByName('���������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+#39+' AND ���='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('���').AsString+#39+' AND ��������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('��������').AsString+#39+' AND ���������='+IntToStr(idGroup));
    updateKodYchenika:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    with RegistrationForm do
      begin
         last_name.text:=BD.Request.DataSet.FieldByName('�������').AsString;
         first_name.text:=BD.Request.DataSet.FieldByName('���').AsString;
         second_name.text:=BD.Request.DataSet.FieldByName('��������').AsString;
         ComboBox1.ItemIndex:=BD.Request.DataSet.FieldByName('���������').AsInteger-1;
         SpeedButton6.Visible:=true;
         SpeedButton1.Visible:=false;
         defoltConfigRegistrationForm
      end;

   RegistrationForm.Show;
   RegistrationForm.Position:=poDesktopCenter;
   YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ManagerUsers.show;
    ManagerUsers.position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationForm.Edit1.Text:='';
    AuthorizationData.freeDataUser;
    AuthorizationForm.Visible:=true;;
    AuthorizationForm.Position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.SpeedButton2Click(Sender: TObject);
begin
    ManagerUsers.show;
    ManagerUsers.position:=poDesktopCenter;
    YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.SpeedButton4Click(Sender: TObject);
var temp:word;
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then
        TitleForm.close;
end;

end.
