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
import com.dao.UserDao;
import com.entity.News;
import com.entity.User;

@WebServlet("/secret")
public class AdministratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsDao newsdao = new NewsDao();
	UserDao userdao = new UserDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<News> newsList = null;
		List<User> userList = null;
		
		//得到新闻排序关键字和用户排序关键字
		/*
		 * String newskey = (String)session.getAttribute("newskey"); String userkey =
		 * (String)session.getAttribute("userkey");
		 */
		String newskey = request.getParameter("newskey");
		String userkey = request.getParameter("userkey");
		
		if(newskey == null) {
			newsList = newsdao.selectAll();
			System.out.println("新闻关键字属性缺失");
		}else if (newskey.trim().isEmpty()) {
			newsList = newsdao.selectAll();
			System.out.println("新闻关键字为空或空格");
		}else {
			newsList = newsdao.search(newskey.trim());
			System.out.println("已按新闻搜索关键字查找");
		}
		
		//用户搜索功能--待商榷
		if(userkey == null) {
			userList = userdao.selectAll();
			System.out.println("用户关键字属性缺失");
		}else {
			userList = userdao.selectAll();
			System.out.println("已按用户id查找");
		}
		
		session.setAttribute("newsList", newsList);
		session.setAttribute("userList", userList);
		System.out.println("======新闻与用户列表已设置");
		
		request.getRequestDispatcher("sources/administrator.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
