package com.yl.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yl.dao.Customer_service_dao;
import com.yl.dao.Review_dao;

public class RWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String filepath = request.getRealPath("image/review");
		int maxSize = 1024*1024*10;
		String[] rimage = new String[3];
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, filepath, maxSize, "utf-8",new DefaultFileRenamePolicy());
			Enumeration<String> enumStr = mRequest.getFileNames();
			int idx = 0;
			while(enumStr.hasMoreElements()) {
				String tempStr = enumStr.nextElement();
				rimage[idx++] = mRequest.getFilesystemName(tempStr);
			}
			String pcode = mRequest.getParameter("pcode");
			String mid = mRequest.getParameter("mid");
			request.setAttribute("pcode", pcode);
			int rstar = Integer.parseInt(mRequest.getParameter("rstar"));
			String rcontent = mRequest.getParameter("rcontent");
			
			Review_dao rDao = Review_dao.getInstance();
			String rimage1 = rimage[0];
			String rimage2 = rimage[1];
			String rimage3 = rimage[2];
			if(rDao.reviewWrite(pcode, mid, rimage1, rimage2, rimage3, rstar, rcontent)) {
				request.setAttribute("reviewWriteResult", mid+"님 리뷰작성에 성공하셨습니다.");
			}else {
				request.setAttribute("reviewWriteResult", mid+"실패.");
			}
			
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		int idx = 0;
		while(idx<3 && rimage[idx]!=null) {
			InputStream is = null;
			OutputStream os = null;
			File file = new File(filepath+"/"+rimage[idx]);
			if(file.exists()) {
				try {
					is = new FileInputStream(file);
					os = new FileOutputStream("D:/mega_IT/git/myproject/WebContent/image/review/"+rimage[idx]);
					byte[] bs = new byte[(int)file.length()];
					while(true) {
						int readInt = is.read(bs);
						if(readInt == -1) break;
						os.write(bs,0,readInt);
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(os!=null) os.close();
						if(is!=null) is.close();
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
			idx++;
		}
		
		
	}

}
