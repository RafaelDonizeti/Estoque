object DM: TDM
  OldCreateOrder = False
  Height = 533
  Width = 749
  object conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Rafael\Desktop\libmysql.dll'
    Left = 680
    Top = 482
  end
  object tb_Produtos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = conexao
    TableName = 'estoque.produtos'
    Left = 168
    Top = 40
    object tb_Produtosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tb_Produtosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tb_Produtosfabricante: TStringField
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Required = True
      Size = 30
    end
    object tb_Produtosvalidade: TDateField
      FieldName = 'validade'
      Origin = 'validade'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tb_Produtosestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
  end
  object dsProdutos: TDataSource
    DataSet = tb_Produtos
    Left = 163
    Top = 120
  end
  object tb_movimentacoes: TFDTable
    Active = True
    BeforeDelete = tb_movimentacoesBeforeDelete
    AfterScroll = tb_movimentacoesAfterScroll
    IndexFieldNames = 'id'
    Connection = conexao
    TableName = 'estoque.movimentacoes'
    Left = 256
    Top = 40
    object tb_movimentacoesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tb_movimentacoestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object tb_movimentacoesdata_hora: TDateTimeField
      FieldName = 'data_hora'
      Origin = 'data_hora'
      Required = True
    end
    object tb_movimentacoesresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Required = True
      Size = 30
    end
    object tb_movimentacoesobservacoes: TStringField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Required = True
      Size = 100
    end
  end
  object dsMovimentacoes: TDataSource
    DataSet = tb_movimentacoes
    Left = 256
    Top = 120
  end
  object tb_MovProdutos: TFDTable
    Active = True
    AfterPost = tb_MovProdutosAfterPost
    BeforeDelete = tb_MovProdutosBeforeDelete
    AfterDelete = tb_MovProdutosAfterDelete
    IndexName = 'id_movimentacao'
    MasterSource = dsMovimentacoes
    MasterFields = 'id'
    Connection = conexao
    TableName = 'estoque.movimentacoes_produtos'
    Left = 352
    Top = 40
    object tb_MovProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_MovProdutosid_movimentacao: TIntegerField
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
      Required = True
    end
    object tb_MovProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object tb_MovProdutosquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object tb_MovProdutosNomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome Produto'
      LookupDataSet = tb_Produtos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_produto'
      Size = 80
      Lookup = True
    end
  end
  object ds_MovProdutos: TDataSource
    DataSet = tb_MovProdutos
    Left = 352
    Top = 128
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoque_atual = estoque_atual + :pQtd WHERE ' +
        'id = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 80
    Top = 280
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoque_atual = estoque_atual - :pQtd WHERE ' +
        'id = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 74
    Top = 344
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 232
    Top = 280
    ParamData = <
      item
        Name = 'pDataInicial'
      end
      item
        Name = 'pDataFinal'
      end>
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 240
    Top = 352
  end
  object sqlMovProdutos: TFDQuery
    Active = True
    IndexFieldNames = 'id_movimentacao'
    MasterSource = dsSqlMovimentacoes
    MasterFields = 'id'
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes_produtos')
    Left = 432
    Top = 280
    object sqlMovProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object sqlMovProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlMovProdutosid_movimentacao: TIntegerField
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
      Required = True
    end
    object sqlMovProdutosquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object sqlMovProdutosnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tb_Produtos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_produto'
      Size = 50
      Lookup = True
    end
  end
  object dsSqlMovProdutos: TDataSource
    DataSet = sqlMovProdutos
    Left = 424
    Top = 352
  end
end
