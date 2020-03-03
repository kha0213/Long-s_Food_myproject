package com.yl.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yl.dao.Manager_dao;

public class RegistProduct implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String saveDirectory=request.getRealPath("image/product");
		int maxProductSize = 1024*1024*5;
		String pimage = "";
		
		MultipartRequest mRequest = null;
		
		try {
			mRequest = new MultipartRequest(request, saveDirectory,maxProductSize,"utf-8",new DefaultFileRenamePolicy());
			String pcode = mRequest.getParameter("pcode");
			String pname = mRequest.getParameter("pname");
			int pprice = Integer.parseInt(mRequest.getParameter("pprice"));
			int pstock = Integer.parseInt(mRequest.getParameter("pstock"));
			String pdescription = mRequest.getParameter("pdescription");
			
			Enumeration<String> param = mRequest.getFileNames();
			String paramStr = "";
			if(param.hasMoreElements()) {
				paramStr = param.nextElement();
			}
			pimage = mRequest.getFilesystemName(paramStr);
			if(pimage == null) pimage = "noProductImage.png";
			
			Manager_dao mgDao = Manager_dao.getInstance();
			int result = mgDao.registProduct(pcode, pname, pprice, pimage, pstock, pdescription);
			
			  if(result == Manager_dao.SUCCESS) {
				  request.setAttribute("registProductResult", true); 
			  }else if(result ==  Manager_dao.FAIL) { 
				  request.setAttribute("registProductResult", false); 
			  }
			 
			
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		File serverFile = new File(saveDirectory+"/"+pimage);
		if(!pimage.equals("noProductImage.png") && serverFile.exists()) {
			InputStream is = null;
			OutputStream os = null;
			
			
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/Study/git/myproject/WebContent/image/product/"+pimage);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt == -1) break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (FileNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
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
