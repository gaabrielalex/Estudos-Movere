using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppCSharp
{
	internal class Program
	{
		static void Main(string[] args)
		{
		Console.WriteLine("Bem vindo ao sistema");

			Console.WriteLine("\nConsultes as opções disponíveis e informe a desejada:");
			Console.WriteLine(" 1 - Calcular valor montante com juros compostos");
			Console.WriteLine(" 2 - Ver se um´número é par");
			Console.WriteLine(" 3 - Realizar a simulação de financiamento");


			Console.Write("\nDigite o número da opção desejada: ");

			var opcao = int.Parse(Console.ReadLine());
		
			switch (opcao)
			{
				case 1:
					Console.Clear();
					TratarCasoDeCalcularValorMontanteComJurosCompostos();
					break;
				case 2:
					Console.Clear();
					TratarCasoDeVerSeNumeroEhPar();
					break;
				case 3:
					Console.Clear();
					TratarCasoDCalcularSimulacaoDeFinanciamento();
					break;
				default:
					Console.WriteLine("\nOpção inválida, oinsira uma opção válida na próxima");
					Console.WriteLine("\nSelecione enter para reiniciar o programa");
					Console.ReadLine();

					// Obtém o caminho completo do arquivo executável atual
					string executablePath = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;

					// Inicia uma nova instância do aplicativo
					Process.Start(executablePath);

					// Encerra a instância atual do aplicativo
					Environment.Exit(0);
					break;
			}

			

		}

		/*public void TratarCasode*/

		public static void TratarCasoDeCalcularValorMontanteComJurosCompostos()
		{

			//Declaração de varáveis de objetos
			var calculadora = new Calculadora();

			//Obtendo os dados
			Console.WriteLine("Para calcular o montante para juros compostos, informe a parcela, taxa e meses, segue:");


			//Ao inserir cada um dos valores, o separador decimal deve '," e não "."
			Console.WriteLine("Parcela: ");

			decimal parcela = decimal.Parse(Console.ReadLine());

			Console.WriteLine("Taxa: ");

			decimal taxa = decimal.Parse(Console.ReadLine());

			Console.WriteLine("Meses: ");

			int meses = int.Parse(Console.ReadLine());


			//Caculando o montante
			var resultado = calculadora.CalcularValorMontanteComJurosCompostos(parcela, taxa, meses);


			Console.WriteLine("O montante calculado para os valores informados foi:" + resultado.ToString());
		}

		public static void TratarCasoDeVerSeNumeroEhPar() {
			Console.WriteLine("Informe um número, por favor ....");

			Console.WriteLine("Vamos ver se é par: ");

			var texto = Console.ReadLine();


			if (int.TryParse(texto, out int numero))
			{
				var calculador = new Calculadora();

				var par = calculador.EhPar(numero);

				if (par)
				{
					Console.WriteLine("muito bonito, vc digitou um número par!");
				}
				else
				{
					Console.WriteLine("Maravilha, este é um número ímpar!");
				}
			}
			else
			{
				Console.WriteLine("Não foi possível ler o número, possívelmente vc passou um valor que não é um número");
			}

		}

		public static void TratarCasoDCalcularSimulacaoDeFinanciamento()
		{
			//Declaração de varáveis de objetos
			var calculadora = new Calculadora();

			//Obtendo os dados
			Console.WriteLine("Para realizar a simulação de financiamento, informe o valor do financiamanto, o número máximo de parcelas e a taxa de juros:, segue:\n");

			Console.Write("\nValor do financiamento: ");
			decimal valorFinanciamento = decimal.Parse(Console.ReadLine());

			Console.Write("Número máximo de parcelas: ");
			int parcelas = int.Parse(Console.ReadLine());

			Console.Write("Taxa de juros: ");
			decimal taxa = decimal.Parse(Console.ReadLine());

			//Apresentando dados obtidos
			Console.WriteLine($"\n\nAguarde, calculando...");
			Console.WriteLine($"Total Financiado: R$ {valorFinanciamento}");
			Console.WriteLine($"Taxa Utilizada: {taxa}%");
			Console.WriteLine($"Meses: {parcelas}");


			//Caculando
			var resultados = calculadora.CalcularSimulacaoDeFinanciamento(valorFinanciamento, taxa, parcelas);


			Console.WriteLine("\n\n-------------- Financiamentos --------------\n");
			foreach(SimulacaoParcela simulacaoParcela in resultados)
			{
				Console.WriteLine($"{simulacaoParcela.Quantidade} X R$ {Math.Round(simulacaoParcela.ValorDaParcela, decimals: 2)} = R$ {Math.Round(simulacaoParcela.ValorTotal, decimals: 2)} [Total de Juros: R$ {Math.Round(simulacaoParcela.ValorJuros, decimals: 2)}] [{simulacaoParcela.Vencimento.ToString("dd/MM/yyyy")}]");
			}
		}
	}
}
