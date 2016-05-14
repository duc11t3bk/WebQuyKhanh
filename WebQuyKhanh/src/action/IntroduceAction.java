package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.HomeForm;
import model.bean.Posts;
import model.bean.Teacher;
import model.bo.HomeBO;
import model.bo.TeacherBO;

public class IntroduceAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HomeForm homeForm= (HomeForm)form;
		HomeBO homeBO= new HomeBO();
		ArrayList<Posts> listPostsNews= homeBO.getListPostsNews();
		homeForm.setListPostsNews(listPostsNews);
		ArrayList<Posts> listPostsStudyAbroad= homeBO.getListPost(Posts.DUHOCNHATBAN, 6);
		homeForm.setListPostsStudyAbroad(homeBO.divideListPosts(listPostsStudyAbroad, 3));
		TeacherBO teacherBO= new TeacherBO();
		ArrayList<Teacher> listTeacher= teacherBO.getListTeacher();
		homeForm.setListTeacher(homeBO.divideListTeacher(listTeacher, 4));
		homeForm.setLeftBanner(homeBO.getBanner("left"));
		homeForm.setRightBanner(homeBO.getBanner("right"));
		return mapping.findForward("showIntroduce");
	}
}
