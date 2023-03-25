object formConsMovimentacao: TformConsMovimentacao
  Left = 0
  Top = 0
  Caption = 'Consulta de Movimenta'#231#245'es '
  ClientHeight = 508
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 228
    Height = 19
    Caption = 'Consulta de movimenta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 92
    Height = 13
    Caption = 'Digite a Data Inicial'
  end
  object Label3: TLabel
    Left = 192
    Top = 88
    Width = 87
    Height = 13
    Caption = 'Digite a Data Final'
  end
  object Label4: TLabel
    Left = 16
    Top = 471
    Width = 153
    Height = 14
    Caption = 'Total de Movimenta'#231#245'es:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 175
    Top = 471
    Width = 16
    Height = 14
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtDataInicial: TMaskEdit
    Left = 16
    Top = 120
    Width = 120
    Height = 21
    EditMask = '##/##/####;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object txtDataFinal: TMaskEdit
    Left = 168
    Top = 120
    Width = 120
    Height = 21
    EditMask = '##/##/####;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object btnConsultar: TButton
    Left = 328
    Top = 118
    Width = 153
    Height = 25
    Caption = 'Consultar Movimenta'#231#245'es'
    TabOrder = 2
    OnClick = btnConsultarClick
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 216
    Width = 320
    Height = 249
    DataSource = DM.dsSqlMovimentacoes
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_hora'
        Title.Caption = 'Data E Hora'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'Respons'#225'vel'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 332
    Top = 216
    Width = 321
    Height = 249
    DataSource = DM.dsSqlMovProdutos
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nomeProduto'
        Title.Caption = 'Nome do Produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end>
  end
end
