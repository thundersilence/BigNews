package com.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FileDao;
import com.dao.UserDao;
import com.entity.User;
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		System.out.println("Get");
		
		
		response.sendRedirect("sources/userEdit.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		
		
		System.out.println("Post");
		FileDao FD=new FileDao();
		User user=new User();
		UserDao UD=new UserDao();
		
		String headimgs = null;
		String name=request.getParameter("username");				//从页面取得新用户名
		System.out.println("=================try前测试=================");
		try {
			System.out.println("=================try中测试=================");
			headimgs=FD.getRequestFileItems(request,response);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		System.out.println("=================try后测试=================");
		
		int id=(int) request.getSession().getAttribute("id");
		System.out.println(id);
		user=UD.search(id);											//依据session储存的id找到用户
		
		
		
		if(name!="") {
			name=user.getName();
		}
		user.setName(name);
		System.out.println("新用户名为"+name);
		request.getSession().setAttribute("user", user);			//更新新用户名至session
		System.out.println("文件名为"+headimgs);
		user.setImg(headimgs);										//修改User对象属性
		UD.update(user);
		
		response.sendRedirect("sources/userDisplay.jsp");
	}




}
