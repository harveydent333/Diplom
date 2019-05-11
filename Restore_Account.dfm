object RestoreAccount: TRestoreAccount
  Left = 235
  Top = 178
  Width = 870
  Height = 640
  Caption = 'RestoreAccount'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 280
    Top = 160
    Width = 126
    Height = 13
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103' '
  end
  object Label2: TLabel
    Left = 208
    Top = 208
    Width = 26
    Height = 13
    Caption = 'Login'
  end
  object Edit1: TEdit
    Left = 280
    Top = 208
    Width = 329
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 304
    Top = 256
    Width = 121
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 1
  end
  object Button2: TButton
    Left = 312
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 640
    Top = 48
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 600
    Top = 48
  end
end
