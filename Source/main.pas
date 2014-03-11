Unit Main;

Interface

Uses
  Classes, Forms, Graphics, ExtCtrls, StdCtrls, Buttons, Dialogs, DualList,
  FileCtrl, Execute, SysUtils, ComCtrls,ClrDlg,Settings, MMedia,QForm,About,Eraser,ID3,
  Mask, Clocks, EndProcess;

Type
  TMainForm = Class (TForm)
    Menu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    Panel1: TPanel;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    ChangeDirDialog1: TChangeDirDialog;
    FileListBox1: TFileListBox;
    Edit1: TEdit;
    ListBox2: TListBox;
    MenuItem11: TMenuItem;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Image15: TImage;
    Image8: TImage;
    Image9: TImage;
    Image12: TImage;
    Image10: TImage;
    Image11: TImage;
    Image13: TImage;
    Image14: TImage;
    FillButton: TButton;
    edYear: TEdit;
    cbGenre: TComboBox;
    edComment: TEdit;
    edAlbum: TEdit;
    edArtist: TEdit;
    edTitle: TEdit;
    Edit6: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Panel2: TPanel;
    MenuItem16: TMenuItem;
    MenuItem15: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    MenuItem14: TMenuItem;
    MenuItem13: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem12: TMenuItem;
    OpenDialog2: TOpenDialog;
    Label1: TLabel;
    Button1: TButton;
    MenuItem6: TMenuItem;
    MenuItem5: TMenuItem;
//    Form3.TForm;
    AbsPath: String;
    IsCoding: Boolean;
    Procedure Label18OnClick (Sender: TObject);
    Procedure Label19OnClick (Sender: TObject);
    Procedure FillButtonOnClick (Sender: TObject);
    Procedure Edit2OnExit (Sender: TObject);
    Procedure Panel1OnClick (Sender: TObject);
    Procedure Label7OnClick (Sender: TObject);
    Procedure Label4OnClick (Sender: TObject);
    Procedure ListBox1OnClick (Sender: TObject);
    Procedure Panel2OnClick (Sender: TObject);
    Procedure MenuItem10OnClick (Sender: TObject);
    Procedure MenuItem4OnClick (Sender: TObject);
    Procedure MainFormOnCloseQuery (Sender: TObject; Var CanClose: Boolean);
    Procedure Button3OnClick (Sender: TObject);
    Procedure MainFormOnCreate (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure StopButtonOnClick (Sender: TObject);
    Procedure PlayButtonOnClick (Sender: TObject);
    Procedure DestButtonOnClick (Sender: TObject);
    Procedure ListBox1OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure AddDirButtonOnClick (Sender: TObject);
    Procedure DelButtonOnClick (Sender: TObject);
    Procedure AddButtonOnClick (Sender: TObject);
    Procedure SettingsClick ;
    Procedure EraseWaves;
    Procedure ClearID3;
    Procedure ID3FromEdits;
    Procedure EditsFromID3;

  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

 Function AddDest (S:String) : String;

Var
  MainForm: TMainForm;
  ID3Tags : array [0..255] of ID3Rec;

Implementation


Uses Add_id3;




Procedure TMainForm.Label18OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.Label19OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.FillButtonOnClick (Sender: TObject);
Begin
    If ListBox1.Items.Count>0 then
    begin
     Form2.Label1.Caption:='Add ID3 tags for files from list?';
     Form2.Flagg:=True;
     Form2.ShowModal;
     EditsFromID3;
    end;
End;

Procedure TMainForm.Edit2OnExit (Sender: TObject);
var j:byte;
Begin
    ID3FromEdits;
End;


Procedure TMainForm.ID3FromEdits;
var i: integer;

function Space (Kvo : byte) : String;
var ss:string;
begin
     ss:='';
     For Kvo:=1 to kvo do ss:=ss+' ';
end;

begin
     If ListBox1.Items.Count>0 then
     begin
{     edTitle.Text:=edTitle.Text+Space(30-length(edTitle.Text));
     edAlbum.Text:=edAlbum.Text+Space(30-length(edAlbum.Text));
     edComment.Text:=edComment.Text+Space(30-length(edComment.Text));
     edArtist.Text:=edArtist.Text+Space(30-length(edArtist.Text));
     edYear.Text:=edYear.Text+Space(4-length(edYear.Text));

     ShowMessage(edTitle.Text+'!'+IntToStr(LengTh(edTitle.Text)));}
     With ID3Tags[ListBox1.ItemIndex] do
     begin
          TAG[0]:='T';TAG[1]:='A';Tag[2]:='G';
          For i:=1 to 30 do
          begin
              If Length(edTitle.Text)>=i then Title[i-1]:=edTitle.Text[i] else Title[i-1]:=' ';
              If Length(edAlbum.Text)>=i Then Album[i-1]:=edAlbum.Text[i] else Album[i-1]:=' ';
              If Length(edArtist.Text)>=i Then Artist[i-1]:=edArtist.Text[i] Else Artist[i-1]:=' ';
              If Length(edComment.Text)>=i Then Comment[i-1]:=edComment.Text[i] Else Comment[i-1]:=' ';
          end;
          For i:=1 to 4 do if length(edYear.Text)>=i then Year[i-1]:=edYear.Text[i] else Year[i-1]:=' ';
          Genre:=cbGenre.ItemIndex;
     end;
     end;
end;


Procedure TMainForm.EditsFromID3;
var i: byte;
    s1,s2,s3,s4,s5 :string;
begin
     s1:='';s2:='';s3:='';s4:='';s5:='';

     With ID3Tags[ListBox1.ItemIndex] do
     begin
          if Tag[0]='T' then
          begin
          For i:=0 to 29 do
          begin
             s1:=s1+Title[i];
             s2:=s2+Artist[i];
             s3:=s3+Album[i];
             s4:=s4+Comment[i];
          end;
          for i:=0 to 3 do s5:=s5+Year[i];
          end;
          edTitle.Text:=s1;
          edArtist.Text:=s2;
          edAlbum.Text:=s3;
          edComment.Text:=s4;
          edYear.Text:=s5;
          cbGenre.ItemIndex:=Genre;
     end;
end;


Procedure TMainForm.ClearID3;
var i,j: byte;
Begin

     For i:=0 to 255 do
     begin
     with ID3Tags[i] do
     begin
          Tag[0]:=' ';
          Tag[1]:=' ';
          Tag[2]:=' ';
          for j:=0 to 29 do
          begin
               Title[j]:=' ';
               Artist[j]:=' ';
               Comment[j]:=' ';
               Album[j]:=' ';
          end;
          For j:=0 to 3 do Year[j]:=' ';
          Genre:=0;
     end;
     end;

End;




Procedure TMainForm.Panel1OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.Label7OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.Label4OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.ListBox1OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.Panel2OnClick (Sender: TObject);
Begin

End;

Procedure TMainForm.MenuItem10OnClick (Sender: TObject);
Begin
     Close;
End;

Procedure TMainForm.MenuItem4OnClick (Sender: TObject);
Begin
     AboutForm.ShowModal;
End;

Procedure TMainForm.MainFormOnCloseQuery (Sender: TObject;
  Var CanClose: Boolean);
Begin

          If not(IsCoding) then
          begin
             if QuitForm.ShowModal=cmOk then
             begin
                 MediaPlayer1.Stop;
                 CanClose:=True;
             end
             else
               CanClose:=False ;
          end
          else
              CanClose:=False ;


End;

Procedure TMainForm.Button3OnClick (Sender: TObject);
var mr :LongWord;
i: byte;
Begin
   mr:=ClrForm.ShowModal;
   If mr=cmOk then
   begin
//        Edit1.Text:='';
        ListBox1.Items.Clear;
        ListBox2.Items.Clear;
        ClearID3;
     edTitle.Enabled:=ListBox1.Items.Count>0;
     edComment.Enabled:=ListBox1.Items.Count>0;
     edArtist.Enabled:=ListBox1.Items.Count>0;
     edAlbum.Enabled:=ListBox1.Items.Count>0;
     edYear.Enabled:=ListBox1.Items.Count>0;
     cbGenre.Enabled:=ListBox1.Items.Count>0;
     MediaPlayer1.Stop;
     MediaPlayer1.Close;
     end;
End;

Procedure TMainForm.EraseWaves;
VAR MR:LongWord;
    CanDelete : boolean;
    i: Integer;
begin
   mr:=EraseForm.ShowModal;
   If mr=cmOk then
   begin
   For i:=0 to ListBox1.Items.Count-1 do
     begin
          CanDelete:=DeleteFile(ListBox1.Items.Strings[i]);
          If not(CanDelete) then ShowMessage('Can''t delete file '+ListBox1.Items.Strings[i]);
     end;
        ListBox1.Items.Clear;
        ListBox2.Items.Clear;
        ClearID3;
   end
   else Button3OnClick (MainForm);
   edTitle.Enabled:=ListBox1.Items.Count>0;
   edComment.Enabled:=ListBox1.Items.Count>0;
   edArtist.Enabled:=ListBox1.Items.Count>0;
   edAlbum.Enabled:=ListBox1.Items.Count>0;
   edYear.Enabled:=ListBox1.Items.Count>0;
   cbGenre.Enabled:=ListBox1.Items.Count>0;
end;



Procedure TMainForm.MainFormOnCreate (Sender: TObject);
var i:byte;
Begin
     AbsPath:=ExpandFileName('gogo236.exe');
     MediaPlayer1.FileName:='';
     Edit1.Text:='C:\';
     ClearId3;
     {Тут нада уставить }
     for i:=0 to MaxId3Genre do
     cbGenre.Items.Add(Id3Genre[i]);
     cbGenre.ItemIndex:=0;
     edTitle.Enabled:=ListBox1.Items.Count>0;
     edComment.Enabled:=ListBox1.Items.Count>0;
     edArtist.Enabled:=ListBox1.Items.Count>0;
     edAlbum.Enabled:=ListBox1.Items.Count>0;
     edYear.Enabled:=ListBox1.Items.Count>0;
     cbGenre.Enabled:=ListBox1.Items.Count>0;
     // ShowMessage(AbsPath);
End;

Procedure TMainForm.Button2OnClick (Sender: TObject);
var s,s_par,s_prop : string;
    i: byte;

Begin
    s:=AbsPath;
    S_prop:= OptForm.WriteStrProp;
    MediaPlayer1.Stop;
    MediaPlayer1.Close;
    If ListBox1.Items.Count>0 Then
    begin
    IsCoding :=True;
    ProgressBar1.Max:=ListBox1.Items.Count;
    ProgressBar1.Visible:=True;
    Panel2.Visible:=True;
    Button2.Visible:=False;
    Image8.Enabled:=False;
    Image9.Enabled:=False;
    Image12.Enabled:=False;
    Image10.Enabled:=False;
    Image11.Enabled:=False;
    Image13.Enabled:=False;
    Image14.Enabled:=False;
    MenuItem16.Enabled:=False;
    MenuItem5.Enabled:=False;
    MenuItem2.Enabled:=False;
    MenuItem10.Enabled:=False;
    MenuItem8.Enabled:=False;
    MenuItem11.Enabled:=False;
    MenuItem6.Enabled:=False;
    edTitle.Enabled:=False;
    edArtist.Enabled:=False;
    edAlbum.Enabled:=False;
    edComment.Enabled:=False;
    cbGenre.Enabled:=False;
    edYear.Enabled:=False;
    FillButton.Enabled:=False;
    MenuItem12.Enabled:=False;
    MenuItem14.Enabled:=False;
    For i:=0 to ListBox1.Items.Count-1 do
     begin
//          s_par:= '"'+ListBox1.Items.Strings[i]+'"'+' '+s_prop+' '+'-silent'+' '+'"'+(ConcatFileName(Edit1.Text,ListBox2.Items.Strings[i]))+'"';
          s_par:= '"'+ListBox1.Items.Strings[i]+'"'+' '+s_prop+' '+'"'+(ConcatFileName(Edit1.Text,ListBox2.Items.Strings[i]))+'"';
          ProgressBar1.Caption:='Coding File: '+ExtractFileName(ListBox1.Items.Strings[i]);
//          ShowMessage(s_par);
          RunProgram(s,s_par);
          WriteID3Tag((ConcatFileName(Edit1.Text,ListBox2.Items.Strings[i])),ID3TAGS[i]);
          ProgressBar1.Position:=ProgressBar1.Position+1;
     end;
     ProgressBar1.Visible:=False;
     Button2.Visible:=True;
     IsCoding:=False;
     Panel2.Visible:=False;
     ProgressBar1.Position:=0;
     Image8.Enabled:=True;
     Image9.Enabled:=True;
     Image12.Enabled:=True;
     Image10.Enabled:=True;
     Image11.Enabled:=True;
     Image13.Enabled:=True;
     Image14.Enabled:=True;
     MenuItem16.Enabled:=True;
     MenuItem5.Enabled:=True;
     MenuItem2.Enabled:=True;
     MenuItem10.Enabled:=True;
     MenuItem8.Enabled:=True;
     MenuItem11.Enabled:=True;
     MenuItem6.Enabled:=True;
     edTitle.Enabled:=True;
     edArtist.Enabled:=True;
     edAlbum.Enabled:=True;
     edComment.Enabled:=True;
     cbGenre.Enabled:=True;
     edYear.Enabled:=True;
     FillButton.Enabled:=True;
     MenuItem12.Enabled:=True;
     MenuItem14.Enabled:=True;
     Form3.ShowModal;
//     ShowMessage('Encoding finished!');
//     Button3OnClick(Sender);
     EraseWaves;
     end;
End;


Procedure TMainForm.StopButtonOnClick (Sender: TObject);
Begin
     MediaPlayer1.Stop;
     MenuItem12.Enabled:=True;
     MenuItem14.Enabled:=True;
End;

Procedure TMainForm.PlayButtonOnClick (Sender: TObject);
Begin
     If ListBox1.ItemIndex>=0 then
     begin
          MenuItem12.Enabled:=False;
          MenuItem14.Enabled:=False;
          MediaPlayer1.FileName:='"'+ListBox1.Items.Strings[ListBox1.ItemIndex]+'"';
          MediaPlayer1.Open;
          MediaPlayer1.Play;

     end;

End;

Procedure TMainForm.DestButtonOnClick (Sender: TObject);
Begin
  ChangeDirDialog1.Caption:='Change Dir';
  ChangeDirDialog1.OkName:='Change';
  If ChangeDirDialog1.Execute Then
  begin
      Edit1.Text:=ChangeDirDialog1.Directory;
  end;
End;

Procedure TMainForm.ListBox1OnItemFocus (Sender: TObject; Index: LongInt);
Begin
//   Edit1.Text:=(ListBox2.Items.Strings[ListBox1.ItemIndex]);
     EditsFromID3;
End;

Procedure TMainForm.AddDirButtonOnClick (Sender: TObject);
var i:integer;
    ss:string;
Begin
  ChangeDirDialog1.Caption:='Add Dir';
  ChangeDirDialog1.OkName:='Add';
  If ChangeDirDialog1.Execute Then
  begin
       FileListBox1.Directory:=ChangeDirDialog1.Directory;
       For i:=0 to FileListBox1.Items.Count-1 do
       begin
           ss:=ConcatFileName(ChangeDirDialog1.Directory,FileListBox1.Items.Strings[i]);
           ListBox1.Items.Add(ss);
           ListBox2.Items.Add(AddDest(FileListBox1.Items.Strings[i]));
//           Edit1.Text:=ChangeDirDialog1.Directory;
       end;
       if ListBox1.Items.Count>0 then
       begin
          Form2.Label1.Caption:='Add ID3 tags for files from this directory?';
          Form2.Flagg:=True;
          Form2.ShowModal;
       end;
       ListBox1.ItemIndex:=0;
       EditsFromID3;

  end;

     edTitle.Enabled:=ListBox1.Items.Count>0;
     edComment.Enabled:=ListBox1.Items.Count>0;
     edArtist.Enabled:=ListBox1.Items.Count>0;
     edAlbum.Enabled:=ListBox1.Items.Count>0;
     edYear.Enabled:=ListBox1.Items.Count>0;
     cbGenre.Enabled:=ListBox1.Items.Count>0;
End;

Procedure TMainForm.DelButtonOnClick (Sender: TObject);
var i:byte;
Begin
     with ListBox1 do
        If ItemIndex>=0 then begin
        For i:=ItemIndex to 254 do
          ID3Tags[i]:=ID3Tags[i+1];

           ListBox2.Items.Delete(ItemIndex);
           Items.Delete(ItemIndex);

        end;
     EditsFromID3;

     edTitle.Enabled:=ListBox1.Items.Count>0;
     edComment.Enabled:=ListBox1.Items.Count>0;
     edArtist.Enabled:=ListBox1.Items.Count>0;
     edAlbum.Enabled:=ListBox1.Items.Count>0;
     edYear.Enabled:=ListBox1.Items.Count>0;
     cbGenre.Enabled:=ListBox1.Items.Count>0;
End;

Procedure TMainForm.AddButtonOnClick (Sender: TObject);
var I : Integer;
Begin
     If OpenDialog1.Execute Then
     begin
        ListBox1.Items.Add(OpenDialog1.FileName);
        ListBox2.Items.Add(AddDest(ExtractFileName(OpenDialog1.FileName)));
//        Edit1.Text:=ExtractFilePath(OpenDialog1.FileName);
        ListBox1.ItemIndex:=0;
     end;
     edTitle.Enabled:=ListBox1.Items.Count>0;
     edComment.Enabled:=ListBox1.Items.Count>0;
     edArtist.Enabled:=ListBox1.Items.Count>0;
     edAlbum.Enabled:=ListBox1.Items.Count>0;
     edYear.Enabled:=ListBox1.Items.Count>0;
     cbGenre.Enabled:=ListBox1.Items.Count>0;
End;

Function AddDest(S: String):String ;
var i : Integer;
begin
     i:=Length(S);
     S[i]:='3';S[i-1]:='p';S[i-2]:='m';
     AddDest:=S;
end;


Procedure TMainForm.SettingsClick;
begin
     OptForm.ShowModal;
end;



Initialization
  RegisterClasses ([TMainForm, TMainMenu, TMenuItem, TPanel, TListBox, TButton,
    TOpenDialog, TChangeDirDialog, TFileListBox, TLabel, TEdit,
    TProgressBar, TPopupMenu, TMediaPlayer, TImage, TGroupBox,
    TComboBox]);
End.
