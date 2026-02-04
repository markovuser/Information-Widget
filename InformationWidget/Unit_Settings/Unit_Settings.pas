Unit Unit_Settings;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, ShellApi, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, WindowsDarkMode, IniFiles, Registry, Vcl.Samples.Spin, Vcl.Grids,
  Vcl.Buttons, Vcl.Menus, System.UITypes, System.Types, Math;

Type
  TForm2 = Class(TForm)
    TabControlButtons: TTabControl;
    ButtonSave: TButton;
    TabControlBody: TTabControl;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    TabControl3: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    CheckBoxColorTrayIcon: TCheckBox;
    ColorBoxNumber: TColorBox;
    GroupBox3: TGroupBox;
    RadioButtonDefaultPosition: TRadioButton;
    RadioButtonLastPosition: TRadioButton;
    GroupBox4: TGroupBox;
    CheckBoxAutostart: TCheckBox;
    TabControl4: TTabControl;
    GroupBoxComputerName: TGroupBox;
    CheckBoxComputerName: TCheckBox;
    ComputerNameFontSize: TSpinEdit;
    CheckComputerNameFontBold: TCheckBox;
    GroupBoxIP: TGroupBox;
    CheckBoxIP: TCheckBox;
    CheckIPFontBold: TCheckBox;
    IPFontSize: TSpinEdit;
    TabControl5: TTabControl;
    GroupBoxCPU: TGroupBox;
    CheckBoxCPU: TCheckBox;
    CPUFontSize: TSpinEdit;
    CheckCPUFontBold: TCheckBox;
    GroupBoxRAM: TGroupBox;
    CheckBoxRAM: TCheckBox;
    RAMFontSize: TSpinEdit;
    CheckRAMFontBold: TCheckBox;
    TabControl6: TTabControl;
    GroupBoxDateTime: TGroupBox;
    CheckBoxDateTime: TCheckBox;
    DateTimeFontSize: TSpinEdit;
    CheckDateTimeFontBold: TCheckBox;
    GroupBoxTime: TGroupBox;
    CheckBoxZero: TCheckBox;
    CheckBoxShowSign: TCheckBox;
    CheckBoxShowSeconds: TCheckBox;
    TabControl7: TTabControl;
    GroupBoxDate: TGroupBox;
    CheckBoxDate: TCheckBox;
    DateFontSize: TSpinEdit;
    CheckDateFontBold: TCheckBox;
    GroupBoxDay: TGroupBox;
    CheckBoxDay: TCheckBox;
    DayFontSize: TSpinEdit;
    CheckDayFontBold: TCheckBox;
    TabControl8: TTabControl;
    GroupBoxBattery: TGroupBox;
    CheckBoxBattery: TCheckBox;
    BatteryFontSize: TSpinEdit;
    CheckBatteryFontBold: TCheckBox;
    GroupBoxWindowsVersion: TGroupBox;
    CheckBoxWindowsVersion: TCheckBox;
    WindowsVersionFontSize: TSpinEdit;
    CheckBoxFullWindowsVersion: TCheckBox;
    RadioButtonRight: TRadioButton;
    CheckBoxAutoColor: TCheckBox;
    CheckBoxIgnoreMouse: TCheckBox;
    Procedure FormCreate(Sender: TObject);
    Procedure CheckBoxComputerNameClick(Sender: TObject);
    Procedure CheckBoxIPClick(Sender: TObject);
    Procedure ButtonSaveClick(Sender: TObject);
    Procedure CheckBoxBatteryClick(Sender: TObject);
    Procedure CheckBoxRAMClick(Sender: TObject);
    Procedure CheckBoxCPUClick(Sender: TObject);
    Procedure CheckBoxDateTimeClick(Sender: TObject);
    Procedure RadioButtonDefaultPositionClick(Sender: TObject);
    Procedure RadioButtonLastPositionClick(Sender: TObject);
    Procedure LoadNastr;
    Procedure RestoreStringInfo;
    Procedure CreateAutoStart(Enabled: Boolean);
    Procedure CheckAutoStart;
    Procedure CheckBoxColorTrayIconClick(Sender: TObject);
    Procedure CheckBoxAutostartClick(Sender: TObject);
    Procedure ComputerNameFontSizeChange(Sender: TObject);
    Procedure IPFontSizeChange(Sender: TObject);
    Procedure DateTimeFontSizeChange(Sender: TObject);
    Procedure CPUFontSizeChange(Sender: TObject);
    Procedure ComputerNameFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure IPFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure DateTimeFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure CPUFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure CheckComputerNameFontBoldClick(Sender: TObject);
    Procedure CheckIPFontBoldClick(Sender: TObject);
    Procedure CheckDateTimeFontBoldClick(Sender: TObject);
    Procedure CheckCPUFontBoldClick(Sender: TObject);
    Procedure RAMFontSizeChange(Sender: TObject);
    Procedure CheckRAMFontBoldClick(Sender: TObject);
    Procedure BatteryFontSizeChange(Sender: TObject);
    Procedure CheckBatteryFontBoldClick(Sender: TObject);
    Procedure RAMFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure BatteryFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure CheckBoxWindowsVersionClick(Sender: TObject);
    Procedure ColorBoxNumberClick(Sender: TObject);
    Procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; Var Handled: Boolean);
    Procedure WindowsVersionFontSizeChange(Sender: TObject);
    Procedure WindowsVersionFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure WindowsVersionFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure ComputerNameFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure IPFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure CPUFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure RAMFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure BatteryFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure DateTimeFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure CheckBoxFullWindowsVersionClick(Sender: TObject);
    Procedure CheckBoxDateClick(Sender: TObject);
    Procedure CheckBoxDayClick(Sender: TObject);
    Procedure DateFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure DateFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure DayFontSizeKeyPress(Sender: TObject; Var Key: Char);
    Procedure DayFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Procedure CheckDateFontBoldClick(Sender: TObject);
    Procedure CheckDayFontBoldClick(Sender: TObject);
    Procedure DateFontSizeChange(Sender: TObject);
    Procedure DayFontSizeChange(Sender: TObject);
    Procedure RadioButtonRightClick(Sender: TObject);
    Procedure CheckBoxAutoColorClick(Sender: TObject);
    Procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    Procedure PageControl1MouseLeave(Sender: TObject);
    Function IsMouseIgnored: Boolean;
    Procedure CheckBoxIgnoreMouseClick(Sender: TObject);
  Private
    { Private declarations }

  Public
    { Public declarations }
  Protected

  End;

Var
  Form2: TForm2;
  i: Int64;

Implementation

{$R *.dfm}

Uses
  Unit_Base, Unit_Update;

Function TForm2.IsMouseIgnored: Boolean;
Begin
  Result := CheckBoxIgnoreMouse.Checked;
End;

Procedure TForm2.BatteryFontSizeChange(Sender: TObject);
Begin
  Form1.ELabelBattery.Font.Size := BatteryFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.BatteryFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.BatteryFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;


Function LoadResourceFontByName(Const ResourceName: String; ResType: PChar): Boolean;
Var
  ResStream: TResourceStream;
  FontsCount: DWORD;
Begin
  ResStream := TResourceStream.Create(hInstance, ResourceName, ResType);
  Try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, Nil, @FontsCount) <> 0);
  Finally
    ResStream.Free;
  End;
End;

Function LoadResourceFontByID(ResourceID: Integer; ResType: PChar): Boolean;
Var
  ResStream: TResourceStream;
  FontsCount: DWORD;
Begin
  ResStream := TResourceStream.CreateFromID(hInstance, ResourceID, ResType);
  Try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, Nil, @FontsCount) <> 0);
  Finally
    ResStream.Free;
  End;
End;

Procedure TForm2.ButtonSaveClick(Sender: TObject);
Begin
  //Form1.SaveNastr;
  Form1.SaveControls;
  application.ProcessMessages;
  Form2.Close;
End;

Procedure TForm2.CheckAutoStart;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);

  If (Reg.ValueExists(Application.Title) = TRUE) And (Reg.ReadString(Application.Title) = (ParamStr(0))) Then
  Begin
    Form2.CheckBoxAutostart.Checked := TRUE;
  End;

  If (Reg.ValueExists(Application.Title) = TRUE) And (Reg.ReadString(Application.Title) <> (ParamStr(0))) Then
  Begin
    Form2.CheckBoxAutostart.Checked := false;
  End;

  If Reg.ValueExists(Application.Title) = false Then
  Begin
    Form2.CheckBoxAutostart.Checked := false;
  End;
  Reg.CloseKey;
  Reg.Free;
End;

// Версия Windows
Function Is64BitOS: Boolean;
Var
  IsWow64Process: Function(hProcess: THandle; Var Wow64Process: BOOL): BOOL; Stdcall;
  Wow64Process: BOOL;
Begin
  Result := False;

  // Для современных версий Delphi
  If TOSVersion.Architecture In [arIntelX64, arARM64] Then
    Exit(true);

  // Для старых версий
  IsWow64Process := GetProcAddress(GetModuleHandle('kernel32'), 'IsWow64Process');
  If Assigned(IsWow64Process) Then
  Begin
    Wow64Process := False;
    If IsWow64Process(GetCurrentProcess, Wow64Process) Then
      Result := Wow64Process;
  End;
End;

Function GetWindowsInfoShort: String;
Var
  Reg: TRegistry;
  DisplayVersion: String;
  CurrentBuild, UBR: Integer;
  OSName: String;
  Bitness: String;
Begin
  DisplayVersion := '';
  CurrentBuild := 0;
  UBR := 0;

  Reg := TRegistry.Create(KEY_READ);
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    If Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) Then
    Begin
      DisplayVersion := Reg.ReadString('DisplayVersion');
      CurrentBuild := StrToIntDef(Reg.ReadString('CurrentBuildNumber'), 0);
      UBR := Reg.ReadInteger('UBR');
    End;
  Finally
    Reg.Free;
  End;

  // Определяем версию Windows
  If CurrentBuild >= 22000 Then
    OSName := 'Windows 11'
  Else
    OSName := 'Windows 10';

  // Определяем разрядность
  If Is64BitOS Then
    Bitness := '64'
  Else
    Bitness := '32';

  Result := Trim(Format('%s %s-bit [%s] %d.%d', [OSName, Bitness, DisplayVersion, CurrentBuild, UBR]));
End;

Function GetWindowsInfoShortSmall: String;
Var
  Reg: TRegistry;
  DisplayVersion: String;
  CurrentBuild, UBR: Integer;
  OSName: String;
  Bitness: String;
Begin
  DisplayVersion := '';
  CurrentBuild := 0;
  UBR := 0;

  Reg := TRegistry.Create(KEY_READ);
  Try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    If Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) Then
    Begin
      DisplayVersion := Reg.ReadString('DisplayVersion');
      CurrentBuild := StrToIntDef(Reg.ReadString('CurrentBuildNumber'), 0);
      UBR := Reg.ReadInteger('UBR');
    End;
  Finally
    Reg.Free;
  End;

  // Определяем версию Windows
  If CurrentBuild >= 22000 Then
    OSName := 'Windows 11'
  Else
    OSName := 'Windows 10';

  // Определяем разрядность
  If Is64BitOS Then
    Bitness := '64'
  Else
    Bitness := '32';

  Result := Trim(Format('%s [%s] %d', [OSName, DisplayVersion, UBR]));
End;

Procedure TForm2.LoadNastr;
Var
  Ini: TMemIniFile;
Begin
  // Автозагрузка

  CheckAutoStart;
  Ini := TMemIniFile.Create(Form1.PortablePath);

  Form2.CheckBoxFullWindowsVersion.Checked := Ini.ReadBool('Option', Form2.CheckBoxFullWindowsVersion.Name, false);
  If Form2.CheckBoxFullWindowsVersion.Checked Then
  Begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShort);
  End;
  If Form2.CheckBoxFullWindowsVersion.Checked = false Then
  Begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShortSmall);
  End;
  // Положение окна
  Form2.RadioButtonDefaultPosition.Checked := Ini.ReadBool('Option', Form2.RadioButtonDefaultPosition.Name, false);
  If Form2.RadioButtonDefaultPosition.Checked = TRUE Then
  Begin
    Form2.RadioButtonDefaultPositionClick(self);
  End;

  Form2.RadioButtonLastPosition.Checked := Ini.ReadBool('Option', Form2.RadioButtonLastPosition.Name, false);
  If Form2.RadioButtonLastPosition.Checked = TRUE Then
  Begin
    Form2.RadioButtonLastPositionClick(self);
  End;

  Form2.RadioButtonRight.Checked := Ini.ReadBool('Option', Form2.RadioButtonRight.Name, false);
  If Form2.RadioButtonRight.Checked = TRUE Then
  Begin
    Form2.RadioButtonRightClick(self);
  End;
  // Имя компьютера
  Form2.CheckBoxComputerName.Checked := Ini.ReadBool('Option', Form2.CheckBoxComputerName.Name, false);
  Form2.CheckBoxComputerNameClick(Self);
  If Form2.CheckBoxComputerName.Checked = TRUE Then
  Begin
    Form1.ALabelUserName.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If Form2.CheckBoxComputerName.Checked = false Then
  Begin
    Form1.ALabelUserName.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // IP компьютера
  Form2.CheckBoxIP.Checked := Ini.ReadBool('Option', Form2.CheckBoxIP.Name, false);
  Form2.CheckBoxIPClick(self);
  If Form2.CheckBoxIP.Checked = TRUE Then
  Begin
    Form1.BLabelGetIP.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If Form2.CheckBoxIP.Checked = false Then
  Begin
    Form1.BLabelGetIP.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Дата и время
  Form2.CheckBoxDateTime.Checked := Ini.ReadBool('Option', Form2.CheckBoxDateTime.Name, false);
  Form2.CheckBoxDateTimeClick(self);
  If Form2.CheckBoxDateTime.Checked = TRUE Then
  Begin
    Form1.FLabelDateTime.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If Form2.CheckBoxDateTime.Checked = false Then
  Begin
    Form1.FLabelDateTime.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Батарея
  Form2.CheckBoxBattery.Checked := Ini.ReadBool('Option', Form2.CheckBoxBattery.Name, false);
  Form2.CheckBoxBatteryClick(self);
  If (Form2.CheckBoxBattery.Checked = TRUE) Then
  Begin
    Form1.ELabelBattery.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxBattery.Checked = false) Then
  Begin
    Form1.ELabelBattery.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Опреативная память
  Form2.CheckBoxRAM.Checked := Ini.ReadBool('Option', Form2.CheckBoxRAM.Name, false);
  Form2.CheckBoxRAMClick(Self);
  If (Form2.CheckBoxRAM.Checked = TRUE) Then
  Begin
    Form1.DLabelRAM.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxRAM.Checked = false) Then
  Begin
    Form1.DLabelRAM.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Процессор
  Form2.CheckBoxCPU.Checked := Ini.ReadBool('Option', Form2.CheckBoxCPU.Name, false);
  Form2.CheckBoxCPUClick(self);
  If (Form2.CheckBoxCPU.Checked = TRUE) Then
  Begin
    Form1.CLabelCPU.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxCPU.Checked = false) Then
  Begin
    Form1.CLabelCPU.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Версия Windows
  Form2.CheckBoxWindowsVersion.Checked := Ini.ReadBool('Option', Form2.CheckBoxWindowsVersion.Name, false);
  Form2.CheckBoxWindowsVersionClick(self);
  If (Form2.CheckBoxWindowsVersion.Checked = TRUE) Then
  Begin
    Form1.LabelWindowsVersion.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxWindowsVersion.Checked = false) Then
  Begin
    Form1.LabelWindowsVersion.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

    // Дата
  Form2.CheckBoxDate.Checked := Ini.ReadBool('Option', Form2.CheckBoxDate.Name, false);
  Form2.CheckBoxDateClick(self);
  If (Form2.CheckBoxDate.Checked = TRUE) Then
  Begin
    Form1.GLabelDate.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxDate.Checked = false) Then
  Begin
    Form1.GLabelDate.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

      // День
  Form2.CheckBoxDay.Checked := Ini.ReadBool('Option', Form2.CheckBoxDay.Name, false);
  Form2.CheckBoxDayClick(self);
  If (Form2.CheckBoxDay.Checked = TRUE) Then
  Begin
    Form1.HLabelDay.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;
  If (Form2.CheckBoxDay.Checked = false) Then
  Begin
    Form1.HLabelDay.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  End;

  // Цветная иконка
  Form2.CheckBoxColorTrayIcon.Checked := Ini.ReadBool('Option', Form2.CheckBoxColorTrayIcon.Name, false);
  Try
    If Form2.CheckBoxColorTrayIcon.Checked = TRUE Then
    Begin
      Form1.TrayIcon1.IconIndex := 2;
      application.ProcessMessages;
    End;

    If Form2.CheckBoxColorTrayIcon.Checked = false Then
    Begin
      If DarkModeIsEnabled = TRUE Then
      Begin
        If SystemUsesLightTheme = false Then
          Form1.TrayIcon1.IconIndex := 1;
        If SystemUsesLightTheme = TRUE Then
          Form1.TrayIcon1.IconIndex := 0;
        application.ProcessMessages;
      End;

      If DarkModeIsEnabled = false Then
      Begin
        If SystemUsesLightTheme = TRUE Then
          Form1.TrayIcon1.IconIndex := 0;
        If SystemUsesLightTheme = false Then
          Form1.TrayIcon1.IconIndex := 1;
        application.ProcessMessages;
      End;
    End;
    RestoreStringInfo;
    application.ProcessMessages;
  Except
  End;

  // Блокировка положения окна
  Form2.CheckBoxIgnoreMouse.Checked := Ini.ReadBool('Option', CheckBoxIgnoreMouse.Name, false);
  Form2.CheckBoxIgnoreMouseClick(Self);
  // Размерт шрифта
  WindowsVersionFontSize.Value := Ini.ReadInteger('Option', WindowsVersionFontSize.Name, WindowsVersionFontSize.Value);
  Form2.WindowsVersionFontSizeChange(self);

  ComputerNameFontSize.Value := Ini.ReadInteger('Option', ComputerNameFontSize.Name, ComputerNameFontSize.Value);
  Form2.ComputerNameFontSizeChange(self);

  IPFontSize.Value := Ini.ReadInteger('Option', IPFontSize.Name, IPFontSize.Value);
  Form2.IPFontSizeChange(self);

  DateTimeFontSize.Value := Ini.ReadInteger('Option', DateTimeFontSize.Name, DateTimeFontSize.Value);
  Form2.DateTimeFontSizeChange(self);

  CPUFontSize.Value := Ini.ReadInteger('Option', CPUFontSize.Name, CPUFontSize.Value);
  Form2.CPUFontSizeChange(self);

  RAMFontSize.Value := Ini.ReadInteger('Option', RAMFontSize.Name, RAMFontSize.Value);
  Form2.RAMFontSizeChange(self);

  BatteryFontSize.Value := Ini.ReadInteger('Option', BatteryFontSize.Name, BatteryFontSize.Value);
  Form2.BatteryFontSizeChange(self);

  DateFontSize.Value := Ini.ReadInteger('Option', DateFontSize.Name, DateFontSize.Value);
  Form2.DateFontSizeChange(self);

  DayFontSize.Value := Ini.ReadInteger('Option', DayFontSize.Name, DayFontSize.Value);
  Form2.DayFontSizeChange(self);
  //Bold
  Form2.CheckComputerNameFontBold.Checked := Ini.ReadBool('Option', Form2.CheckComputerNameFontBold.Name, false);
  Form2.CheckComputerNameFontBoldClick(self);

  Form2.CheckIPFontBold.Checked := Ini.ReadBool('Option', Form2.CheckIPFontBold.Name, false);
  Form2.CheckIPFontBoldClick(self);

  Form2.CheckDateTimeFontBold.Checked := Ini.ReadBool('Option', Form2.CheckDateTimeFontBold.Name, false);
  Form2.CheckDateTimeFontBoldClick(self);

  Form2.CheckCPUFontBold.Checked := Ini.ReadBool('Option', Form2.CheckCPUFontBold.Name, false);
  Form2.CheckCPUFontBoldClick(self);

  Form2.CheckRAMFontBold.Checked := Ini.ReadBool('Option', Form2.CheckRAMFontBold.Name, false);
  Form2.CheckRAMFontBoldClick(self);

  Form2.CheckBatteryFontBold.Checked := Ini.ReadBool('Option', Form2.CheckBatteryFontBold.Name, false);
  Form2.CheckBatteryFontBoldClick(self);

  Form2.CheckDateFontBold.Checked := Ini.ReadBool('Option', Form2.CheckDateFontBold.Name, false);
  Form2.CheckDateFontBoldClick(self);

  Form2.CheckDayFontBold.Checked := Ini.ReadBool('Option', Form2.CheckDayFontBold.Name, false);
  Form2.CheckDayFontBoldClick(self);

  Form2.CheckBoxZero.Checked := Ini.ReadBool('Option', Form2.CheckBoxZero.Name, false);
  Form2.CheckBoxShowSign.Checked := Ini.ReadBool('Option', Form2.CheckBoxShowSign.Name, false);
  Form2.CheckBoxShowSeconds.Checked := Ini.ReadBool('Option', Form2.CheckBoxShowSeconds.Name, false);

  //Color
  Form2.CheckBoxAutoColor.Checked := Ini.ReadBool('Option', Form2.CheckBoxAutoColor.Name, false);
  Form2.CheckBoxAutoColorClick(self);

  If Form2.CheckBoxAutoColor.Checked = false Then
  Begin
    Form2.ColorBoxNumber.Selected := Ini.ReadInteger('Option', Form2.ColorBoxNumber.Name, clWhite);
    Form2.ColorBoxNumberClick(Self);
  End;

  Ini.Free;
End;

Procedure TForm2.PageControl1MouseLeave(Sender: TObject);
Begin
  Screen.Cursor := crDefault;
End;

Procedure TForm2.PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var
  TabIndex: Integer;
Begin
  // Проверяем, находится ли курсор над вкладкой
  TabIndex := TPageControl(Sender).IndexOfTabAt(X, Y);

  If TabIndex >= 0 Then
    Screen.Cursor := crHandPoint  // Курсор для вкладок
  Else
    Screen.Cursor := crDefault;   // Обычный курсор
End;

Procedure TForm2.FormCreate(Sender: TObject);
Begin
  Form1.Globload;
  PageControl1.ActivePageIndex := 0;
  OnMouseWheel := FormMouseWheel;
End;

Procedure TForm2.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; Var Handled: Boolean);
Var
  ComponentAtPosition: TControl;
Begin
  // Получаем компонент, находящийся под курсором мыши
  ComponentAtPosition := FindDragTarget(Mouse.CursorPos, False);

  // Проверяем, является ли компонент типом TSpinEdit
  If Assigned(ComponentAtPosition) And (ComponentAtPosition Is TSpinEdit) Then
  Begin
    With TComponent(ComponentAtPosition) As TSpinEdit Do
    Begin
      SetFocus();
      If WheelDelta > 0 Then
        Value := Value + 1
      Else
        Value := Value - 1;

      SelectAll(); // Выделение текста

      Handled := True;
    End;
  End;
End;

Procedure TForm2.IPFontSizeChange(Sender: TObject);
Begin
  Form1.BLabelGetIP.Font.Size := IPFontSize.Value;
  RestoreStringInfo;
End;

Procedure TForm2.IPFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.IPFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure tForm2.CreateAutoStart(Enabled: Boolean);
Var
  Reg: TRegistry;
Begin
  If Enabled = true Then
  Begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);
    Reg.WriteString(Application.Title, ParamStr(0));
    Reg.CloseKey;
    Reg.Free;
  End;

  If Enabled = false Then
  Begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);
    Reg.DeleteValue(Application.Title);
    Reg.CloseKey;
    Reg.Free;
  End;
End;

Procedure TForm2.CheckBoxAutoColorClick(Sender: TObject);
Begin
  ColorBoxNumber.Enabled := Not CheckBoxAutoColor.Checked;
  ColorBoxNumberClick(self);
  Form1.Timer3.Enabled := CheckBoxAutoColor.Checked;
End;

Procedure TForm2.CheckBoxAutostartClick(Sender: TObject);
Begin
  If CheckBoxAutostart.Checked Then
  Begin
    CreateAutoStart(True);
  End
  Else
  Begin
    CreateAutoStart(false);
  End;
End;

Procedure TForm2.CheckBoxBatteryClick(Sender: TObject);
Begin
  BatteryFontSize.Enabled := CheckBoxBattery.Checked;
  CheckBatteryFontBold.Enabled := CheckBoxBattery.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxColorTrayIconClick(Sender: TObject);
Begin
  Try
    If Form2.CheckBoxColorTrayIcon.Checked = TRUE Then
    Begin
      Form1.TrayIcon1.IconIndex := 2;
      application.ProcessMessages;
    End;

    If Form2.CheckBoxColorTrayIcon.Checked = false Then
    Begin
      If DarkModeIsEnabled = TRUE Then
      Begin
        If SystemUsesLightTheme = false Then
          Form1.TrayIcon1.IconIndex := 1;
        If SystemUsesLightTheme = TRUE Then
          Form1.TrayIcon1.IconIndex := 0;
        application.ProcessMessages;
      End;

      If DarkModeIsEnabled = false Then
      Begin
        If SystemUsesLightTheme = TRUE Then
          Form1.TrayIcon1.IconIndex := 0;
        If SystemUsesLightTheme = false Then
          Form1.TrayIcon1.IconIndex := 1;
        application.ProcessMessages;
      End;
    End;
  Except
  End;
End;

Procedure TForm2.RestoreStringInfo;
Begin
  Form1.ClientHeight := 0;
  Form1.ClientHeight := Form1.ClientHeight + 5;
  If Form2.CheckBoxWindowsVersion.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.LabelWindowsVersion.Height;
  End;
  If Form2.CheckBoxComputerName.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.ALabelUserName.Height;
  End;
  If Form2.CheckBoxIP.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.BLabelGetIP.Height;
  End;
  If CheckBoxCPU.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.CLabelCPU.Height;
  End;
  If CheckBoxRAM.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.DLabelRam.Height;
  End;
  If Form2.CheckBoxBattery.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.ELabelBattery.Height;
  End;
  If Form2.CheckBoxDateTime.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.FLabelDateTime.Height;
  End;
  If Form2.CheckBoxDate.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.GLabelDate.Height;
  End;
  If Form2.CheckBoxDay.Checked Then
  Begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.HLabelDay.Height;
  End;
End;

Procedure TForm2.WindowsVersionFontSizeChange(Sender: TObject);
Begin
  Form1.LabelWindowsVersion.Font.Size := WindowsVersionFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.WindowsVersionFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.WindowsVersionFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.CheckBoxComputerNameClick(Sender: TObject);
Begin
  ComputerNameFontSize.Enabled := CheckBoxComputerName.Checked;
  CheckComputerNameFontBold.Enabled := CheckBoxComputerName.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxCPUClick(Sender: TObject);
Begin
  CPUFontSize.Enabled := CheckBoxCPU.Checked;
  CheckCPUFontBold.Enabled := CheckBoxCPU.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxDateClick(Sender: TObject);
Begin
  DateFontSize.Enabled := CheckBoxDate.Checked;
  CheckDateFontBold.Enabled := CheckBoxDate.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxDateTimeClick(Sender: TObject);
Begin
  DateTimeFontSize.Enabled := CheckBoxDateTime.Checked;
  CheckDateTimeFontBold.Enabled := CheckBoxDateTime.Checked;
  CheckBoxZero.Enabled := CheckBoxDateTime.Checked;
  CheckBoxShowSign.Enabled := CheckBoxDateTime.Checked;
  CheckBoxShowSeconds.Enabled := CheckBoxDateTime.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxDayClick(Sender: TObject);
Begin
  DayFontSize.Enabled := CheckBoxDay.Checked;
  CheckDayFontBold.Enabled := CheckBoxDay.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxFullWindowsVersionClick(Sender: TObject);
Begin
  If Form2.CheckBoxFullWindowsVersion.Checked Then
  Begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShort);
  End;
  If Form2.CheckBoxFullWindowsVersion.Checked = false Then
  Begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShortSmall);
  End;
End;

Procedure TForm2.CheckBoxIgnoreMouseClick(Sender: TObject);
Begin
  Form1.UpdateCursorForAllLabels;
End;

Procedure TForm2.CheckBoxIPClick(Sender: TObject);
Begin
  IPFontSize.Enabled := CheckBoxIP.Checked;
  CheckIPFontBold.Enabled := CheckBoxIP.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxRAMClick(Sender: TObject);
Begin
  RAMFontSize.Enabled := CheckBoxRAM.Checked;
  CheckRAMFontBold.Enabled := CheckBoxRAM.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxWindowsVersionClick(Sender: TObject);
Begin
  WindowsVersionFontSize.Enabled := CheckBoxWindowsVersion.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.RAMFontSizeChange(Sender: TObject);
Begin
  Form1.DLabelRAM.Font.Size := RAMFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.RAMFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.RAMFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.DateFontSizeChange(Sender: TObject);
Begin
  Form1.GLabelDate.Font.Size := DateFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.DateFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.DateFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.DateTimeFontSizeChange(Sender: TObject);
Begin
  Form1.FLabelDateTime.Font.Size := DateTimeFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.DateTimeFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.DateTimeFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.DayFontSizeChange(Sender: TObject);
Begin
  Form1.HLabelDay.Font.Size := DayFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.DayFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.DayFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.CheckBatteryFontBoldClick(Sender: TObject);
Begin
  If CheckBatteryFontBold.Checked Then
  Begin
    Form1.ELabelBattery.Font.Style := Form1.ELabelBattery.Font.Style + [fsBold];
  End;

  If CheckBatteryFontBold.Checked = false Then
  Begin
    Form1.ELabelBattery.Font.Style := Form1.ELabelBattery.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckComputerNameFontBoldClick(Sender: TObject);
Begin
  If CheckComputerNameFontBold.Checked Then
  Begin
    Form1.ALabelUserName.Font.Style := Form1.ALabelUserName.Font.Style + [fsBold];
  End;

  If CheckComputerNameFontBold.Checked = false Then
  Begin
    Form1.ALabelUserName.Font.Style := Form1.ALabelUserName.Font.Style - [fsBold];
  End;

End;

Procedure TForm2.CheckCPUFontBoldClick(Sender: TObject);
Begin
  If CheckCPUFontBold.Checked Then
  Begin
    Form1.CLabelCPU.Font.Style := Form1.CLabelCPU.Font.Style + [fsBold];
  End;

  If CheckCPUFontBold.Checked = false Then
  Begin
    Form1.CLabelCPU.Font.Style := Form1.CLabelCPU.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckDateFontBoldClick(Sender: TObject);
Begin
  If CheckDateFontBold.Checked Then
  Begin
    Form1.GLabelDate.Font.Style := Form1.GLabelDate.Font.Style + [fsBold];
  End;

  If CheckDateFontBold.Checked = false Then
  Begin
    Form1.GLabelDate.Font.Style := Form1.GLabelDate.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckDateTimeFontBoldClick(Sender: TObject);
Begin

  If CheckDateTimeFontBold.Checked Then
  Begin
    Form1.FLabelDateTime.Font.Style := Form1.FLabelDateTime.Font.Style + [fsBold];
  End;

  If CheckDateTimeFontBold.Checked = false Then
  Begin
    Form1.FLabelDateTime.Font.Style := Form1.FLabelDateTime.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckDayFontBoldClick(Sender: TObject);
Begin
  If CheckDayFontBold.Checked Then
  Begin
    Form1.HLabelDay.Font.Style := Form1.HLabelDay.Font.Style + [fsBold];
  End;

  If CheckDayFontBold.Checked = false Then
  Begin
    Form1.HLabelDay.Font.Style := Form1.HLabelDay.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckIPFontBoldClick(Sender: TObject);
Begin
  If CheckIPFontBold.Checked Then
  Begin
    Form1.BLabelGetIP.Font.Style := Form1.BLabelGetIP.Font.Style + [fsBold];
  End;

  If CheckIPFontBold.Checked = false Then
  Begin
    Form1.BLabelGetIP.Font.Style := Form1.BLabelGetIP.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.CheckRAMFontBoldClick(Sender: TObject);
Begin
  If CheckRAMFontBold.Checked Then
  Begin
    Form1.DLabelRAM.Font.Style := Form1.DLabelRAM.Font.Style + [fsBold];
  End;

  If CheckRAMFontBold.Checked = false Then
  Begin
    Form1.DLabelRAM.Font.Style := Form1.DLabelRAM.Font.Style - [fsBold];
  End;
End;

Procedure TForm2.ColorBoxNumberClick(Sender: TObject);
Begin
  If CheckBoxAutoColor.Checked = false Then
  Begin

    Form1.LabelWindowsVersion.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.ALabelUserName.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.BLabelGetIP.Font.Color := Form2.ColorBoxNumber.Selected;

    Form1.CLabelCPU.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.DLabelRam.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.ELabelBattery.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.FLabelDateTime.Font.Color := Form2.ColorBoxNumber.Selected;

    Form1.GLabelDate.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.HLabelDay.Font.Color := Form2.ColorBoxNumber.Selected;
  End;
End;

Procedure TForm2.ComputerNameFontSizeChange(Sender: TObject);
Begin
  Form1.ALabelUserName.Font.Size := ComputerNameFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.ComputerNameFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.ComputerNameFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.CPUFontSizeChange(Sender: TObject);
Begin
  Form1.CLabelCPU.Font.Size := CPUFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
End;

Procedure TForm2.CPUFontSizeKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  If Not (Key In [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) Then
  Begin
    Key := 0;
  End;
End;

Procedure TForm2.CPUFontSizeKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := #0;
End;

Procedure TForm2.RadioButtonDefaultPositionClick(Sender: TObject);
Begin
  RadioButtonDefaultPosition.Checked := TRUE;
  RadioButtonLastPosition.Checked := false;
  RadioButtonRight.Checked := false;
 { Form1.Left := Screen.Width - Form1.Width - 20;
  Form1.Top := Screen.Height - Form1.Height - 50;}
End;

Procedure TForm2.RadioButtonLastPositionClick(Sender: TObject);
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  RadioButtonLastPosition.Checked := TRUE;
  RadioButtonDefaultPosition.Checked := false;
  RadioButtonRight.Checked := false;
  Form1.Top := Ini.ReadInteger('Option', 'Top', Form1.Top);
  Form1.Left := Ini.ReadInteger('Option', 'Left', Form1.Left);
  Ini.Free;
End;

Procedure TForm2.RadioButtonRightClick(Sender: TObject);
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  RadioButtonLastPosition.Checked := false;
  RadioButtonDefaultPosition.Checked := false;
  RadioButtonRight.Checked := TRUE;
  Form1.Top := Ini.ReadInteger('Option', 'Top', Form1.Top);
  //Form1.Left := Screen.Width - Form1.Width - 10;
  Ini.Free;
End;

End.

