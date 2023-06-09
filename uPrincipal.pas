unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Cadastros1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Movimentaes1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    ConsultarMovimentaes1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
    procedure ConsultarMovimentaes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uCadProdutos, uConsMovimentacao, uCadMovimentacao;

procedure TformPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
formCadProdutos.showmodal;
end;

procedure TformPrincipal.ConsultarMovimentaes1Click(Sender: TObject);
begin
formConsMovimentacao.showmodal;
end;

procedure TformPrincipal.GerenciarMovimentaes1Click(Sender: TObject);
begin
formCadMovimentacao.showmodal;
end;

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin
application.Terminate;
end;

end.
