package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.dao.StarDao;
import com.entity.News;

/**
 * Servlet implementation class FavouriteServlet
 */
@WebServlet("/FavouriteServlet")
public class FavouriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StarDao SD=new StarDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavouriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest req, HttpServletResponse resp)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest req, HttpServletResponse resp)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置请求的编码为utf-8
		req.setCharacterEncoding("utf-8");
	
		//取到请求的中的分类信息
		//String category = req.getParameter("category");
		//测试请求
		//System.out.println("当前分类为："+category);
		
		showFavoriteNews(req,resp);
		
		
	}

	private void showFavoriteNews(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		int user_id=(int) req.getSession().getAttribute("id");
		
		ArrayList<News> newsList = SD.search(user_id);
		//测试dao
//		TestCategory test = new TestCategory();
//		ArrayList<News> newsList= test.creatnewslist();
		
		System.out.println("----->"+newsList);
		//将查询到的news添加到web容器中
		req.getSession().setAttribute("newsList", newsList);
		
		//跳转到指定的页面
		resp.sendRedirect("sources/checkstar.jsp");
	}

}
