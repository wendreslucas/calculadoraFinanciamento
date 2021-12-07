unit UntDados;

interface

implementation

uses
  SysUtils, DateUtils, Math;

var
  ValorEmprestimo: Double;

procedure ColetarValorEmprestimo;
begin
  Writeln('@-------------------------------------------------------------------@');
  Writeln('@--                 Digite o valor do emprestimo				           --@');
  Writeln('@-------------------------------------------------------------------@');
  Readln(ValorEmprestimo);
end;

procedure TCalculadoraFinanciamento.Executar;
var
  Continua: String;
begin
  Writeln('@-----------------------------------------------------@');
  Writeln('---  Bem vindo ao Programa Minha Casa Minha Divida  ---');
  Writeln('-------------------------------------------------------');
  Writeln('---------------------Atencao---------------------------');
  Writeln('----Nao sera permitido informar valores negativos------');
  Writeln('-------------------------------------------------------');

  repeat
    ColetarValorEmprestimo;


    Writeln('Pressione 1 para continuar ou pressione outra tecla para sair');
    Readln(Continua);

    Writeln('-------------------------------------------------------');
  until Continua <> '1';
end;

end.
