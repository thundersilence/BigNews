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

@WebServlet("/deleteNews")
public class DeleteNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsDao newsdao = new NewsDao();
	UserDao userdao = new UserDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.valueOf(request.getParameter("id"));
		System.out.println("已获取新闻id：" + id);
		
		if(newsdao.delete(id) != 0) {
			System.out.println("======已删除id为" + id + "的新闻");
		}

		response.sendRedirect("secret");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}