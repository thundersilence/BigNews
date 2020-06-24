package com.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.entity.News;

public class AddNewsServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AddNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		Random rand=new Random();
		int id;
		while(true) {
		id=rand.nextInt(2147483640);
		if (ND.checkID(id)==false)break;
		}//随机生成id
		
		news.setId(id);
		String filename=new String();
		filename=id+"";
		fileout(content,filename);
		news.setContent(filename);
		
		//利用id生成文件名
		
		
		ND.insert(news);

		//将准备好的news类放入数据库

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
