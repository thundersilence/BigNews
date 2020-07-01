package com.action;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CommentDao;
import com.dao.NewsDao;
import com.entity.Comment;
import com.entity.News;
import com.entity.User;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-------已访问CommentServlet");
		
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		
		String comment_content = request.getParameter("comment_message");
		HttpSession session=  request.getSession();
		News news = (News)session.getAttribute("news");
		User user = (User)session.getAttribute("user");
		//从html页面取得对应参数
		CommentDao CD= new CommentDao();
		Comment comment=new Comment();
		//创建新的Comment对象
	
		comment.setContent(comment_content);
		comment.setNews_id(news.getId());
		comment.setUser_id(user.getId());

		//无需修改的内容
		System.out.println("开始随机生成id");
		
		Random rand=new Random();
		int id;
		while(true) {
		id=rand.nextInt(2147483640);
		if (CD.checkID(id))break;
		}//随机生成id
		
		System.out.println("----成功随机生成id:" + id);
		
		comment.setId(id);
		CD.insert(comment);
		response.sendRedirect("NewsServlet?news_id="+news.getId());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
