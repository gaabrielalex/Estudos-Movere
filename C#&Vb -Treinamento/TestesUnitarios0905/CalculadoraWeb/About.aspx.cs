using CalculadoraWeb.util;
using ConsoleAppCSharp;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraWeb
{
	public partial class About : Page
	{
		public List<string> Nomes { 
			get {
				return (List<string>)ViewState["Nomes"];
			}
			set {
				ViewState["Nomes"] = value;
			}
		} 
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Nomes == null)
			{
				Nomes = new List<string>();
			}
		}

		protected void AjustarVisibilidadeDoPainel_click(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = sender == FibonacciButton;
			CalcularJurosPanel.Visible = sender == CalcularJurosButton;
			CalcularSimulacaoFinancimanetoPanel.Visible = sender == CalcularSimulacaoFinancimanetoButton;
			GerenciadorDeNomesPanel.Visible = sender == GerenciadorDeNomesButton;
		}

		protected void AdicionarNomeButton_Click(object sender, EventArgs e)
		{
			string nomeAdicionado = NomeTextBox.Text;
			
			if (!string.IsNullOrEmpty(nomeAdicionado)) {
				Nomes.Add(nomeAdicionado);
			}

			NomesRepeater.DataSource = Nomes;
			NomesRepeater.DataBind();
		}
	}
}