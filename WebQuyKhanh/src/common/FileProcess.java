package common;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.upload.FormFile;

public class FileProcess {

	public static String uploadImage(FormFile file, ActionServlet servlet, String folderName) {

		String filePath = servlet.getServletContext().getRealPath("/") + folderName;
		System.out.println("" + filePath);
		File folder = new File(filePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		if (!"".equals(file.getFileName())) {
			String imageName = file.getFileName();
			File newFile = new File(filePath, imageName);
			while (newFile.exists()) {
				String name = imageName.substring(0, imageName.indexOf(".")) + "a";
				String type = imageName.substring(imageName.indexOf("."), imageName.length());
				imageName = name + type;
				newFile = new File(filePath, imageName);
			}
			try {
				FileOutputStream fos = new FileOutputStream(newFile);
				fos.write(file.getFileData());
				fos.flush();
				fos.close();

				// copy file to folder avata
				//String destPath = "/home/davy/Git/WebQuyKhanh/WebContent/" + folderName;
				String destPath="C:\\Users\\viettel\\Documents\\gitspace\\WebQuyKhanh\\WebQuyKhanh\\WebContent\\"+folderName;
				File destFile = new File(destPath, imageName);
				FileUtils.copyFile(newFile, destFile);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return imageName;
		}
		return null;
	}

	public static void deleteOldImage(ActionServlet servlet, String fileName, String folderName) {
		if (!"".equals(fileName)) {
			String filePath=servlet.getServletContext().getRealPath("/")+folderName;
			File file = new File(filePath, fileName);
			if (file.exists()) {
				file.delete();
			}
			String localPath = "/home/davy/Git/WebQuyKhanh/WebContent/"+folderName;
			File localFile = new File(localPath, fileName);
			if (localFile.exists()) {
				localFile.delete();
			}
		}
	}
}
