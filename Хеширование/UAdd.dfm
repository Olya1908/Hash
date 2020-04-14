object FormAdd: TFormAdd
  Left = 513
  Top = 300
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 292
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 292
    Align = alClient
    TabOrder = 0
    object lblFName: TLabel
      Left = 16
      Top = 16
      Width = 138
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072':'
    end
    object lblDirectro: TLabel
      Left = 16
      Top = 64
      Width = 104
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1088#1077#1078#1080#1089#1089#1077#1088#1072':'
    end
    object lblActors: TLabel
      Left = 16
      Top = 120
      Width = 92
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1072#1082#1090#1077#1088#1086#1074':'
    end
    object lblSummary: TLabel
      Left = 16
      Top = 176
      Width = 157
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
    end
    object edtInputFName: TEdit
      Left = 16
      Top = 32
      Width = 577
      Height = 21
      TabOrder = 0
      OnChange = edtInputFNameChange
    end
    object edtInputDir: TEdit
      Left = 16
      Top = 88
      Width = 577
      Height = 21
      Enabled = False
      TabOrder = 1
      OnChange = edtInputDirChange
    end
    object edtInputAct: TEdit
      Left = 16
      Top = 144
      Width = 577
      Height = 21
      Enabled = False
      TabOrder = 2
      OnChange = edtInputActChange
    end
    object edtInputSum: TEdit
      Left = 16
      Top = 208
      Width = 577
      Height = 21
      Enabled = False
      TabOrder = 3
      OnChange = edtInputSumChange
    end
    object btnAdd: TButton
      Left = 160
      Top = 248
      Width = 121
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnCancel: TButton
      Left = 336
      Top = 248
      Width = 121
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 5
      OnClick = btnCancelClick
    end
  end
end
