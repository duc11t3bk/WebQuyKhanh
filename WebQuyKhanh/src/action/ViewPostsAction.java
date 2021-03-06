package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.StringProcess;
import form.PostsForm;
import model.bean.Posts;
import model.bo.HomeBO;
import model.bo.PostsBO;

public class ViewPostsAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PostsForm postsForm= (PostsForm)form;
		PostsBO postsBO= new PostsBO();
		HomeBO homeBO= new HomeBO();
		String postID=postsForm.getPostID();
		Posts posts= postsBO.getPosts(postID);
		posts.setCategoryName(StringProcess.getNameCategory(posts.getCategory()));
		postsForm.setPost(posts);
		ArrayList<Posts> listPostsNews= homeBO.getListPostsNews();
		postsForm.setListPostsNews(listPostsNews);
		return mapping.findForward("showPosts");
	}
}
