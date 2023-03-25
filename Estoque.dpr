program Estoque;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {formPrincipal},
  uCadProdutos in 'uCadProdutos.pas' {formCadProdutos},
  uCadMovimentacao in 'uCadMovimentacao.pas' {formCadMovimentacao},
  uConsMovimentacao in 'uConsMovimentacao.pas' {formConsMovimentacao},
  unitDM in 'unitDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TformCadProdutos, formCadProdutos);
  Application.CreateForm(TformCadMovimentacao, formCadMovimentacao);
  Application.CreateForm(TformConsMovimentacao, formConsMovimentacao);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
