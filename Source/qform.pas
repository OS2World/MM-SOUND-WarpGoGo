Unit QForm;

Interface

Uses
  Classes, Forms, Graphics, Buttons, StdCtrls;

Type
  TQuitForm = Class (TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Procedure QuitFormOnCreate (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  QuitForm: TQuitForm;

Implementation

Procedure TQuitForm.QuitFormOnCreate (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TQuitForm, TButton, TLabel]);
End.
