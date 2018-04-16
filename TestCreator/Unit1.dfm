object Form1: TForm1
  Left = 786
  Top = 208
  Width = 531
  Height = 480
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1074#1077#1088#1080#1092#1080#1082#1072#1094#1080#1080' '#1089#1077#1090#1080' '#1082#1086#1085#1077#1095#1085#1099#1093' '#1072#1074#1090#1086#1084#1072#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 48
    Width = 116
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1072#1074#1090#1086#1084#1072#1090#1086#1074
  end
  object Label2: TLabel
    Left = 336
    Top = 72
    Width = 110
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1080#1084#1091#1083#1086#1074
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 193
    Height = 409
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 208
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 208
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1077
    TabOrder = 2
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 208
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 208
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    OnKeyPress = Edit3KeyPress
  end
  object Button1: TButton
    Left = 288
    Top = 16
    Width = 129
    Height = 25
    Caption = #1056#1072#1073#1086#1090#1072' '#1089#1077#1090#1080
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 112
    Width = 115
    Height = 25
    Caption = #1055#1080#1089#1072#1090#1100' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 208
    Top = 184
    Width = 89
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1082#1085#1086
    TabOrder = 7
    OnClick = Button4Click
  end
end
