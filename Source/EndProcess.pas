Unit EndProcess;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, Buttons, ExtCtrls;

Type
  TForm3 = Class (TForm)
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    Procedure Form3OnCreate (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  Form3: TForm3;

Implementation

Procedure TForm3.Form3OnCreate (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TForm3, TLabel, TButton, TImage]);
End.
