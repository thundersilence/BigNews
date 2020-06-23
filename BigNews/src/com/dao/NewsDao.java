package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.News;

import com.utils.NewsDBUtils;

public class NewsDao extends NewsDBUtils{
	public int insert(News news) {
		
		//给占位符赋予的值
		Object params [] 
				= {news.getId(),news.getName(),news.getTime(),news.getSource(),news.getContent(),news.getCommentNum(),news.getStars(),news.getPictureURL(),news.getSimple(),news.getAuthor(),news.getType()};
		//要执行的sql语句
		String sql = "insert into news values(?,?,?,?,?,?,?,?,?,?,?)";  //使用时将news改为自己数据库表名
		
		//执行sql语句
		int i = doUpdate(sql,params);
		
		//释放资源
		getClose();
		return  i;
	}
	public int delete(News news) {
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
	
	public int update(News news) {
		// 给占位符赋予的值
		Object params [] 
				= {news.getName(),news.getTime(),news.getSource(),news.getContent(),news.getCommentNum(),news.getStars(),news.getPictureURL(),news.getSimple(),news.getAuthor(),news.getType(),news.getId()};
		// 要执行的sql语句
		String sql = "update news set news_name=?,news_time=?,news_source=?,news_content=?,news_comment_num=?,news_stars=?,news_pictureURL=?,news_simple=?,news_author=?,news_type=? where news_id=?";
		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	
	public ArrayList<News> selectAll() {
		// 给占位符赋予的值
		//Object params[] = null;
		// 要执行的sql语句
		String sql = "select * from news";
		// 执行sql语句
		ResultSet rs = doQuery(sql, null);
		//存放学生的list集合
		ArrayList<News> list = null;
		
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<News>();
				
				//将学生存放在list集合中
				while (rs.next()) {
					//将每一个学生记录保存在list集合中
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

}
