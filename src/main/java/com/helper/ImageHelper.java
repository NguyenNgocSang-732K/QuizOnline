package com.helper;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class ImageHelper {

	public static String saveImage(HttpServletRequest request, String imageUrl, String savedUrl) {

		try {
			String path = request.getSession().getServletContext().getRealPath("/uploads/images/");
			URL url = new URL(imageUrl);
			InputStream is = url.openStream();
			OutputStream os = new FileOutputStream(path + savedUrl);

			byte[] b = new byte[2048];
			int length;

			while ((length = is.read(b)) != -1) {
				os.write(b, 0, length);
			}

			is.close();
			os.close();
			return null;
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	public static boolean RemoveFile(String imageUrl) {
		File file = new File(imageUrl);
		if (file.exists()) {
			return file.delete();
		}
		return false;
	}

}
