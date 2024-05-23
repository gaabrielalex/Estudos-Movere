<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<title>Exemplo de página</title>
	<link rel="stylesheet" href="estilo.css">
	<script>
		function ola(){
			alert("Tudo Bem?");
		}
	</script>
</head>

</html>
<body>
	<p>Página 1</p>
	<p id="p2">Página 2</p>
	<p>Página 3</p>
	<p class="azul tamanho-20">Página 4</p>
	<p>Página 5</p>
	<p class="tamanho-20">Página 6</p>
	<p>Página 7</p>
	<div class="azul" onclick="ola()">
		Conteudo em DIV
	</div>

	<form runat="server">
		<asp:Button runat="server" Text="Clique Aqui" OnClick="btnClique" />
	</form>

	<!--<%for (var n 0; n < 10; n++){%>
		<p> 
			<%=n%>
		</p>

	<%}%>-->
</body>