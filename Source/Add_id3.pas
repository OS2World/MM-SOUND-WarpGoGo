Unit Add_id3;

Interface

Uses
  Classes,Dialogs, Forms, Graphics, StdCtrls, Buttons, ID3, Main, SysUtils;

Type
  TForm2 = Class (TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit4: TEdit;
    Label6: TLabel;
    Flagg : Boolean;
    Procedure Button1OnClick (Sender: TObject);
    Procedure Form2OnCreate (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  Form2: TForm2;

Implementation

Procedure TForm2.Button1OnClick (Sender: TObject);
var i,j:integer;
Begin
 for j:=0 to MainForm.ListBox1.Items.Count-1 do
 begin
    if (ExtractFilePath(MainForm.ListBox1.Items.Strings[j])=MainForm.ChangeDirDialog1.Directory+'\') or (Flagg) then
    With ID3Tags[j] do
     begin
          TAG[0]:='T';TAG[1]:='A';Tag[2]:='G';
          For i:=1 to 30 do
          begin
              If Length(Edit2.Text)>=i Then Album[i-1]:=Edit2.Text[i] else Album[i-1]:=' ';
              If Length(Edit1.Text)>=i Then Artist[i-1]:=Edit1.Text[i] Else Artist[i-1]:=' ';
              If Length(Edit4.Text)>=i Then Comment[i-1]:=Edit4.Text[i] Else Comment[i-1]:=' ';
          end;
          For i:=1 to 4 do if length(Edit3.Text)>=i then Year[i-1]:=Edit3.Text[i] else Year[i-1]:=' ';
          Genre:=ComboBox1.ItemIndex;
     end;
 end;
 End;

Procedure TForm2.Form2OnCreate (Sender: TObject);
var i: integer;
Begin
     for i:=0 to MaxId3Genre do
     ComboBox1.Items.Add(Id3Genre[i]);
     ComboBox1.ItemIndex:=0;
     Flagg:=False;
End;

Initialization
  RegisterClasses ([TForm2, TLabel, TEdit, TComboBox, TButton]);
End.
