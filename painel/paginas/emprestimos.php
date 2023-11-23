<?php 
$pag = 'emprestimos';
$data_atual = date('Y-m-d');
$mes_atual = Date('m');
$ano_atual = Date('Y');
$data_mes = $ano_atual."-".$mes_atual."-01";
$data_ano = $ano_atual."-01-01";

?>
<div class="row ">
	<a  href="index.php?pagina=leitores" type="button" class="btn btn-primary" ><span class="fa fa-plus"></span> Nova Solicitacao</a>

	<li class="dropdown head-dpdn2" style="display: inline-block;">
		<a href="#" class="dropdown-toggle btn btn-success"  data-toggle="dropdown" aria-expanded="false" id="btn-deletar"style="display: none;"><span class="fa fa-check-square "></span> Cancelar Solicitação</a>

		<ul class="dropdown-menu" style="margin-left:-230px;">
		<li>
		<div class="notification_desc2">
		<p>Confirmar Baixa? <a href="#" onclick="baixarSel()"><span class="text-danger">Sim</span></a></p>
		</div>
		</li>										
		</ul>
</li>

<a style="position: absolute; right: 30px;"  id="btn-rel" onclick="relatorio()" type="button" class="btn btn-success" ><span class="fa fa-file"></span> Relat贸rio</a>
	</div>
<div class="row">
	<div class="col-md-12">

		


<div class="" style="float:left; margin-right:10px"><span><small><i title="Data  Inicial" class="fa fa-calendar-o"></i></small></span></div>
		<div class="" style="float:left; margin-right:20px">
			<input onchange="listarData()" type="date" class="form-control" name="data-inicial"  id="data-inicial" value="<?php echo $data_mes ?>" required>
		</div>

		<div class="esc" style="float:left; margin-right:10px"><span><small><i title="Data Final" class="fa fa-calendar-o"></i></small></span></div>
		<div class="" style="float:left; margin-right:30px">
			<input onchange="listarData()"type="date" class="form-control " name="data-final"  id="data-final" value="<?php echo date('Y-m-d') ?>" required>
			</div>
			<div class="mobile-busca" style="float:left; margin-right:30px"><span><small></small></span></div>



			<div class="" style="float:left; margin-right:10px"><span><small><i title="Buscar por Data" class="fa fa-search"></i></small></span></div>

			<div class="mobile-busca" style="float:left; margin-right:30px">
			<select class="form-control" id="status" onchange="listarData()">
				<option value="data_emprestimo">Data por Solicitacao</option>
				<!--<option value="data_devolucao">Data Entrega</option>-->
				
				
			</select>
			</div>



			<div class="" style="float:left; margin-right:10px"><span><small><i title="Buscar por livro" class="fa fa-search"></i></small></span></div>
			<div class="mobile-busca" style="float:left; margin-right:30px">

		<select onchange="listarData()" class="form-control "  id="livro_busca" style="width:100%;"> 	

			<option class="" value="">Filtrar por Unidade Escolar</option>	

			<?php 
			$query = $pdo->query("SELECT * FROM livros");
			$res = $query->fetchAll(PDO::FETCH_ASSOC);
			for($i=0; $i < @count($res); $i++){		
				?>	
				<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['titulo'].' - '.$res[$i]['edicao'] ?></option>

			<?php } ?>

		</select>
	</div>






			

		</div>

		</div>	



<div class="bs-example widget-shadow" style="padding:15px" id="listar">


</div>


<input type="hidden" name="ids" id="ids">









<script type="text/javascript">var pag = "<?=$pag?>"</script>
<script src="js/ajax.js"></script>


<script type="text/javascript">
	$(document).ready( function () {
		listarData();
	});
</script>

<script type="text/javascript">

	

	function listarData() {
		var data_inicial =  $('#data-inicial').val();
		var data_final =  $('#data-final').val();
		var status =  $('#status').val();
		var livro_busca =  $('#livro_busca').val();
		listar(data_inicial, data_final, status, livro_busca);
	};




	function relatorio()
	 {
	 
		var data_inicial =  $('#data-inicial').val();
		var data_final =  $('#data-final').val();
		var status =  $('#status').val();
		var livro_busca =  $('#livro_busca').val();

		window.open ("rel/emprestimos_class.php?inicio="+data_inicial+"&final="+data_final+"&status="+status+"&livro_busca="+livro_busca+"&devolvido=nao&emprestimos=Emprestimos Ativos");

		
	};
</script>
	
</script>

