package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.User;
import com.entity.User;
import com.utils.UserDBUtils;

public class UserDao extends UserDBUtils{
	public int insert(User user) {//插入新的user到数据库，User共4个属性
		//给占位符赋予的值
		Object params [] 
				= {user.getId(),user.getName(),user.getPassword(),user.getImg()};
		//要执行的sql语句
		String sql = "insert into user values(?,?,?,?)";  //使用时将user改为自己数据库表名
		
		//执行sql语句
		int i = doUpdate(sql,params);
		
		//释放资源
		getClose();
		return  i;
	}
	
	public int delete(int id) { //删除数据库中user_id与user的id相同的纪录
		// 给占位符赋予的值
		Object params[] = {id};
		// 要执行的sql语句
		String sql = "delete from user where user_id=?";

		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
    }
	
	public int update(User user) {//输入新的user，将user_id与user对象的id相同的数据库中的纪录的其他属性改为user对象中的属性
		// 给占位符赋予的值
		Object params [] 
				= {user.getName(),user.getPassword(),user.getPassword(),user.getId()};
		// 要执行的sql语句
		String sql = "update user set user_name=?,user_password=?,user_headimg=? where user_id=?";
		// 执行sql语句
		
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	
	public ArrayList<User> selectAll() {//返回数据库中所有的纪录，以arraylist<User>的形式返回
		// 给占位符赋予的值
		Object params[] = null;
		// 要执行的sql语句
		String sql = "select * from user";
		// 执行sql语句
		ResultSet rs = doQuery(sql, null);

		ArrayList<User> list = null;
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<User>();
				while (rs.next()) {
				
					User user = new User();
							user.setId(rs.getInt(1));
							user.setName(rs.getString(2));
							user.setPassword(rs.getString(3));
							user.setImg(rs.getString(4));
					
					list.add(user);
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 释放资源
		getClose();
		return list;
	}
	
	public User search(int id) {//通过id搜索用户，因为id为主键，返回值为User
		Object params[] = {id};
		// 要执行的sql语句
		String sql = "select * from user where user_id=?";
		// 执行sql语句
		ResultSet rs = doQuery(sql, params);

		User user=new User();
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				rs.next();
				user = new User();
							user.setId(rs.getInt(1));
							user.setName(rs.getString(2));
							user.setPassword(rs.getString(3));
							user.setImg(rs.getString(4));
					
		
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 释放资源
		getClose();
		return user;
	}
	
	public ArrayList<User> searchUser(String name){
		Object params[] = {name};
		// 要执行的sql语句
		String sql = "select * from user where user_name=?";
		// 执行sql语句
		ResultSet rs = doQuery(sql, params);
ArrayList<User> list = null;
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<User>();
				while (rs.next()) {
				
					User user = new User();
							user.setId(rs.getInt(1));
							user.setName(rs.getString(2));
							user.setPassword(rs.getString(3));
							user.setImg(rs.getString(4));
					
					list.add(user);
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 释放资源
		getClose();
		return list;
	}
}
