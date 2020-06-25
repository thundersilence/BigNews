package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.entity.News;

/**
 * Servlet implementation class ClassifiedServlet
 */
@WebServlet("/ClassifiedServlet")
public class ClassifiedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NewsDao dao =new NewsDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassifiedServlet() {
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
		
		showCategoryNews(req,resp);
		
		
	}

	private void showCategoryNews(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		//取到请求的中的分类信息
		String category = req.getParameter("category");
		//调用dao方法返回分类的newslist
		ArrayList<News> newsList = dao.classified(category);
		
		//测试dao
//		TestCategory test = new TestCategory();
//		ArrayList<News> newsList= test.creatnewslist();
		
		System.out.println("----->"+newsList);
		//将查询到的news添加到web容器中
		req.getSession().setAttribute("newsList", newsList);
		//把当前的分类存到web容器中
		req.getSession().setAttribute("category", category);
		
		//跳转到指定的页面
		resp.sendRedirect("quar_5_magz/category.jsp");
	}

}
