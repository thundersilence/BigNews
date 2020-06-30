package com.action;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ReplyDao;
import com.entity.News;
import com.entity.Reply;
import com.entity.User;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-------已访问ReplyServlet");
		/*
		 * private int comment_id; 			回复所属评论的id 				{comment.id}
		 * private int id; 					随机生成													
		 * private int user_id; 			用户id，登录时存放在session对象中								
		 * private int target_user_id; 		回复目标用户的id					{comment.user.id}或者{reply0.user_id}或者{reply1.user_id}
		 * private int target_reply_id; 	回复目标回复的id，根据按钮所在的循环层数不同，当type为1时设置{reply0.id}或者{reply1.id}
		 * private int type;				回复按钮所在的循环层数不同，type为0是评论的回复，type为1是回复的回复
		 * private String time;				new的时候自动生成
	     * private String content;			提交文本框的内容request的getparameter方法
		 */
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		String content = request.getParameter("reply_message");
		int target_reply_id = Integer.parseInt(request.getParameter("target_reply_id"));
		int target_user_id = Integer.parseInt(request.getParameter("target_user_id"));
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session=  request.getSession();
		News news = (News)session.getAttribute("news");
		User user = (User)session.getAttribute("user");
		int user_id = user.getId();

		//从html页面取得对应参数
		ReplyDao RD= new ReplyDao();
		Reply reply=new Reply();

		//创建新的Comment对象
		reply.setComment_id(comment_id);

		reply.setContent(content);
		
		reply.setTarget_reply_id(target_reply_id);
		
		reply.setTarget_user_id(target_user_id);
		
		reply.setType(type);
		
		reply.setUser_id(user_id);
		
		System.out.println("开始随机生成id");

		//无需修改的内容
		System.out.println("开始随机生成id");
		
		Random rand=new Random();
		int id;
		while(true) {
		id=rand.nextInt(2147483640);
		if (RD.checkID(id))break;
		}//随机生成id
		
		System.out.println(comment_id + "  "+content + "  "+target_reply_id + "  "+target_user_id + "  "+type + "  "+user_id + "  ");
		
		reply.setId(id);
		RD.insert(reply);
		//重定向到../NewsServlet?news_id=${news.id}
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
