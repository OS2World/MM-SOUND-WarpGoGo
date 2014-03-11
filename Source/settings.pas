Unit Settings;

Interface

Uses
  Classes, Forms, Graphics, ExtCtrls, Buttons, StdCtrls, ComCtrls,SysUtils,Dialogs,
  Seven;

Type
  TOptForm = Class (TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Bevel3: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox3: TCheckBox;
    RadioGroup1: TRadioGroup;
    Label7: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    TrackBar1: TTrackBar;
    Label4: TLabel;

    UseVBR : Boolean;
    BitRate : LongInt;
    VBRQuality :LongInt;
    Riff :Boolean;
    DisPsycho :Boolean;
    VBRMin: LongInt;
    VBRMax: LongInt;
    ModeCod : LongInt;
    PsychoType : Integer;

    Procedure CheckBox1OnClick (Sender: TObject);
    Procedure RadioGroup1OnClick (Sender: TObject);
    Procedure Label4OnClick (Sender: TObject);
    Procedure CheckBox2OnClick (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure OptFormOnCreate (Sender: TObject);
    Procedure SetProp;
    Function GetProp : String;
    Function WriteStrProp : String;

  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  OptForm: TOptForm;

Implementation

Procedure TOptForm.CheckBox1OnClick (Sender: TObject);

Begin
     RadioGroup1.Enabled:=Not(CheckBox1.Checked);
     If CheckBox1.Checked then RadioGroup1.ItemIndex:=-1;
End;

Procedure TOptForm.RadioGroup1OnClick (Sender: TObject);
Begin

End;

Procedure TOptForm.Label4OnClick (Sender: TObject);
Begin

End;

Procedure TOptForm.CheckBox2OnClick (Sender: TObject);
Begin
     ListBox1.Enabled:=CheckBox2.Checked;
     ListBox2.Enabled:=CheckBox2.Checked;
     ListBox3.Enabled:=Not(CheckBox2.Checked);
     Label3.Enabled:=Not(CheckBox2.Checked);
     Label1.Enabled:=CheckBox2.Checked;
     Label2.Enabled:=CheckBox2.Checked;
End;


Procedure TOptForm.Button2OnClick (Sender: TObject);
Begin
  SetProp;
End;

Procedure TOptForm.Button1OnClick (Sender: TObject);
var S: String;
Begin
  S:=GetProp;
  SetProp;
End;


Procedure TOptForm.OptFormOnCreate (Sender: TObject);
Begin
     UseVBR:=False;
     VBRMin:= 96;
     VBRMax:=224;
     VBRQuality:=4;
     DisPsycho:=True;
     ModeCod:=2;
     BitRate:=128;
     Riff:=False;
     PsychoType:=-1;
     CheckBox1.Checked:=True;
     ListBox1.Enabled:=CheckBox2.Checked;
     ListBox2.Enabled:=CheckBox2.Checked;
     Label1.Enabled:=CheckBox2.Checked;
     Label2.Enabled:=CheckBox2.Checked;
     ListBox3.Enabled:=Not(CheckBox2.Checked);
     Label3.Enabled:=Not(CheckBox2.Checked);
     RadioGroup1.Enabled:=Not(CheckBox1.Checked);
     If CheckBox1.Checked then RadioGroup1.ItemIndex:=-1;
     SetProp;
End;

Procedure TOptForm.SetProp;  //Set Defaults Properties
begin
    Case ModeCod of
        0 : RadioButton1.Checked:=True;
        1 : RadioButton2.Checked:=True;
        2 : RadioButton3.Checked:=True;
    end;
    CheckBox1.Checked:=DisPsycho;
    CheckBox3.Checked:=Riff;
    RadioGroup1.Enabled:=Not(DisPsycho);
    RadioGroup1.ItemIndex:=PsychoType;
    TrackBar1.Position:=VBRQuality;
    ListBox3.ItemIndex:=ListBox3.Items.IndexOf(IntToStr(BitRate));
    CheckBox2.Checked:=UseVBR;
    ListBox1.Enabled:=CheckBox2.Checked;
    ListBox2.Enabled:=CheckBox2.Checked;
    ListBox1.ItemIndex:=ListBox1.Items.IndexOf(IntToStr(VBRMin));
    ListBox2.ItemIndex:=ListBox2.Items.IndexOf(IntToStr(VBRMax));
    ListBox3.Enabled:=Not(CheckBox2.Checked);
end;

Function TOptForm.GetProp: String;
begin
    If RadioButton1.Checked Then ModeCod:=0;
    If RadioButton2.Checked Then ModeCod:=1;
    If RadioButton3.Checked Then ModeCod:=2;

    DisPsycho:=CheckBox1.Checked;
    Riff:=CheckBox3.Checked;
    PsychoType:=RadioGroup1.ItemIndex;
    VBRQuality:=TrackBar1.Position;
    UseVbr:=CheckBox2.Checked;
    VBRMin:=StrToInt(ListBox1.Items.Strings[ListBox1.ItemIndex]);
    VBRMax:=StrToInt(ListBox2.Items.Strings[ListBox2.ItemIndex]);
    BitRate:=StrToInt(ListBox3.Items.Strings[ListBox3.ItemIndex]);
end;

Function TOptForm.WriteStrProp: String;
var S: String;
begin
   Case ModeCod of
       0: s:=' -m m ';
       1: s:=' -m s ';
       2: s:=' -m j ';
   end;
   If DisPsycho Then s:=s+'-nopsy '
   else
   case PsychoType of
      0 : begin
              s:=s+'-emp 5 ';
              end;
      1 : begin
              s:=s+'-emp c ';
              end;
   end;

   If Riff Then s:=s+'-riff rmp ';
   If UseVbr then
   begin
        s:=s+'-v '+IntToStr(VBRQuality)+' ';
        s:=s+'-vb '+IntToStr(VBRMin)+' '+IntToStr(VBRMax);
   end else s:=s+'-b '+IntToStr(BitRate);

   WriteStrProp:=s;
end;


Initialization
  RegisterClasses ([TOptForm, TCheckBox, TLabel, TBevel,
    TTrackBar, TButton, TRadioButton, TListBox, TRadioGroup]);
End.
