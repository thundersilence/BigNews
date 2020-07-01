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
		if(!(userid.equals(null)||userid.equals(""))) {
			int id = Integer.parseInt(userid);
			user=UD.search(id);
			String image=user.getImg();
			//以id搜索唯一用户
			System.out.println(user.getName());
			if(user.getPassword()==null) {
				System.out.println("无此账号");
				/* response.sendRedirect("sources/login.jsp"); */
				request.setAttribute("success", "S");
				request.getRequestDispatcher("sources/login.jsp").forward(request, response);
			}else if((user.getPassword()).equals(password)){
				System.out.println("登陆成功");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("id", id);			//session 添加名称和id
				request.getSession().setAttribute("image", image);
				//response.sendRedirect("sources/index.html");
				response.sendRedirect("sources/index.jsp");
			}else {
				System.out.println("登陆失败");
				request.setAttribute("success", "S");
				/* response.sendRedirect("sources/login.jsp"); */
				request.getRequestDispatcher("sources/login.jsp").forward(request, response);
				
			}
		}else{
			System.out.println("登陆失败");
			request.setAttribute("success", "S");
			/* response.sendRedirect("sources/login.jsp"); */
			request.getRequestDispatcher("sources/login.jsp").forward(request, response);
		}
			
	}
}
