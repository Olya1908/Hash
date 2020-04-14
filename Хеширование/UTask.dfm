object FormTask: TFormTask
  Left = 429
  Top = 115
  BorderStyle = bsDialog
  Caption = #1055#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1092#1080#1083#1100#1084#1072' '#1074#1099#1074#1077#1089#1090#1080' '#1074#1089#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1085#1077#1084
  ClientHeight = 127
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 127
    Align = alClient
    TabOrder = 0
    object lblFName: TLabel
      Left = 16
      Top = 24
      Width = 263
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080':'
    end
    object edtInputFName: TEdit
      Left = 16
      Top = 48
      Width = 577
      Height = 21
      TabOrder = 0
      OnChange = edtInputFNameChange
    end
    object btnFind: TButton
      Left = 160
      Top = 88
      Width = 121
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      Enabled = False
      TabOrder = 1
      OnClick = btnFindClick
    end
    object btnCancel: TButton
      Left = 312
      Top = 88
      Width = 113
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
end
