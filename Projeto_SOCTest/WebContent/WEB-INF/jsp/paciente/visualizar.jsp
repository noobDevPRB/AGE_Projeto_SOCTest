<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Soc Teste</title>
</head>
<body>

	<%@ include file="navBar.jsp"%>

	<div class="container custon-transley">
		<div class="row justify-content-center pb-5">
			<h4>Dados do Paciente</h4>
		</div>
	  	<div class="row justify-content-center">
		    <div class="col-lg-6">
			    <div class="container">
					<div class="row">
						<div class="col">
							<h6>C�digo:</h6>
						</div>
						<div class="col">
							<h6>${paciente.id}</h6>
						</div>
					</div>
	
					<div class="row">
						<div class="col">
							<h6>Nome:</h6>
						</div>
						<div class="col">
							<h6>${paciente.nm_cmplt}</h6>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<h6>Idade:</h6>
						</div>
						<div class="col">
							<h6>${paciente.idade}</h6>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<h6>Gen�ro:</h6>
						</div>
						<div class="col">
							<h6>${paciente.genero}</h6>
						</div>
					</div>
				</div>
			</div>
	  	</div>
	</div>
</body>
</html>