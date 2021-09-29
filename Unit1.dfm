object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 272
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 168
    Top = 155
    Width = 82
    Height = 23
    Caption = 'Resultado'
  end
  object Button_Um: TButton
    Left = 32
    Top = 32
    Width = 81
    Height = 32
    Caption = '1'
    TabOrder = 0
    OnClick = Button_UmClick
  end
  object Button_Dois: TButton
    Left = 288
    Top = 32
    Width = 83
    Height = 32
    Caption = '2'
    TabOrder = 1
    OnClick = Button_DoisClick
  end
  object Edit_1: TEdit
    Left = 32
    Top = 80
    Width = 81
    Height = 31
    TabOrder = 2
  end
  object Edit_2: TEdit
    Left = 288
    Top = 80
    Width = 83
    Height = 31
    TabOrder = 3
  end
  object Button_Menos: TButton
    Left = 448
    Top = 32
    Width = 83
    Height = 32
    Caption = '-'
    TabOrder = 4
    OnClick = Button_MenosClick
  end
  object Button_Mais: TButton
    Left = 448
    Top = 70
    Width = 83
    Height = 32
    Caption = '+'
    TabOrder = 5
    OnClick = Button_MaisClick
  end
  object Edit_Resultado: TEdit
    Left = 144
    Top = 184
    Width = 121
    Height = 31
    TabOrder = 6
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 424
    Top = 160
  end
end
