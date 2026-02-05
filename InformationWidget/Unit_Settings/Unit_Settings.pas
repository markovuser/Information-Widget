unit Unit_Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellApi, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, WindowsDarkMode, IniFiles, Registry,
  Vcl.Samples.Spin, Vcl.Grids, Vcl.Buttons, Vcl.Menus, System.UITypes,
  System.Types, Math;

type
  TForm2 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxComputerNameClick(Sender: TObject);
    procedure CheckBoxIPClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure CheckBoxBatteryClick(Sender: TObject);
    procedure CheckBoxRAMClick(Sender: TObject);
    procedure CheckBoxCPUClick(Sender: TObject);
    procedure CheckBoxDateTimeClick(Sender: TObject);
    procedure RadioButtonDefaultPositionClick(Sender: TObject);
    procedure RadioButtonLastPositionClick(Sender: TObject);
    procedure LoadNastr;
    procedure RestoreStringInfo;
    procedure CreateAutoStart(Enabled: Boolean);
    procedure CheckAutoStart;
    procedure CheckBoxColorTrayIconClick(Sender: TObject);
    procedure CheckBoxAutostartClick(Sender: TObject);
    procedure ComputerNameFontSizeChange(Sender: TObject);
    procedure IPFontSizeChange(Sender: TObject);
    procedure DateTimeFontSizeChange(Sender: TObject);
    procedure CPUFontSizeChange(Sender: TObject);
    procedure ComputerNameFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure IPFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimeFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure CPUFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure CheckComputerNameFontBoldClick(Sender: TObject);
    procedure CheckIPFontBoldClick(Sender: TObject);
    procedure CheckDateTimeFontBoldClick(Sender: TObject);
    procedure CheckCPUFontBoldClick(Sender: TObject);
    procedure RAMFontSizeChange(Sender: TObject);
    procedure CheckRAMFontBoldClick(Sender: TObject);
    procedure BatteryFontSizeChange(Sender: TObject);
    procedure CheckBatteryFontBoldClick(Sender: TObject);
    procedure RAMFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure BatteryFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxWindowsVersionClick(Sender: TObject);
    procedure ColorBoxNumberClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure WindowsVersionFontSizeChange(Sender: TObject);
    procedure WindowsVersionFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure WindowsVersionFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComputerNameFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IPFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CPUFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RAMFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BatteryFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DateTimeFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBoxFullWindowsVersionClick(Sender: TObject);
    procedure CheckBoxDateClick(Sender: TObject);
    procedure CheckBoxDayClick(Sender: TObject);
    procedure DateFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DateFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure DayFontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure DayFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckDateFontBoldClick(Sender: TObject);
    procedure CheckDayFontBoldClick(Sender: TObject);
    procedure DateFontSizeChange(Sender: TObject);
    procedure DayFontSizeChange(Sender: TObject);
    procedure RadioButtonRightClick(Sender: TObject);
    procedure CheckBoxAutoColorClick(Sender: TObject);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PageControl1MouseLeave(Sender: TObject);
    function IsMouseIgnored: Boolean;
    procedure CheckBoxIgnoreMouseClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  Form2: TForm2;
  i: Int64;

implementation

{$R *.dfm}

uses
  Unit_Base, Unit_Update;

procedure TForm2.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

function TForm2.IsMouseIgnored: Boolean;
begin
  Result := CheckBoxIgnoreMouse.Checked;
end;

procedure TForm2.BatteryFontSizeChange(Sender: TObject);
begin
  Form1.ELabelBattery.Font.Size := BatteryFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.BatteryFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.BatteryFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

function LoadResourceFontByName(const ResourceName: string; ResType: PChar): Boolean;
var
  ResStream: TResourceStream;
  FontsCount: DWORD;
begin
  ResStream := TResourceStream.Create(hInstance, ResourceName, ResType);
  try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount) <> 0);
  finally
    ResStream.Free;
  end;
end;

function LoadResourceFontByID(ResourceID: Integer; ResType: PChar): Boolean;
var
  ResStream: TResourceStream;
  FontsCount: DWORD;
begin
  ResStream := TResourceStream.CreateFromID(hInstance, ResourceID, ResType);
  try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount) <> 0);
  finally
    ResStream.Free;
  end;
end;

procedure TForm2.ButtonSaveClick(Sender: TObject);
begin
  //Form1.SaveNastr;
  Form1.SaveControls;
  application.ProcessMessages;
  Form2.Close;
end;

procedure TForm2.CheckAutoStart;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);

  if (Reg.ValueExists(Application.Title) = TRUE) and (Reg.ReadString(Application.Title) = (ParamStr(0))) then
  begin
    Form2.CheckBoxAutostart.Checked := TRUE;
  end;

  if (Reg.ValueExists(Application.Title) = TRUE) and (Reg.ReadString(Application.Title) <> (ParamStr(0))) then
  begin
    Form2.CheckBoxAutostart.Checked := false;
  end;

  if Reg.ValueExists(Application.Title) = false then
  begin
    Form2.CheckBoxAutostart.Checked := false;
  end;
  Reg.CloseKey;
  Reg.Free;
end;

// Версия Windows
function Is64BitOS: Boolean;
var
  IsWow64Process: function(hProcess: THandle; var Wow64Process: BOOL): BOOL; stdcall;
  Wow64Process: BOOL;
begin
  Result := False;

  // Для современных версий Delphi
  if TOSVersion.Architecture in [arIntelX64, arARM64] then
    Exit(true);

  // Для старых версий
  IsWow64Process := GetProcAddress(GetModuleHandle('kernel32'), 'IsWow64Process');
  if Assigned(IsWow64Process) then
  begin
    Wow64Process := False;
    if IsWow64Process(GetCurrentProcess, Wow64Process) then
      Result := Wow64Process;
  end;
end;

function GetWindowsInfoShort: string;
var
  Reg: TRegistry;
  DisplayVersion: string;
  CurrentBuild, UBR: Integer;
  OSName: string;
  Bitness: string;
begin
  DisplayVersion := '';
  CurrentBuild := 0;
  UBR := 0;

  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
    begin
      DisplayVersion := Reg.ReadString('DisplayVersion');
      CurrentBuild := StrToIntDef(Reg.ReadString('CurrentBuildNumber'), 0);
      UBR := Reg.ReadInteger('UBR');
    end;
  finally
    Reg.Free;
  end;

  // Определяем версию Windows
  if CurrentBuild >= 22000 then
    OSName := 'Windows 11'
  else
    OSName := 'Windows 10';

  // Определяем разрядность
  if Is64BitOS then
    Bitness := '64'
  else
    Bitness := '32';

  Result := Trim(Format('%s %s-bit [%s] %d.%d', [OSName, Bitness, DisplayVersion, CurrentBuild, UBR]));
end;

function GetWindowsInfoShortSmall: string;
var
  Reg: TRegistry;
  DisplayVersion: string;
  CurrentBuild, UBR: Integer;
  OSName: string;
  Bitness: string;
begin
  DisplayVersion := '';
  CurrentBuild := 0;
  UBR := 0;

  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
    begin
      DisplayVersion := Reg.ReadString('DisplayVersion');
      CurrentBuild := StrToIntDef(Reg.ReadString('CurrentBuildNumber'), 0);
      UBR := Reg.ReadInteger('UBR');
    end;
  finally
    Reg.Free;
  end;

  // Определяем версию Windows
  if CurrentBuild >= 22000 then
    OSName := 'Windows 11'
  else
    OSName := 'Windows 10';

  // Определяем разрядность
  if Is64BitOS then
    Bitness := '64'
  else
    Bitness := '32';

  Result := Trim(Format('%s [%s] %d', [OSName, DisplayVersion, UBR]));
end;

procedure TForm2.LoadNastr;
var
  Ini: TMemIniFile;
begin
  // Автозагрузка

  CheckAutoStart;
  Ini := TMemIniFile.Create(Form1.PortablePath);

  Form2.CheckBoxFullWindowsVersion.Checked := Ini.ReadBool('Option', Form2.CheckBoxFullWindowsVersion.Name, false);
  if Form2.CheckBoxFullWindowsVersion.Checked then
  begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShort);
  end;
  if Form2.CheckBoxFullWindowsVersion.Checked = false then
  begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShortSmall);
  end;
  // Положение окна
  Form2.RadioButtonDefaultPosition.Checked := Ini.ReadBool('Option', Form2.RadioButtonDefaultPosition.Name, false);
  if Form2.RadioButtonDefaultPosition.Checked = TRUE then
  begin
    Form2.RadioButtonDefaultPositionClick(self);
  end;

  Form2.RadioButtonLastPosition.Checked := Ini.ReadBool('Option', Form2.RadioButtonLastPosition.Name, false);
  if Form2.RadioButtonLastPosition.Checked = TRUE then
  begin
    Form2.RadioButtonLastPositionClick(self);
  end;

  Form2.RadioButtonRight.Checked := Ini.ReadBool('Option', Form2.RadioButtonRight.Name, false);
  if Form2.RadioButtonRight.Checked = TRUE then
  begin
    Form2.RadioButtonRightClick(self);
  end;
  // Имя компьютера
  Form2.CheckBoxComputerName.Checked := Ini.ReadBool('Option', Form2.CheckBoxComputerName.Name, false);
  Form2.CheckBoxComputerNameClick(Self);
  if Form2.CheckBoxComputerName.Checked = TRUE then
  begin
    Form1.ALabelUserName.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if Form2.CheckBoxComputerName.Checked = false then
  begin
    Form1.ALabelUserName.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // IP компьютера
  Form2.CheckBoxIP.Checked := Ini.ReadBool('Option', Form2.CheckBoxIP.Name, false);
  Form2.CheckBoxIPClick(self);
  if Form2.CheckBoxIP.Checked = TRUE then
  begin
    Form1.BLabelGetIP.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if Form2.CheckBoxIP.Checked = false then
  begin
    Form1.BLabelGetIP.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Дата и время
  Form2.CheckBoxDateTime.Checked := Ini.ReadBool('Option', Form2.CheckBoxDateTime.Name, false);
  Form2.CheckBoxDateTimeClick(self);
  if Form2.CheckBoxDateTime.Checked = TRUE then
  begin
    Form1.FLabelDateTime.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if Form2.CheckBoxDateTime.Checked = false then
  begin
    Form1.FLabelDateTime.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Батарея
  Form2.CheckBoxBattery.Checked := Ini.ReadBool('Option', Form2.CheckBoxBattery.Name, false);
  Form2.CheckBoxBatteryClick(self);
  if (Form2.CheckBoxBattery.Checked = TRUE) then
  begin
    Form1.ELabelBattery.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxBattery.Checked = false) then
  begin
    Form1.ELabelBattery.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Опреативная память
  Form2.CheckBoxRAM.Checked := Ini.ReadBool('Option', Form2.CheckBoxRAM.Name, false);
  Form2.CheckBoxRAMClick(Self);
  if (Form2.CheckBoxRAM.Checked = TRUE) then
  begin
    Form1.DLabelRAM.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxRAM.Checked = false) then
  begin
    Form1.DLabelRAM.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Процессор
  Form2.CheckBoxCPU.Checked := Ini.ReadBool('Option', Form2.CheckBoxCPU.Name, false);
  Form2.CheckBoxCPUClick(self);
  if (Form2.CheckBoxCPU.Checked = TRUE) then
  begin
    Form1.CLabelCPU.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxCPU.Checked = false) then
  begin
    Form1.CLabelCPU.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Версия Windows
  Form2.CheckBoxWindowsVersion.Checked := Ini.ReadBool('Option', Form2.CheckBoxWindowsVersion.Name, false);
  Form2.CheckBoxWindowsVersionClick(self);
  if (Form2.CheckBoxWindowsVersion.Checked = TRUE) then
  begin
    Form1.LabelWindowsVersion.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxWindowsVersion.Checked = false) then
  begin
    Form1.LabelWindowsVersion.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

    // Дата
  Form2.CheckBoxDate.Checked := Ini.ReadBool('Option', Form2.CheckBoxDate.Name, false);
  Form2.CheckBoxDateClick(self);
  if (Form2.CheckBoxDate.Checked = TRUE) then
  begin
    Form1.GLabelDate.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxDate.Checked = false) then
  begin
    Form1.GLabelDate.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

      // День
  Form2.CheckBoxDay.Checked := Ini.ReadBool('Option', Form2.CheckBoxDay.Name, false);
  Form2.CheckBoxDayClick(self);
  if (Form2.CheckBoxDay.Checked = TRUE) then
  begin
    Form1.HLabelDay.Visible := TRUE;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;
  if (Form2.CheckBoxDay.Checked = false) then
  begin
    Form1.HLabelDay.Visible := false;
    application.ProcessMessages;
    RestoreStringInfo;
    application.ProcessMessages;
  end;

  // Цветная иконка
  Form2.CheckBoxColorTrayIcon.Checked := Ini.ReadBool('Option', Form2.CheckBoxColorTrayIcon.Name, false);
  try
    if Form2.CheckBoxColorTrayIcon.Checked = TRUE then
    begin
      Form1.TrayIcon1.IconIndex := 2;
      application.ProcessMessages;
    end;

    if Form2.CheckBoxColorTrayIcon.Checked = false then
    begin
      if DarkModeIsEnabled = TRUE then
      begin
        if SystemUsesLightTheme = false then
          Form1.TrayIcon1.IconIndex := 1;
        if SystemUsesLightTheme = TRUE then
          Form1.TrayIcon1.IconIndex := 0;
        application.ProcessMessages;
      end;

      if DarkModeIsEnabled = false then
      begin
        if SystemUsesLightTheme = TRUE then
          Form1.TrayIcon1.IconIndex := 0;
        if SystemUsesLightTheme = false then
          Form1.TrayIcon1.IconIndex := 1;
        application.ProcessMessages;
      end;
    end;
    RestoreStringInfo;
    application.ProcessMessages;
  except
  end;

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

  if Form2.CheckBoxAutoColor.Checked = false then
  begin
    Form2.ColorBoxNumber.Selected := Ini.ReadInteger('Option', Form2.ColorBoxNumber.Name, clWhite);
    Form2.ColorBoxNumberClick(Self);
  end;

  Ini.Free;
end;

procedure TForm2.PageControl1MouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TForm2.PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
begin
  // Проверяем, находится ли курсор над вкладкой
  TabIndex := TPageControl(Sender).IndexOfTabAt(X, Y);

  if TabIndex >= 0 then
    Screen.Cursor := crHandPoint  // Курсор для вкладок
  else
    Screen.Cursor := crDefault;   // Обычный курсор
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form1.Globload;
  PageControl1.ActivePageIndex := 0;
  OnMouseWheel := FormMouseWheel;
end;

procedure TForm2.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  ComponentAtPosition: TControl;
begin
  // Получаем компонент, находящийся под курсором мыши
  ComponentAtPosition := FindDragTarget(Mouse.CursorPos, False);

  // Проверяем, является ли компонент типом TSpinEdit
  if Assigned(ComponentAtPosition) and (ComponentAtPosition is TSpinEdit) then
  begin
    with TComponent(ComponentAtPosition) as TSpinEdit do
    begin
      SetFocus();
      if WheelDelta > 0 then
        Value := Value + 1
      else
        Value := Value - 1;

      SelectAll(); // Выделение текста

      Handled := True;
    end;
  end;
end;

procedure TForm2.IPFontSizeChange(Sender: TObject);
begin
  Form1.BLabelGetIP.Font.Size := IPFontSize.Value;
  RestoreStringInfo;
end;

procedure TForm2.IPFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.IPFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure tForm2.CreateAutoStart(Enabled: Boolean);
var
  Reg: TRegistry;
begin
  if Enabled = true then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);
    Reg.WriteString(Application.Title, ParamStr(0));
    Reg.CloseKey;
    Reg.Free;
  end;

  if Enabled = false then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', TRUE);
    Reg.DeleteValue(Application.Title);
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TForm2.CheckBoxAutoColorClick(Sender: TObject);
begin
  ColorBoxNumber.Enabled := not CheckBoxAutoColor.Checked;
  ColorBoxNumberClick(self);
  Form1.Timer3.Enabled := CheckBoxAutoColor.Checked;
end;

procedure TForm2.CheckBoxAutostartClick(Sender: TObject);
begin
  if CheckBoxAutostart.Checked then
  begin
    CreateAutoStart(True);
  end
  else
  begin
    CreateAutoStart(false);
  end;
end;

procedure TForm2.CheckBoxBatteryClick(Sender: TObject);
begin
  BatteryFontSize.Enabled := CheckBoxBattery.Checked;
  CheckBatteryFontBold.Enabled := CheckBoxBattery.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxColorTrayIconClick(Sender: TObject);
begin
  try
    if Form2.CheckBoxColorTrayIcon.Checked = TRUE then
    begin
      Form1.TrayIcon1.IconIndex := 2;
      application.ProcessMessages;
    end;

    if Form2.CheckBoxColorTrayIcon.Checked = false then
    begin
      if DarkModeIsEnabled = TRUE then
      begin
        if SystemUsesLightTheme = false then
          Form1.TrayIcon1.IconIndex := 1;
        if SystemUsesLightTheme = TRUE then
          Form1.TrayIcon1.IconIndex := 0;
        application.ProcessMessages;
      end;

      if DarkModeIsEnabled = false then
      begin
        if SystemUsesLightTheme = TRUE then
          Form1.TrayIcon1.IconIndex := 0;
        if SystemUsesLightTheme = false then
          Form1.TrayIcon1.IconIndex := 1;
        application.ProcessMessages;
      end;
    end;
  except
  end;
end;

procedure TForm2.RestoreStringInfo;
begin
  Form1.ClientHeight := 0;
  Form1.ClientHeight := Form1.ClientHeight + 5;
  if Form2.CheckBoxWindowsVersion.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.LabelWindowsVersion.Height;
  end;
  if Form2.CheckBoxComputerName.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.ALabelUserName.Height;
  end;
  if Form2.CheckBoxIP.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.BLabelGetIP.Height;
  end;
  if CheckBoxCPU.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.CLabelCPU.Height;
  end;
  if CheckBoxRAM.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.DLabelRam.Height;
  end;
  if Form2.CheckBoxBattery.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.ELabelBattery.Height;
  end;
  if Form2.CheckBoxDateTime.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.FLabelDateTime.Height;
  end;
  if Form2.CheckBoxDate.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.GLabelDate.Height;
  end;
  if Form2.CheckBoxDay.Checked then
  begin
    Form1.ClientHeight := Form1.ClientHeight + Form1.HLabelDay.Height;
  end;
end;

procedure TForm2.WindowsVersionFontSizeChange(Sender: TObject);
begin
  Form1.LabelWindowsVersion.Font.Size := WindowsVersionFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.WindowsVersionFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.WindowsVersionFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.CheckBoxComputerNameClick(Sender: TObject);
begin
  ComputerNameFontSize.Enabled := CheckBoxComputerName.Checked;
  CheckComputerNameFontBold.Enabled := CheckBoxComputerName.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxCPUClick(Sender: TObject);
begin
  CPUFontSize.Enabled := CheckBoxCPU.Checked;
  CheckCPUFontBold.Enabled := CheckBoxCPU.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxDateClick(Sender: TObject);
begin
  DateFontSize.Enabled := CheckBoxDate.Checked;
  CheckDateFontBold.Enabled := CheckBoxDate.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxDateTimeClick(Sender: TObject);
begin
  DateTimeFontSize.Enabled := CheckBoxDateTime.Checked;
  CheckDateTimeFontBold.Enabled := CheckBoxDateTime.Checked;
  CheckBoxZero.Enabled := CheckBoxDateTime.Checked;
  CheckBoxShowSign.Enabled := CheckBoxDateTime.Checked;
  CheckBoxShowSeconds.Enabled := CheckBoxDateTime.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxDayClick(Sender: TObject);
begin
  DayFontSize.Enabled := CheckBoxDay.Checked;
  CheckDayFontBold.Enabled := CheckBoxDay.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxFullWindowsVersionClick(Sender: TObject);
begin
  if Form2.CheckBoxFullWindowsVersion.Checked then
  begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShort);
  end;
  if Form2.CheckBoxFullWindowsVersion.Checked = false then
  begin
    Form1.LabelWindowsVersion.Caption := Trim(GetWindowsInfoShortSmall);
  end;
end;

procedure TForm2.CheckBoxIgnoreMouseClick(Sender: TObject);
begin
  Form1.UpdateCursorForAllLabels;
end;

procedure TForm2.CheckBoxIPClick(Sender: TObject);
begin
  IPFontSize.Enabled := CheckBoxIP.Checked;
  CheckIPFontBold.Enabled := CheckBoxIP.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxRAMClick(Sender: TObject);
begin
  RAMFontSize.Enabled := CheckBoxRAM.Checked;
  CheckRAMFontBold.Enabled := CheckBoxRAM.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CheckBoxWindowsVersionClick(Sender: TObject);
begin
  WindowsVersionFontSize.Enabled := CheckBoxWindowsVersion.Checked;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.RAMFontSizeChange(Sender: TObject);
begin
  Form1.DLabelRAM.Font.Size := RAMFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.RAMFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.RAMFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.DateFontSizeChange(Sender: TObject);
begin
  Form1.GLabelDate.Font.Size := DateFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.DateFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.DateFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.DateTimeFontSizeChange(Sender: TObject);
begin
  Form1.FLabelDateTime.Font.Size := DateTimeFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.DateTimeFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.DateTimeFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.DayFontSizeChange(Sender: TObject);
begin
  Form1.HLabelDay.Font.Size := DayFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.DayFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.DayFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.CheckBatteryFontBoldClick(Sender: TObject);
begin
  if CheckBatteryFontBold.Checked then
  begin
    Form1.ELabelBattery.Font.Style := Form1.ELabelBattery.Font.Style + [fsBold];
  end;

  if CheckBatteryFontBold.Checked = false then
  begin
    Form1.ELabelBattery.Font.Style := Form1.ELabelBattery.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckComputerNameFontBoldClick(Sender: TObject);
begin
  if CheckComputerNameFontBold.Checked then
  begin
    Form1.ALabelUserName.Font.Style := Form1.ALabelUserName.Font.Style + [fsBold];
  end;

  if CheckComputerNameFontBold.Checked = false then
  begin
    Form1.ALabelUserName.Font.Style := Form1.ALabelUserName.Font.Style - [fsBold];
  end;

end;

procedure TForm2.CheckCPUFontBoldClick(Sender: TObject);
begin
  if CheckCPUFontBold.Checked then
  begin
    Form1.CLabelCPU.Font.Style := Form1.CLabelCPU.Font.Style + [fsBold];
  end;

  if CheckCPUFontBold.Checked = false then
  begin
    Form1.CLabelCPU.Font.Style := Form1.CLabelCPU.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckDateFontBoldClick(Sender: TObject);
begin
  if CheckDateFontBold.Checked then
  begin
    Form1.GLabelDate.Font.Style := Form1.GLabelDate.Font.Style + [fsBold];
  end;

  if CheckDateFontBold.Checked = false then
  begin
    Form1.GLabelDate.Font.Style := Form1.GLabelDate.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckDateTimeFontBoldClick(Sender: TObject);
begin

  if CheckDateTimeFontBold.Checked then
  begin
    Form1.FLabelDateTime.Font.Style := Form1.FLabelDateTime.Font.Style + [fsBold];
  end;

  if CheckDateTimeFontBold.Checked = false then
  begin
    Form1.FLabelDateTime.Font.Style := Form1.FLabelDateTime.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckDayFontBoldClick(Sender: TObject);
begin
  if CheckDayFontBold.Checked then
  begin
    Form1.HLabelDay.Font.Style := Form1.HLabelDay.Font.Style + [fsBold];
  end;

  if CheckDayFontBold.Checked = false then
  begin
    Form1.HLabelDay.Font.Style := Form1.HLabelDay.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckIPFontBoldClick(Sender: TObject);
begin
  if CheckIPFontBold.Checked then
  begin
    Form1.BLabelGetIP.Font.Style := Form1.BLabelGetIP.Font.Style + [fsBold];
  end;

  if CheckIPFontBold.Checked = false then
  begin
    Form1.BLabelGetIP.Font.Style := Form1.BLabelGetIP.Font.Style - [fsBold];
  end;
end;

procedure TForm2.CheckRAMFontBoldClick(Sender: TObject);
begin
  if CheckRAMFontBold.Checked then
  begin
    Form1.DLabelRAM.Font.Style := Form1.DLabelRAM.Font.Style + [fsBold];
  end;

  if CheckRAMFontBold.Checked = false then
  begin
    Form1.DLabelRAM.Font.Style := Form1.DLabelRAM.Font.Style - [fsBold];
  end;
end;

procedure TForm2.ColorBoxNumberClick(Sender: TObject);
begin
  if CheckBoxAutoColor.Checked = false then
  begin

    Form1.LabelWindowsVersion.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.ALabelUserName.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.BLabelGetIP.Font.Color := Form2.ColorBoxNumber.Selected;

    Form1.CLabelCPU.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.DLabelRam.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.ELabelBattery.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.FLabelDateTime.Font.Color := Form2.ColorBoxNumber.Selected;

    Form1.GLabelDate.Font.Color := Form2.ColorBoxNumber.Selected;
    Form1.HLabelDay.Font.Color := Form2.ColorBoxNumber.Selected;
  end;
end;

procedure TForm2.ComputerNameFontSizeChange(Sender: TObject);
begin
  Form1.ALabelUserName.Font.Size := ComputerNameFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.ComputerNameFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.ComputerNameFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.CPUFontSizeChange(Sender: TObject);
begin
  Form1.CLabelCPU.Font.Size := CPUFontSize.Value;
  RestoreStringInfo;
  application.ProcessMessages;
end;

procedure TForm2.CPUFontSizeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_BACK, VK_DELETE, VK_TAB, VK_RETURN, VK_ESCAPE]) then
  begin
    Key := 0;
  end;
end;

procedure TForm2.CPUFontSizeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.RadioButtonDefaultPositionClick(Sender: TObject);
begin
  RadioButtonDefaultPosition.Checked := TRUE;
  RadioButtonLastPosition.Checked := false;
  RadioButtonRight.Checked := false;
 { Form1.Left := Screen.Width - Form1.Width - 20;
  Form1.Top := Screen.Height - Form1.Height - 50;}
end;

procedure TForm2.RadioButtonLastPositionClick(Sender: TObject);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  RadioButtonLastPosition.Checked := TRUE;
  RadioButtonDefaultPosition.Checked := false;
  RadioButtonRight.Checked := false;
  Form1.Top := Ini.ReadInteger('Option', 'Top', Form1.Top);
  Form1.Left := Ini.ReadInteger('Option', 'Left', Form1.Left);
  Ini.Free;
end;

procedure TForm2.RadioButtonRightClick(Sender: TObject);
var
  Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  RadioButtonLastPosition.Checked := false;
  RadioButtonDefaultPosition.Checked := false;
  RadioButtonRight.Checked := TRUE;
  Form1.Top := Ini.ReadInteger('Option', 'Top', Form1.Top);
  //Form1.Left := Screen.Width - Form1.Width - 10;
  Ini.Free;
end;

end.

