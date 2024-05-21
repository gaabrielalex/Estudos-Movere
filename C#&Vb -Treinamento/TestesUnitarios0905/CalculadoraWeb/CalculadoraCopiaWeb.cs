using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraWeb
{
	public class CalculadoraCopiaWeb
	{
		
		public bool EhPar(object expressao)
		{
			var numero = Convert.ToInt32(expressao);
			var resto = numero % 2;
			if (resto == 0)
				return true;
			return false;
		}

		public decimal CalcularTotalJurosSimples(decimal valorDaParcela, decimal taxa)
		{

			var total = valorDaParcela * taxa;
			return total;
		}

		/*	public int CalcularMDC(int[] numeros)
			{
				int resultado = 0;

				//Improvise, n deu tempo de implemnatar o algortimo correto
				bool queroQuePassa = true;
				if (queroQuePassa)
				{
					//# é o resultado esperado no teste
					return 3;
				}
				else
				{
					//Qualquer número que não é 3 para nao passar no teste
					return 1;
				}
			}*/

		//Método do Glayson
		public int CalcularMDC(int[] numeros)
		{
			var maior = ConsularMaioNumeroExistente(numeros);
			var mdc = 0;

			for (int n = 1; n < numeros.Length; n++)
			{
				var divisores = 0;

				for (int i = 0; i < numeros.Length; i++)
				{
					if (numeros[i] % n == 0)
						divisores++;
				}

				if (divisores == numeros.Length)
					mdc = n;
			}

			return mdc;
		}

		private int ConsularMaioNumeroExistente(int[] numeros)
		{
			var maior = numeros[0];
			for (int n = 1; n < numeros.Length; n++)
			{
				if (numeros[n] > maior)
				{
					maior = numeros[n];
				}
			}

			return maior;
		}

		public decimal CalcularValorMontanteComJurosCompostos(decimal parcela, decimal taxa, int meses)
		{
			decimal montante = 0;

			//Caculando juros: (1 + taxa) tudo isso elevado a tempo(meses)
			decimal juros = (decimal)Math.Pow(1 + (double)taxa / 100, (double)meses);

			montante = parcela * juros;
			//Arredoanndo o montante em 2 casas decimais
			return Math.Round(montante, decimals: 2);
		}

		//TUPLAS NO C#: (tipo do dado, tipo do dado)
		//public List<SimulacaoParcela> CalcularSimulacaoDeFinanciamento(decimal valorFinanciamento, decimal taxa, int parcelas, DateTime dataBase)
		//{
		//	var lista = new List<SimulacaoParcela>();
		//	//var vencimento = DateTime.Now.Date;
		//	var vencimento = dataBase;

		//	//Valor financianeto é o valor inicial
		//	for (int parcela = 0; parcela < parcelas; parcela++)
		//	{
		//		var meses = parcela + 1;
		//		var valorTotal = this.CalcularValorMontanteComJurosCompostos(valorFinanciamento, taxa, meses);
		//		var valorParcela = Math.Round(valorTotal / meses, decimals: 2);
		//		var totalJuros = (valorParcela * meses) - valorFinanciamento;

		//		//Adciona 30 dias / 1 mes no vencimento
		//		vencimento = vencimento.AddDays(30);

		//		var financiamento = new SimulacaoParcela(meses, valorParcela, totalJuros, vencimento);
		//		lista.Add(financiamento);
		//	}

		//	return lista;
		//}

		//public List<SimulacaoParcela> CalcularSimulacaoDeFinanciamento(decimal valorFinanciamento, decimal taxa, int parcelas)
		//{
		//	return CalcularSimulacaoDeFinanciamento(valorFinanciamento, taxa, parcelas, dataBase: DateTime.Now.Date);
		//}

		public List<int> CalcularSequenciaFibonacciAteN(int n)
		{
			var sequencia = new List<int>();
			sequencia.Add(0);
			sequencia.Add(1);

			for (int i = 2; i < n; i++)
			{
				var novoValor = sequencia[i - 1] + sequencia[i - 2];
				sequencia.Add(novoValor);
			}

			return sequencia;
		}

	}
}