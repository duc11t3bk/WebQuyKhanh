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

public class ViewListPostsAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PostsForm postsForm= (PostsForm)form;
		PostsBO postsBO= new PostsBO();
		HomeBO homeBO= new HomeBO();
		String category=postsForm.getCategory();
		int page=postsForm.getPage();
		System.out.println("page="+page);
		if(page==0){
			postsForm.setPage(1);
		}
		ArrayList<Posts> listPosts= postsBO.getListPosts(category,postsForm.getPage());
		ArrayList<Posts> listPostsNews= homeBO.getListPostsNews();
		postsForm.setPosts(listPosts);
		postsForm.setListPostsNews(listPostsNews);
		postsForm.setTotalPage(postsBO.getTotalPage(category));
		ArrayList<Integer> pagination= new ArrayList<Integer>();
		for(int i=0; i<postsForm.getTotalPage(); i++){
			pagination.add(i+1);
		}
		postsForm.setPagination(pagination);
		postsForm.setCategoryName(StringProcess.getNameCategory(category));
		return mapping.findForward("showListPosts");
	}
}
