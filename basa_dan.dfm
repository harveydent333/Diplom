object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 259
  Top = 268
  Height = 547
  Width = 856
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
  object EditRazdel: TDataSource
    DataSet = EditRazdelADO
    Left = 576
    Top = 64
  end
  object EditRazdelADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1056#1072#1079#1076#1077#1083';')
    Left = 568
    Top = 16
  end
  object EditTemaADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1058#1077#1084#1072';')
    Left = 656
    Top = 16
  end
  object EditTema: TDataSource
    DataSet = EditTemaADO
    Left = 664
    Top = 64
  end
  object EditControl: TDataSource
    DataSet = EditControlADO
    Left = 744
    Top = 64
  end
  object EditControlADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1050#1086#1085#1090#1088#1086#1083#1100';')
    Left = 744
    Top = 16
  end
  object YchenikADO: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM '#1059#1095#1077#1085#1080#1082';')
    Left = 176
    Top = 232
  end
  object Ychenik: TDataSource
    DataSet = YchenikADO
    Left = 176
    Top = 288
  end
  object ModuleLecture: TDataSource
    DataSet = ADOModuleLecture
    Left = 56
    Top = 288
  end
  object ADOModuleLecture: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 232
  end
  object TemaCRUD: TDataSource
    DataSet = ADOTemaCRUD
    Left = 32
    Top = 128
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
    Top = 88
  end
  object RazdelCRUD: TDataSource
    DataSet = ADORazdelCRUD
    Left = 128
    Top = 128
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
    Top = 88
  end
  object LectureCRUD: TDataSource
    DataSet = ADOLectureCRUD
    Left = 232
    Top = 136
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
    Top = 96
  end
  object PracticCRUD: TDataSource
    DataSet = ADOPracticCRUD
    Left = 336
    Top = 144
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
    Top = 96
  end
  object ControlCRUD: TDataSource
    DataSet = ADOControlCRUD
    Left = 432
    Top = 144
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
    Top = 96
  end
  object ADOMultimediaCRUD: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1056#1072#1079#1076#1077#1083'.'#1053#1072#1079#1074#1072#1085#1080#1077#1056#1072#1079#1076#1077#1083#1072', '#1058#1077#1084#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077#1058#1077#1084#1099', '#1052#1091#1083#1100#1090#1080#1084#1077#1076#1080#1072'.'#1053#1072 +
        #1079#1074#1072#1085#1080#1077#1052#1091#1083#1100#1090#1080#1084#1077#1076#1080#1080
      
        'FROM '#1052#1091#1083#1100#1090#1080#1084#1077#1076#1080#1072' INNER JOIN ('#1056#1072#1079#1076#1077#1083' INNER JOIN '#1058#1077#1084#1072' ON '#1056#1072#1079#1076#1077#1083'.'#1050#1086 +
        #1076#1056#1072#1079#1076#1077#1083#1072' = '#1058#1077#1084#1072'.'#1050#1086#1076#1056#1072#1079#1076#1077#1083#1072') ON '#1052#1091#1083#1100#1090#1080#1084#1077#1076#1080#1072'.'#1050#1086#1076#1058#1077#1084#1099' = '#1058#1077#1084#1072'.'#1050#1086#1076#1058#1077#1084 +
        #1099';'
      '')
    Left = 528
    Top = 144
  end
  object MultimediaCRUD: TDataSource
    DataSet = ADOMultimediaCRUD
    Left = 528
    Top = 192
  end
end
