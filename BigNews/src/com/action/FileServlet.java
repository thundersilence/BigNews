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
import com.model.CreateIcon;
import com.model.filein;

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
		UserDao UD=new UserDao();
		String headimgs = null;
		
		int id=(int) request.getSession().getAttribute("id");
		
		
		String imagedir = getServletContext().getRealPath("sources/imageStore/");
		String imageurl = imagedir + id + ".jpg";
		
		filein.putnew(imagedir, imageurl, CreateIcon.getIcom());
		
		response.sendRedirect("sources/userEdit.jsp");
	}
}