package com.action;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.entity.News;

@WebServlet("/AddNewsServlet")
public class AddNewsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-------已访问AddNewsServlet");
		
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		
		String title= request.getParameter("title");
		String source= request.getParameter("source");
		String author= request.getParameter("author");
		String category= request.getParameter("category");
		String newsimage= request.getParameter("newsimage");
		String content= request.getParameter("content");
		String simple= request.getParameter("simple");
		//从html页面取得对应参数
		NewsDao ND= new NewsDao();
		News news=new News();
		//创建新的News对象
		
		
		news.setAuthor(author);
		news.setCommentNum(0);
		news.setName(title);
		news.setPictureURL(newsimage);
		news.setSimple(simple);
		news.setSource(source);
		news.setStars(0);
		news.setType(category);
		//无需修改的内容
		
		System.out.println("开始随机生成id");
		
		Random rand=new Random();
		int id;
		while(true) {
		id=rand.nextInt(2147483640);
		if (ND.checkID(id))break;
		}//随机生成id
		
		System.out.println("----成功随机生成id:" + id);
		
		news.setId(id);
		String filename=new String();
		
		//得到tomcat项目根文件绝对路径
		filename="D:/BigNews/contentStore/"+id;
		System.out.println("content:"+content+"\tfilename:"+filename);
		
		fileout(content,filename);
		news.setContent(filename);
		
		//利用id生成文件名
		System.out.println("-------News对象已创建");
		ND.insert(news);

		//将准备好的news类放入数据库
		
		
		response.sendRedirect("sources/index.html");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	void fileout(String s,String filename) {
        File file = new File(filename);
        try (FileOutputStream fop = new FileOutputStream(file)) {
    	
        	if (!file.exists()) { 
        		file.createNewFile();
        	}
            byte[] contentInBytes = s.getBytes();
            fop.write(contentInBytes);
            fop.flush();
            fop.close();
            System.out.println("Done");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
