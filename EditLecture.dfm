object Edit_Lecture: TEdit_Lecture
  Left = 206
  Top = 214
  Width = 988
  Height = 768
  Caption = 'Edit_Lecture'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 48
    Width = 969
    Height = 681
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 488
    Top = 8
    Width = 129
    Height = 25
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1090#1077#1082#1089#1090#1072
    TabOrder = 2
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 8
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1092#1072#1081#1083
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 248
    Top = 8
    Width = 145
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 400
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 888
    Top = 8
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 6
    OnClick = Button6Click
  end
  object PageSetupDialog1: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 29700
    PageHeight = 21000
    Left = 304
    Top = 48
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 528
    Top = 48
  end
  object PrintDialog1: TPrintDialog
    Left = 408
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt|*.txt'
    Left = 88
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.txt|*.txt'
    Left = 168
    Top = 48
  end
end
