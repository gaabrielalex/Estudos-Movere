using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CalculadoraWeb.BancoDeDados;

namespace CalculadoraWeb
{
	public partial class Clientes : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				MensagemLabel.Text = string.Empty;
			}
		}

		protected void ListaDeClientesButton_Click(object sender, EventArgs e)
		{
			var banco = new BancoDeDados();
			var sql = "select top 100 Nome, Cidade, DataDeNascimento, DataDeCadastro, NomeConjuge from vwCLiente order by Nome";
			var tabela = banco.Consultar(sql);
			RelacaoClienteGrid.DataSource = tabela;
			RelacaoClienteGrid.DataBind();
		}

		protected void FiltrarButton_Click(object sender, EventArgs e)
		{
			var banco = new BancoDeDados();
			var sql = @"select top 100 Nome, Cidade, DataDeNascimento, DataDeCadastro, NomeConjuge from vwCLiente 
						where Nome like @Nome
						order by Nome";
			var listaParametros = new List<DBParametro>();
			listaParametros.Add(new DBParametro("@Nome", "%" + FiltroTextBox.Text + "%"));
			var tabela = banco.Consultar(sql, listaParametros);
			RelacaoClienteGrid.DataSource = tabela;
			RelacaoClienteGrid.DataBind();
		}

		protected void CadastrarClienteButton_Click(object sender, EventArgs e)
		{
			var banco = new BancoDeDados();
			var sql = @"insert into Cliente (Nome)
						values (@Nome)";
			var listaParametros = new List<DBParametro>();
			listaParametros.Add(new DBParametro("@Nome", FiltroTextBox.Text));
			banco.Executar(sql, listaParametros);

			MensagemLabel.Text = "Cliente cadastrado com sucesso";
		}
	}
}