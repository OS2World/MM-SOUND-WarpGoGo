Program warpgogo;

Uses
  Forms, Graphics, Main, ClrDlg, Settings, QForm, About, Eraser, Add_id3, EndProcess;

{$r warpgogo.scu}

Begin
  Application.Create;
  Application.CreateForm (TMainForm, MainForm);
  Application.Run;
  Application.Destroy;
End.
