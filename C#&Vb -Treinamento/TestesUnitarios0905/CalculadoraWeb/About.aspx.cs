using CalculadoraWeb.util;
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
	public partial class About : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Unnamed_Click(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = true;
			CalcularJurosPanel.Visible = false;
			CalcularSimulacaoFinancimanetoPanel.Visible = false;
		}

		protected void Unnamed_Click1(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = false;
			CalcularJurosPanel.Visible = true;
			CalcularSimulacaoFinancimanetoPanel.Visible = false;

		}

		protected void Unnamed_Click2(object sender, EventArgs e)
		{
			FibonacciPanel.Visible = false;
			CalcularJurosPanel.Visible = false;
			CalcularSimulacaoFinancimanetoPanel.Visible = true;
		}


	}
}