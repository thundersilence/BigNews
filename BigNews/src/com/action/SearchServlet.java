package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewsDao;
import com.entity.News;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsDao newsdao = new NewsDao();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("sources/search.jsp").forward(request, response); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		
		List<News> newsList = null;
		String key = request.getParameter("key");
		
		if(key == null) {
			newsList = newsdao.selectAll();
			System.out.println("关键字属性缺失");
		}else if (key.trim().isEmpty()) {
			newsList = newsdao.selectAll();
			System.out.println("关键字为空");
		}else {
			newsList = newsdao.search(key.trim());
			System.out.println("已按搜索关键字查找");
		}
		
		request.setAttribute("newsList", newsList);
		session.setAttribute("key", key);
		request.getRequestDispatcher("sources/search.jsp").forward(request, response);
		
	}

}
