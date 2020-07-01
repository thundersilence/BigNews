package com.dao;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileExistsException;



public class FileDao {
	public String getRequestFileItems(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		System.out.println("开始执行getRequestFileItems方法");
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<FileItem> Files=new ArrayList<FileItem>();
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		/*
		ServletFileUpload用于上传文件
		
		
		
		*/
		String filename=null;
		String imageurl=null;
		FileItem item=null;
		if(!ServletFileUpload.isMultipartContent(request))System.out.println("============上传失败=============");
		System.out.println("============getRequestFileItems方法try前测试=============");
		try {
			List<FileItem> list=upload.parseRequest(request);
			System.out.println("============getRequestFileItems方法for前测试=============");
			for(FileItem items:list) {
				if(!items.isFormField()) {
					String str=items.getFieldName();
					
					//if(str.equals("headimg")) {
						Files.add(items);
					//}
					System.out.println("items.getFieldName()的值"+str+" = = = = "+items.getSize());
				}
			}
			
			for(int i=0;i<Files.size();i++){
				item=(FileItem) Files.get(i);
				
				filename=item.getName();
				System.out.println("filename为"+filename);
			}
			Random rand=new Random();
			int rand_id=rand.nextInt(2147483640);
			String rand_id_str = Integer.toString(rand_id);
			if(filename.equals("")||filename.equals(null))return ("");
			String imagedir = "D://BigNews/imageStore/";
			
			String[] splitList=filename.split("\\\\");
			String fileName = splitList[splitList.length-1];
			if(fileName.equals("")||fileName.equals(null))return ("");
			imageurl = imagedir+rand_id_str+fileName;
			
			
			
			File image=new File(imageurl);
			System.out.println("image地址为"+imageurl);
			item.write(image);
			
		}catch (FileUploadException e2) {

			e2.printStackTrace();

		}catch(FileExistsException e2) {
			return imageurl;
		}
		System.out.println("============getRequestFileItems方法try后测试=============");
		return imageurl;
	}
}
