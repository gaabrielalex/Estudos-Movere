using System;

namespace ConsoleAppCSharp
{
	public class SimulacaoParcela
	{	
		public int Quantidade {  get;}
		public decimal ValorInicial {  get;}
		public decimal ValorTotal { get;}
		public decimal ValorDaParcela { 
			get;
			private set;
		}

		public decimal ValorJuros{  
			get;
			private set;
		}

		public SimulacaoParcela(decimal valorIncial, int quantidade, decimal valorTotal)
		{	
			ValorInicial = valorIncial;
			Quantidade = quantidade;
			ValorTotal = valorTotal;
			CalcularValorDaParcela();
			CalcularJuros();
		}

		public void CalcularValorDaParcela() {
			ValorDaParcela = ValorTotal / Quantidade;	
		}

		public void CalcularJuros() {
			ValorJuros = ValorTotal - ValorInicial;
		}
	}
}
