program CalculadoraFinanciamento;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DateUtils,
  Math,
  UntCalculadoraFinanciamento in 'UntCalculadoraFinanciamento.pas';

var
  Calculadora: TCalculadoraFinanciamento;
begin
  Calculadora := TCalculadoraFinanciamento.Create;
  try
    Calculadora.Executar;
  finally
    Calculadora.Free;
  end;
end.