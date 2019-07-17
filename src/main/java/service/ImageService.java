package service;

import java.io.*;

import javax.servlet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Service
public class ImageService {
	
	@Autowired
	ServletContext context;
	
	public boolean saveImage(MultipartFile mfile, String fileName) {
		boolean result = true;
		String path = context.getRealPath("/") + "resources/images/";
		System.out.println(path);
		File isDir = new File(path);
		if (!isDir.isDirectory()) {
			isDir.mkdirs();
		}
		
		try {
			File f = new File(path + fileName);
			if (f.exists()) {
				result = false;
				System.out.println(fileName + " : 파일이 이미 존재합니다.");
			} else {
				mfile.transferTo(new File(path + fileName));
				System.out.println(fileName + " : 파일이 저장되었습니다.");
			}
		} catch (IOException e) {
			e.printStackTrace();
			result = false;
			System.out.println(fileName + " : 오류가 발생했어요!!");
		}
		
		return result;
	}
}
