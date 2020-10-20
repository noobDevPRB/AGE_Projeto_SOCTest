package agews;

import model.bean.Exame;
import model.business.ExameBusiness;

public class ExameWs {
	
	public String consultaPorId(String paramId) {
		ExameBusiness exameBusiness = new ExameBusiness();
		int id = Integer.parseInt(paramId);
		Exame examePorId = exameBusiness.getExamePorId(id);
		return examePorId.getNm_exame();
	}
}
