package com.utils;

import java.sql.*;      //引入sql全包




public class NewsDBUtils {
	private String url = "jdbc:mysql://localhost:3306/bignews?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=UTC";
	// 使用时修改为本地数据库位置
	private String user = "root";
	// 用户密码 你的数据库密码
	private String password = "389237";
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {                  //加载驱动，不调用自动执行
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void getConnect() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("链接数据库成功！！");                   //链接数据库
		} catch (SQLException e) {
			System.out.println("链接数据库失败！！！");
			e.printStackTrace();
		}

	}
	
	public int doUpdate(String Sqls,Object params[]) {
		//调用连接对象的函数
		getConnect();
		int i=0;
		try {
			//获取执行对象
			stmt = conn.prepareStatement(Sqls,
		             ResultSet.TYPE_SCROLL_INSENSITIVE,
		             ResultSet.CONCUR_READ_ONLY);
			
			//判断是否要给占位符赋值
			if (params!=null && params.length!=0) {
				for (int j = 0; j < params.length; j++) {
					stmt.setObject(j+1, params[j]);
				}
			}
			
			System.out.println("执行的sql语句为："+stmt.toString());
			
			//执行sql语句，并处理执行状态结果
			i = stmt.executeUpdate();
			System.out.println("执行状态："+i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public ResultSet doQuery(String Sqls,Object params[]) {

		// 调用连接对象的函数
		getConnect();
		try {
			// 获取执行对象
			stmt = conn.prepareStatement(Sqls,
		             ResultSet.TYPE_SCROLL_INSENSITIVE,
		             ResultSet.CONCUR_READ_ONLY);
			
			//判断是否要给占位符赋值
			if (params!=null && params.length!=0) {
				for (int j = 0; j < params.length; j++) {
					stmt.setObject(j+1, params[j]);
				}
			}
			

			System.out.println("执行的sql语句为："+stmt.toString());
			// 执行sql语句，并处理执行状态结果
			rs = stmt.executeQuery();
			
			/*//处理结果集对象
			if (rs.next()) {//至少有一条数据记录
				//将光标移到第一行数据之前
				rs.beforeFirst();
				while (rs.next()) {
					System.out.println(rs.getString("stu_id")+"  "
							+rs.getString("stu_name")+" "
							+rs.getString("stu_password")+"  "
							+rs.getString("stu_age")+" "
							+rs.getString("stu_sex")+" "
							+rs.getString("stu_address"));
				}
			}*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public void getClose() {
		 try {
			if (rs!=null) {
				rs.close();
			}
			if (stmt!=null) {
				stmt.close();
			}
			if (conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
