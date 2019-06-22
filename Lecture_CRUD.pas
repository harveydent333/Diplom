unit Lecture_CRUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, basa_dan, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TLectureCRUD = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid2: TDBGrid;
    teacher_ON: TImage;
    stydent_ON: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure performingEditing;
    procedure performingRemoval;
    procedure editingLecture;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LectureCRUD: TLectureCRUD;
   temp:word;
implementation

uses Title_Form, AddLecture, UpdateLecture, config, UpdateUnit,
  EditLecture, ControlCenter, Unit2, AuthorizationData, ShellAPI;
{$R *.dfm}

{
  ��������� ������� ������ �������� �������� ������
}
procedure TLectureCRUD.BitBtn1Click(Sender: TObject);
begin
  with TAddLectureModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

{
  ��������� ������� ������ ������������� ������
}
procedure TLectureCRUD.BitBtn2Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
      performingEditing
    else
      MessageBox(0,'� ��� ��� ���� �� �������������� ������ ������!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� ������� ������ ������� ������
}
procedure TLectureCRUD.BitBtn3Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
      begin
        temp:=MessageBox(0,'�� ����� ������ ������� ������ ������?','',MB_YESNO+MB_ICONQUESTION);
        if idyes=temp then
          performingRemoval;
      end
    else
        MessageBox(0,'� ��� ��� ���� �� �������� ������ ������!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� ������� ������ ������� �������� ������
}
procedure TLectureCRUD.BitBtn4Click(Sender: TObject);
begin
    config.selectRequestSQL('SELECT * FROM ������ WHERE ��������������='+
      #39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39
    );
    if KodUser = BD.Request.DataSet.FieldByName('����������').AsInteger then
        editingLecture
    else
        MessageBox(0,'� ��� ��� ���� �� �������� ��������� ������ ������!','', MB_OK+MB_ICONwarning);
end;

{
  ��������� �������������� �������� ������
}
procedure TLectureCRUD.performingEditing;
begin
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;           // ��� ����, ���������� ������
    updateKodLecture:=DBGrid2.DataSource.DataSet.FieldByName('���������').AsInteger;      // ��� ���������� ������
    config.selectRequestSQL('SELECT * FROM ���� WHERE �������='+IntToStr(updateKodTema));
    updateKodRazdela:=DBGrid2.DataSource.DataSet.FieldByName('����������').AsInteger;    // ��� ������� ���������� ������

    with TUpdateLectureModalForm.Create(nil) do
      try
        ShowModal;
      finally
        Free;
    end;
end;

{
  ��������� �������� �������� ������
}
procedure TLectureCRUD.performingRemoval;
begin
    config.execRequestSQL('DELETE FROM ������ WHERE ��������������='+#39+DBGrid1.DataSource.DataSet.FieldByName('��������������').AsString+#39);
    config.rebootRequestsCRUD;
    MessageBox(0,'������ ������ ���� ������� �������!','', MB_OK+MB_ICONINFORMATION);
end;

{
  ��������� �������� ��������� ������
}
procedure TLectureCRUD.editingLecture;
begin
    updateKodTema:=DBGrid2.DataSource.DataSet.FieldByName('�������').AsInteger;           // ��� ����,
    updateKodLecture:=DBGrid2.DataSource.DataSet.FieldByName('���������').AsInteger;      // ���  ������
    config.selectRequestSQL('SELECT * FROM ������ WHERE ���������='+IntToStr(updateKodLecture));
    LectureCRUD.Visible:=false;
    with Edit_Lecture do
      begin
        Show;
        Position:=poDesktopCenter;
        Memo1.Clear;
        Memo1.Lines.Add(DBGrid2.DataSource.DataSet.FieldByName('����������').AsString);
        Height:=920;
        Width:=1201;
        Memo1.Height:=833;
        Memo1.Width:=1190;
        Button1.Left:=8;
        Button1.Visible:=true;
        Button3.Left:=128;
        Button4.Visible:=true;
        Button5.Visible:=true;
        Button6.Left:=632;
        Button7.Visible:=false;
        Button8.Visible:=false;
        Memo1.ReadOnly:=false;
        AutoScroll:=true;
      end;
end;

procedure TLectureCRUD.SpeedButton2Click(Sender: TObject);
begin
    DataManagementCenter.show;
    DataManagementCenter.position:=poDesktopCenter;
    LectureCRUD.Visible:=false;
end;

procedure TLectureCRUD.SpeedButton5Click(Sender: TObject);
begin
    AuthorizationData.freeDataUser;
    LectureCRUD.Visible:=false;
end;

procedure TLectureCRUD.SpeedButton4Click(Sender: TObject);  // ���������� ������ ���������
begin
    temp:=MessageBox(0,'�� ����� ������ ����� �� ���������?','���������������� � ������ Web - ����������',MB_YESNO+MB_ICONQUESTION);
    if idyes=temp then TitleForm.close;
end;

procedure TLectureCRUD.SpeedButton3Click(Sender: TObject);
begin
    ShellExecute(handle,'open', PChar('Help.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.
