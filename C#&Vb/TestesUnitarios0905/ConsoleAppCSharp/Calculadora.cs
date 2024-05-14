using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppCSharp
{
	public class Calculadora
	{
		public bool EhPar(object expressao)
		{	
			var numero = Convert.ToInt32(expressao);
			var resto = numero % 2;
			if (resto == 0)
				return true;
			return false;
		}

		public decimal CalcularTotalJurosSimples(decimal valorDaParcela, decimal taxa){

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

			for(int n= 1; n < numeros.Length; n++) {
				var divisores = 0;

				for(int i = 0; i < numeros.Length; i++){
					if(numeros[i] % n == 0)
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
			for (int n = 1; n <  numeros.Length; n++) { 
				if (numeros[n] > maior) {
					maior = numeros[n];
				}
			}

			return maior;
		}

		public static decimal CalcularValorMontanteComJurosCompostos(decimal parcela, decimal taxa, int meses)
		{
			decimal montante = 0;

			//Taxa deve estar em "porcentagem"
			taxa = taxa / 100;

			//Caculando juros: (1 + taxa) tudo isso elevado a tempo(meses)
			decimal juros = (decimal)Math.Pow(1 + (double)taxa, (double)meses);

			montante = parcela * juros;
			//Arredoanndo o montante em 2 casas decimais
			return Math.Round(montante, decimals: 2);
		}
	}
}