object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 183
  Top = 195
  Height = 696
  Width = 1104
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 88
    Top = 48
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=dbfil' +
      'e.mdb;Mode=Share Deny None;Jet OLEDB:System database="";Jet OLED' +
      'B:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engi' +
      'ne Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Par' +
      'tial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:N' +
      'ew Database Password="";Jet OLEDB:Create System Database=False;J' +
      'et OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on C' +
      'ompact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet ' +
      'OLEDB:SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1059#1095#1077#1085#1080#1082';')
    Left = 88
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 160
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 152
    Top = 56
  end
  object AddQuestionSource: TDataSource
    DataSet = AddQuestionADO
    Left = 40
    Top = 200
  end
  object AddQuestionADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1042#1086#1087#1088#1086#1089#1099';')
    Left = 40
    Top = 144
  end
  object SearchQuestADO: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ')
    Left = 128
    Top = 152
  end
  object SearchQuest: TDataSource
    DataSet = SearchQuestADO
    Left = 136
    Top = 216
  end
  object AddRazdelADO: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 320
    Top = 16
  end
  object AddRazdel: TDataSource
    DataSet = AddRazdelADO
    Left = 320
    Top = 64
  end
  object ShowRazdel: TDataSource
    DataSet = ShowRazdelADO
    Left = 360
    Top = 416
  end
  object ShowRazdelADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1056#1072#1079#1076#1077#1083';')
    Left = 360
    Top = 368
  end
  object ShowTemaADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1058#1077#1084#1072';')
    Left = 456
    Top = 368
  end
  object ShowTema: TDataSource
    DataSet = ShowTemaADO
    Left = 456
    Top = 416
  end
  object SearchKodRazdela: TDataSource
    DataSet = ADOQuery3
    Left = 352
    Top = 224
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 352
    Top = 176
  end
  object GetDataUserSource: TDataSource
    DataSet = GetDataUserADO
    Left = 512
    Top = 56
  end
  object GetDataUserADO: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 8
  end
  object ProverkaTemADO66: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 256
    Top = 176
  end
  object ProverkaTem66: TDataSource
    DataSet = ProverkaTemADO66
    Left = 240
    Top = 240
  end
  object KodRazdelaForTree: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 504
    Top = 184
  end
  object KodRazdelaTree: TDataSource
    DataSet = KodRazdelaForTree
    Left = 504
    Top = 232
  end
  object ShowControlADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1050#1086#1085#1090#1088#1086#1083#1100';')
    Left = 576
    Top = 368
  end
  object ShowControl: TDataSource
    DataSet = ShowControlADO
    Left = 576
    Top = 416
  end
  object EditRazdel: TDataSource
    DataSet = EditRazdelADO
    Left = 640
    Top = 64
  end
  object EditRazdelADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1056#1072#1079#1076#1077#1083';')
    Left = 632
    Top = 16
  end
  object Test: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 872
    Top = 8
  end
  object Tests: TDataSource
    DataSet = Test
    Left = 872
    Top = 64
  end
  object EditTemaADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1058#1077#1084#1072';')
    Left = 720
    Top = 16
  end
  object EditTema: TDataSource
    DataSet = EditTemaADO
    Left = 720
    Top = 64
  end
  object EditControl: TDataSource
    DataSet = EditControlADO
    Left = 808
    Top = 64
  end
  object EditControlADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1050#1086#1085#1090#1088#1086#1083#1100';')
    Left = 808
    Top = 16
  end
  object SearchKodControl: TDataSource
    DataSet = SearchKodControlADO
    Left = 800
    Top = 248
  end
  object SearchKodControlADO: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 800
    Top = 192
  end
  object ShyrnalADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1046#1091#1088#1085#1072#1083';')
    Left = 904
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = ShyrnalADO
    Left = 904
    Top = 248
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 1008
    Top = 32
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 1008
    Top = 88
  end
  object Auth_YchenikADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1059#1095#1077#1085#1080#1082';')
    Left = 1024
    Top = 184
  end
  object Auth_Ychenik: TDataSource
    DataSet = Auth_YchenikADO
    Left = 1024
    Top = 240
  end
  object ModuleLectrue: TDataSource
    DataSet = ADOModuleLectrue
    Left = 80
    Top = 424
  end
  object ADOModuleLectrue: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 368
  end
  object TemaCRUD: TDataSource
    DataSet = ADOTemaCRUD
    Left = 32
    Top = 560
  end
  object ADOTemaCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072
      
        'FROM '#1056#1072#1079#1076#1077#1083' INNER JOIN '#1058#1077#1084#1072' ON '#1056#1072#1079#1076#1077#1083'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072' = '#1058#1077#1084#1072'.'#1050#1086#1076#1056#1072#1079#1076#1077 +
        #1083#1072' '
      'ORDER BY '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099';')
    Left = 32
    Top = 520
  end
  object ModulePractic: TDataSource
    DataSet = ADOModulePractic
    Left = 160
    Top = 424
  end
  object ADOModulePractic: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 368
  end
  object RazdelCRUD: TDataSource
    DataSet = ADORazdelCRUD
    Left = 128
    Top = 560
  end
  object ADORazdelCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072
      'FROM '#1056#1072#1079#1076#1077#1083';')
    Left = 128
    Top = 520
  end
  object LectureCRUD: TDataSource
    DataSet = ADOLectureCRUD
    Left = 232
    Top = 568
  end
  object ADOLectureCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1051#1077#1082#1094#1080#1080'.'#1053#1072#1079#1074#1072#1085#1080 +
        #1077#1051#1077#1082#1094#1080#1080
      
        'FROM ('#1056#1072#1079#1076#1077#1083' INNER JOIN '#1058#1077#1084#1072' ON '#1056#1072#1079#1076#1077#1083'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072' = '#1058#1077#1084#1072'.'#1050#1086#1076#1056#1072#1079#1076 +
        #1077#1083#1072') INNER JOIN '#1051#1077#1082#1094#1080#1080' ON '#1058#1077#1084#1072'.'#1050#1086#1076#1058#1077#1084#1099' = '#1051#1077#1082#1094#1080#1080'.'#1050#1086#1076#1058#1077#1084#1099
      
        'ORDER BY '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1051#1077#1082#1094#1080#1080'.'#1053#1072#1079#1074#1072 +
        #1085#1080#1077#1051#1077#1082#1094#1080#1080';')
    Left = 232
    Top = 528
  end
  object PracticCRUD: TDataSource
    DataSet = ADOPracticCRUD
    Left = 336
    Top = 576
  end
  object ADOPracticCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077'.'#1053#1072#1079#1074#1072#1085#1080#1077#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081', '#1056#1072#1079 +
        #1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072
      
        'FROM ('#1056#1072#1079#1076#1077#1083' INNER JOIN '#1058#1077#1084#1072' ON '#1056#1072#1079#1076#1077#1083'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072' = '#1058#1077#1084#1072'.'#1050#1086#1076#1056#1072#1079#1076 +
        #1077#1083#1072') INNER JOIN '#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' ON '#1058#1077#1084#1072'.'#1050#1086#1076#1058#1077#1084#1099' = '#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077'.'#1050#1086#1076#1058 +
        #1077#1084#1099
      
        'ORDER BY '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077 +
        '.'#1053#1072#1079#1074#1072#1085#1080#1077#1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081';')
    Left = 336
    Top = 528
  end
  object ControlCRUD: TDataSource
    DataSet = ADOControlCRUD
    Left = 432
    Top = 576
  end
  object ADOControlCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1050#1086#1085#1090#1088#1086#1083#1100'.'#1053#1072#1079#1074#1072#1085#1080#1077#1050#1086#1085#1090#1088#1086#1083#1103', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074 +
        #1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072
      
        'FROM '#1056#1072#1079#1076#1077#1083' INNER JOIN ('#1050#1086#1085#1090#1088#1086#1083#1100' INNER JOIN '#1058#1077#1084#1072' ON '#1050#1086#1085#1090#1088#1086#1083#1100'.'#1050#1086#1076 +
        #1058#1077#1084#1099' = '#1058#1077#1084#1072'.'#1050#1086#1076#1058#1077#1084#1099') ON '#1056#1072#1079#1076#1077#1083'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072' = '#1058#1077#1084#1072'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072
      
        'ORDER BY '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1050#1086#1085#1090#1088#1086#1083#1100'.'#1053#1072#1079 +
        #1074#1072#1085#1080#1077#1050#1086#1085#1090#1088#1086#1083#1103';')
    Left = 432
    Top = 528
  end
end
