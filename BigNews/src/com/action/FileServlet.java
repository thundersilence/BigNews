package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FileDao;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/FileServlet")
public class FileServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		User user=new User();
		UserDao UD=new UserDao();
		String headimgs = null;
		FileDao FD=new FileDao();
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
		user=UD.search(id);
		
		if(headimgs.equals(null)||headimgs.equals("")) {
			headimgs=user.getImg();
		}
		System.out.println("文件名为"+headimgs);
			
		user.setImg(headimgs);
		request.getSession().setAttribute("user", user);
		UD.update(user);
		response.sendRedirect("sources/userEdit.jsp");
	}
}