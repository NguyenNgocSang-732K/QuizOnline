package com.helper;

import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;

public class ImageHelper {

//	public static String saveImage(HttpServletRequest request, String imageUrl, String savedUrl) {
//
//		try {
//			

//			URL url = new URL(imageUrl);
//			InputStream is = url.openStream();
//			OutputStream os = new FileOutputStream(path + savedUrl);
//			byte[] b = new byte[2048];
//			int length;
//
//			while ((length = is.read(b)) != -1) {
//				os.write(b, 0, length);
//			}
//
//			is.close();
//			os.close();
//			return null;
//		} catch (Exception e) {
//			return e.getMessage();
//		}
//	}

	public static String saveImage(HttpServletRequest request, MultipartFile multipartFile, String rootPath) {

		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
			String date = "_" + dateFormat.format(new Date()) + ".";
			String[] names = multipartFile.getOriginalFilename().split("\\.");
			String fileName = names[0] + date + names[1];
			File fileSave = new File(rootPath + fileName);

			try (OutputStream os = new FileOutputStream(fileSave)) {
				os.write(multipartFile.getBytes());
			}

			return fileSave.getName();

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
