<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<div class="container">
		<div class="row justify-content-center py-5">
			<h4>Lista de Exames</h4>
		</div>
		
	  	<div class="row justify-content-center custon-table">	  		
		    <table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th>C�digo</th>
			      <th>Paciente</th>
			      <th>Tipo Exame</th>			     
			      <th>Data</th>
			      <th></th>
			      <th></th>
			    </tr>
			  </thead>
			  <c:forEach items="${listaExamesForm}" var="exame">
				  <tbody>
				    <tr>
						<th scope="row"><a href="visualizarExame?exame.id=${exame.id}"><c:out value="${exame.id}"/></a></th>				      
						<td><c:out value="${exame.examePaciente.nm_cmplt}"/></td>					
						<td><c:out value="${exame.nm_exame}"/></td>
						<td><c:out value="${exame.exm_data}"/></td>
						<td>
							<a href="navegarAtualizarExame?exame.id=${exame.id}">atualizar</a>
						<td>
							<button onclick='javascript:iniciarModalDeletar("${exame.id}")' class="bot�o-transparente" data-toggle="modal" data-target="#abrirModal">
							  excluir
							</button>						
						</td>
				    </tr>
				  </tbody>
			  </c:forEach>
			</table>		
	  	</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="abrirModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="abrirModal">Aviso!</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Deseja realmente excluir este exame?
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" id="deletarExameModal"/> 
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <button onclick="javascript:deletarExame()" type="button" class="btn btn-danger" data-dismiss="modal">Excluir</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>

<script>

function iniciarModalDeletar(exameId) {
	window.location.href = "#abrirModal";
	document.getElementById(`deletarExameModal`).value = exameId;
}

function deletarExame() {
	var exameId = document.getElementById(`deletarExameModal`).value;
	window.location.href = `deletarExame?exame.id=` + exameId;
}

</script>
</html>