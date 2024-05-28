using ConsoleAppCSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraWeb
{
	public partial class CalculadoraSimulacaoFinanciamento : System.Web.UI.UserControl
	{
		public String Nome { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			ResultadoFinanciamentoLabel.Text = "";
		}

		protected void CalcularFinanciamentoButton_Click(object sender, EventArgs e)
		{
			//Solictar para ser prrenchido todos os campos
			if (VlrFinanciamentoTxtBox.Text == "" || TaxaJurosTxtBox.Text == "" || NumMaxParcelasTxtBox.Text == "")
			{
				ResultadoFinanciamentoLabel.Text = "Por favor, preencha todos os campos";
			}
			else if (decimal.TryParse(VlrFinanciamentoTxtBox.Text, out decimal valorFinanciamento) && decimal.TryParse(TaxaJurosTxtBox.Text, out decimal taxaJuros) && int.TryParse(NumMaxParcelasTxtBox.Text, out int quantidadeParcelas))
			{

				//Instanciar a classe Calculadora
				var calculadora = new Calculadora();
				//Calculando
				var resultados = calculadora.CalcularSimulacaoDeFinanciamento(valorFinanciamento, taxaJuros, quantidadeParcelas);

				ResultadoFinanciamentoLabel.Text = "Simulação realizada com sucesso!";

				SimulacaoFinanciamentoReapeter.DataSource = resultados;
				SimulacaoFinanciamentoReapeter.DataBind();

			}
			else
			{
				ResultadoFinanciamentoLabel.Text = "Por favor, insira valores númericos";
			}
		}
	}
}