<?php 
require_once("conexao.php");
$query = $pdo->query("SELECT * from usuarios");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$linhas = @count($res);
$senha = '123';
$senha_crip = md5($senha);
$data_atual = date('Y-m-d');

if($linhas == 0){
	$pdo->query("INSERT INTO usuarios SET nome = '$nome_sistema', email = '$email_sistema', senha = '$senha', senha_crip = '$senha_crip', nivel = 'Administrador', 
	ativo = 'Sim', foto = 'sem-foto.jpg', telefone = '$telefone_sistema', data = curDate() ");
}

$query = $pdo->query("SELECT * from cargos");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$linhas = @count($res);
if($linhas == 0){
	$pdo->query("INSERT INTO cargos SET nome = 'Administrador'");
	
}

 ?>
 <!DOCTYPE html>
<html>
<head>
    
	<title><?php echo $nome_sistema ?></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="img/icone.png">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
	<div class="login">		
		<div class="form">
			<img src="img/logo.png" class="imagem">
			<form method="post" action="autenticar.php">
				<input type="email" name="usuario" hidden="true" value="solicitante@educacao.luziania.go.gov.br" readonly="true" required>
				<input type="password" name="senha" value="123" hidden="true" readonly="true" required>
				<h3>CRONOGRAMA DE PRÉ MATRÍCULA CRECHE I SERÁ LIBERADO DIA 24/11/2023 às 08h.<h3>
				    <a>CRECHE I SOMENTE CRIANÇAS COM 01 ANO COMPLETOS OU A COMPLETAR ATE 31/03/2024</a><br><br>
				<!--<h4 id="h4">Clique no botão ENTRAR<h4>


		<div class="" style="">
			<label  id="data">QUAL É A DATA DE NASCIMENTO DO SEU FILHO(A)?</label>
			<input onchange="listarData()" type="date" class="form-control" name="data-inicial"  id="data-inicial" value="<?php echo $data_atual ?>" required>
		</div>
				<button id="btn-entrar">ENTRAR</button>
			</form>	
		</div>
	</div>
</body>
</html>



<script type="text/javascript">
		$(document).ready( function () {
$('#btn-entrar').prop('disabled', true);

$('#btn-entrar').hide();
$('#h4').hide();
} );
	</script>

	

	<script type="text/javascript">
	function listarData() {
		
		var data_inicial =  $('#data-inicial').val();

	
		//var dataLimiteInicial = ("2019-04-01");
		//var dataLimiteFinal = ("2020-03-31");
		
		// CRECHE III (crianças nascidas entre 01/04/2020 a 31/03/2021) 
		var dataLimiteInicial = ("2020-04-01");
		var dataLimiteFinal = ("2021-03-31");
		
		// CRECHE II (crianças nascidas entre 01/04/2021 a 31/03/2022) 
		//var dataLimiteInicial = ("2021-04-01");
		//var dataLimiteFinal = ("2022-03-31");
		
		// CRECHE I (crianças nascidas entre 01/04/2022 a 31/03/2023) 
		//var dataLimiteInicial = ("2022-04-01");
		//var dataLimiteFinal = ("2023-03-31");
		
		
    if (data_inicial >= dataLimiteInicial && data_inicial <= dataLimiteFinal) {
    	 $('#btn-entrar').prop('disabled', false);
      $('#btn-entrar').show();
       $('#data-inicial').hide();
       $('#data').hide();
        $('#h4').show();

    } else {
    	$('#btn-entrar').prop('disabled', true);
        alert("A DATA DE NASCIMENTO DO SEU FILHO(A) NÃO ESTA DENTRO DA FAIXA ETÁRIA DO CRONOGRAMA ATUAL, FAVOR VERIFICAR O CRONOGRAMA CORRESPONDENTE A DATA DE NASCIMENTO DO SEU FILHO(A).");
        window.location="index.php"
    }
	};-->


</script>