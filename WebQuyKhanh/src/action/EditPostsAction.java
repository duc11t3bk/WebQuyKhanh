package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.sun.corba.se.impl.ior.OldPOAObjectKeyTemplate;

import common.FileProcess;
import common.StringProcess;
import common.Validate;
import form.PostsForm;
import model.bean.Posts;
import model.bo.PostsBO;

public class EditPostsAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		PostsForm postsForm = (PostsForm) form;
		String action = postsForm.getAction();
		String postID = postsForm.getPostID();
		if(action!=null){
			if("edit".equals(action)){
				PostsBO postBO = new PostsBO();
				Posts post = postBO.getPosts(postID);
				postsForm.setPost(post);
				postsForm.setPostID(postID);
				postsForm.setTeacherID(post.getTeacherID());
				postsForm.setTeacherName(post.getTeacherName());
				postsForm.setTitle(post.getTitle());
				postsForm.setContent(post.getContent());
				postsForm.setCategory(post.getCategory());
				postsForm.setDatePosted(post.getDatePosted());
				postsForm.setImage(post.getImage());
				return mapping.findForward("showPostsContent");
				
			}
			if ("delete".equals(action)) {

			}
		}
		System.out.println("chayyyyyyyyyyyyyyyyy");
		System.out.println(""+StringProcess.toUTF8(postsForm.getSubmit()));
		if ("Lưu".equals(StringProcess.toUTF8(postsForm.getSubmit()))) {
			String title = StringProcess.toUTF8(postsForm.getTitle());
			String content = StringProcess.toUTF8(postsForm.getContent());
			System.out.println(""+postsForm.getImage());
			FormFile file = postsForm.getFile();
			PostsBO postsBO = new PostsBO();
			if (checkValidate(title, content, postsForm)) {
				if (!"".equals(file.getFileName())) {
					String imageName = FileProcess.uploadImage(file, getServlet(), "postsimage");
					String oldImagePath = getServlet().getServletContext().getRealPath("/") + "postsimage";
					String oldImageName = postsForm.getPost().getImage();
					FileProcess.deleteOldImage(oldImagePath, oldImageName);
					postsForm.getPost().setImage(imageName);
				}
				System.out.println("chay khong loi");
			}
			else{
				System.out.println("chayyyyyyyyyyyyyy loi");
			}
		}
		return mapping.findForward("editFailed");
	}

	public boolean checkValidate(String title, String content, PostsForm postsForm) {
		boolean checkValid = true;

		if (Validate.isEmpty(title)) {
			checkValid = false;
			postsForm.setTitleError("Tiêu đề không được bỏ trống");
		}
		if (Validate.isEmpty(content)) {
			checkValid = false;
			postsForm.setContentError("Nội dung không được bỏ trống");
		}
		return checkValid;
	}
}
