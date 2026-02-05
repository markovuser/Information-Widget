Unit Unit_Base;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Winsock, IniFiles, Vcl.Menus, Registry,
  WindowsDarkMode, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Vcl.Themes,
  Vcl.Styles, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Translation,
  IdComponent, IdBaseComponent, IdTCPConnection, IdTCPClient, IdHTTP, ShellAPI,
  Vcl.ComCtrls, Vcl.ToolWin, CPUUsageMonitor, ActiveX, ComObj, ShlObj,
  System.DateUtils, Math, Vcl.Samples.Spin, jpeg, System.Types, FileInfoUtils;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TForm1 = Class(TForm)
    Timer1: TTimer;
    ALabelUserName: TLabel;
    BLabelGetIP: TLabel;
    TrayIcon1: TTrayIcon;
    FLabelDateTime: TLabel;
    PopupMenu1: TPopupMenu;
    MenuExit: TMenuItem;
    N3: TMenuItem;
    MenuAbout: TMenuItem;
    N5: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    N6: TMenuItem;
    PopupMenuLanguage: TPopupMenu;
    LangBattery: TMenuItem;
    LangUnknown: TMenuItem;
    LangRAM: TMenuItem;
    LangCPU: TMenuItem;
    Settings: TMenuItem;
    ELabelBattery: TLabel;
    LabelWindowsVersion: TLabel;
    MenuCheckUpdate: TMenuItem;
    ThemeMenu: TMenuItem;
    ThemeAuto: TMenuItem;
    ThemeLight: TMenuItem;
    ThemeDark: TMenuItem;
    LangOnlyWindows: TMenuItem;
    LangError: TMenuItem;
    Version: TMenuItem;
    LanguageMenu: TMenuItem;
    CLabelCPU: TLabel;
    DLabelRam: TLabel;
    GLabelDate: TLabel;
    HLabelDay: TLabel;
    Timer2: TTimer;
    LangMonday: TMenuItem;
    LangTuesday: TMenuItem;
    LangWednesday: TMenuItem;
    LangThursday: TMenuItem;
    LangFriday: TMenuItem;
    LangSaturday: TMenuItem;
    LangSunday: TMenuItem;
    Timer3: TTimer;
    Name: TMenuItem;
    Procedure Timer1Timer(Sender: TObject);
    Procedure MenuExitClick(Sender: TObject);
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure Globload;
    Procedure CleanTranslationsLikeGlobload;
    Procedure LoadLanguage;
    Procedure GetCPU;
    Procedure UnCheckTheme;
    Procedure FontApply;
    Procedure WMMoving(Var Msg: TWmMoving); Message WM_MOVING;
    Procedure FormCreate(Sender: TObject);
    Procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    Procedure MenuAboutClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormDestroy(Sender: TObject);
    Procedure SettingsClick(Sender: TObject);
    Procedure TrayIcon1DblClick(Sender: TObject);
    Procedure MenuCheckUpdateClick(Sender: TObject);
    Procedure ThemeAutoClick(Sender: TObject);
    Procedure ThemeLightClick(Sender: TObject);
    Procedure ThemeDarkClick(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
    Procedure SaveControls;
    Procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure PopupMenu1Popup(Sender: TObject);
    Procedure Timer2Timer(Sender: TObject);
    Procedure LabelVisible;
    Procedure KeepFormInWorkArea;
    Procedure Timer3Timer(Sender: TObject);
    procedure UpdateCursorForAllLabels;
    procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

  Private
    Color: TColor;
    FIsProcessingWallpaper: Boolean;
    FIsProcessingWallpaperA: Boolean;
    FLastWallpaperPath: String;
    FCachedDesktopColor: TColor;
    FLastUpdateTime: Cardinal;

    FShowColon: Boolean;
    FCPUMonitor: TCPUUsageMonitor;
    FWindowInitialized: Boolean;
    FProcessPrioritySet: Boolean;
    FPreventMinimize: Boolean;
    NewDesktopColor: tColor;

    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
    Procedure WMExitSizeMove(Var Msg: TMessage); Message WM_EXITSIZEMOVE;
    Procedure WMMove(Var Msg: TWMMove); Message WM_MOVE;
    Procedure WMSysColorChange(Var Message: TMessage); Message WM_SYSCOLORCHANGE;
    Procedure LanguageMenuItemClick(Sender: TObject);
    Procedure SetAsBackgroundProcess;
    Function GetDesktopColor: TColor;
    Function GetContrastColor(Color: TColor): TColor;
    //Function GetCurrentWallpaper: Boolean;
    Procedure GetDesktopColorAsync;
    Procedure GetDesktopColorAsyncA;

  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  Public
    Constructor Create(AOwner: TComponent); Override;
  Public
  End;

Var
  Form1: TForm1;
  RamStats: TMemoryStatus;
  sps: TSystemPowerStatus;
  Battery, Ram, CPU, CPUPROC: String;
  portable: Boolean;
  LangCode: String;
  LangLocal: String;

Const
  ServerName = 'Information-Widget';
  ApiGithub = 'https://api.github.com/repos/markovuser/' + ServerName + '/releases/latest';

Implementation

Uses
  Unit_About, Unit_Settings, Unit_Update;

{$R *.dfm}

Constructor TForm1.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  FWindowInitialized := False;
  FProcessPrioritySet := False;
  FPreventMinimize := True;
End;

Procedure TForm1.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);

  Params.ExStyle := Params.ExStyle Or WS_EX_TOOLWINDOW;
  Params.ExStyle := Params.ExStyle Or WS_EX_NOACTIVATE;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TForm1.SetAsBackgroundProcess;
Var
  ProcessHandle: THandle;
Begin
  If FProcessPrioritySet Then
    Exit;

  ProcessHandle := OpenProcess(PROCESS_SET_INFORMATION, False, GetCurrentProcessId);
  If ProcessHandle <> 0 Then
  Try
    SetPriorityClass(ProcessHandle, BELOW_NORMAL_PRIORITY_CLASS);
    FProcessPrioritySet := True;
  Finally
    CloseHandle(ProcessHandle);
  End;
End;

Function TForm1.IsWindows10Or11: Boolean;
Begin
  Result := (TOSVersion.Major = 10) And (TOSVersion.Build >= 10240);
End;

Procedure TForm1.WMSettingChange(Var Message: TWMSettingChange);
Begin

  if Message.Flag = SPI_SETWORKAREA then
  begin
  Form2.WindowsVersionFontSize.Value:= Form2.WindowsVersionFontSize.Value+1;
  Form2.WindowsVersionFontSize.Value:= Form2.WindowsVersionFontSize.Value-1;
  end;

  If ThemeAuto.Checked = true Then
  Begin
    Try
      If DarkModeIsEnabled = true Then
      Begin
        SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
      End;

      If DarkModeIsEnabled = False Then
      Begin
        SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
      End;
    Except
    End;
    Application.ProcessMessages;
  End;

  Try
    Form2.CheckBoxColorTrayIconClick(self);
  Except
  End;
  Application.ProcessMessages;
End;

Procedure TForm1.Globload;
Var
  i: Integer;
  Internat: TTranslation;
  Ini: TMemIniFile;
  lang, lang_file: String;
Begin
  For i := 0 To Screen.FormCount - 1 Do
  Begin
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    If Ini.SectionExists(Application.Title) Then
    // Используем конкретную секцию
    Begin
      Internat.Execute(Screen.Forms[i], Application.Title);
      // Передаем имя секции
      Application.ProcessMessages;
    End;
    Ini.Free;
  End;
End;

Function GetCurrentUserName: String;
Const
  cnMaxUserNameLen = 254;
Var
  sUserName: String;
  dwUserNameLen: DWORD;
Begin
  dwUserNameLen := cnMaxUserNameLen - 1;
  SetLength(sUserName, cnMaxUserNameLen);
  GetUserName(pchar(sUserName), dwUserNameLen);
  SetLength(sUserName, dwUserNameLen);
  Result := sUserName;
End;

Function ComputerName: String;
Var
  buffer: Array[0..255] Of char;
  size: DWORD;
Begin
  size := 256;
  If GetComputerName(buffer, size) Then
    Result := buffer
  Else
    Result := ''
End;

Function GetIP: String;
Var
  WSAData: TWSAData;
  Buffer: Array[0..255] Of AnsiChar;
  HostEnt: PHostEnt;
  SockAddr: TSockAddrIn;
  IP: PAnsiChar;
Begin
  Result := '';

  If WSAStartup($0202, WSAData) <> 0 Then
    Exit;

  Try
    If gethostname(Buffer, SizeOf(Buffer)) <> 0 Then
      Exit;

    HostEnt := gethostbyname(Buffer);
    If (HostEnt = Nil) Or (HostEnt.h_addr_list = Nil) Or (HostEnt.h_addr_list^ = Nil) Then
      Exit;

    SockAddr.sin_addr.S_addr := PInAddr(HostEnt.h_addr_list^)^.S_addr;
    IP := inet_ntoa(SockAddr.sin_addr);

    If IP <> Nil Then
      Result := String(IP);
  Finally
    WSACleanup;
  End;
End;

Procedure TForm1.GetCPU;
Var
  CPUUsage: Double;
Begin
  Try
    CPUUsage := FCPUMonitor.GetCPUUsage;
    CPUPROC := Format(' %4.0f', [CPUUsage]);
  Except
  End;
  CPU := LangCPU.Caption + CPUPROC + '% ';
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  //SaveNastr;
  SaveControls;
  Application.ProcessMessages;
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

Procedure TForm1.LoadLanguage;
Var
  Ini: TMemIniFile;
  LangFiles: TStringList;
  i: Integer;
  MenuItem: TMenuItem;
  FileName, DisplayName, MenuCaption: String;
  SearchRec: TSearchRec;
Begin
  Ini := TMemIniFile.Create(PortablePath);
  While LanguageMenu.Count > 0 Do
    LanguageMenu.Items[0].Free;
  LangLocal := Ini.ReadString('Language', 'Language', '');
  Ini.Free;

  LangFiles := TStringList.Create;
  Try
    If FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec) = 0 Then
    Begin
      Repeat
        If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
          LangFiles.Add(SearchRec.Name);
      Until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    End;
    LangFiles.Sort;
    For i := 0 To LangFiles.Count - 1 Do
    Begin
      FileName := LangFiles[i];
      LangCode := ChangeFileExt(FileName, '');
      DisplayName := LangCode;
      Try
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + FileName);
        Try
          DisplayName := Ini.ReadString('Language information', 'LANGNAME', LangCode);
        Finally
          Ini.Free;
        End;
      Except
      End;
      MenuCaption := LangCode + #9 + #9 + DisplayName;
      MenuItem := TMenuItem.Create(LanguageMenu);
      MenuItem.RadioItem := true;
      MenuItem.Caption := MenuCaption;
      MenuItem.AutoHotkeys := maManual;
      MenuItem.AutoCheck := True;
      If (LangCode = LangLocal) Or (SameText(LangCode, LangLocal)) Or (LangCode + '.ini' = LangLocal) Then
        MenuItem.Checked := True;
      MenuItem.OnClick := LanguageMenuItemClick;
      LanguageMenu.Add(MenuItem);
    End;

  Finally
    LangFiles.Free;
  End;
End;

Procedure TForm1.LanguageMenuItemClick(Sender: TObject);
Var
  MenuItem: TMenuItem;
  Ini: TMemIniFile;
  i: Integer;
Begin
  If Sender Is TMenuItem Then
  Begin
    MenuItem := TMenuItem(Sender);
    LangCode := Copy(MenuItem.Caption, 1, Pos(#9, MenuItem.Caption) - 1);
    LangLocal := LangCode;
    For i := 0 To LanguageMenu.Count - 1 Do
      LanguageMenu.Items[i].Checked := False;
    MenuItem.Checked := True;
    Ini := TMemIniFile.Create(PortablePath);
    Try
      Ini.WriteString('Language', 'Language', LangLocal);
      Ini.UpdateFile;
    Finally
      Ini.Free;
    End;
    LoadLanguage;
    Form1.Globload;
  End;
End;

Procedure TForm1.CleanTranslationsLikeGlobload;
Var
  i, j, k, m: Integer;
  Ini: TMemIniFile;
  Sections, Keys: TStringList;
  SearchRec: TSearchRec;
  FindResult: Integer;
  CompPath, FormName, CompName, PropName: String;
  FirstDot, SecondDot: Integer;
  FormExists, CompExists: Boolean;
  CurrentForm: TForm;
  CurrentComponent: TComponent;
  Modified: Boolean;
  IsDuplicate: Boolean;
  n: Integer;
  CompareKey, CompareFormName: String;
  CompareDotPos: Integer;
Begin
  // Создаем все формы проекта (если нужно)
  // CreateAllProjectForms;

  FindResult := FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec);
  If FindResult = 0 Then
  Begin
    Repeat
      If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
      Begin
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + SearchRec.Name);
        Sections := TStringList.Create;
        Keys := TStringList.Create;
        Modified := False;

        Try
          Ini.ReadSections(Sections);

          For i := 0 To Sections.Count - 1 Do
          Begin
            // ========== ИСКЛЮЧАЕМ ЭТИ СЕКЦИИ ИЗ ОБРАБОТКИ ==========
            If SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir') Then
              Continue; // Пропускаем эти секции полностью

            Ini.ReadSection(Sections[i], Keys);

            // Проходим по всем ключам в обратном порядке
            For j := Keys.Count - 1 Downto 0 Do
            Begin
              CompPath := Keys[j];
              FirstDot := Pos('.', CompPath);

              If FirstDot > 0 Then
              Begin
                FormName := Copy(CompPath, 1, FirstDot - 1);
                FormExists := False;
                CompExists := False;

                // ==================== ПРОВЕРКА СУЩЕСТВОВАНИЯ КОМПОНЕНТА ====================
                // Проверяем ВСЕ формы в Screen
                For k := 0 To Screen.FormCount - 1 Do
                Begin
                  If SameText(Screen.Forms[k].Name, FormName) Then
                  Begin
                    FormExists := True;
                    CurrentForm := Screen.Forms[k];

                    // Извлекаем остаток пути после имени формы
                    CompName := Copy(CompPath, FirstDot + 1, Length(CompPath));
                    SecondDot := Pos('.', CompName);

                    If SecondDot > 0 Then
                    Begin
                      // Есть вложенный компонент: Form1.TrayIcon1.Hint
                      PropName := Copy(CompName, SecondDot + 1, Length(CompName));
                      CompName := Copy(CompName, 1, SecondDot - 1);

                      // Ищем компонент на форме
                      CurrentComponent := CurrentForm.FindComponent(CompName);

                      // Если не нашли через FindComponent, ищем вручную
                      If CurrentComponent = Nil Then
                      Begin
                        For m := 0 To CurrentForm.ComponentCount - 1 Do
                        Begin
                          If SameText(CurrentForm.Components[m].Name, CompName) Then
                          Begin
                            CurrentComponent := CurrentForm.Components[m];
                            Break;
                          End;
                        End;
                      End;

                      CompExists := (CurrentComponent <> Nil);
                    End
                    Else
                    Begin
                      // Нет второй точки - это свойство формы (Form1.Caption)
                      CompExists := True;
                    End;

                    Break; // Форма найдена, выходим из цикла
                  End;
                End;

                // ==================== ПРОВЕРКА ДУБЛИКАТОВ ====================
                IsDuplicate := False;
                // Проверяем предыдущие ключи на дубликаты (только внутри той же формы)
                For n := 0 To j - 1 Do
                Begin
                  CompareKey := Keys[n];
                  CompareDotPos := Pos('.', CompareKey);

                  If CompareDotPos > 0 Then
                  Begin
                    CompareFormName := Copy(CompareKey, 1, CompareDotPos - 1);

                    // Дубликатом считаем только если:
                    // 1. Имя формы совпадает
                    // 2. Полный путь совпадает (регистронезависимо)
                    If (SameText(FormName, CompareFormName)) And (SameText(CompPath, CompareKey)) Then
                    Begin
                      IsDuplicate := True;
                      Break;
                    End;
                  End;
                End;

                // ==================== УДАЛЕНИЕ КЛЮЧА ====================
                // Удаляем если:
                // 1. Форма или компонент не существуют ИЛИ
                // 2. Найден дубликат в той же форме
                If (Not (FormExists And CompExists)) Or IsDuplicate Then
                Begin
                  Ini.DeleteKey(Sections[i], Keys[j]);
                  Modified := True;
                End;
              End
              Else
              Begin
                // Некорректный формат - удаляем
                Ini.DeleteKey(Sections[i], Keys[j]);
                Modified := True;
              End;
            End;

            // Проверяем, не пустая ли секция после удаления
            // (кроме исключенных секций)
            If Not (SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir')) Then
            Begin
              Ini.ReadSection(Sections[i], Keys);
              If Keys.Count = 0 Then
              Begin
                Ini.EraseSection(Sections[i]);
                Modified := True;
              End;
            End;
          End;

          If Modified Then
            Ini.UpdateFile;

        Finally
          Keys.Free;
          Sections.Free;
          Ini.Free;
        End;
      End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
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

Procedure TForm1.FontApply;
Begin
  If LoadResourceFontByID(1, RT_FONT) Then
  Begin
    Form1.FLabelDateTime.Font.Name := 'Digital Display Regular';
  End;
End;

Function GetApplicationBitness: String;
Begin
  {$IFDEF WIN64}
  Result := '(64-bit)';
  {$ELSE}
  Result := '(32-bit)';
  {$ENDIF}
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  Visible := False;
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  If portable Then
    Form1.Caption := Form1.Caption + ' Portable';
  Version.Caption := GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  Name.Caption := GetFileDescription(ParamStr(0));

  SetWindowPos(Form1.handle, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOREDRAW Or SWP_FRAMECHANGED);
  ShowWindow(Application.handle, SW_HIDE);
  Application.ProcessMessages;
  FCPUMonitor := TCPUUsageMonitor.Create;
  Form1.LoadNastr;
  Form1.LabelWindowsVersion.Caption := '';
  Form1.ALabelUserName.Caption := '';
  Form1.BLabelGetIP.Caption := '';
  Form1.CLabelCPU.Caption := '';
  Form1.DLabelRam.Caption := '';
  Form1.ELabelBattery.Caption := '';
  Form1.FLabelDateTime.Caption := '';
  SetAsBackgroundProcess;
  LoadLanguage;
  FontApply;
  Color := GetDesktopColor;
     LabelWindowsVersion.OnMouseDown := LabelMouseDown;
  ALabelUserName.OnMouseDown := LabelMouseDown;
  BLabelGetIP.OnMouseDown := LabelMouseDown;

       CLabelCPU.OnMouseDown := LabelMouseDown;
  DLabelRam.OnMouseDown := LabelMouseDown;
  ELabelBattery.OnMouseDown := LabelMouseDown;

       FLabelDateTime.OnMouseDown := LabelMouseDown;
  GLabelDate.OnMouseDown := LabelMouseDown;
  HLabelDay.OnMouseDown := LabelMouseDown;

End;

Procedure TForm1.FormDestroy(Sender: TObject);
Begin
  FCPUMonitor.Free;
End;

Procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
  PostMessage(Handle, WM_CANCELMODE, 0, 0);
End;

Procedure TForm1.LoadNastr;
Var
  Ini: TMemIniFile;
  i: Integer;
Begin

  Ini := TMemIniFile.Create(Form1.PortablePath);

  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    ThemeMenu.Items[i].Checked := Ini.ReadBool('Option', ThemeMenu.Items[i].name, False);
    If ThemeMenu.Items[i].Checked = true Then
    Begin
      ThemeMenu.Items[i].Click;
    End;
  End;

  Ini.Free;
End;

Function GetAppDataRoamingPath: String;
Var
  Path: Array[0..MAX_PATH] Of char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) Then
    Result := IncludeTrailingPathDelimiter(Path)
  Else
    Result := '';
End;

Procedure TForm1.PopupMenu1Popup(Sender: TObject);
Begin
  SetWindowPos(Form1.handle, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOREDRAW Or SWP_FRAMECHANGED);
  ShowWindow(Application.handle, SW_HIDE);
  Application.ProcessMessages;
End;

Function TForm1.PortablePath: String;
Begin
  If portable Then
    Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(ParamStr(0))) + Application.Title + '\Config\Option.ini';
    //Result := ExtractFilePath(ParamStr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  ForceDirectories(ExtractFilePath(Result));
End;

Procedure TForm1.SaveControls;
Var
  Ini: TIniFile;
  i: Integer;
Begin
  If Not Assigned(Form2) Then
    Exit;

  Ini := TIniFile.Create(PortablePath);
  Ini.WriteBool('Option', Form10.CheckBoxQuickUpdate.name, Form10.CheckBoxQuickUpdate.Checked);

  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    Ini.WriteBool('Option', ThemeMenu.Items[i].name, ThemeMenu.Items[i].Checked);
  End;
  Try
    // Проходим по ВСЕМ компонентам Form2
    For i := 0 To Form2.ComponentCount - 1 Do
    Begin
      // Сохраняем CheckBox
      If Form2.Components[i] Is TCheckBox Then
        Ini.WriteBool('Option', Form2.Components[i].Name, TCheckBox(Form2.Components[i]).Checked)

      // Сохраняем RadioButton
      Else If Form2.Components[i] Is TRadioButton Then
        Ini.WriteBool('Option', Form2.Components[i].Name, TRadioButton(Form2.Components[i]).Checked)

      // Сохраняем SpinEdit
      Else If Form2.Components[i] Is TSpinEdit Then
        Ini.WriteInteger('Option', Form2.Components[i].Name, TSpinEdit(Form2.Components[i]).Value)

      // Сохраняем ColorBox
      Else If Form2.Components[i] Is TColorBox Then
        Ini.WriteInteger('Option', Form2.Components[i].Name, TColorBox(Form2.Components[i]).Selected)

    End;

    // Сохраняем положение формы Form2
    Ini.WriteInteger('Option', 'Form2_Top', Form2.Top);
    Ini.WriteInteger('Option', 'Form2_Left', Form2.Left);

  Finally
    Ini.Free;
  End;
End;

Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
  i: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  Ini.WriteBool('Option', Form10.CheckBoxQuickUpdate.name, Form10.CheckBoxQuickUpdate.Checked);

  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    Ini.WriteBool('Option', ThemeMenu.Items[i].name, ThemeMenu.Items[i].Checked);
  End;

  Ini.WriteBool('Option', Form2.CheckBoxFullWindowsVersion.name, Form2.CheckBoxFullWindowsVersion.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxComputerName.name, Form2.CheckBoxComputerName.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxIP.name, Form2.CheckBoxIP.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxDateTime.name, Form2.CheckBoxDateTime.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxCPU.name, Form2.CheckBoxCPU.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxRAM.name, Form2.CheckBoxRAM.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxBattery.name, Form2.CheckBoxBattery.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxWindowsVersion.name, Form2.CheckBoxWindowsVersion.Checked);

  Ini.WriteBool('Option', Form2.CheckBoxColorTrayIcon.name, Form2.CheckBoxColorTrayIcon.Checked);

  Ini.WriteBool('Option', Form2.RadioButtonDefaultPosition.name, Form2.RadioButtonDefaultPosition.Checked);
  Ini.WriteBool('Option', Form2.RadioButtonLastPosition.name, Form2.RadioButtonLastPosition.Checked);
  Ini.WriteBool('Option', Form2.CheckBoxIgnoreMouse.name, Form2.CheckBoxIgnoreMouse.Checked);

  Ini.WriteInteger('Option', Form2.WindowsVersionFontSize.name, Form2.WindowsVersionFontSize.Value);
  Ini.WriteInteger('Option', Form2.ComputerNameFontSize.name, Form2.ComputerNameFontSize.Value);
  Ini.WriteInteger('Option', Form2.IPFontSize.name, Form2.IPFontSize.Value);
  Ini.WriteInteger('Option', Form2.DateTimeFontSize.name, Form2.DateTimeFontSize.Value);
  Ini.WriteInteger('Option', Form2.CPUFontSize.name, Form2.CPUFontSize.Value);
  Ini.WriteInteger('Option', Form2.RAMfontSize.name, Form2.RAMfontSize.Value);
  Ini.WriteInteger('Option', Form2.BatteryFontSize.name, Form2.BatteryFontSize.Value);

  Ini.WriteBool('Option', Form2.CheckComputerNameFontBold.name, Form2.CheckComputerNameFontBold.Checked);
  Ini.WriteBool('Option', Form2.CheckDateTimeFontBold.name, Form2.CheckDateTimeFontBold.Checked);
  Ini.WriteBool('Option', Form2.CheckRAMFontBold.name, Form2.CheckRAMFontBold.Checked);
  Ini.WriteBool('Option', Form2.CheckIPFontBold.name, Form2.CheckIPFontBold.Checked);
  Ini.WriteBool('Option', Form2.CheckCPUFontBold.name, Form2.CheckCPUFontBold.Checked);
  Ini.WriteBool('Option', Form2.CheckBatteryFontBold.name, Form2.CheckBatteryFontBold.Checked);
  Ini.WriteInteger('Option', Form2.ColorBoxNumber.Name, Form2.ColorBoxNumber.Selected);
  Ini.WriteBool('Option', Form2.CheckBoxShowFrame.Name, Form2.CheckBoxShowFrame.Checked);

  Ini.WriteInteger('Option', 'Top', Form1.Top);
  Ini.WriteInteger('Option', 'Left', Form1.Left);

  Ini.UpdateFile;
  Ini.Free;
End;


procedure TForm1.UpdateCursorForAllLabels;
begin
  if  Form2.IsMouseIgnored then
  begin
    // Режим игнорирования - обычный курсор
    LabelWindowsVersion.Cursor := crDefault;
    ALabelUserName.Cursor := crDefault;
    BLabelGetIP.Cursor := crDefault;
    BLabelGetIP.Cursor := crDefault;
    CLabelCPU.Cursor := crDefault;
    DLabelRam.Cursor := crDefault;
    ELabelBattery.Cursor := crDefault;
    FLabelDateTime.Cursor := crDefault;
    GLabelDate.Cursor := crDefault;
    HLabelDay.Cursor := crDefault;
    SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) Or WS_EX_TRANSPARENT);
  end
  else
  begin
    // Нормальный режим - рука
    LabelWindowsVersion.Cursor := crHandPoint;
    ALabelUserName.Cursor := crHandPoint;
    BLabelGetIP.Cursor := crHandPoint;
    BLabelGetIP.Cursor := crHandPoint;
    CLabelCPU.Cursor := crHandPoint;
    DLabelRam.Cursor := crHandPoint;
    ELabelBattery.Cursor := crHandPoint;
    FLabelDateTime.Cursor := crHandPoint;
    GLabelDate.Cursor := crHandPoint;
    HLabelDay.Cursor := crHandPoint;
    SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) And Not WS_EX_TRANSPARENT);
  end;
end;

procedure TForm1.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(Form2) and Form2.IsMouseIgnored then
  begin
    // Блокируем всё в режиме игнорирования
    PopupMenu1.AutoPopup := False; // Отключаем авто-показ
    Exit;
  end;

  PopupMenu1.AutoPopup := True; // Включаем авто-показ

  if Button = mbLeft then
  begin
    // Перемещение окна
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F012, 0);
  end
  else if Button = mbRight then
  begin
    // Контекстное меню
    SetForegroundWindow(Handle);
    PopupMenu1.PopupComponent := TLabel(Sender);
    PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

Procedure TForm1.MenuAboutClick(Sender: TObject);
Begin
  Try
    Form8.ShowModal;
  Except
  End;
End;

Procedure TForm1.MenuExitClick(Sender: TObject);
Begin
  Form1.Close;
  Application.Terminate;
End;

Procedure TForm1.MenuCheckUpdateClick(Sender: TObject);
Begin
  Try
    Form10.ShowModal;
  Except
  End;
End;

Procedure TForm1.SettingsClick(Sender: TObject);
Begin
  Form2.Show;
End;

Procedure SethWndTrasparent(hWnd: hWnd; Transparent: Boolean);
Var
  l: Longint;
  lpRect: TRect;
Begin
  If Transparent Then
  Begin
    l := GetWindowLong(hWnd, GWL_EXSTYLE);
    l := l Or WS_EX_LAYERED;
    SetWindowLong(hWnd, GWL_EXSTYLE, l);
    SetLayeredWindowAttributes(hWnd, 0, 150, LWA_ALPHA);
  End
  Else
  Begin
    l := GetWindowLong(hWnd, GWL_EXSTYLE);
    l := l Xor WS_EX_LAYERED;
    SetWindowLong(hWnd, GWL_EXSTYLE, l);
    GetWindowRect(hWnd, lpRect);
    InvalidateRect(hWnd, lpRect, true);
  End;
End;

Procedure TForm1.UnCheckTheme;
Var
  i: Integer;
Begin
  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    ThemeMenu.Items[i].Checked := False;
  End;
End;

Procedure TForm1.ThemeAutoClick(Sender: TObject);
Begin
  UnCheckTheme;
  ThemeAuto.Checked := true;
  If DarkModeIsEnabled = true Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    Application.ProcessMessages;
  End;

  If DarkModeIsEnabled = False Then
  Begin
    SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    Application.ProcessMessages;
  End;
End;

Procedure TForm1.ThemeDarkClick(Sender: TObject);
Begin
  UnCheckTheme;
  ThemeDark.Checked := true;
  SetSpecificThemeMode(true, 'Windows11 Modern Dark', 'Windows11 Modern Light');
  Application.ProcessMessages;
End;

Procedure TForm1.ThemeLightClick(Sender: TObject);
Begin
  UnCheckTheme;
  ThemeLight.Checked := true;
  SetSpecificThemeMode(true, 'Windows11 Modern Light', 'Windows11 Modern Dark');
  Application.ProcessMessages;
End;

{Procedure LabelVisible;
Begin

  Form1.LabelWindowsVersion.Align := alBottom;
  Form1.ALabelUserName.Align := alBottom;
  Form1.BLabelGetIP.Align := alBottom;
  Form1.CLabelCPU.Align := alBottom;
  Form1.DLabelRam.Align := alBottom;
  Form1.ELabelBattery.Align := alBottom;
  Form1.FLabelDateTime.Align := alBottom;

  Form1.LabelWindowsVersion.Visible := Form2.CheckBoxWindowsVersion.Checked;
  Form1.ALabelUserName.Visible := Form2.CheckBoxComputerName.Checked;
  Form1.BLabelGetIP.Visible := Form2.CheckBoxIP.Checked;
  Form1.CLabelCPU.Visible := Form2.CheckBoxCPU.Checked;
  Form1.DLabelRam.Visible := Form2.CheckBoxRAM.Checked;
  Form1.ELabelBattery.Visible := Form2.CheckBoxBattery.Checked;
  Form1.FLabelDateTime.Visible := Form2.CheckBoxDateTime.Checked;

  Form1.LabelWindowsVersion.Align := alTop;
  Form1.ALabelUserName.Align := alTop;
  Form1.BLabelGetIP.Align := alTop;
  Form1.CLabelCPU.Align := alTop;
  Form1.DLabelRam.Align := alTop;
  Form1.ELabelBattery.Align := alTop;
  Form1.FLabelDateTime.Align := alTop;

  Application.ProcessMessages;
End; }

Procedure Tform1.LabelVisible;
Var
  Labels: Array Of TControl;
  CheckBoxes: Array Of TCheckBox;
  TopPos: Integer;
  i: Integer;
Begin
  // Инициализация массива меток
  SetLength(Labels, 9);
  Labels[0] := Form1.LabelWindowsVersion;
  Labels[1] := Form1.ALabelUserName;
  Labels[2] := Form1.BLabelGetIP;
  Labels[3] := Form1.CLabelCPU;
  Labels[4] := Form1.DLabelRam;
  Labels[5] := Form1.ELabelBattery;
  Labels[6] := Form1.FLabelDateTime;
  Labels[7] := Form1.GLabelDate;
  Labels[8] := Form1.HLabelDay;

  // Инициализация массива чекбоксов
  SetLength(CheckBoxes, 9);
  CheckBoxes[0] := Form2.CheckBoxWindowsVersion;
  CheckBoxes[1] := Form2.CheckBoxComputerName;
  CheckBoxes[2] := Form2.CheckBoxIP;
  CheckBoxes[3] := Form2.CheckBoxCPU;
  CheckBoxes[4] := Form2.CheckBoxRAM;
  CheckBoxes[5] := Form2.CheckBoxBattery;
  CheckBoxes[6] := Form2.CheckBoxDateTime;
  CheckBoxes[7] := Form2.CheckBoxDate;
  CheckBoxes[8] := Form2.CheckBoxDay;

  // Отключаем обновление интерфейса для уменьшения мерцания
  Form1.DisableAlign;
  Try
    TopPos := 0;

    // Обрабатываем все метки в правильном порядке
    For i := 0 To High(Labels) Do
    Begin
      // Устанавливаем видимость в соответствии с чекбоксом
      Labels[i].Visible := CheckBoxes[i].Checked;

      If Labels[i].Visible Then
      Begin
        // Сначала убираем выравнивание
        Labels[i].Align := alNone;

        // Устанавливаем позицию сверху
        Labels[i].Top := TopPos;
        Labels[i].Left := 0;
        Labels[i].Width := Form1.ClientWidth;

        // Пересчитываем позицию для следующей метки
        // Используем фактическую высоту после применения свойств
        If Labels[i].Height > 0 Then
          TopPos := TopPos + Labels[i].Height
        Else
          TopPos := TopPos + 20; // Высота по умолчанию, если не известна

        // Восстанавливаем выравнивание по верхнему краю
        Labels[i].Align := alTop;
      End
      Else
      Begin
        // Если метка не видима, сбрасываем ее позицию
        Labels[i].Align := alNone;
        Labels[i].Top := 0;
      End;
    End;

    // Принудительное обновление расположения
    Form1.Realign;

  Finally
    // Включаем обновление интерфейса
    Form1.EnableAlign;
  End;
  KeepFormInWorkArea;
  Application.ProcessMessages;
End;

Function GetDayNameFromPopupMenu(PopupMenu: TPopupMenu): String;
Var
  DayNumber: Integer;
Begin
  DayNumber := DayOfTheWeek(Now);
  If (PopupMenu.Items.Count >= DayNumber) And (DayNumber >= 1) Then
    Result := PopupMenu.Items[DayNumber - 1].Caption
  Else
    Result := FormatDateTime('dddd', Now);
End;

Procedure TForm1.Timer1Timer(Sender: TObject);
Var
  MaxWidth: Integer;
    r: TRect;
Begin
   r := Screen.WorkAreaRect;

  // Timer1.Enabled := false;
  LockWindowUpdate(handle);
  SetWindowPos(Form1.handle, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOREDRAW);
  ShowWindow(Application.handle, SW_HIDE);


  // Windows Version
  If Form2.CheckBoxWindowsVersion.Checked = true Then
  Begin
    LabelVisible;
    Application.ProcessMessages;
  End;
  If Form2.CheckBoxWindowsVersion.Checked = False Then
  Begin
    LabelVisible;
  End;

  // Computer Name
  If Form2.CheckBoxComputerName.Checked = true Then
  Begin
    ALabelUserName.Caption := ComputerName;
    LabelVisible;
    Application.ProcessMessages;
  End;
  If Form2.CheckBoxComputerName.Checked = False Then
  Begin
    ALabelUserName.Caption := '';
    LabelVisible;
  End;

  // IP
  If Form2.CheckBoxIP.Checked = true Then
  Begin
    BLabelGetIP.Caption := GetIP;
    LabelVisible;
  End;
  If Form2.CheckBoxIP.Checked = False Then
  Begin
    BLabelGetIP.Caption := '';
    LabelVisible;
  End;

  // CPU
  If Form2.CheckBoxCPU.Checked = true Then
  Begin
    GetCPU;
    CLabelCPU.Caption := CPU;
    LabelVisible;
  End;
  If Form2.CheckBoxCPU.Checked = False Then
  Begin
    CLabelCPU.Caption := '';
    LabelVisible;
  End;

  // RAM
  If Form2.CheckBoxRAM.Checked = true Then
  Begin
    GlobalMemoryStatus(RamStats);
    Application.ProcessMessages;
    Ram := Format(LangRAM.Caption + ' %3d%% ', [RamStats.dwMemoryLoad]);
    DLabelRam.Caption := Ram;
    LabelVisible;
  End;

  If Form2.CheckBoxRAM.Checked = False Then
  Begin
    Ram := '';
    DLabelRam.Caption := Ram;
    LabelVisible;
  End;

  // Battery
  If Form2.CheckBoxBattery.Checked = true Then
  Begin
    If GetSystemPowerStatus(sps) = true Then
    Begin
      Battery := Format(LangBattery.Caption + ' %3d%% ', [sps.BatteryLifePercent]);
      Application.ProcessMessages;
    End;

    If GetSystemPowerStatus(sps) = False Then
    Begin
      Battery := LangUnknown.Caption + ' ';
      Application.ProcessMessages;
    End;
    ELabelBattery.Caption := Battery;
    LabelVisible;
  End;
  If Form2.CheckBoxBattery.Checked = False Then
  Begin
    Battery := '';
    ELabelBattery.Caption := Battery;
    LabelVisible;
  End;

  // Time
  If Form2.CheckBoxDateTime.Checked = true Then
  Begin
    LabelVisible;
  End;
  If Form2.CheckBoxDateTime.Checked = False Then
  Begin
    LabelVisible;
  End;

    // Date
  If Form2.CheckBoxDate.Checked = true Then
  Begin
    GLabelDate.Caption := DateToStr(Now);
    LabelVisible;
  End;
  If Form2.CheckBoxDate.Checked = False Then
  Begin
    GLabelDate.Caption := '';
    LabelVisible;
  End;

    // Day
  If Form2.CheckBoxDay.Checked = true Then
  Begin
    HLabelDay.Caption := GetDayNameFromPopupMenu(PopupMenuLanguage);
    LabelVisible;
  End;
  If Form2.CheckBoxDay.Checked = False Then
  Begin
    HLabelDay.Caption := '';
    LabelVisible;
  End;

  Application.ProcessMessages;
  MaxWidth := BLabelGetIP.Canvas.TextWidth(BLabelGetIP.Caption);

  MaxWidth := Max(MaxWidth, ALabelUserName.Canvas.TextWidth(ALabelUserName.Caption));
  MaxWidth := Max(MaxWidth, CLabelCPU.Canvas.TextWidth(CLabelCPU.Caption));
  MaxWidth := Max(MaxWidth, ELabelBattery.Canvas.TextWidth(ELabelBattery.Caption));
  MaxWidth := Max(MaxWidth, FLabelDateTime.Canvas.TextWidth(FLabelDateTime.Caption));
  MaxWidth := Max(MaxWidth, LabelWindowsVersion.Canvas.TextWidth(LabelWindowsVersion.Caption));
  MaxWidth := Max(MaxWidth, GLabelDate.Canvas.TextWidth(GLabelDate.Caption));
  MaxWidth := Max(MaxWidth, HLabelDay.Canvas.TextWidth(HLabelDay.Caption));

  // Устанавливаем ширину формы
  Form1.ClientWidth := MaxWidth + 20;
  Application.ProcessMessages;
  If Form2.RadioButtonDefaultPosition.Checked Then
  Begin
    Form1.Left := Screen.Width - Form1.Width - 10;
    //Form1.Top := Screen.Height - Form1.Height;
      //If Top + Height > r.Bottom Then
    Top := r.Bottom - Height;
  End;
  ShowWindow(Application.handle, SW_HIDE);
  Application.ProcessMessages;
  If Form2.RadioButtonRight.Checked Then
  Begin
    Form1.Left := Screen.Width - Form1.Width - 10;
  End;
  LockWindowUpdate(0);
  invalidate;
  Update;
End;

Procedure TForm1.Timer2Timer(Sender: TObject);
Var
  HourFormat, Separator, TimeFormat: String;
Begin
  LockWindowUpdate(handle);
  If Form2.CheckBoxZero.Checked Then
    HourFormat := 'HH'
  Else
    HourFormat := 'H';

  // Определяем разделитель
  If Form2.CheckBoxShowSign.Checked Then
  Begin
    FShowColon := Not FShowColon;
    If FShowColon Then
      Separator := ':'
    Else
      Separator := ' ';
  End
  Else
  Begin
    Separator := ':';
  End;

  // Формируем полный формат
  TimeFormat := HourFormat + Separator + 'nn';

  // Добавляем секунды если нужно
  If Form2.CheckBoxShowSeconds.Checked Then
    TimeFormat := TimeFormat + Separator + 'ss';

  // Обновляем отображение
  FLabelDateTime.Caption := FormatDateTime(TimeFormat, Now);
  LockWindowUpdate(0);
  invalidate;
  Update;
End;

{Function TForm1.GetCurrentWallpaper: Boolean;
Var
  Reg: TRegistry;
  WallpaperPath: String;
Begin
  Result := False;
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;

    // Для современных версий Windows (8/10/11)
    If Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers', False) Then
    Begin
      WallpaperPath := Reg.ReadString('BackgroundHistoryPath0');
      If WallpaperPath <> '' Then
      Begin
        Result := True;
        Reg.CloseKey;
        Exit;
      End;
      Reg.CloseKey;
    End;

    // Для всех версий Windows (классический способ)
    If Reg.OpenKey('Control Panel\Desktop', False) Then
    Begin
      WallpaperPath := Reg.ReadString('Wallpaper');
      If WallpaperPath <> '' Then
      Begin
        Result := True;
      End;
      Reg.CloseKey;
    End;
  Finally
    Reg.Free;
  End;
End;  }

{Function TForm1.GetDesktopColor: TColor;
Var
  WallpaperPath: Array[0..MAX_PATH] Of Char;
  Bitmap: TBitmap;
  Jpeg: TJPEGImage;
  Png: TPngImage;
  Ext: String;
  Points: Array[0..3] Of TPoint;
  I, R, G, B: Integer;
Begin
  Result := clWhite;

  If Not SystemParametersInfo(SPI_GETDESKWALLPAPER, MAX_PATH, @WallpaperPath, 0) Then
    Exit;

  If (WallpaperPath[0] = #0) Or Not FileExists(String(WallpaperPath)) Then
    Exit;

  Try
    Bitmap := TBitmap.Create;
    Try
      Ext := LowerCase(ExtractFileExt(String(WallpaperPath)));

      // Быстрая загрузка только заголовка
      If (Ext = '.jpg') Or (Ext = '.jpeg') Then
      Begin
        Jpeg := TJPEGImage.Create;
        Try
          Jpeg.Scale := jsEighth; // 1/8 размера!
          Jpeg.LoadFromFile(String(WallpaperPath));
          Bitmap.Assign(Jpeg);
        Finally
          Jpeg.Free;
        End;
      End
      Else If Ext = '.png' Then
      Begin
        Png := TPngImage.Create;
        Try
          // Загружаем как есть (PNG обычно меньше)
          Png.LoadFromFile(String(WallpaperPath));

          // Уменьшаем если очень большое
          If (Png.Width > 100) Or (Png.Height > 100) Then
          Begin
            Bitmap.Width := 100;
            Bitmap.Height := 100;
            Bitmap.Canvas.StretchDraw(Rect(0, 0, 100, 100), Png);
          End
          Else
            Bitmap.Assign(Png);
        Finally
          Png.Free;
        End;
      End
      Else
      Begin
        // Для BMP просто загружаем
        Bitmap.LoadFromFile(String(WallpaperPath));
      End;

      // Анализируем только 4 точки (углы)
      R := 0;
      G := 0;
      B := 0;

      // Координаты углов
      Points[0] := Point(0, 0); // Левый верхний
      Points[1] := Point(Bitmap.Width - 1, 0); // Правый верхний
      Points[2] := Point(0, Bitmap.Height - 1); // Левый нижний
      Points[3] := Point(Bitmap.Width - 1, Bitmap.Height - 1); // Правый нижний

      For I := 0 To 3 Do
      Begin
        If (Points[I].X >= 0) And (Points[I].X < Bitmap.Width) And (Points[I].Y >= 0) And (Points[I].Y < Bitmap.Height) Then
        Begin
          Result := Bitmap.Canvas.Pixels[Points[I].X, Points[I].Y];
          R := R + GetRValue(Result);
          G := G + GetGValue(Result);
          B := B + GetBValue(Result);
        End;
      End;

      Result := RGB(R Div 4, G Div 4, B Div 4);

    Finally
      Bitmap.Free;
    End;
  Except
    Result := clWhite;
  End;
End;  }

Function TForm1.GetDesktopColor: TColor;
Var
  WallpaperPath: Array[0..MAX_PATH] Of Char;
  Bitmap: TBitmap;
  Jpeg: TJPEGImage;
  Png: TPngImage;
  Ext: String;
  X, Y: Integer;
  R, G, B: LongInt;
  SampleCount: Integer;
  FormPos: TPoint;
Begin
  Result := clBtnFace; // Цвет по умолчанию (системный цвет кнопки)

  // Получаем путь к обоям
  If Not SystemParametersInfo(SPI_GETDESKWALLPAPER, MAX_PATH, @WallpaperPath, 0) Then
    Exit;

  If (WallpaperPath[0] = #0) Or Not FileExists(String(WallpaperPath)) Then
    Exit;

  Try
    Bitmap := TBitmap.Create;
    Try
      Ext := LowerCase(ExtractFileExt(String(WallpaperPath)));

      // Быстрая загрузка изображения
      If (Ext = '.jpg') Or (Ext = '.jpeg') Then
      Begin
        Jpeg := TJPEGImage.Create;
        Try
          Jpeg.Scale := jsEighth; // Маленький размер для быстрой обработки
          Jpeg.LoadFromFile(String(WallpaperPath));
          Bitmap.Assign(Jpeg);
        Finally
          Jpeg.Free;
        End;
      End
      Else If Ext = '.png' Then
      Begin
        Png := TPngImage.Create;
        Try
          Png.LoadFromFile(String(WallpaperPath));
          // Уменьшаем для быстрой обработки
          If (Png.Width > 200) Or (Png.Height > 200) Then
          Begin
            Bitmap.Width := 200;
            Bitmap.Height := 200;
            Bitmap.Canvas.StretchDraw(Rect(0, 0, 200, 200), Png);
          End
          Else
            Bitmap.Assign(Png);
        Finally
          Png.Free;
        End;
      End
      Else If Ext = '.bmp' Then
      Begin
        // Для BMP просто загружаем
        Bitmap.LoadFromFile(String(WallpaperPath));

        // Уменьшаем если слишком большой
        If (Bitmap.Width > 200) Or (Bitmap.Height > 200) Then
        Begin
          With TBitmap.Create Do
          Try
            Width := 200;
            Height := 200;
            Canvas.StretchDraw(Rect(0, 0, 200, 200), Bitmap);
            Bitmap.Assign(Self);
          Finally
            Free;
          End;
        End;
      End
      Else
        Exit; // Неподдерживаемый формат

      // Получаем положение формы на экране
      FormPos := Point(Left, Top);

      // Если форма не на экране или вне рабочей области, используем центр обоев
      If (FormPos.X < 0) Or (FormPos.Y < 0) Or (FormPos.X > Screen.Width) Or (FormPos.Y > Screen.Height) Then
      Begin
        FormPos := Point(Bitmap.Width Div 2, Bitmap.Height Div 2);
      End
      Else
      Begin
        // Преобразуем координаты формы в координаты на обоях
        // Учитываем, что обои могут растягиваться/центрироваться
        FormPos.X := MulDiv(FormPos.X, Bitmap.Width, Screen.Width);
        FormPos.Y := MulDiv(FormPos.Y, Bitmap.Height, Screen.Height);

        // Ограничиваем координаты
        If FormPos.X < 0 Then
          FormPos.X := 0;
        If FormPos.Y < 0 Then
          FormPos.Y := 0;
        If FormPos.X >= Bitmap.Width Then
          FormPos.X := Bitmap.Width - 1;
        If FormPos.Y >= Bitmap.Height Then
          FormPos.Y := Bitmap.Height - 1;
      End;

      // Берем несколько пикселей вокруг позиции формы
      R := 0;
      G := 0;
      B := 0;
      SampleCount := 0;

      // Сканируем область 5x5 пикселей вокруг позиции формы
      For Y := -2 To 2 Do
      Begin
        For X := -2 To 2 Do
        Begin
          If (FormPos.X + X >= 0) And (FormPos.X + X < Bitmap.Width) And (FormPos.Y + Y >= 0) And (FormPos.Y + Y < Bitmap.Height) Then
          Begin
            Result := Bitmap.Canvas.Pixels[FormPos.X + X, FormPos.Y + Y];
            Inc(R, GetRValue(Result));
            Inc(G, GetGValue(Result));
            Inc(B, GetBValue(Result));
            Inc(SampleCount);
          End;
        End;
      End;

      If SampleCount > 0 Then
        Result := RGB(R Div SampleCount, G Div SampleCount, B Div SampleCount)
      Else
        Result := clBtnFace;

    Finally
      Bitmap.Free;
    End;
  Except
    Result := clBtnFace;
  End;
End;

Function TForm1.GetContrastColor(Color: TColor): TColor;
Var
  BGColor: TColor;
  R, G, B, Luma: Integer;
Begin
  // Получаем реальный цвет с экрана
  BGColor := Form1.GetDesktopColor;

  // Анализируем
  BGColor := ColorToRGB(BGColor);
  R := GetRValue(BGColor);
  G := GetGValue(BGColor);
  B := GetBValue(BGColor);

  // Формула яркости (YCbCr)
  Luma := Round(R * 0.299 + G * 0.587 + B * 0.114);

  // Очень простая логика
  If Luma > 128 Then
    Result := clBlack  // Черный текст на светлом фоне
  Else
    Result := clWhite; // Белый текст на темном фоне
End;

Procedure TForm1.GetDesktopColorAsync;
Begin
  If FIsProcessingWallpaper Then
    Exit; // Уже в процессе обработки, выходим

  FIsProcessingWallpaper := True;

  TThread.CreateAnonymousThread(
    Procedure
    Var

      CurrentPath: String;
      WallpaperPath: Array[0..MAX_PATH] Of Char;
    Begin
      Try
        // Получаем текущий путь к обоям
        If SystemParametersInfo(SPI_GETDESKWALLPAPER, MAX_PATH, @WallpaperPath, 0) Then
          CurrentPath := String(WallpaperPath)
        Else
          CurrentPath := '';

        // Проверяем, изменились ли обои
            If (CurrentPath <> '') And (CurrentPath <> FLastWallpaperPath) Then
        Begin
          Color := GetDesktopColor; // Ваша существующая функция

          TThread.Queue(Nil,
            Procedure
            Begin
              FLastWallpaperPath := CurrentPath;
              FCachedDesktopColor := Color;

              // Обновляем UI
              If Form2.CheckBoxAutoColor.Checked Then
              Begin
                Form1.LabelWindowsVersion.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.ALabelUserName.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.BLabelGetIP.Font.Color := GetContrastColor(NewDesktopColor);

                Form1.CLabelCPU.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.DLabelRam.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.ELabelBattery.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.FLabelDateTime.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.GLabelDate.Font.Color := GetContrastColor(NewDesktopColor);
                Form1.HLabelDay.Font.Color := GetContrastColor(NewDesktopColor);
              End;

              FIsProcessingWallpaper := False;
            End);
        End
        Else
        Begin
          TThread.Queue(Nil,
            Procedure
            Begin
              FIsProcessingWallpaper := False;
            End);
        End;
      Except
        TThread.Queue(Nil,
          Procedure
          Begin
            FIsProcessingWallpaper := False;
          End);
      End;
    End).Start;
End;

Procedure TForm1.GetDesktopColorAsyncA;
Begin
  If FIsProcessingWallpaperA Then
    Exit; // Уже в процессе обработки, выходим

  FIsProcessingWallpaperA := True;

  TThread.CreateAnonymousThread(
    Procedure
    Var
      DesktopColor: TColor;
      Success: Boolean;
    Begin
      Success := False;
      DesktopColor := clBlack; // Значение по умолчанию

      Try
        Try
          // Получаем цвет рабочего стола
          DesktopColor := GetDesktopColor; // Ваша существующая функция
          Success := True;

        Except
          Success := False;
        End;

      Finally
        TThread.Queue(Nil,
          Procedure
          Begin
            If Success Then
            Begin
              // Обновляем UI только если получение цвета было успешным
              If Form2.CheckBoxAutoColor.Checked Then
              Begin
                Form1.LabelWindowsVersion.Font.Color := GetContrastColor(DesktopColor);
                Form1.ALabelUserName.Font.Color := GetContrastColor(DesktopColor);
                Form1.BLabelGetIP.Font.Color := GetContrastColor(DesktopColor);

                Form1.CLabelCPU.Font.Color := GetContrastColor(DesktopColor);
                Form1.DLabelRam.Font.Color := GetContrastColor(DesktopColor);
                Form1.ELabelBattery.Font.Color := GetContrastColor(DesktopColor);
                Form1.FLabelDateTime.Font.Color := GetContrastColor(DesktopColor);
                Form1.GLabelDate.Font.Color := GetContrastColor(DesktopColor);
                Form1.HLabelDay.Font.Color := GetContrastColor(DesktopColor);
              End;
            End;

            FIsProcessingWallpaperA := False;
          End);
      End;
    End).Start;
End;

Procedure TForm1.WMMove(Var Msg: TWMMove);
Begin
  Inherited;
End;

Procedure TForm1.WMSysColorChange(Var Message: TMessage);
Begin
  Inherited;
  Color := GetDesktopColor;
End;

Procedure TForm1.Timer3Timer(Sender: TObject);
Begin
  // Проверяем раз в 5 секунд вместо каждого тика таймера
  If GetTickCount - FLastUpdateTime < 1000 Then
    Exit;

  FLastUpdateTime := GetTickCount;

  // Используем кэшированный цвет, если обои не изменились
  If Form2.CheckBoxAutoColor.Checked Then
  Begin
    // Проверяем обои асинхронно
    GetDesktopColorAsync;
  End;
End;

{procedure TForm1.Timer3Timer(Sender: TObject);
begin
  If GetCurrentWallpaper = true Then
  Begin
  //Showmessage('ok');
    NewDesktopColor := GetDesktopColor;
    If Form2.CheckBoxAutoColor.Checked = true Then
    Begin
      Form1.LabelWindowsVersion.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.ALabelUserName.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.BLabelGetIP.Font.Color := GetContrastColor(NewDesktopColor);

      Form1.CLabelCPU.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.DLabelRam.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.ELabelBattery.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.FLabelDateTime.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.GLabelDate.Font.Color := GetContrastColor(NewDesktopColor);
      Form1.HLabelDay.Font.Color := GetContrastColor(NewDesktopColor);
      application.ProcessMessages;
    End;
  End;
end; }

Procedure TForm1.TrayIcon1DblClick(Sender: TObject);
Begin
  If Not Visible Then
  Begin
    Show;
    BringToFront;
  End
  Else
  Begin
    Hide;
  End;
End;

Procedure TForm1.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
  If portable = True Then
    TrayIcon1.Hint := getFileDescription(ParamStr(0)) + #13 + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness + #13 + ' Portable'
  Else
    TrayIcon1.Hint := getFileDescription(ParamStr(0)) + #13 + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  Application.ProcessMessages;
End;

Procedure TForm1.WMMoving(Var Msg: TWmMoving);
Var
  r: TRect;
Begin
  r := Screen.WorkareaRect;
  If Msg.lpRect^.Left < r.Left Then
    OffsetRect(Msg.lpRect^, r.Left - Msg.lpRect^.Left, 0);
  If Msg.lpRect^.Top < r.Top Then
    OffsetRect(Msg.lpRect^, 0, r.Top - Msg.lpRect^.Top);
  If Msg.lpRect^.Right > r.Right Then
    OffsetRect(Msg.lpRect^, r.Right - Msg.lpRect^.Right, 0);
  If Msg.lpRect^.Bottom > r.Bottom Then
    OffsetRect(Msg.lpRect^, 0, r.Bottom - Msg.lpRect^.Bottom);
  Inherited;
End;

Procedure TForm1.WMExitSizeMove(Var Msg: TMessage);
Begin
  Inherited;
  KeepFormInWorkArea;
  GetDesktopColorAsyncA;
End;

Procedure TForm1.KeepFormInWorkArea;
Var
  r: TRect;
Begin
  r := Screen.WorkAreaRect;

  // Если форма выходит за правую границу
  If Left + Width > r.Right Then
    Left := r.Right - Width;

  // Если форма выходит за нижнюю границу
  If Top + Height > r.Bottom Then
    Top := r.Bottom - Height;

  // Если форма выходит за левую границу
  If Left < r.Left Then
    Left := r.Left;

  // Если форма выходит за верхнюю границу
  If Top < r.Top Then
    Top := r.Top;
End;

End.

