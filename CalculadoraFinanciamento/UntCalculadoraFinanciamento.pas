unit UntCalculadoraFinanciamento;

interface

type
  TCalculadoraFinanciamento = Class
    ValorEmprestimo, TotalMesesParcelamento, ValorParcelamento, TaxaJurosMensal: Double;
    TextoLido: String;
    DataInicioPagamento, DataFimPagamento: TDate;
    procedure ColetarValorEmprestimo;
    procedure ColetarDataInicioPagamento;
    procedure ColetarQuantidadeMesesParcelamento;
    procedure Executar;
  end;

implementation

uses
  SysUtils, DateUtils, Math;

procedure TCalculadoraFinanciamento.ColetarValorEmprestimo;
begin
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@--                 Digite o valor do emprestimo                  --@');
  Writeln('@-------------------------------------------------------------------@');
  Readln(ValorEmprestimo);
end;

procedure TCalculadoraFinanciamento.ColetarDataInicioPagamento;
begin
  repeat
    Writeln('@-------------------------------------------------------------------@');
    Writeln('@--           Digite a data que pretende comecar a pagar          --@');
    Writeln('@-------------------------------------------------------------------@');
    Readln(TextoLido);
    DataInicioPagamento := StrToDateDef(TextoLido, 0);

    if DataInicioPagamento <= 0 then begin
      Writeln('@--------- A data informada e invalida ou nao foi informada --------@');
    end;
  until DataInicioPagamento > 0;
end;

procedure TCalculadoraFinanciamento.ColetarQuantidadeMesesParcelamento;
begin
  repeat
    Writeln('@-------------------------------------------------------------------@');
    Writeln('@--          Digite a quantidade de meses do parcelamento         --@');
    Writeln('@-------------------------------------------------------------------@');
    Readln(TotalMesesParcelamento);

    if TotalMesesParcelamento <= 0 then begin
      Writeln('@--------- Quantidade de meses invalida ou nao foi informada -------@');
    end
  until TotalMesesParcelamento >0;
end;

procedure TCalculadoraFinanciamento.Executar;
var
  Continua: String;
begin
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@---------- Bem vindo ao Programa Minha Casa Minha Divida ----------@');
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@-------------------------------Atencao-----------------------------@');
  Writeln('@----------Nao sera permitido informar valores negativos------------@');
  Writeln('@-------------------------------------------------------------------@');
  Writeln('');

  repeat
    ColetarValorEmprestimo;
    ColetarDataInicioPagamento;
    ColetarQuantidadeMesesParcelamento;

    Writeln('Pressione 1 para continuar ou pressione outra tecla para sair');
    Readln(Continua);

    Writeln('-------------------------------------------------------');
  until Continua <> '1';
end;

end.

