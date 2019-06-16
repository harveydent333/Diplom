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
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
  ControlCenter, Unit2, Manager_Users, ShellAPI;

{$R *.dfm}

{
  ��������� ������ "����������� ������ ������������", ��������� �� ����� "����������� ������������"
}
procedure TYchenikiCRUD.BitBtn1Click(Sender: TObject);
begin
    AuthorizationData.defoltConfigRegistrationForm;
    YchenikiCRUD.Visible:=false;
    with RegistrationForm do
      begin
          Show;
          Position:=poDesktopCenter;
          last_name.text:='';
          first_name.text:='';
          second_name.text:='';
          ComboBox1.ItemIndex:=0;
          SpeedButton6.Visible:=false;
          SpeedButton1.Visible:=true;
          defoltConfigRegistrationForm;
          Caption:='����������� ������������';
      end;
end;

{
  ��������� ������ "������������� ������ ������������", ��������� �� ����� "�������������� ������������"
  �������� ������ ���������� ������������ � ��������� ���� �� ����� "�������������� ������������"
}
procedure TYchenikiCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39
    );

    idGroup:=BD.Request.DataSet.FieldByName('���������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+#39+' AND ���='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('���').AsString+#39+' AND ��������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('��������').AsString+#39+' AND ���������='+IntToStr(idGroup)
    );
    updateKodYchenika:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    with RegistrationForm do
      begin
         last_name.text:=BD.Request.DataSet.FieldByName('�������').AsString;
         first_name.text:=BD.Request.DataSet.FieldByName('���').AsString;
         second_name.text:=BD.Request.DataSet.FieldByName('��������').AsString;
         ComboBox1.ItemIndex:=BD.Request.DataSet.FieldByName('���������').AsInteger-1;
         SpeedButton6.Visible:=true;
         SpeedButton1.Visible:=false;
         defoltConfigRegistrationForm;
         Caption:='�������������� ������������';
         Position:=poDesktopCenter;
      end;

   RegistrationForm.Show;
   RegistrationForm.Position:=poDesktopCenter;
   YchenikiCRUD.Visible:=false;
end;

procedure TYchenikiCRUD.BitBtn3Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
    #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39);

    idGroup:=BD.Request.DataSet.FieldByName('���������').AsInteger;

    config.selectRequestSQL('SELECT * FROM ������ WHERE �������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('�������').AsString+#39+' AND ���='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('���').AsString+#39+' AND ��������='+
        #39+DBGrid1.DataSource.DataSet.FieldByName('��������').AsString+#39+' AND ���������='+IntToStr(idGroup)
    );
    updateKodYchenika:=BD.Request.DataSet.FieldByName('����������').AsInteger;

    config.execRequestSQL('DELETE FROM ������ WHERE ����������='+IntToStr(updateKodYchenika));
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ������������ ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

procedure TYchenikiCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
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
    if idyes=temp then TitleForm.close;
end;

procedure TYchenikiCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
