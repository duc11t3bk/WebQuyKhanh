package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.StuckThreadDetectionValve;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.LoginForm;
import form.StudentForm;
import model.bean.Class;
import model.bean.Student;
import model.bo.StudentBO;

public class ManageStudentAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		StudentForm studentForm = (StudentForm) form;

		if (loginForm.getMember().getPriority() == 1) {
			// teacher
			String classID = studentForm.getClassID();
			StudentBO studentBO = new StudentBO();
			ArrayList<Class> listClass = studentBO.getListClass(loginForm.getMember().getTeacherID(),
					loginForm.getMember().getPriority());
			ArrayList<Student> students=null;
			if (classID == null) {
				classID=listClass.get(0).getClassID();
			}
			System.out.println("classID"+classID);
			students= studentBO.getListStudent(classID);
			studentForm.setListClass(listClass);
			studentForm.setStudents(students);
			studentForm.setClassID(classID);
			
			return mapping.findForward("teacherShowListStudent");
		}
		return mapping.findForward("teacherShowListStudent");
	}
}
