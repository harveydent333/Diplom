object PassingKnowledgeControlForm: TPassingKnowledgeControlForm
  Left = 245
  Top = 157
  Width = 896
  Height = 850
  Caption = 'PassingKnowledgeControlForm'
  Color = clBtnFace
  Constraints.MaxHeight = 850
  Constraints.MaxWidth = 896
  Constraints.MinHeight = 850
  Constraints.MinWidth = 896
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline VariantsQuestionMore1: TVariantsQuestionMore
    Left = -4
    Top = 32
    Width = 877
    Height = 777
    TabOrder = 1
    Visible = False
    inherited hint: TLabel
      Left = 440
      Top = 110
      Width = 5
      Height = 25
      Caption = ''
      Font.Height = -21
    end
    inherited Label1: TLabel
      Top = 43
      Width = 31
      Caption = #8470'1'
    end
    inherited Label2: TLabel
      Top = 121
      Width = 34
      Caption = #8470'2'
    end
    inherited Label3: TLabel
      Top = 183
      Width = 33
      Caption = #8470'3'
    end
    inherited Label4: TLabel
      Left = 7
      Top = 245
      Width = 39
      Caption = ' '#8470'4'
    end
    inherited Label5: TLabel
      Top = 315
      Width = 33
      Caption = #8470'5'
    end
    inherited Label6: TLabel
      Top = 385
      Width = 34
      Caption = #8470'6'
    end
    inherited Label7: TLabel
      Top = 455
      Width = 33
      Caption = #8470'7'
    end
    inherited Label8: TLabel
      Top = 525
      Width = 34
      Caption = #8470'8'
    end
    inherited Label9: TLabel
      Top = 595
      Width = 34
      Caption = #8470'9'
    end
    inherited Label10: TLabel
      Left = 10
      Top = 673
      Width = 43
      Caption = #8470'10'
    end
    inherited Memo1: TMemo
      Top = 65
      Height = 56
      ReadOnly = True
    end
    inherited Memo2: TMemo
      Top = 135
      Height = 56
    end
    inherited Memo3: TMemo
      Top = 205
      Height = 56
    end
    inherited Memo4: TMemo
      Top = 275
      Height = 56
    end
    inherited Memo5: TMemo
      Top = 345
      Height = 56
    end
    inherited Memo6: TMemo
      Top = 415
      Height = 56
    end
    inherited Memo7: TMemo
      Top = 485
      Height = 56
    end
    inherited Memo8: TMemo
      Top = 555
      Height = 56
    end
    inherited Memo9: TMemo
      Top = 625
      Height = 56
    end
    inherited Memo10: TMemo
      Top = 695
      Height = 56
    end
    inherited RadioButton1: TRadioButton
      Top = 75
    end
    inherited RadioButton2: TRadioButton
      Top = 145
    end
    inherited RadioButton3: TRadioButton
      Top = 215
    end
    inherited RadioButton4: TRadioButton
      Top = 285
    end
    inherited RadioButton5: TRadioButton
      Top = 355
    end
    inherited RadioButton6: TRadioButton
      Top = 425
    end
    inherited RadioButton7: TRadioButton
      Top = 495
    end
    inherited RadioButton8: TRadioButton
      Top = 565
    end
    inherited RadioButton9: TRadioButton
      Top = 635
    end
    inherited RadioButton10: TRadioButton
      Top = 700
    end
  end
  object DBGrid1: TDBGrid
    Left = 584
    Top = 288
    Width = 281
    Height = 89
    DataSource = DataModule1.ModuleLecture
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 208
    Top = 776
    Width = 441
    Height = 25
    Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 72
    Top = 0
    Width = 737
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 3
  end
end
