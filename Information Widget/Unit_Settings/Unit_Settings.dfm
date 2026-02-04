object Form2: TForm2
  Left = 0
  Top = 0
  Cursor = crHandPoint
  AutoSize = True
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 341
  ClientWidth = 334
  Color = clBtnFace
  Constraints.MinHeight = 380
  Constraints.MinWidth = 350
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  RoundedCorners = rcOn
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  TextHeight = 15
  object TabControlButtons: TTabControl
    Left = 0
    Top = 306
    Width = 334
    Height = 35
    Align = alBottom
    TabOrder = 1
    object ButtonSave: TButton
      Left = 4
      Top = 6
      Width = 326
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonSaveClick
    end
  end
  object TabControlBody: TTabControl
    Left = 0
    Top = 0
    Width = 334
    Height = 306
    Align = alClient
    TabOrder = 0
    object TabControl1: TTabControl
      Left = 4
      Top = 6
      Width = 326
      Height = 88
      Align = alTop
      TabOrder = 0
    end
    object TabControl2: TTabControl
      Left = 4
      Top = 94
      Width = 326
      Height = 88
      Align = alTop
      TabOrder = 1
    end
    object TabControl3: TTabControl
      Left = 4
      Top = 182
      Width = 326
      Height = 88
      Align = alTop
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 334
    Height = 306
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    TabWidth = 100
    OnMouseLeave = PageControl1MouseLeave
    OnMouseMove = PageControl1MouseMove
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 326
        Height = 73
        Align = alTop
        Caption = #1042#1080#1076
        TabOrder = 0
        object CheckBoxColorTrayIcon: TCheckBox
          Left = 4
          Top = 17
          Width = 150
          Height = 17
          Cursor = crHandPoint
          Caption = #1062#1074#1077#1090#1085#1072#1103' '#1080#1082#1086#1085#1082#1072
          TabOrder = 0
          OnClick = CheckBoxColorTrayIconClick
        end
        object ColorBoxNumber: TColorBox
          Left = 160
          Top = 17
          Width = 150
          Height = 22
          Cursor = crHandPoint
          Hint = #1062#1074#1077#1090' '#1096#1088#1080#1092#1090#1072
          DefaultColorColor = clWhite
          NoneColorColor = clWhite
          Selected = clWhite
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ColorBoxNumberClick
        end
        object CheckBoxAutoColor: TCheckBox
          Left = 160
          Top = 45
          Width = 149
          Height = 17
          Cursor = crHandPoint
          Caption = #1040#1074#1090#1086' '#1094#1074#1077#1090
          TabOrder = 2
          OnClick = CheckBoxAutoColorClick
        end
        object CheckBoxIgnoreMouse: TCheckBox
          Left = 4
          Top = 45
          Width = 150
          Height = 17
          Cursor = crHandPoint
          Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1084#1099#1096#1100
          TabOrder = 3
          OnClick = CheckBoxIgnoreMouseClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 73
        Width = 326
        Height = 55
        Align = alTop
        Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' '#1086#1082#1085#1072
        TabOrder = 1
        object RadioButtonDefaultPosition: TRadioButton
          Left = 4
          Top = 17
          Width = 150
          Height = 17
          Cursor = crHandPoint
          Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonDefaultPositionClick
        end
        object RadioButtonLastPosition: TRadioButton
          Left = 4
          Top = 35
          Width = 150
          Height = 17
          Cursor = crHandPoint
          Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077
          TabOrder = 1
          OnClick = RadioButtonLastPositionClick
        end
        object RadioButtonRight: TRadioButton
          Left = 160
          Top = 17
          Width = 149
          Height = 17
          Cursor = crHandPoint
          Caption = #1057#1087#1088#1072#1074#1072
          TabOrder = 2
          OnClick = RadioButtonRightClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 128
        Width = 326
        Height = 44
        Align = alTop
        Caption = #1040#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1072
        TabOrder = 2
        object CheckBoxAutostart: TCheckBox
          Left = 4
          Top = 17
          Width = 305
          Height = 17
          Cursor = crHandPoint
          Caption = #1040#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1072' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077' Windows'
          TabOrder = 0
          OnClick = CheckBoxAutostartClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1082#1083#1072#1076#1082#1080
      ImageIndex = 1
      object TabControl4: TTabControl
        Left = 0
        Top = 0
        Width = 326
        Height = 88
        Align = alTop
        TabOrder = 0
        object GroupBoxComputerName: TGroupBox
          Left = 4
          Top = 6
          Width = 140
          Height = 78
          Align = alLeft
          Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
          TabOrder = 0
          object CheckBoxComputerName: TCheckBox
            Left = 2
            Top = 17
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = CheckBoxComputerNameClick
          end
          object ComputerNameFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 136
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 100
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 25
            OnChange = ComputerNameFontSizeChange
            OnKeyDown = ComputerNameFontSizeKeyDown
            OnKeyPress = ComputerNameFontSizeKeyPress
          end
          object CheckComputerNameFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = CheckComputerNameFontBoldClick
          end
        end
        object GroupBoxIP: TGroupBox
          Left = 144
          Top = 6
          Width = 178
          Height = 78
          Align = alClient
          Caption = 'IP '#1040#1076#1088#1077#1089
          TabOrder = 1
          object CheckBoxIP: TCheckBox
            Left = 2
            Top = 17
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxIPClick
          end
          object CheckIPFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 1
            OnClick = CheckIPFontBoldClick
          end
          object IPFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 174
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 100
            MinValue = 8
            ParentFont = False
            TabOrder = 2
            Value = 25
            OnChange = IPFontSizeChange
            OnKeyDown = IPFontSizeKeyDown
            OnKeyPress = IPFontSizeKeyPress
          end
        end
      end
      object TabControl5: TTabControl
        Left = 0
        Top = 88
        Width = 326
        Height = 88
        Align = alTop
        TabOrder = 1
        object GroupBoxCPU: TGroupBox
          Left = 4
          Top = 6
          Width = 140
          Height = 78
          Align = alLeft
          Caption = #1055#1088#1086#1094#1077#1089#1089#1086#1088
          TabOrder = 0
          object CheckBoxCPU: TCheckBox
            Left = 2
            Top = 17
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxCPUClick
          end
          object CPUFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 136
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = CPUFontSizeChange
            OnKeyDown = CPUFontSizeKeyDown
            OnKeyPress = CPUFontSizeKeyPress
          end
          object CheckCPUFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckCPUFontBoldClick
          end
        end
        object GroupBoxRAM: TGroupBox
          Left = 144
          Top = 6
          Width = 178
          Height = 78
          Align = alClient
          Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1072#1103' '#1087#1072#1084#1103#1090#1100
          TabOrder = 1
          object CheckBoxRAM: TCheckBox
            Left = 2
            Top = 17
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxRAMClick
          end
          object RAMFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 174
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = RAMFontSizeChange
            OnKeyDown = RAMFontSizeKeyDown
            OnKeyPress = RAMFontSizeKeyPress
          end
          object CheckRAMFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckRAMFontBoldClick
          end
        end
      end
      object TabControl8: TTabControl
        Left = 0
        Top = 176
        Width = 326
        Height = 89
        Align = alTop
        TabOrder = 2
        object GroupBoxBattery: TGroupBox
          Left = 4
          Top = 6
          Width = 140
          Height = 79
          Align = alLeft
          Caption = #1041#1072#1090#1072#1088#1077#1103
          TabOrder = 0
          object CheckBoxBattery: TCheckBox
            Left = 2
            Top = 17
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxBatteryClick
          end
          object BatteryFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 136
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = BatteryFontSizeChange
            OnKeyDown = BatteryFontSizeKeyDown
            OnKeyPress = BatteryFontSizeKeyPress
          end
          object CheckBatteryFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckBatteryFontBoldClick
          end
        end
        object GroupBoxWindowsVersion: TGroupBox
          Left = 144
          Top = 6
          Width = 178
          Height = 79
          Align = alClient
          Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1089#1080#1089#1090#1077#1084#1077
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          object CheckBoxWindowsVersion: TCheckBox
            Left = 2
            Top = 17
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1042#1077#1088#1089#1080#1103' Windows'
            TabOrder = 0
            OnClick = CheckBoxWindowsVersionClick
          end
          object WindowsVersionFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 174
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 100
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 25
            OnChange = WindowsVersionFontSizeChange
            OnKeyDown = WindowsVersionFontSizeKeyDown
            OnKeyPress = WindowsVersionFontSizeKeyPress
          end
          object CheckBoxFullWindowsVersion: TCheckBox
            Left = 2
            Top = 56
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1085#1072#1103' '#1074#1077#1088#1089#1080#1103
            TabOrder = 2
            OnClick = CheckBoxFullWindowsVersionClick
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1042#1088#1077#1084#1103
      ImageIndex = 2
      object TabControl6: TTabControl
        Left = 0
        Top = 0
        Width = 326
        Height = 88
        Align = alTop
        TabOrder = 0
        object GroupBoxDateTime: TGroupBox
          Left = 4
          Top = 6
          Width = 140
          Height = 78
          Align = alLeft
          Caption = #1042#1088#1077#1084#1103
          TabOrder = 0
          object CheckBoxDateTime: TCheckBox
            Left = 2
            Top = 17
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxDateTimeClick
          end
          object DateTimeFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 136
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = DateTimeFontSizeChange
            OnKeyDown = DateTimeFontSizeKeyDown
            OnKeyPress = DateTimeFontSizeKeyPress
          end
          object CheckDateTimeFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckDateTimeFontBoldClick
          end
        end
        object GroupBoxTime: TGroupBox
          Left = 144
          Top = 6
          Width = 178
          Height = 78
          Align = alClient
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1088#1077#1084#1077#1085#1080
          TabOrder = 1
          object CheckBoxZero: TCheckBox
            Left = 2
            Top = 17
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1083#1100
            TabOrder = 0
          end
          object CheckBoxShowSign: TCheckBox
            Left = 2
            Top = 34
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1052#1080#1075#1072#1102#1097#1080#1081' '#1079#1085#1072#1082' '#39':'#39
            TabOrder = 1
          end
          object CheckBoxShowSeconds: TCheckBox
            Left = 2
            Top = 51
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1077#1082#1091#1085#1076#1099
            TabOrder = 2
          end
        end
      end
      object TabControl7: TTabControl
        Left = 0
        Top = 88
        Width = 326
        Height = 88
        Align = alTop
        TabOrder = 1
        object GroupBoxDate: TGroupBox
          Left = 4
          Top = 6
          Width = 140
          Height = 78
          Align = alLeft
          Caption = #1044#1072#1090#1072
          TabOrder = 0
          object CheckBoxDate: TCheckBox
            Left = 2
            Top = 17
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxDateClick
          end
          object DateFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 136
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = DateFontSizeChange
            OnKeyDown = DateFontSizeKeyDown
            OnKeyPress = DateFontSizeKeyPress
          end
          object CheckDateFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 136
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckDateFontBoldClick
          end
        end
        object GroupBoxDay: TGroupBox
          Left = 144
          Top = 6
          Width = 178
          Height = 78
          Align = alClient
          Caption = #1044#1077#1085#1100
          TabOrder = 1
          object CheckBoxDay: TCheckBox
            Left = 2
            Top = 17
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            TabOrder = 0
            OnClick = CheckBoxDayClick
          end
          object DayFontSize: TSpinEdit
            Left = 2
            Top = 34
            Width = 174
            Height = 22
            Cursor = crHandPoint
            Align = alTop
            DragCursor = crHandPoint
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 50
            MinValue = 8
            ParentFont = False
            TabOrder = 1
            Value = 15
            OnChange = DayFontSizeChange
            OnKeyDown = DayFontSizeKeyDown
            OnKeyPress = DayFontSizeKeyPress
          end
          object CheckDayFontBold: TCheckBox
            Left = 2
            Top = 56
            Width = 174
            Height = 17
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
            TabOrder = 2
            OnClick = CheckDayFontBoldClick
          end
        end
      end
    end
  end
end
