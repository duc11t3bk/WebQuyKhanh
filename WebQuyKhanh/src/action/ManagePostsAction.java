package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.LoginForm;
import form.PostsForm;
import model.bean.Posts;
import model.bo.PostsBO;

public class ManagePostsAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LoginForm loginForm = (LoginForm) request.getSession().getAttribute("loginForm");
		PostsForm postsForm = (PostsForm) form;

		PostsBO postsBO = new PostsBO();
		int priority = loginForm.getMember().getPriority();
		String teacherID = loginForm.getMember().getTeacherID();
		String group= postsForm.getGroup();
		ArrayList<Posts> posts=postsBO.getListPosts(priority, teacherID, group);
		for (int i = 0; i < posts.size(); i++) {
			String category = "";
			if(posts.get(i).getCategory().equals(Posts.LICHGIANGDAY)){
				category="Lịch giảng dạy";
			} else if (posts.get(i).getCategory().equals(Posts.DUHOCNHATBAN)) {
				category = "Du Học Nhật Bản";
			} else if (posts.get(i).getCategory().equals(Posts.LOPHOCTIENGNHAT)) {
				category = "Lớp Học Tiếng Nhật";
			} else if (posts.get(i).getCategory().equals(Posts.TAILIEUTHAMKHAO)) {
				category = "Tài liệu tham khảo";
			} else if (posts.get(i).getCategory().equals(Posts.TUYENDUNG)) {
				category = "Tuyển dụng";
			}
			posts.get(i).setCategory(category);
		}
		postsForm.setPosts(posts);

		return mapping.findForward("showListPosts");
	}
}
