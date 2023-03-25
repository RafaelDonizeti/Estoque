unit uConsMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask;

type
  TformConsMovimentacao = class(TForm)
    Label1: TLabel;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnConsultar: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    lblTotal: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsMovimentacao: TformConsMovimentacao;

implementation

{$R *.dfm}

uses unitDM;

procedure TformConsMovimentacao.btnConsultarClick(Sender: TObject);
begin
  DM.sqlMovimentacoes.Close;
  DM.sqlMovimentacoes.SQL.Clear;
  DM.sqlMovimentacoes.SQL.Text := 'SELECT * FROM movimentacoes WHERE Date (data_hora) BETWEEN :pDataInicial AND :pDataFinal';
  DM.sqlMovimentacoes.ParamByName('pDataInicial').Value := FormatDateTime('YYYY-mm-dd',strtodate(txtDataInicial.Text));
  DM.sqlMovimentacoes.ParamByName('pDataFinal').Value := FormatDateTime('YYYY-mm-dd',strtodate(txtDataFinal.Text));
  DM.sqlMovimentacoes.Open;

  lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);
end;

procedure TformConsMovimentacao.FormShow(Sender: TObject);
begin
DM.sqlMovimentacoes.Refresh;
dm.sqlMovProdutos.Refresh;
lblTotal.Caption := IntToStr(DM.sqlMovimentacoes.RecordCount);
end;

end.
