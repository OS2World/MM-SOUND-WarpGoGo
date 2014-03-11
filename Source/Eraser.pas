Unit Eraser;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons;

Type
  TEraseForm = Class (TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Procedure Button1OnClick (Sender: TObject);
    Procedure Label1OnClick (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  EraseForm: TEraseForm;

Implementation

Procedure TEraseForm.Button1OnClick (Sender: TObject);
Begin

End;

Procedure TEraseForm.Label1OnClick (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TEraseForm, TLabel, TButton]);
End.
