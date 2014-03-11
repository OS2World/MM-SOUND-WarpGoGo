Program WarpGoGo;

Uses
  Forms, Graphics, Main, ClrDlg, Settings, QForm, About;

{$r GoGO.scu}

Begin
  Application.Create;
  Application.CreateForm (TMainForm, MainForm);
  Application.Run;
  Application.Destroy;
End.
