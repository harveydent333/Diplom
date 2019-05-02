object VariantsQuestion: TVariantsQuestion
  Left = 0
  Top = 0
  Width = 892
  Height = 382
  Color = clBtnFace
  ParentColor = False
  TabOrder = 0
  object Label4: TLabel
    Left = 16
    Top = 46
    Width = 241
    Height = 16
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1079' '#1074#1072#1088#1080#1072#1085#1090#1086#1074' '#1086#1090#1074#1077#1090#1086#1074' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object DBMemo4: TDBMemo
    Left = 34
    Top = 234
    Width = 800
    Height = 66
    BorderStyle = bsNone
    DataField = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077#1054#1090#1074#1077#1090#1072'4'
    DataSource = DataModule1.AddQuestionSource
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object DBMemo5: TDBMemo
    Left = 34
    Top = 309
    Width = 795
    Height = 66
    BorderStyle = bsNone
    DataField = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077#1054#1090#1074#1077#1090#1072'5'
    DataSource = DataModule1.AddQuestionSource
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 32
    Top = 64
    Width = 800
    Height = 75
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = -1
    Top = 2
    Width = 875
    Height = 40
    Color = clWhite
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 200
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1086#1087#1088#1086#1089
      Enabled = False
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 660
      Top = 8
      Width = 200
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 1
      Kind = bkAbort
    end
    object BitBtn3: TBitBtn
      Left = 224
      Top = 8
      Width = 425
      Height = 25
      Caption = '+ '#1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
    end
  end
end
