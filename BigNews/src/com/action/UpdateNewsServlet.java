package com.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.entity.News;
import com.model.AddRecord;

@WebServlet("/updateNews")
public class UpdateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsDao newsdao = new NewsDao();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		int newsid = Integer.valueOf(request.getParameter("id"));
		System.out.println("======正在对id为" + newsid + "的新闻进行操作");
		
		News news = newsdao.searchNews(newsid);
		String content = filein(news.getContent()).replace("\n", "");
		
		request.setAttribute("news", news);
		request.setAttribute("content", content);
		request.getRequestDispatcher("sources/updateNews.jsp").forward(request, response);
	}

	private String filein(String url) throws IOException {

        StringBuffer sb = new StringBuffer();	
		InputStream is = new FileInputStream(url);
		
        String line; // 用来保存每行读取的内容
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        line = reader.readLine(); // 读取第一行
        while (line != null) { // 如果 line 为空说明读完了
            sb.append(line); // 将读到的内容添加到 buffer 中
            sb.append("\n"); // 添加换行符
            line = reader.readLine(); // 读取下一行
        }
        reader.close();
        is.close();
        
        return sb.toString();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		int id = Integer.valueOf(request.getParameter("id"));
		News news = newsdao.searchNews(id);
		System.out.println("======正在对id为" + id + "的新闻进行修改操作");
		
		news.setAuthor(request.getParameter("author"));
		news.setName(request.getParameter("title"));
		news.setSource(request.getParameter("source"));
		news.setType(request.getParameter("category"));
		news.setPictureURL(request.getParameter("newsimage"));
		news.setSimple(request.getParameter("simple"));
		fileout(request.getParameter("content"), news.getContent());
		
		newsdao.update(news);
		
		response.sendRedirect("secret");
	}
	
	private void fileout(String s,String filename) {
        File file = new File(filename);
        try (FileOutputStream fop = new FileOutputStream(file)) {
    	
        	if (!file.exists()) { 
        		file.createNewFile();
        	}
            byte[] contentInBytes = s.getBytes();
            fop.write(contentInBytes);
            fop.flush();
            fop.close();
            AddRecord.print("创建新闻文件：" + filename);
            System.out.println("Done");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
