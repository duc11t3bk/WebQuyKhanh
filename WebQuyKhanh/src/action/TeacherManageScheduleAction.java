package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.PostsForm;
import model.bean.Posts;
import model.bo.PostsBO;

public class TeacherManageScheduleAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PostsForm postsForm= (PostsForm)form;
		PostsBO postsBO= new PostsBO();
		ArrayList<Posts> listPosts= postsBO.getListPosts(Posts.LICHGIANGDAY); 
		for(int i=0; i<listPosts.size(); i++){
			listPosts.get(i).setCategory("Lịch giảng dạy");
		}
		postsForm.setPosts(listPosts);
		return mapping.findForward("showListSchedule");
	}
}
