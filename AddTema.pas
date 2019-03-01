unit AddTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, jpeg , basa_dan , Control,
  Grids, DBGrids;

type
  TAddTemaModalForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTemaModalForm: TAddTemaModalForm;
  kodRazdel:integer;
  nameRazdel,str:string;
  unique_user:boolean;

implementation

{$R *.dfm}

procedure TAddTemaModalForm.FormCreate(Sender: TObject);
begin
Edit1.Text:='';                                                                               // Заполнение ComboBox при создании
DataModule1.ADOModuleLecture.SQL.Clear;                                                       //
DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Раздел');                                 //
DataModule1.ADOModuleLecture.Open;                                                            //
DBGrid1.DataSource.DataSet.First;                                                             //
While (DBGrid1.DataSource.DataSet.Eof=false) do                                               //
 begin                                                                                        //
    ComboBox1.Items.Add(DBGrid1.DataSource.DataSet.FieldByName('НазваниеРаздела').AsString);  //
    DBGrid1.DataSource.DataSet.Next;                                                          //
  end;                                                                                        //
DBGrid1.DataSource.DataSet.First;                                                             //
ComboBox1.ItemIndex:=0;                                                                       //
                                                                                              //  конец создания

if ComboBox1.ItemIndex=-1 then
  begin
    Edit1.Text:='';
    Edit1.Visible:=false;
    label2.Visible:=false;
    Panel2.Visible:=false;
  end
  else
    begin
    Edit1.Text:='';
    Edit1.Visible:=true;
    label2.Visible:=true;
    Panel2.Visible:=true;
    //
    nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
    DataModule1.ADOModuleLecture.SQL.Clear;
    str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39;
    DataModule1.ADOModuleLecture.SQL.Add(str);
    DataModule1.ADOModuleLecture.Open;
    kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
    end;


end;

procedure TAddTemaModalForm.SpeedButton1Click(Sender: TObject);
begin
unique_user:=false;
DataModule1.ADOModuleLecture.SQL.Clear;
  if Edit1.Text<>'' then
  begin
      DataModule1.ADOModuleLecture.SQL.Add('SELECT * FROM Тема WHERE НазваниеТемы='+#39+Edit1.Text+#39);
      DataModule1.ADOModuleLecture.Open;
      if DataModule1.ADOModuleLecture.IsEmpty then unique_user:=true
      else
       MessageBox(0,'Данная тема уже сущетсвует!','Создание темы', MB_OK+MB_ICONwarning);
   end;
 if ((Edit1.Text<>'')and(unique_user<>false)) then
    begin
    DataModule1.ShowTemaADO.Append;
    DataModule1.ShowTemaADO.Edit;
    DataModule1.ShowTemaADO.FieldByName('НазваниеТемы').AsString:=edit1.Text;
    DataModule1.ShowTemaADO.FieldByName('КодРаздела').AsInteger:=kodRazdel;
    DataModule1.ShowTemaADO.Post;
    MessageBox(0,'Тема была успешно Создана!','Создание Темы', MB_OK+MB_ICONINFORMATION);
    DataModule1.ADOTemaCRUD.Active:=False;
    DataModule1.ADOTemaCRUD.Active:=True;
    Edit1.Text:='';
    //default setting creat ModalForm
   end;
end;


procedure TAddTemaModalForm.ComboBox1Change(Sender: TObject);
begin
Edit1.Text:='';
Edit1.Visible:=true;
label2.Visible:=true;
Panel2.Visible:=true;
nameRazdel:=ComboBox1.Items.Strings[Combobox1.ItemIndex];
DataModule1.ADOModuleLecture.SQL.Clear;
str:='SELECT * FROM Раздел WHERE НазваниеРаздела='+#39+nameRazdel+#39;
DataModule1.ADOModuleLecture.SQL.Add(str);
DataModule1.ADOModuleLecture.Open;
kodRazdel:=DBGrid1.DataSource.DataSet.FieldByName('КодРаздела').AsInteger;
if ComboBox1.ItemIndex=-1 then
  begin
    Edit1.Text:='';
    Edit1.Visible:=false;
    label2.Visible:=false;
    Panel2.Visible:=false;

  end;
end;

end.
