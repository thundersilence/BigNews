package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StarDao;
import com.entity.Star;
@WebServlet("/StarServlet")
public class StarServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	StarDao lovedao = new StarDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println("----------->"+action);
		if (action.equals("sel")) {
			selLoveType(req, resp);
		}else if(action.equals("del")) {
			delLoveType(req, resp);
		}else if(action.equals("add")) {
			addLoveType(req, resp);
		}
		 
	}
	
	private void addLoveType(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String user_id =req.getParameter("user_id");
		String news_id = req.getParameter("news_id");
		Star star = new Star();
			 star.setNews_id(news_id!=null&&!news_id.equals("")?Integer.parseInt(news_id):0);
			 star.setUser_id(user_id!=null&&!user_id.equals("")?Integer.parseInt(user_id):0);
		lovedao.insert(star);
	}
	private void delLoveType(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String user_id =req.getParameter("user_id");
		String news_id = req.getParameter("news_id");
		System.out.println("shanchu de tiaojian ="+user_id+"  "+news_id);
		lovedao.delete(user_id!=null&&!user_id.equals("")?Integer.parseInt(user_id):0,news_id!=null&&!news_id.equals("")?Integer.parseInt(news_id):0);
	}
	private void selLoveType(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//获取要查询是否已收藏的条件，如用户id，收藏id
		String user_id =req.getParameter("user_id");
		String news_id = req.getParameter("news_id");
		
		System.out.println(user_id+"------"+news_id);
		boolean bool = lovedao.checkstar(user_id!=null&&!user_id.equals("")?Integer.parseInt(user_id):0,news_id!=null&&!news_id.equals("")?Integer.parseInt(news_id):0);
		//返回json对象数据
		PrintWriter writer = resp.getWriter();
		writer.write("{\"start\":\""+bool+"\"}");
		writer.close();
		
		
		
	}
}

