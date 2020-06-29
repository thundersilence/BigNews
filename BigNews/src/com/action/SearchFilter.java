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

@WebServlet("/SearchFilter")
public class SearchFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NewsDao newsdao = new NewsDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		
		List<News> newsList = null;
		
		String key = (String)session.getAttribute("key");
		String[] categories = request.getParameterValues("category");
		
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
		
		
		if(categories != null) {
			if(newsList != null) {
				for(int i=0;i<newsList.size();i++) {
					if(!involve(categories, newsList.get(i).getType())) {
						newsList.remove(i);
						i--;
					}
				}
			}
		}
		
		int num;
		if(newsList == null) {
			num=0;
		}else {
			num = newsList.size();
		}
		
		int pageNum = num/6 +1;
		
		List<News> newsList2 = null;
		if(pageNum>1) {
			newsList2 = newsList.subList(0, 5);
		}else {
			newsList2 = newsList;
		}
		
		request.setAttribute("page", 1);
		request.setAttribute("pageNum", pageNum);
		session.setAttribute("newsList", newsList2);
		session.setAttribute("categories", categories);
		request.getRequestDispatcher("search").forward(request, response); 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

	}
	
	//判断字符串e是否在字符串数组list里
	private boolean involve(String[] list, String e) {
		for(int i=0;i<list.length;i++) {
			if(list[i].equals(e)) {
				return true;
			}
		}
		return false;
	}

}
