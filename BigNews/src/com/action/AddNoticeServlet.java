package com.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addNotice")
public class AddNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String notice = request.getParameter("notice");
		System.out.println("发布公告内容：" + notice);
		
		ServletContext application= this.getServletContext();
		
		if(notice.trim().isEmpty()) {
			if(application.getAttribute("notice") != null) {
				application.removeAttribute("notice");
			}
		}else {
			application.setAttribute("notice", notice);
		}
		
		response.sendRedirect("secret");
	}

}
