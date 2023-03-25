unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Vcl.Dialogs;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    tb_Produtos: TFDTable;
    dsProdutos: TDataSource;
    tb_movimentacoes: TFDTable;
    dsMovimentacoes: TDataSource;
    tb_MovProdutos: TFDTable;
    ds_MovProdutos: TDataSource;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    dsSqlMovimentacoes: TDataSource;
    tb_Produtosid: TFDAutoIncField;
    tb_Produtosnome: TStringField;
    tb_Produtosfabricante: TStringField;
    tb_Produtosvalidade: TDateField;
    tb_Produtosestoque_atual: TIntegerField;
    tb_movimentacoesid: TFDAutoIncField;
    tb_movimentacoestipo: TStringField;
    tb_movimentacoesdata_hora: TDateTimeField;
    tb_movimentacoesresponsavel: TStringField;
    tb_movimentacoesobservacoes: TStringField;
    tb_MovProdutosid: TFDAutoIncField;
    tb_MovProdutosid_movimentacao: TIntegerField;
    tb_MovProdutosid_produto: TIntegerField;
    tb_MovProdutosquantidade: TIntegerField;
    tb_MovProdutosNomeProduto: TStringField;
    sqlMovProdutos: TFDQuery;
    dsSqlMovProdutos: TDataSource;
    sqlMovProdutosid_produto: TIntegerField;
    sqlMovProdutosid: TFDAutoIncField;
    sqlMovProdutosid_movimentacao: TIntegerField;
    sqlMovProdutosquantidade: TIntegerField;
    sqlMovProdutosnomeProduto: TStringField;
    procedure tb_MovProdutosAfterPost(DataSet: TDataSet);
    procedure tb_MovProdutosAfterDelete(DataSet: TDataSet);
    procedure calcularTotais;
    procedure tb_movimentacoesAfterScroll(DataSet: TDataSet);
    procedure tb_MovProdutosBeforeDelete(DataSet: TDataSet);
    procedure tb_movimentacoesBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uCadMovimentacao;

{$R *.dfm}

procedure TDM.calcularTotais;
var

  totais: Integer;

begin
  if tb_MovProdutos.State in [dsBrowse] then
  begin
    tb_MovProdutos.First;
    while not tb_MovProdutos.eof do
      begin
        totais := totais + tb_MovProdutos.FieldByName('quantidade').value;
        tb_MovProdutos.Next;
      end;

    formCadMovimentacao.txtTotalProdutos.Caption := IntToStr(totais);
  end;
end;

procedure TDM.tb_movimentacoesAfterScroll(DataSet: TDataSet);
begin
  calcularTotais;
end;

procedure TDM.tb_movimentacoesBeforeDelete(DataSet: TDataSet);
begin
  if tb_MovProdutos.RecordCount > 0 then
    begin
      ShowMessage('Existem produtos cadastrados nessa movimentação. Exclua-os primeiro');
      abort;
    end;

end;

procedure TDM.tb_MovProdutosAfterDelete(DataSet: TDataSet);
begin
  calcularTotais;

  
end;

procedure TDM.tb_MovProdutosAfterPost(DataSet: TDataSet);
begin
  calcularTotais;

  if (tb_movimentacoes.FieldByName('tipo').Value = 'Entrada no Estoque') then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tb_MovProdutos.FieldByName('id_Produto').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tb_MovProdutos.FieldByName('quantidade').Value;
      sqlAumentaEstoque.Execute;
    end;

    if (tb_movimentacoes.FieldByName('tipo').Value = 'Saída do Estoque') then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tb_MovProdutos.FieldByName('id_Produto').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tb_MovProdutos.FieldByName('quantidade').Value;
      sqlDiminuiEstoque.Execute;
    end;

end;

procedure TDM.tb_MovProdutosBeforeDelete(DataSet: TDataSet);
begin
  if (tb_movimentacoes.FieldByName('tipo').Value = 'Entrada no Estoque') then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tb_MovProdutos.FieldByName('id_Produto').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tb_MovProdutos.FieldByName('quantidade').Value;
      sqlDiminuiEstoque.Execute;
    end;

    if (tb_movimentacoes.FieldByName('tipo').Value = 'Saída do Estoque') then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tb_MovProdutos.FieldByName('id_Produto').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tb_MovProdutos.FieldByName('quantidade').Value;
      sqlAumentaEstoque.Execute;
    end;
end;

end.
