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
			<h4>Cadastro de Exame</h4>
		</div>
		
	  	<div class="row justify-content-center">
		    <div class="col-lg-6 align-item">			
				<form action="cadastrarExame"method="post">		
					<div class="form-group">
						<label>Nome do Exame</label>
						<input class="form-control" type="text" required="required" maxlength="40" placeholder="Nome do exame" name="exame.nm_exame">		    	    
					</div>
					
					 <div class="form-group">
						<label>C�digo do Paciente</label>
						<input class="form-control" type="number" required="required" placeholder="C�digo do paciente" name="exame.id_pcnt">
					</div>
					
					<div class="form-group">
						<label>Data do Exame</label>
						<input type="date" required="required" placeholder="Data" name="exame.exm_data">
					</div>
						
					<div class="form-group">
						<label>Relat�rio do Exame</label>
						<textarea class="form-control" rows="3" placeholder="Digite o resultado do exame aqui." name="exame.resultado">${exame.resultado}</textarea>
					</div>
						 
					<div class="pt-3 row justify-content-center">
						<button type="submit" class="btn btn-primary px-5" value="Cadastrar">Cadastrar</button>
					</div>
				</form>
		    </div>
	  	</div>
	</div>	
</body>
</html>