object FormMain: TFormMain
  Left = 197
  Top = 275
  AutoScroll = False
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1092#1080#1083#1100#1084#1072#1093
  ClientHeight = 271
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TStringGrid
    Left = 0
    Top = 0
    Width = 975
    Height = 271
    Align = alClient
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 0
    OnDrawCell = GridDrawCell
    ColWidths = (
      30
      164
      178
      239
      356)
    RowHeights = (
      24
      22)
  end
  object OpenDialog: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt'
    Left = 192
    Top = 360
  end
  object SaveDialog: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt'
    Left = 160
    Top = 360
  end
  object MainMenu: TMainMenu
    Left = 56
    object mFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mCreate: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = mCreateClick
      end
      object mOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = mOpenClick
      end
      object mSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        OnClick = mSaveClick
      end
      object mSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'..'
        Enabled = False
        OnClick = mSaveAsClick
      end
      object mExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mExitClick
      end
    end
    object mEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Enabled = False
      object mAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Enabled = False
        OnClick = mAddClick
      end
      object mDel: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        OnClick = mDelClick
      end
    end
    object mTask: TMenuItem
      Caption = #1047#1072#1076#1072#1085#1080#1077
      Enabled = False
      OnClick = mTaskClick
    end
  end
end
