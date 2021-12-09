unit UntCalculadoraFinanciamento;

interface

type
  TCalculadoraFinanciamento = Class
    ValorEmprestimo, ValorMensalidade, TaxaJuros: Double;
    TextoLido: String;
    DataInicioPagamento, DataFimPagamento: TDateTime;
    TotalMesesParcelamento: integer;
    procedure ColetarValorEmprestimo;
    procedure ColetarDataInicioPagamento;
    procedure ColetarQuantidadeMesesParcelamento;
    procedure ColetarTaxaDeJuros;
    procedure CalcularJurosMensalidade;
    procedure MostrarValorMensalidade;
    procedure CalcularFimPagamento;
    procedure MostrarConclusaoFinanciamento;
    procedure Executar;
  end;


implementation

uses
  SysUtils, DateUtils, Math;



procedure TCalculadoraFinanciamento.ColetarValorEmprestimo;
begin
  repeat
    Writeln('@-------------------------------------------------------------------@');
    Writeln('@--                 Digite o valor do emprestimo                  --@');
    Writeln('@-------------------------------------------------------------------@');
    Write('R$ ');Readln(ValorEmprestimo);

    if ValorEmprestimo <= 0 then  begin
      Writeln('@--------- Valor do emprestimo invalido ou nao informado ---------@');
    end;
  until ValorEmprestimo > 0;
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
    Write('Meses para finalizacao do pagamento: '); Read(TotalMesesParcelamento);

    if TotalMesesParcelamento <= 0 then begin
      Writeln('@--------- Quantidade de meses invalida ou nao foi informada -------@');
    end
  until TotalMesesParcelamento >0;
end;

procedure TCalculadoraFinanciamento.ColetarTaxaDeJuros;
begin
  repeat
    Writeln('@-------------------------------------------------------------------@');
    Writeln('@--                     Digite a taxa de juros                    --@');
    Writeln('@-------------------------------------------------------------------@');
    Write('Porcentagem de Juros: ');Readln(TaxaJuros);
    TaxaJuros := TaxaJuros / 100;

    if TaxaJuros <= 0 then begin
      Writeln('@--------- Taxa de juros invalida ou nao foi informada -------@');
    end
  until TaxaJuros > 0;
end;

procedure TCalculadoraFinanciamento.CalcularJurosMensalidade;
begin
  ValorMensalidade := ValorEmprestimo * (TaxaJuros / ( 1- Power((1 + TaxaJuros), -TotalMesesParcelamento)))
end;

procedure TCalculadoraFinanciamento.MostrarValorMensalidade;
begin
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@--                          Valor Mensal                         --@');
  Writeln('@-------------------------------------------------------------------@');
  Writeln('                             R$' + ' ' + FormatFloat(',##0.00                             ', ValorMensalidade));
  Writeln('@-------------------------------------------------------------------@');
  Writeln('');
end;

procedure TCalculadoraFinanciamento.CalcularFimPagamento;
begin
  DataFimPagamento := IncMonth(DataInicioPagamento,TotalMesesParcelamento );
end;

procedure TCalculadoraFinanciamento.MostrarConclusaoFinanciamento;
begin
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@--                           Conclusao                           --@');
  Writeln('@-------------------------------------------------------------------@');
  Writeln('A Previsão de conclusao do parcelamento e: ' + DateToStr(DataFimPagamento));
  Writeln('@-------------------------------------------------------------------@');
  Writeln('');
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
    ColetarTaxaDeJuros;
    CalcularJurosMensalidade;
    MostrarValorMensalidade;
    CalcularFimPagamento;
    MostrarConclusaoFinanciamento;

    Writeln('Pressione 1 para continuar ou pressione outra tecla para sair');
    Readln(Continua);

    Writeln('-------------------------------------------------------');
  until Continua <> '1';
end;

end.

