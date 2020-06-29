package com.action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CommentDao;
import com.dao.NewsDao;
import com.dao.ReplyDao;
import com.dao.UserDao;
import com.entity.Comment;
import com.entity.News;
import com.entity.Reply;
import com.entity.User;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// dao
	NewsDao newsdao = new NewsDao();
	UserDao userdao = new UserDao();
	CommentDao commentdao = new CommentDao();
	ReplyDao replydao = new ReplyDao();

	// 指定绝对路径
	// String contentbasepath = "D:/BigNews/contentStore";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		int news_id = Integer.parseInt(req.getParameter("news_id"));
		// 取news对象
		News news = newsdao.searchNews(news_id);
		// 存news对象
		req.getSession().setAttribute("news", news);
		// 取评论列表
		ArrayList<Comment> commentList = commentdao.search(news_id);
		// 填充对象属性
		for (int i = 0; i < commentList.size(); i++) {
			Comment comment = commentList.get(i);
			// 取产生评论的user
			User user = userdao.search(comment.getUser_id());
			// 填产生评论的user
			comment.setUser(user);
			// 取replyList
			ArrayList<Reply> replyList = replydao.selectReplyListByCommentId(comment.getId());
			for (int j = 0; j < replyList.size(); j++) {
				Reply reply = replyList.get(j);
				// 取产生回复的user
				User auser = userdao.search(reply.getUser_id());
				// 填产生回复的user
				reply.setUser(auser);
				// 取回复的目标user
				User buser = userdao.search(reply.getTarget_reply_id());
				// 填回复的目标user
				reply.setTarget_user(buser);
			}
			// 填replyList
			comment.setReplyList(replyList);
		}
		// 存评论列表
		req.getSession().setAttribute("commentList", commentList);
		// 拼接路径
		String contentpath = news.getContent();
		StringBuffer news_content = new StringBuffer();
		news_content = getSB(contentpath);
		// 存新闻文本
		req.getSession().setAttribute("news_content", news_content);
		// 跳转到指定的页面
		resp.sendRedirect("sources/single.jsp");
	}

	// 读取文件
	public StringBuffer getSB(String filePath) {
		StringBuffer sb = new StringBuffer();
		Reader reader = null;
		BufferedReader br = null;
		try {
			reader = new FileReader(filePath);
			br = new BufferedReader(reader);
			String data = null;
			while ((data = br.readLine()) != null) {
				sb.append(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sb;
	}
}


