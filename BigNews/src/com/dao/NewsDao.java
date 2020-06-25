package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.entity.News;

import com.utils.NewsDBUtils;

public class NewsDao extends NewsDBUtils{
	public int insert(News news) {//插入新的news到数据库，News共11个属性，其中10个需要赋值，具体要求在News中
		//给占位符赋予的值
		Object params [] 
				= {news.getId(),news.getName(),news.getTime(),news.getSource(),news.getContent(),news.getCommentNum(),news.getStars(),news.getPictureURL(),news.getSimple(),news.getAuthor(),news.getType()};
		//要执行的sql语句
		String sql = "insert into news values(?,?,?,?,?,?,?,?,?,?,?)";  //使用时将news改为自己数据库表名
		
		//执行sql语句
		int i = doUpdate(sql,params);
		
		System.out.println("-------sql语句已执行完毕");
		
		//释放资源
		getClose();
		return  i;
	}
	public int delete(News news) { //删除数据库中news_id与news的id相同的纪录
		// 给占位符赋予的值
		Object params[] = {news.getId()};
		// 要执行的sql语句
		String sql = "delete from news where news_id=?";

		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	
	public int update(News news) {//输入新的news，将news_id与news对象的id相同的数据库中的纪录的其他属性改为news对象中的属性
		// 给占位符赋予的值
		Object params [] 
				= {news.getName(),news.getSource(),news.getContent(),news.getCommentNum(),news.getStars(),news.getPictureURL(),news.getSimple(),news.getAuthor(),news.getType(),news.getId()};
		// 要执行的sql语句
		String sql = "update news set news_name=?,news_source=?,news_content=?,news_comment_num=?,news_stars=?,news_pictureURL=?,news_simple=?,news_author=?,news_type=? where news_id=?";
		// 执行sql语句
		
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	
	public ArrayList<News> selectAll() {//返回数据库中所有的纪录，以arraylist<News>的形式返回
		// 给占位符赋予的值
		Object params[] = null;
		// 要执行的sql语句
		String sql = "select * from news";
		// 执行sql语句
		ResultSet rs = doQuery(sql, null);

		ArrayList<News> list = null;
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<News>();
				
				//将学生存放在list集合中
				while (rs.next()) {
				
					News news = new News();
							news.setId(rs.getInt(1));
							news.setName(rs.getString(2));
							news.setTime(rs.getString(3));
							news.setSource(rs.getString(4));
							news.setContent(rs.getString(5));
							news.setCommentNum(rs.getInt(6));
							news.setStars(rs.getInt(7));
							news.setPictureURL(rs.getString(8));
							news.setSimple(rs.getString(9));
							news.setAuthor(rs.getString(10));
							news.setType(rs.getString(11));
					
					list.add(news);
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
	
	public ArrayList<News> classified(String type) {  //返回分类新闻对象，输入为String,返回类型为该字符串的新闻对象
		Object params[] = {type};
		String sql = "select * from news where news_type=?";
		ResultSet rs = doQuery(sql, params);

		ArrayList<News> list = null;
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<News>();
				
				//将学生存放在list集合中
				while (rs.next()) {
				
					News news = new News();
							news.setId(rs.getInt(1));
							news.setName(rs.getString(2));
							news.setTime(rs.getString(3));
							news.setSource(rs.getString(4));
							news.setContent(rs.getString(5));
							news.setCommentNum(rs.getInt(6));
							news.setStars(rs.getInt(7));
							news.setPictureURL(rs.getString(8));
							news.setSimple(rs.getString(9));
							news.setAuthor(rs.getString(10));
							news.setType(rs.getString(11));
					
					list.add(news);
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

	public boolean checkID(int id){ //验证id是否存在，存在返回false，不存在返回true
		Object params[] = {id};
		String sql = "select * from news where news_id=?";
		ResultSet rs = doQuery(sql, params);
		try {
			if (rs.next())
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
	}
}
