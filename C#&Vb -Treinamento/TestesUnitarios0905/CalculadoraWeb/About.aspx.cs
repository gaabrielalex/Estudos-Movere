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

		protected void Unnamed_Click(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = true;
			CalcularJurosPanel.Visible = false;
			CalcularSimulacaoFinancimanetoPanel.Visible = false;
			GerenciadorDeNomesPanel.Visible = false;

		}

		protected void Unnamed_Click1(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = false;
			CalcularJurosPanel.Visible = true;
			CalcularSimulacaoFinancimanetoPanel.Visible = false;
			GerenciadorDeNomesPanel.Visible = false;

		}

		protected void Unnamed_Click2(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = false;
			CalcularJurosPanel.Visible = false;
			CalcularSimulacaoFinancimanetoPanel.Visible = true;
			GerenciadorDeNomesPanel.Visible = false;
		}

		protected void Unnamed_Click3(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = false;
			CalcularJurosPanel.Visible = false;
			CalcularSimulacaoFinancimanetoPanel.Visible = false;
			GerenciadorDeNomesPanel.Visible = true;
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