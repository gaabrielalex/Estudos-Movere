using ConsoleAppCSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraWeb
{
	public partial class CalculadoraJurosComposto : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			ResultadoJurosLabel.Text = "";
		}
		protected void CalcularJurosButton_Click(object sender, EventArgs e)
		{
			if (ParcelaTBox.Text == "" || TaxaTBox.Text == "" || MesesTBox.Text == "")
			{
				ResultadoJurosLabel.Text = "Por favor, preencha todos os campos";
			}
			else if (decimal.TryParse(ParcelaTBox.Text, out decimal parcela) && decimal.TryParse(TaxaTBox.Text, out decimal taxa) && int.TryParse(MesesTBox.Text, out int meses))
			{
				var calculadora = new Calculadora();
				var resultado = calculadora.CalcularValorMontanteComJurosCompostos(parcela, taxa, meses);

				ResultadoJurosLabel.Text = resultado.ToString();
			}
			else
			{
				ResultadoJurosLabel.Text = "Por favor, insira valores númericos";
			}
		}
	}
}