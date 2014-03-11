Unit About;

Interface

Uses
  Classes, Forms, Graphics, Buttons, StdCtrls, ExtCtrls;

Type
  TAboutForm = Class (TForm)
    Button1: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Procedure Label3OnClick (Sender: TObject);
  Private
    {Insert private declarations here}
  Public
    {Insert public declarations here}
  End;

Var
  AboutForm: TAboutForm;

Implementation

Procedure TAboutForm.Label3OnClick (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TAboutForm, TButton, TBevel, TLabel, TImage]);
End.
