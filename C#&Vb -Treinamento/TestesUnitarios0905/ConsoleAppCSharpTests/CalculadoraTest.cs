using ConsoleAppCSharp;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using FluentAssertions;

namespace ConsoleAppCSharpTests
{
	[TestClass]
	public class CalculadoraTest
	{
		[TestMethod]
		public void AoVerificarSeUmNumeroEhParDeveRetornarVerdadeiro()
		{
			var calculadora = new Calculadora();
			var par = calculadora.EhPar(2);
			if (par == false) {
				throw new Exception("O número dois é Par meu amigpo");
			}
			
		}

		[TestMethod]
		public void AoVerificarSeUmNumeroEhImparDeveRetornarFalso()
		{
			var calculadora = new Calculadora();
			var impar = (calculadora.EhPar(3) == false);
			if (impar == false)
			{
				throw new Exception("O número dois é impar meu amigpo");
			}

		}

		[TestMethod]
		public void AoCalcularJuroSimplesDeUmaParcelaDeveInformarValorCorreto()
		{	

			// TIPLE A - AAA - Arrange, Act, Assert
			//Arrange: preparare os dados
			var parcela = 562.3M;
			var taxa = 2.5M;
			var calculadora = new Calculadora();

			//Act: execução a ação a operação
			var totalDoJuros = calculadora.CalcularTotalJurosSimples(parcela, taxa);

			//Assert: o que fazer com o resultado da ação
			if(totalDoJuros != 1405.75M)
			{
				throw new Exception("Favor Calcular corretamente o valor do juros!");
			}

			//Arrange...
			parcela = 255M;
			taxa = 1.78M;

			//Act
			totalDoJuros = calculadora.CalcularTotalJurosSimples(parcela, taxa);

			//Assert
			if(totalDoJuros != 453.90M)
			{
				throw new Exception("Favor calcular corretamente o valor do juros");
			}
		}

		[TestMethod]
		public void AoCalcularoMDCDeVariosNUmrosDeveEncontarOResultadoCorreto() {
			//aRRANGE
			var numeros = new int[] { 21, 54, 69, 15, 27, 18 };
			var calculadora = new Calculadora();

			//aCT
			int mdc = calculadora.CalcularMDC(numeros);


			//Assert
			if(mdc != 3) {
				throw new Exception(@"O MDC dos números 
									{ 21, 54, 69, 15, 27, 18 }
									deve ser 3, porém o resultado
									obtido foi outro. O mdc obtido foi:"+ mdc);
			}


			//aRRANGE
			numeros = new int[] { 15, 15, 15, 20, 30, 45, 60};
			calculadora = new Calculadora();

			//aCT
			mdc = calculadora.CalcularMDC(numeros);


			//Assert
			if (mdc != 5)
			{
				throw new Exception(@"O MDC dos números 
									{ 15, 15, 15, 20, 30, 45, 60}
									deve ser 3, porém o resultado
									obtido foi outro. O mdc obtido foi:" + mdc);
			}

			/*var lista = new List<int>();
			lista.Add(1);
			lista.Add(2);
			lista.Add(3);
			lista.Add(4)*/;


		}

		[TestMethod] 
		public void AoCalcularJurosCompostosDeUmaParcelaDeveRetornarValorCorreto() {
			var calculadora = new Calculadora();
			var parcela = 562.3M;
			var taxa = 1.5M;
			var meses =3;

			var montante = calculadora.CalcularValorMontanteComJurosCompostos(parcela, taxa, meses);

			if (montante != 587.98M)
			{
				throw new Exception("O montante deveria ser 587.99, porém o resultado obtido foi:" + montante.ToString());
			}
		}

		[TestMethod]
		public void SeREalizarUmaSimulacaoDeParcelaDeveEncontrarOsValoresCorretos()
		{
			//Arragne
			var calculadora = new Calculadora();
			var valorFinanciamento = 562.3M;
			var taxa = 1.5M;
			var parcelas = 3;

			//Act
			var dataBase = new DateTime(day: 21, month: 5, year: 2024);
			var simulacao = calculadora.CalcularSimulacaoDeFinanciamento(valorFinanciamento, taxa, parcelas, dataBase);

			//Assert
			simulacao.Count
				.Should()
				.Be(3, because: "Não foi calculado a quantidade correta de parcelas!");

			var valoreEsperados = new decimal[] { 570.73M, 579.3M, 587.97M };

			var primeiroVencimento = new DateTime(day: 20, month: 6, year: 2024);
			var segundooVencimento = new DateTime(day: 20, month: 7, year: 2024);
			var terceiroVencimento = new DateTime(day: 19, month: 8, year: 2024);

			var vencimentosEsperados = new DateTime[] {primeiroVencimento, segundooVencimento, terceiroVencimento };


			for (int parcela = 1; parcela <= 3; parcela++) {
				simulacao[parcela - 1].Quantidade
					.Should()
					.Be(parcela, because: "A quantidade de parcelas está errada!");

				//if (simulacao[parcela - 1].Quantidade != parcela)
				//	throw new Exception("A quantidade de parcelas da parcela [" +
				//		parcelas.ToString() + "] está errada");

				simulacao[parcela - 1].ValorTotal
					.Should()
					.Be(valoreEsperados[parcela - 1]);

				//if (simulacao[parcela - 1].ValorTotal != valoreEsperados[parcela - 1]) {
				//			throw new Exception("O valor da parcela[[" + parcela.ToString() + "] está errado!" +
				//			$"Esperacvamos {valoreEsperados[parcela - 1]}, porém, está calculando {simulacao[parcela - 1].ValorTotal}.");

				//}

				simulacao[parcela - 1].Vencimento
					.Should()
					.Be(vencimentosEsperados[parcela - 1]);

				//if (simulacao[parcela - 1].Vencimento != vencimentosEsperados[parcela - 1])
				//{
				//	throw new Exception("O vencimento da parcela[[" + parcela.ToString() + "] está errado!" +
				//	$"Esperacvamos {vencimentosEsperados[parcela - 1]}, porém, está calculando {simulacao[parcela - 1].Vencimento}.");

				//}
			}

		}

		[TestMethod]
		public void AoCalcularSequenciaDeFibonnaciAte8TermoDeveRetornarValoresEsperados()
		{
			//Arrange
			var calculadora = new Calculadora();

			//Act
			var sequencia = calculadora.CalcularSequenciaFibonacciAteN(8);

			//Assert
			sequencia.Count
				.Should()
				.Be(8, because: "A sequência de Fibonacci deveria ter 8 termos!");

			var valoresEsperados = new int[] {0,1, 1, 2, 3, 5, 8, 13 };

			for (int termo = 1; termo <= 8; termo++) {
				sequencia[termo - 1]
					.Should()
					.Be(valoresEsperados[termo - 1], because: "O valor do termo está errado!");
			}
		}
	}
}
