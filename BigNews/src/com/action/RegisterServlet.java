package com.action;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.entity.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//编码标准UTF-8
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		
		//读取用户名和密码
		
		
		User user=new User();
		UserDao UD=new UserDao();
		
		
		
		Random rand=new Random();
		int id;
		while(true) {
		id=rand.nextInt(2147483640);
		if (UD.search(id).getId()==0)break;				//搜索不到已有id时返回一个id为0的user类
		}//随机生成id
		
		user.setId(id);
		user.setName(username);
		user.setPassword(password);
		user.setImg(null);
		
		System.out.println("注册成功");					//给测试人员看的东西
		request.getRequestDispatcher("login.html");		//跳转到登录界面
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
