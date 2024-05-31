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
				return NumeroAtualLabel.Text;
			}
			set
			{
				NumeroAtualLabel.Text = value;
			}
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			ErroLabel.Text = "";
		}

		protected void Numero1Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "1";
			else
			NumeroAtual = NumeroAtual + "1";
		}
		protected void Numero2Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "2";
			else
			NumeroAtual = NumeroAtual + "2";
		}
		protected void Numero3Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "3";
			else
			NumeroAtual = NumeroAtual + "3";
		}
		protected void Numero4Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "4";
			else
			NumeroAtual = NumeroAtual + "4";
		}
		protected void Numero5Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "5";
			else
			NumeroAtual = NumeroAtual + "5";
		}
		protected void Numero6Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "6";
			else
			NumeroAtual = NumeroAtual + "6";
		}
		protected void Numero7Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "7";
			else
			NumeroAtual = NumeroAtual + "7";
		}
		protected void Numero8Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "8";
			else
			NumeroAtual = NumeroAtual + "8";
		}
		protected void Numero9Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtual == "0")
				NumeroAtual = "9";
			else
			NumeroAtual = NumeroAtual + "9";
		}
		protected void Numero0Button_Click(object sender, EventArgs e)
		{
			if (NumeroAtualLabel.Text == "0")
				return;
			else
			NumeroAtual = NumeroAtual + "0";
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
	}
}