using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppCSharp
{
	internal class Program
	{
		static void Main(string[] args)
		{

			//Forma antiga de comunição com o usuário
			/*Console.WriteLine("Hellow ....");

			Console.WriteLine("Informe um número, por favor ....");

			Console.WriteLine("Vamos ver se é par: ");

			var texto = Console.ReadLine();


			if (int.TryParse(texto, out int numero))
			{
				var calculador = new Calculadora();

				var par = calculador.EhPar(numero);
				
				if(par) {
					Console.WriteLine("Muito bonito, vc digitou um número par!");
				} else {
					Console.WriteLine("Maravilha, este é um número ímpar!");
				}
			} else {
				Console.WriteLine("Não foi possível ler o número, possívelmente vc passou um valor que não é um número");
			}*/

			Console.WriteLine("Bem vindo ao sistema");

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
			var resultado = Calculadora.CalcularValorMontanteComJurosCompostos(parcela, taxa, meses);


			Console.WriteLine("O montante calculado para os valores informados foi:" + resultado.ToString());

		}
	}
}
