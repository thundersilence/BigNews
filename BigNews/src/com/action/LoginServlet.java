package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.entity.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		String userid= request.getParameter("userid");
		String password= request.getParameter("password");
		
		//读取用户id和密码
		User user=new User();
		UserDao UD=new UserDao();
		
		int id = Integer.parseInt(userid);
		user=UD.search(id);
		//以id搜索唯一用户
		if(user.getPassword()!=password) {					//登录失败
			System.out.println("登陆成功");
			request.getRequestDispatcher("index.jsp");
		}
		else {												//登录成功
			System.out.println("登陆失败");
			response.sendRedirect("sources/index.html");
		}
	}
}
