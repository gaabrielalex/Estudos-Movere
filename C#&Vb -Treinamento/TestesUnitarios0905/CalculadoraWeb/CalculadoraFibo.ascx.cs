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
	public partial class CalculadoraFibo : System.Web.UI.UserControl
	{
		public int QuantidadeDeCliques { get; set; }
		public int QuantidadeDeAlteracoes
		{
			get
			{
				return int.Parse(ViewState["QuantidadeDeAlteracoes"].ToString());
			}
			set
			{
				ViewState["QuantidadeDeAlteracoes"] = value.ToString();
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			//Isso dá erro por que esse estado vai ser perdido ao dar reload
			//QuantidadeDeCliques += 1;
			//VisitalLabel.Text = QuantidadeDeCliques.ToString();

			if (!IsPostBack)
			{
				TextBox1.Text = "5";
				ImprimirFibbonaci(5);

				//Para resolver fazemos assim, se é a primeira vez a visita é 1
				QuantidadeDeCliques = 0;
				QuantidadeDeAlteracoes = 0;
				
			}
			else
			{
				//Se não é a primeira vez, então vc vai pegar informação da quantidade de cliques atrvaés de u compnente que gerenciou o estado
				//ou sej, ao dar reload o estado desse componente des=te será mantido, para que o asp net consiga saber como esse componnte estava antes da requisiçãpo
				// ele precisa saber como o compoente estava antes da reqisição poara qu ele consiga recarregar	página da forma que etsva aantes ao devover a resposta da requisiçã, ou seja
				//ao dar reload na página
				//então se não é aprimeira abetura de página pelo usua´rio addcionamos mais um no clique
				//Daí como o componente do asp tem gerciamenoto de estaod então vc pode utilizar esse para guardar a informação de quantidade de visitas
				// Do contraario nvc pode forçar esse gerenciamnrtonde estaod em envaroavesies e atribbutos para isso só aplicar iguakl foi aplicado no quantidade aletações(atributo lá em cima)
				QuantidadeDeCliques = int.Parse(VisitalLabel.Text);
				//if(int.TryParse(VisitalLabel.Text, out int qtde))
				//{
				//	QuantidadeDeCliques = qtde;
				//}
			}
			QuantidadeDeCliques += 1;
			VisitalLabel.Text = QuantidadeDeCliques.ToString();

		}

		public List<int> GerarNumerosFibonaci()
		{
			var sequencia = new List<int>();
			sequencia.Add(0);
			sequencia.Add(1);

			for (int i = 2; i < 10; i++)
			{
				var novoValor = sequencia[i - 1] + sequencia[i - 2];
				sequencia.Add(novoValor);
			}
			return sequencia;
		}

		protected void Button1_Click(object sender, EventArgs e)
		{

			if (int.TryParse(TextBox1.Text, out int limite))
			{

				ImprimirFibbonaci(limite);
			}
			else
			{
				Label1.Text = "Favor informar um valor númerico";
			}


		}

		private void ImprimirFibbonaci(int limite)
		{
			var calculadora = new Calculadora();
			var lista = calculadora.CalcularSequenciaFibonacciAteN(limite);

			var html = new StringBuilder();
			html.Append("<ul>");
			for (int n = 0; n < lista.Count; n++)
			{
				html.Append("<li>");
				html.Append(lista[n]);
				html.Append("</li>");


			}
			html.Append("</ul>");

			Label1.Text = html.ToString();
		}

		protected void TextBox1_TextChanged(object sender, EventArgs e)
		{
			TextoModificado.Text = "VAlor Alterado";
			QuantidadeDeAlteracoes += 1;
			QtdeAlt.Text = QuantidadeDeAlteracoes.ToString();
		}
	}
}