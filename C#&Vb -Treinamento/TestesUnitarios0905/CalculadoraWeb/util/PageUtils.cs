using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraWeb.util
{
	public class PageUtils
	{
		public static void exibirMensagem(HttpContext context, String mensagem) {
			context.Response.Write($"<script>alert('{mensagem}')</script>");
			/*// Redirecionar para evitar resubmissão de formulário
			context.Response.Redirect(context.Request.RawUrl, false);
			context.ApplicationInstance.CompleteRequest();*/
		}
	}
}