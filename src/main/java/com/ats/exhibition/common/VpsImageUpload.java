package com.ats.exhibition.common;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VpsImageUpload {

	//public static final String FR_FOLDER = "/home/ats-12/";
	public static final String FLOUR_MAP= "http://exhibition.aaryatechindia.in:12756/uploads/FLOURMAP/";
	public static final String SPONSOR_FOLDER = "http://exhibition.aaryatechindia.in:12756/uploads/SPONSOR/";

	public static final String GALLARY_FOLDER = "http://exhibition.aaryatechindia.in:12756/uploads/GALLARY/";
	
	public static final String M_SP_CAKE_FOLDER = "/opt/tomcat-latest/webapps/uploads/MSPCAKE/";
	
	public static final String RAW_MAT_IMAGE_FOLDER = "/opt/tomcat-latest/webapps/uploads/RAWMAT/";

	public static final String GATE_ENTRY_IMAGE_FOLDER = "/opt/tomcat-latest/webapps/uploads/GATEENTRY/";
	
	public static final String LOGIS_BILL_FILE= "/opt/tomcat-latest/webapps/uploads/MSPCAKE/";

	private static final String FIELDMAP_FOLDER = null;
	private static final String KYC_FOLDER = null;

	private static String curTimeStamp = null;

	public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName) throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = Paths.get(FLOUR_MAP + imageName);

			byte[] bytes = file.getBytes();

			if (imageType == 1) {
				System.out.println("Inside Image Type =1");

				path = Paths.get(FLOUR_MAP + imageName);

				System.out.println("Path= " + path.toString());

			} else if (imageType == 2) {

				path = Paths.get(FLOUR_MAP + imageName);

			} else if (imageType == 3) {

				path = Paths.get(GALLARY_FOLDER + imageName);

			}else if (imageType == 4) {

				path = Paths.get(M_SP_CAKE_FOLDER + imageName);

			}
			else if (imageType == 6) {

				path = Paths.get(RAW_MAT_IMAGE_FOLDER + imageName);

			}

			else if (imageType == 7) {

				path = Paths.get(GATE_ENTRY_IMAGE_FOLDER + imageName);

			}
			else if (imageType == 8) {

				path = Paths.get(LOGIS_BILL_FILE + imageName);

			}

			Files.write(path, bytes);

		}

	}

}
