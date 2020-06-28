package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.News;
import com.entity.User;

@WebServlet("/AdministratorPages")
public class AdministratorPagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int newsPageSize = 3;
	private static final int userPageSize = 5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		List<News> newsList = (List<News>)session.getAttribute("newsList");
		List<User> userList = (List<User>)session.getAttribute("userList");
		
		
		int newspage = 1;
		if(request.getParameter("newspage") != null) {
			newspage = Integer.valueOf(request.getParameter("newspage"));
		}
		
		int userpage = 1;
		if(request.getParameter("userpage") != null) {
			userpage = Integer.valueOf(request.getParameter("userpage"));
		}
		
		System.out.println("newspage:" + newspage + "\nuserpage:" + userpage);
		
		session.setAttribute("cNewsList", getCurrentList(newsList, newsPageSize, newspage));
		session.setAttribute("cUserList", getCurrentList(userList, userPageSize, userpage));
		request.setAttribute("newsPage", newspage);
		request.setAttribute("userPage", userpage);
		request.setAttribute("newsTotal", getTotalPages(newsList, newsPageSize));
		request.setAttribute("userTotal", getTotalPages(userList, userPageSize));
		
		request.getRequestDispatcher("sources/administrator.jsp").forward(request, response);
	}
	
	private int getTotalPages(List list, int pagesize) {
		int totalnum = list.size();
		int totalpage = totalnum % pagesize == 0 ?(totalnum/pagesize):(totalnum/pagesize+1);
		return totalpage;
	}

	private List getCurrentList(List list, int pagesize, int currentpage){
		int totalnum = list.size();
		List currentlist = new ArrayList();

		if(totalnum>=pagesize){
			for(int i=0;i<pagesize;i++){
				int index =(currentpage-1)*pagesize+i;
				currentlist.add(list.get(index));
			}
		}else{
			currentlist = list;
		}
		
		return currentlist;
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
