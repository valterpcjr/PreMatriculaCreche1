<?php
$url = "http://api.wordmensagens.com.br/send-text";

$data = array('instance' => "$instancia_api",
              'to' => "$telefone_envio",
              'token' => "$token_api",
              'message' => "$mensagem");

$options = array('http' => array(
               'method' => 'POST',
               'content' => http_build_query($data)
));

$stream = stream_context_create($options);

@$result = file_get_contents($url, false, $stream);

// Inicio da Verificação de Envio
$res123 = json_decode($result);
$erro = $res123->erro;

if ($erro == true) {
  $status_envio = 'true';
} else {
  $status_envio = 'false';
}
// Fim da Verificação de Envio

//Retorno Completo do Status
//echo $status_envio;

?>

