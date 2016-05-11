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
import model.bo.HomeBO;

public class HomeAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HomeForm homeForm= (HomeForm)form;
		HomeBO homeBO= new HomeBO();
		ArrayList<Posts> listPostsNews= homeBO.getListPostsNews();
		String category="";
		int limit=0;
		ArrayList<Posts> listPostsStudyAbroad=homeBO.getListPost(category,limit);
		
		return super.execute(mapping, form, request, response);
	}
}
