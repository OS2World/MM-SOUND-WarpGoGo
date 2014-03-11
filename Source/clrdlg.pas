Unit ClrDlg;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Type
  TClrForm = Class (TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Procedure Button1OnClick (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  ClrForm: TClrForm;

Implementation

Procedure TClrForm.Button1OnClick (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TClrForm, TLabel, TButton]);
End.
