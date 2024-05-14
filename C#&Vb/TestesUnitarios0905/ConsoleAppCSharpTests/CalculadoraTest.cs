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
			if (mdc != 3)
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
			var caculadora = new Calculadora();
			var parcela = 562.3M;
			var taxa = 1.5M;
			var meses =3;

			var montante = Calculadora.CalcularValorMontanteComJurosCompostos(parcela, taxa, meses);

			if (montante != 587.98M)
			{
				throw new Exception("O montante deveria ser 587.99, porém o resultado obtido foi:" + montante.ToString());
			}
		}
	}
}
