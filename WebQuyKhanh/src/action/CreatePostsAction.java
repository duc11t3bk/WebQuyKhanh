package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import common.FileProcess;
import common.StringProcess;
import common.Validate;
import form.LoginForm;
import form.PostsForm;
import model.bean.Posts;
import model.bo.PostsBO;

public class CreatePostsAction extends Action {

	public static String DUHOCNHATBAN="DHNB";
	public static String LOPHOCTIENGNHAT="LHTN";
	public static String TUYENDUNG="TD";
	public static String TAILIEUTHAMKHAO="TLTK";
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		LoginForm loginForm=(LoginForm)request.getSession().getAttribute("loginForm");
		PostsForm postsForm=(PostsForm)form;
		
		String title=StringProcess.toUTF8(postsForm.getTitle());
		String content=StringProcess.toUTF8(postsForm.getContent());
		String category= postsForm.getCategory();		
		FormFile file= postsForm.getFile();
		
		if(checkValidate(title, content, postsForm)){
			String imageName="";
			imageName=FileProcess.uploadFile(file, getServlet(), "postsimage");
			Posts post= new Posts();
			post.setTitle(title);
			post.setContent(content);
			post.setCategory(category);
			post.setImage(imageName);
			post.setTeacherID(loginForm.getMember().getTeacherID());
			post.setViews(0);
			Date date= new Date();
			SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
			post.setDatePosted(sdf.format(date));
			PostsBO postBO= new PostsBO();
			if(postBO.addNewPosts(post)){
				return mapping.findForward("createSuccess");
			}
		}
		postsForm.setTitle(StringProcess.toUTF8(postsForm.getTitle()));
		postsForm.setContent(StringProcess.toUTF8(postsForm.getContent()));
		return mapping.findForward("createFailed");
	}
	
	public boolean checkValidate(String title, String content, PostsForm postsForm){
		boolean checkValid= true;
		
		if(Validate.isEmpty(title)){
			checkValid=false;
			postsForm.setTitleError("Tiêu đề không được bỏ trống");
		}
		if(Validate.isEmpty(content)){
			checkValid=false;
			postsForm.setContentError("Nội dung không được bỏ trống");
		}
		return checkValid;
	}
}
