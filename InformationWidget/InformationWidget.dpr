Program InformationWidget;





{$R *.dres}

uses
  Vcl.Forms,
  windows,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  WindowsDarkMode in 'Units\WindowsDarkMode\WindowsDarkMode.pas',
  Unit_About in 'Unit_About\Unit_About.pas' {Form8},
  CPUUsageMonitor in 'Units\CPUUsageMonitor\CPUUsageMonitor.pas',
  Unit_Settings in 'Unit_Settings\Unit_Settings.pas' {Form2},
  Translation in 'Units\Translation\Translation.pas',
  Unit_Update in 'Unit_Update\Unit_Update.pas' {Form10},
  FileInfoUtils in 'Units\FileInfoUtils\FileInfoUtils.pas';

{$R *.res}

Var
  HM: THandle;

Function Check: boolean;
Begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Information Widget');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Information Widget');
End;

Begin
  If Check Then
    exit;
  SetThreadLocale(1049);
  Application.CreateHandle;
  Application.Initialize;
  Application.Title := 'Information Widget';
  Application.CreateForm(TForm1, Form1);
  Form1.Visible := false;
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm10, Form10);
  Form1.LoadLanguage;
  Form1.CleanTranslationsLikeGlobload;
  Form1.Globload;
  Form2.LoadNastr;
  If Not Form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption), Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Form1.Timer1.Enabled := true;
  Application.Run;

End.

