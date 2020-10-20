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
			<h4>Atualizar de Paciente</h4>
		</div>
		
	  	<div class="row justify-content-center">
		    <div class="col-lg-6 align-item">
		    	<h6><b>Paciente: ${paciente.nm_cmplt}</b> <b>C�digo: ${paciente.id}</b></h6>
				<form action="atualizarPaciente"method="post">
					<div class="form-group">
						<label>Nome completo</label>
						<input class="form-control" value="${paciente.nm_cmplt}" type="text" required="required" maxlength="40" placeholder="digite seu nome" name="paciente.nm_cmplt">		    	    
					</div>
					 <div class="form-group">
						<label>idade</label>
						<input class="form-control" value="${paciente.idade}" type="number" required="required" placeholder="Sua idade" name="paciente.idade">
					</div>
					<div class="pt-3 row justify-content-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="paciente.genero" value="masculino">
							<label class="form-check-label" for="inlineRadio1">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="paciente.genero" value="feminino">
							<label class="form-check-label" for="inlineRadio2">Feminino</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="paciente.genero" value="outro">
							<label class="form-check-label" for="inlineRadio3">Outro</label>
						</div>
					</div>		 
					<div class="pt-3 row justify-content-center">
						<input value="${paciente.id}" type="hidden" name="paciente.id">
						<button type="submit" class="btn btn-primary px-5" value="Cadastrar">Atualizar</button>
					</div>
				</form>
		    </div>
	  	</div>
	</div>	
</body>
</html>