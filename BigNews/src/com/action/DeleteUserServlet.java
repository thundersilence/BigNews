package com.action;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDao;
import com.dao.UserDao;
import com.model.AddRecord;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsDao newsdao = new NewsDao();
	UserDao userdao = new UserDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int id = Integer.valueOf(request.getParameter("id"));
		System.out.println("已获取用户id：" + id);
		
		deleteIcon(id);
		if(userdao.delete(id) != 0) {
			System.out.println("======已删除id为" + id + "的用户");
			AddRecord.print("删除用户记录：" + id);
		}

		response.sendRedirect("secret");
	}
	
	private void deleteIcon(int userid) throws IOException {
		String iconurl = userdao.search(userid).getImg();
		System.out.println("======所要删除的文件位于" + iconurl);
		File file = new File(iconurl);
		if (file.exists()) {
            file.delete();
            AddRecord.print("删除用户文件：" + iconurl);
        } else {
        	System.out.println("删除文件失败:" + iconurl + "不存在！");
        	AddRecord.print("删除文件失败：" + iconurl);
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
