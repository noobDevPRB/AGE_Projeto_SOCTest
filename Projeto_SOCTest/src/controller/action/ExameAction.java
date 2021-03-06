package controller.action;

import java.util.List;

import model.bean.Exame;
import model.business.ExameBusiness;

public class ExameAction extends MainAction{

	Exame exame;
	List<Exame> listaExamesForm;
	
	public String cadastrar() {
		ExameBusiness exameBusiness = new ExameBusiness(); 
		return exameBusiness.cadastrar(exame);
	}
	
	public String listar() {
		ExameBusiness exameBusiness = new ExameBusiness();
		listaExamesForm = exameBusiness.getTodos();
		return "success";
	}
	
	public String detalhar() {
		ExameBusiness exameBusiness = new ExameBusiness();
		exame = exameBusiness.getExamePorId(exame.getId());
		return "success";
	}
	
	public String atualizar() {
		ExameBusiness exameBusiness = new ExameBusiness();
		exameBusiness.atualizar(exame);
		return "success";		
	}
	
	public String deletar() {
		ExameBusiness exameBusiness = new ExameBusiness();
		return exameBusiness.deletar(exame.getId());
	}
	
	//Navega��o
	public String navegarCadastro() {
		return "success";	
	}
	
	//Getters & Setters
	public Exame getExame() {
		return exame;
	}
	
	public void setExame(Exame exame) {
		this.exame = exame;
	}
	
	public List<Exame> getListaExamesForm() {
		return listaExamesForm;
	}

	public void setListaExamesForm(List<Exame> listaExamesForm) {
		this.listaExamesForm = listaExamesForm;
	}
}
