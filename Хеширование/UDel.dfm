object FormDel: TFormDel
  Left = 828
  Top = 107
  BorderStyle = bsDialog
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077
  ClientHeight = 115
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
    Height = 115
    Align = alClient
    TabOrder = 0
    object lblDelFName: TLabel
      Left = 16
      Top = 16
      Width = 190
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072' '#1091#1076#1072#1083#1077#1085#1080#1103':'
    end
    object edtInpFName: TEdit
      Left = 16
      Top = 40
      Width = 577
      Height = 21
      TabOrder = 0
      OnChange = edtInpFNameChange
    end
    object btnDel: TButton
      Left = 160
      Top = 80
      Width = 121
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = btnDelClick
    end
    object btnCancel: TButton
      Left = 336
      Top = 80
      Width = 121
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
end
