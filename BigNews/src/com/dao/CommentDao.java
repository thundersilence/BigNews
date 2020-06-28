package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.Comment;
import com.utils.NewsDBUtils;

public class CommentDao extends NewsDBUtils {

	// 接受news_id，返回所有的comment
	public ArrayList<Comment> search(int news_id) { // 返回分类新闻对象，输入为String,返回类型为该字符串的新闻对象
		Object params[] = { news_id };
		String sql = "select * from comment where news_id=?";
		ResultSet rs = doQuery(sql, params);

		ArrayList<Comment> list = new ArrayList<Comment>();

		try {
			if (rs.next()) {// 判断是否至少存在一条数据记录
				rs.beforeFirst();// 将光标移动到第一行数据之前
				while (rs.next()) {

					Comment comment = new Comment();
					comment.setId(rs.getInt(1));
					comment.setNews_id(rs.getInt(2));
					comment.setUser_id(rs.getInt(3));
					comment.setTime(rs.getString(4));
					comment.setContent(rs.getString(5));

					list.add(comment);
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

	public int insert(Comment comment) {// 插入新的comment到数据库，comment共11个属性，其中10个需要赋值，具体要求在comment中
		// 给占位符赋予的值
		Object params[] = { comment.getId(), comment.getNews_id(), comment.getUser_id(), comment.getTime(),
				comment.getContent() };
		// 要执行的sql语句
		String sql = "insert into comment values(?,?,?,?,?)"; // 使用时将comment改为自己数据库表名

		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}

}

