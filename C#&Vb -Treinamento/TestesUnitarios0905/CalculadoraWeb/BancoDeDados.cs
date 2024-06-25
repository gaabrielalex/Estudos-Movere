using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CalculadoraWeb
{
	public class BancoDeDados
	{
		public class DBParametro
		{
			public string Nome { get; set; }
			public object Valor{ get; set; }

			public DBParametro() { }
			public DBParametro(string parametro, object valor)
			{
				Nome = parametro;
				Valor = valor;
			}
		}
		private SqlConnection CriarConexao()
		{
			var stringDeConexao =
				ConfigurationManager
					.ConnectionStrings["ConexaoPadrao"]
						.ConnectionString;
			return new SqlConnection(stringDeConexao);
		}
		public DataTable Consultar(string sql)
		{
			return Consultar(sql, null);
		}

		public DataTable Consultar(string sql, List<DBParametro> parametros)
		{
			using (var conexao = CriarConexao())
			using (var comando = conexao.CreateCommand())
			{
				AdicionarParametrosAQuery(comando, parametros);

				comando.CommandText = sql;

				using (var adapter = new SqlDataAdapter(comando))
				{
					var tabela = new DataTable();
					adapter.Fill(tabela);
					return tabela;
				}
			}

		}

		public int Executar(string sql, List<DBParametro> parametros)
		{
			using (var conexao = CriarConexao())
			using (var comando = conexao.CreateCommand())
			{
				AdicionarParametrosAQuery(comando, parametros);

				comando.CommandText = sql;

				conexao.Open();
				try
				{
					return comando.ExecuteNonQuery();
				}
				finally
				{
					conexao.Close();
				}
			}

		}

		public void AdicionarParametrosAQuery(SqlCommand sqlCommand, List<DBParametro> parametros)
		{
			if (parametros == null)
				return;
			for (int n = 0; n < parametros.Count; n++)
			{
				var filtro = sqlCommand.CreateParameter();
				filtro.ParameterName = parametros[n].Nome;
				filtro.Value = parametros[n].Valor;
				sqlCommand.Parameters.Add(filtro);
			}
		}
	}
}