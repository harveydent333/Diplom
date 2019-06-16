unit EditLecture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls;

type
  TEdit_Lecture = class(TForm)
    Memo1: TMemo;
    PageSetupDialog1: TPageSetupDialog;
    FontDialog1: TFontDialog;
    PrintDialog1: TPrintDialog;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_Lecture: TEdit_Lecture;
  ArrayListText:array[1..30] of string;

implementation

uses config, UpdateUnit, Lecture_CRUD,
  Menu_Lectures, AuthorizationData, All_Lecture_Practic_Control;

{$R *.dfm}

procedure TEdit_Lecture.Button1Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
      begin
        Memo1.Lines.LoadFromFile(opendialog1.FileName);
      end;
end;

procedure TEdit_Lecture.Button2Click(Sender: TObject);
begin
    if FontDialog1.Execute then
      begin
        Memo1.Font.Color:=FontDialog1.Font.Color;
        Memo1.Font.Size:=FontDialog1.Font.Size;
        Memo1.Font.Name:=FontDialog1.Font.Name;
        Memo1.Font.Height:=FontDialog1.Font.Height;
        Memo1.Font.Style:=FontDialog1.Font.Style;
        Memo1.Font.Pitch:=FontDialog1.Font.Pitch;
        Memo1.Font.Charset:=FontDialog1.Font.Charset;
      end;
end;

procedure TEdit_Lecture.Button3Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
      Memo1.Lines.SaveToFile(SaveDialog1.FileName+'.txt');
    MessageBox(0,'Лекция сохранена','', MB_OK+MB_ICONINFORMATION);
end;

procedure TEdit_Lecture.Button5Click(Sender: TObject);
begin
    PrintDialog1.Execute;
end;

{
  Процедура обработки нажатия кнопки "Сохранить в базу данных"
  Формируется запрос на сохранение 
}
procedure TEdit_Lecture.Button4Click(Sender: TObject);
begin
    config.execRequestSQL('UPDATE Лекции'+
                            ' SET Содержание='+#39+Memo1.Text+#39+
                          ' WHERE КодЛекции='+IntToStr(updateKodLecture)
    );
    MessageBox(0,'Лекция сохранена','', MB_OK+MB_ICONINFORMATION);
end;

procedure TEdit_Lecture.Button6Click(Sender: TObject);
begin
    if Memo1.ReadOnly=true then
      begin
        AllComponents.show;
        Edit_Lecture.Visible:=false;
      end
    else
      begin
        LectureCRUD.show;
        Edit_Lecture.Visible:=false;
      end;
end;

procedure TEdit_Lecture.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if roleUser<>'stydent' then
    begin
      LectureCRUD.show;
      LectureCRUD.Position:=poDesktopCenter;
      Edit_Lecture.Visible:=false;
    end
  else
    begin
      AllComponents.show;
      AllComponents.Position:=poDesktopCenter;
      Edit_Lecture.Visible:=false;
      Edit_Lecture.AutoScroll:=false;
    end;
end;

procedure TEdit_Lecture.Button7Click(Sender: TObject);
begin
    if List=AllList then Button7.Enabled:=false;
    Button8.Enabled:=true;
    List:=List+1;
    Memo1.Clear;
    Memo1.Lines.Add(ArrayListText[List]);
end;

procedure TEdit_Lecture.Button8Click(Sender: TObject);
begin
    if List=2 then Button8.Enabled:=false;
    Button7.Enabled:=true;
    List:=List-1;
    Memo1.Clear;
    Memo1.Lines.Add(ArrayListText[List]);
end;

end.
