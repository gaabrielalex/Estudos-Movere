using ConsoleAppCSharp;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

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
			var simulacao = calculadora.CalcularSimulacaoDeFinanciamento(valorFinanciamento, taxa, parcelas);

			//Assert
			if (simulacao.Count != 3)
				throw new Exception("Não foi calculado a quantidade correta de parcelas!");

			var valoreEsperados = new decimal[] { 570.73M, 579.3M, 587.98M };


			for (int parcela = 1; parcela <= 3; parcela++) {
				if (simulacao[parcela - 1].Quantidade != parcela)
					throw new Exception("A quantidade de parcelas da parcela [" +
						parcelas.ToString() + "] está errada");

				if (simulacao[parcela - 1].ValorTotal != valoreEsperados[parcela - 1]) {
							throw new Exception("O valor da parcela[[" + parcela.ToString() + "] está errado!" +
							$"Esperacvamos {valoreEsperados[parcela - 1]}, porém, está calculando {simulacao[parcela - 1].ValorTotal}.");

				}
			}

		}
	}
}
