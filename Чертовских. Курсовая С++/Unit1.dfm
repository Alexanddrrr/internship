object Form1: TForm1
  Left = 431
  Top = 170
  Width = 750
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    734
    441)
  PixelsPerInch = 96
  TextHeight = 13
  object pb1: TPaintBox
    Left = 112
    Top = 0
    Width = 601
    Height = 441
  end
  object img1: TImage
    Left = 296
    Top = 96
    Width = 249
    Height = 257
    ParentShowHint = False
    ShowHint = False
  end
  object test: TButton
    Left = 7
    Top = 16
    Width = 75
    Height = 25
    Anchors = []
    Caption = #1059#1088#1086#1074#1077#1085#1100' 1'
    TabOrder = 0
    OnClick = testClick
    OnKeyPress = testKeyPress
  end
  object lvl2: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = #1059#1088#1086#1074#1077#1085#1100' 2'
    TabOrder = 1
    OnClick = lvl2Click
    OnKeyPress = lvl2KeyPress
  end
  object lvl3: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = #1059#1088#1086#1074#1077#1085#1100' 3'
    TabOrder = 2
    OnClick = lvl3Click
    OnKeyPress = lvl3KeyPress
  end
  object manual: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = #1087#1088#1072#1074#1080#1083#1072
    TabOrder = 3
    OnClick = manualClick
  end
  object test1: TTimer
    Interval = 25
    OnTimer = test1Timer
    Left = 8
    Top = 48
  end
  object test2: TTimer
    Interval = 32
    OnTimer = test2Timer
    Left = 8
    Top = 128
  end
  object test3: TTimer
    Interval = 25
    OnTimer = test3Timer
    Left = 8
    Top = 208
  end
end
