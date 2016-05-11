package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.HomeForm;
import javafx.geometry.Pos;
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
		ArrayList<Posts> listPostsStudyAbroad=homeBO.getListPost(Posts.DUHOCNHATBAN,6);
		ArrayList<Posts> listPostsJapaneseClass=homeBO.getListPost(Posts.LOPHOCTIENGNHAT,5);
		ArrayList<Posts> listPostsRecruitment=homeBO.getListPost(Posts.TUYENDUNG, 5);
		ArrayList<Posts> listPostsDocument=homeBO.getListPost(Posts.TAILIEUTHAMKHAO, 5);
		homeForm.setListPostsNews(listPostsNews);
		homeForm.setListPostsStudyAbroad(homeBO.divideList(listPostsStudyAbroad,2));
		homeForm.setListPostsJapaneseClass(listPostsNews);
		homeForm.setListPostsRecruitment(listPostsNews);
		homeForm.setListPostsDocument(listPostsNews);
		return mapping.findForward("showHome");
	}
}
