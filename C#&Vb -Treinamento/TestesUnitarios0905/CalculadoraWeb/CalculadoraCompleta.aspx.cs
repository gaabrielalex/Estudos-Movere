using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraWeb
{
	public partial class CalculadoraCompleta : System.Web.UI.Page
	{
		public string PrimeiroNumero
		{
			get
			{
				return PrimeiroNumeroLabel.Text;
			}
			set
			{
				if (string.IsNullOrEmpty(value))
				{
					PrimeiroNumeroLabel.Text = "";
					return;
				}
				PrimeiroNumeroLabel.Text = Math.Round(decimal.Parse(value), decimals: 4).ToString();
			}
		}
		public string NumeroAtual
		{
			get
			{
				return NumeroAtualHidden.Value;
			}
			set
			{
				NumeroAtualHidden.Value = value;
				NumeroAtualLabel.Text = value;
			}
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			ErroLabel.Text = "";
		}

		protected void btnAddNumero_Click(object sender, EventArgs e)
		{
			Button clickedButton = (Button)sender;

			//Fazer o cast asssim é melhor pois caso o sender não seja um button não lancara uma exceção de
			//cast, do jeito de cima lançara uma exceção
			Button clickButton = sender as Button;

			string valor = clickedButton.Text;


			if (NumeroAtual == "0")
				NumeroAtual = valor;
			else
				NumeroAtual = NumeroAtual + valor;
		}

		protected void OperacaoSomarButton_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(PrimeiroNumero))
			{
				PrimeiroNumero = NumeroAtual;
			}
			else
			{
				var primeiro = decimal.Parse(PrimeiroNumero);
				var atual = decimal.Parse(NumeroAtual);
				PrimeiroNumero = (primeiro + atual).ToString();
			}
			NumeroAtual = "0";
		}

		protected void OperacaoSubtrairButton_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(PrimeiroNumero))
			{
				PrimeiroNumero = NumeroAtual;
			}
			else
			{
				var primeiro = decimal.Parse(PrimeiroNumero);
				var atual = decimal.Parse(NumeroAtual);
				PrimeiroNumero = (primeiro - atual).ToString();
			}
			NumeroAtual = "0";
		}

		protected void OperacaoCEButton_Click(object sender, EventArgs e)
		{
			NumeroAtual = "0";
		}

		protected void OperacaoCButton_Click(object sender, EventArgs e)
		{
			NumeroAtual = "0";
			PrimeiroNumero = "";
		}

		protected void OperacaoBackSpaceButton_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(NumeroAtual))
				return;
			NumeroAtual = NumeroAtual.Remove(NumeroAtual.Length - 1);
		}

		protected void OperacaoMultiplicarButton_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(PrimeiroNumero))
			{
				PrimeiroNumero = NumeroAtual;
			}
			else
			{
				var primeiro = decimal.Parse(PrimeiroNumero);
				var atual = decimal.Parse(NumeroAtual);
				PrimeiroNumero = (primeiro * atual).ToString();
			}
			NumeroAtual = "0";
		}

		protected void OperacaoDividirButton_Click(object sender, EventArgs e)
		{
			if(NumeroAtual == "0")
			{
				ErroLabel.Text = "Erro: divisião por 0 não permitida";
				return;
			}
				
			if (string.IsNullOrEmpty(PrimeiroNumero))
			{
				PrimeiroNumero = NumeroAtual;
			}
			else
			{
				var primeiro = decimal.Parse(PrimeiroNumero);
				var atual = decimal.Parse(NumeroAtual);
				PrimeiroNumero = (primeiro / atual).ToString();
			}
			NumeroAtual = "0";
		}

		protected void VirgulaButton_Click(object sender, EventArgs e)
		{
			if (!NumeroAtual.Contains(","))
				NumeroAtual += ",";
		}

		protected void MaisMenosButton_Click(object sender, EventArgs e)
		{
			if(NumeroAtual.StartsWith("-"))
			{
				NumeroAtual = NumeroAtual.Substring(1);
			} else {
				NumeroAtual = "-" + NumeroAtual;
			}
		}
	}
}