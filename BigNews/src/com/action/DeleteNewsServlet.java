package com.action;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.dao.UserDao;
import com.entity.News;
import com.model.AddRecord;

@WebServlet("/deleteNews")
public class DeleteNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsDao newsdao = new NewsDao();
	UserDao userdao = new UserDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.valueOf(request.getParameter("id"));
		System.out.println("已获取新闻id：" + id);
		
		deleteContent(id);
		if(newsdao.delete(id) != 0) {
			System.out.println("======已删除id为" + id + "的新闻");
			AddRecord.print("删除新闻记录：" + id);
		}

		response.sendRedirect("secret");
	}

	private void deleteContent(int newsid) throws IOException {
		String contenturl = newsdao.searchNews(newsid).getContent();
		System.out.println("======所要删除的文件位于" + contenturl);
		File file = new File(contenturl);
		if (file.exists()) {
            file.delete();
            AddRecord.print("删除新闻文件：" + contenturl);
        } else {
        	System.out.println("删除文件失败:" + contenturl + "不存在！");
        	AddRecord.print("删除新闻文件失败：" + newsid);
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
