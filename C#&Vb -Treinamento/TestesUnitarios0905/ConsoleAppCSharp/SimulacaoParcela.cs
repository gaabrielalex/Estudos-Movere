using System;

namespace ConsoleAppCSharp
{
	public class SimulacaoParcela
	{	
		public int Quantidade {  get;}
		public decimal ValorTotal { 
			get { return ValorDaParcela * Quantidade; }
		}
		public decimal ValorDaParcela { 
			get;
			private set;
		}

		public decimal ValorJuros{  
			get;
		}

		public DateTime Vencimento { get;}

		public SimulacaoParcela(int quantidade, decimal valorParcela, decimal totalJuros, DateTime vencimento)
		{	
			Quantidade = quantidade;
			ValorDaParcela = valorParcela;
			ValorJuros = totalJuros;
			Vencimento = vencimento;
		}

	}
}
