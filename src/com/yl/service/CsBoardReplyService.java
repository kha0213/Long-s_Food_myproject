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

public class CsBoardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String filepath = request.getRealPath("image/customer_service");
		int maxSize = 1024*1024*10;
		String cimage = null;
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, filepath, maxSize, "utf-8",new DefaultFileRenamePolicy());
			Enumeration<String> enumStr = mRequest.getFileNames();
			if(enumStr.hasMoreElements()) {
				String tempStr = enumStr.nextElement();
				cimage = mRequest.getFilesystemName(tempStr);
			}
			
			String mid = mRequest.getParameter("mid");
			String csubject = mRequest.getParameter("csubject");
			String onoStr = mRequest.getParameter("ono");
			int ono=0;
			if(onoStr!=null && onoStr.length()!=0) {
				ono = Integer.parseInt(onoStr);
			}
			String ccontent = mRequest.getParameter("ccontent");
			boolean csecret = mRequest.getParameter("csecret")!=null;
			int cgroup = Integer.parseInt(mRequest.getParameter("cgroup"));
			int cgroup_outnum = Integer.parseInt(mRequest.getParameter("cgroup_outnum"));
			int cindent = Integer.parseInt(mRequest.getParameter("cindent"));
			
			
			Customer_service_dao csDao = Customer_service_dao.getInstance();
			if(csDao.csReplyStepB(mid, csubject, ccontent, csecret, cimage, cgroup, cgroup_outnum, cindent, ono)) {
				request.setAttribute("replyCsResult", "답글 쓰기 성공");
			}else {
				request.setAttribute("replyCsResult", "답글 쓰기 실패");
			}
			
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		if(cimage!=null) {
			InputStream is = null;
			OutputStream os = null;
			File file = new File(filepath+"/"+cimage);
			if(file.exists()) {
				try {
					is = new FileInputStream(file);
					os = new FileOutputStream("D:/mega_IT/git/myproject/WebContent/image/customer_service/"+cimage);
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
		}

	}

}
