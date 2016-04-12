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
				postsForm.setViews(post.getViews());
				return mapping.findForward("showPostsContent");
				
			}
			if ("delete".equals(action)) {
				PostsBO postsBO = new PostsBO();
				if(postsBO.deletePosts(postID)){
					return mapping.findForward("deleteSuccess");
				};
			}
		}
		if ("Lưu".equals(StringProcess.toUTF8(postsForm.getSubmit()))) {
			String title = StringProcess.toUTF8(postsForm.getTitle());
			String content = StringProcess.toUTF8(postsForm.getContent());
			FormFile file = postsForm.getFile();
			PostsBO postsBO = new PostsBO();
			if (checkValidate(title, content, postsForm)) {
				Posts post= new Posts();
				post.setImage(postsForm.getImage());
				if (!"".equals(file.getFileName())) {
					String imageName = FileProcess.uploadFile(file, getServlet(), "postsimage");
					String oldImageName = postsForm.getImage();
					FileProcess.deleteOldFile(getServlet(), oldImageName,"postsimage");
					post.setImage(imageName);
					postsForm.setImage(imageName);
				}
				post.setPostID(postsForm.getPostID());
				post.setTitle(title);
				post.setContent(content);
				post.setDatePosted(postsForm.getDatePosted());
				post.setTeacherName(StringProcess.toUTF8(postsForm.getTeacherName()));
				post.setCategory(postsForm.getCategory());
				post.setViews(postsForm.getViews());
				if(postsBO.updatePosts(post)){
					postsForm.setNotification("Chỉnh sửa bài viết thành công");
				}
				else{
					postsForm.setNotification("Xảy ra lỗi trong quá trình cập nhật");
				}
			}
			postsForm.setTitle(StringProcess.toUTF8(postsForm.getTitle()));
			postsForm.setContent(StringProcess.toUTF8(postsForm.getContent()));
			postsForm.setTeacherName(StringProcess.toUTF8(postsForm.getTeacherName()));
		}
		return mapping.findForward("editResult");
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
