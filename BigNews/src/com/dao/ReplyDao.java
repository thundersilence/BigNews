package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.Reply;
import com.utils.NewsDBUtils;

public class ReplyDao extends NewsDBUtils {

	// 参数为评论id，返回所有该评论的回复
	public ArrayList<Reply> selectReplyListByCommentId(int comment_id) { // 返回分类新闻对象，输入为String,返回类型为该字符串的新闻对象
		Object params[] = { comment_id };
		// 改表名
		String sql = "select * from reply where comment_id=?";
		ResultSet rs = doQuery(sql, params);

		ArrayList<Reply> list = new ArrayList<Reply>();

		try {
			if (rs.next()) {// 判断是否至少存在一条数据记录
				rs.beforeFirst();// 将光标移动到第一行数据之前
				while (rs.next()) {

					Reply Reply = new Reply();
					// 表中属性填充
					Reply.setId(rs.getInt(1));
					Reply.setComment_id(rs.getInt(2));
					Reply.setUser_id(rs.getInt(3));
					Reply.setTarget_user_id(rs.getInt(4));
					Reply.setTarget_reply_id(rs.getInt(5));
					Reply.setType(rs.getInt(6));
					Reply.setTime(rs.getString(7));
					Reply.setContent(rs.getString(8));
					// 对象属性填充,放在servlet中
					list.add(Reply);
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

	public int insert(Reply reply) {// 插入新的reply到数据库，reply共11个属性，其中10个需要赋值，具体要求在reply中
		// 给占位符赋予的值
		Object params[] = { reply.getId(), reply.getComment_id(), reply.getUser_id(), reply.getTarget_user_id(),
				reply.getTarget_reply_id(), reply.getType(), reply.getTime(), reply.getContent() };
		// 要执行的sql语句
		String sql = "insert into reply values(?,?,?,?,?,?,?,?)"; // 使用时将reply改为自己数据库表名

		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}

}

