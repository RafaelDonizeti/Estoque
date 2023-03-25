object formCadMovimentacao: TformCadMovimentacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 511
  ClientWidth = 1194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 56
    Top = 24
    Width = 271
    Height = 25
    Caption = 'Gerenciar Movimenta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 109
    Width = 129
    Height = 16
    Caption = 'Tipo de Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 164
    Width = 68
    Height = 16
    Caption = 'Data e Hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 235
    Width = 71
    Height = 16
    Caption = 'Respons'#225'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 301
    Width = 73
    Height = 16
    Caption = 'Observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 768
    Top = 64
    Width = 287
    Height = 25
    Caption = 'Produtos da Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 776
    Top = 484
    Width = 146
    Height = 19
    Caption = 'Total de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtTotalProdutos: TLabel
    Left = 928
    Top = 484
    Width = 20
    Height = 19
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBComboBox1: TDBComboBox
    Left = 56
    Top = 134
    Width = 145
    Height = 24
    Style = csDropDownList
    DataField = 'tipo'
    DataSource = DM.dsMovimentacoes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Entrada no Estoque'
      'Sa'#237'da do Estoque')
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 189
    Width = 121
    Height = 24
    DataField = 'data_hora'
    DataSource = DM.dsMovimentacoes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 56
    Top = 326
    Width = 281
    Height = 177
    DataField = 'observacoes'
    DataSource = DM.dsMovimentacoes
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 56
    Top = 55
    Width = 328
    Height = 34
    DataSource = DM.dsMovimentacoes
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 3
    OnClick = DBNavigator1Click
  end
  object DBGrid1: TDBGrid
    Left = 343
    Top = 235
    Width = 362
    Height = 268
    DataSource = DM.dsMovimentacoes
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_hora'
        Title.Caption = 'Data e Hora'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'Respons'#225'vel'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit
    Left = 56
    Top = 268
    Width = 121
    Height = 27
    DataField = 'responsavel'
    DataSource = DM.dsMovimentacoes
    TabOrder = 5
  end
  object DBNavigator2: TDBNavigator
    Left = 808
    Top = 125
    Width = 220
    Height = 38
    DataSource = DM.ds_MovProdutos
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 776
    Top = 189
    Width = 220
    Height = 27
    DataField = 'id_produto'
    DataSource = DM.ds_MovProdutos
    KeyField = 'id'
    ListField = 'nome'
    ListSource = DM.dsProdutos
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 1033
    Top = 189
    Width = 88
    Height = 27
    DataField = 'quantidade'
    DataSource = DM.ds_MovProdutos
    TabOrder = 8
  end
  object DBGrid2: TDBGrid
    Left = 768
    Top = 222
    Width = 409
    Height = 241
    DataSource = DM.ds_MovProdutos
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome Produto'
        Visible = True
      end>
  end
end
