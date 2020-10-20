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
			<h4>Informa��es do Exame</h4>
		</div>	    
	  	<div class="row"> 
	  		<div class="col-lg-12 justify-content-center pl-5 ml-5">
			    <div class="container pl-lg-5 ml-lg-5">				
					<div class="row">
						<div class="col">
							<h6>Tipo do exame: ${exame.nm_exame}</h6>
							<h6>Cod. exame: ${exame.id}</h6>
						</div>
						<div class="col">
							<h6>Data do exame: ${exame.exm_data}</h6>
						</div>				  
					</div>
													
					<div class="row pt-5">
						<div class="col">
							<h6>Nome Paciente: ${exame.examePaciente.nm_cmplt} Cod: ${exame.examePaciente.id}</h6>					
						</div>
						<div class="col">
							<h6></h6>
						</div>				  
					</div>
					
					<div class="row">
						<div class="col">
							<h6>idade: ${exame.examePaciente.idade}</h6>	
						</div>
						<div class="col">
							<h6>${paciente.idade}</h6>
						</div>				  
					</div>
					
					<div class="row">
						<div class="col">
							<h6>Gen�ro: ${exame.examePaciente.genero}</h6>
						</div>
						<div class="col">
							<h6>${paciente.genero}</h6>
						</div>
					</div>
					<h4 class="py-4">Resultado</h4>
					
					<div class="col-lg-12 justify-content-center">
						<h6>${exame.resultado}</h6>
					</div>	
				</div>					
						 				    			   				
			</div>
	  	</div>		
	</div>	
</body>
</html>