package com.dao;

public class StarDao {

<<<<<<< Updated upstream
=======
import com.entity.News;
import com.entity.Star;
import com.utils.NewsDBUtils;

public class StarDao extends NewsDBUtils{
	public int insert(Star star) {//插入新的star到数据库，含两个参数
		//给占位符赋予的值
		Object params [] 
				= {star.getStars_id(),star.getUser_id(),star.getNews_id()};
		//要执行的sql语句
		String sql = "insert into star values(?,?)";  //star表：stars_id:主键;user_id:用户id;news_id
		
		//执行sql语句
		int i = doUpdate(sql,params);
		
		System.out.println("-------sql语句已执行完毕");
		
		//释放资源
		getClose();
		return  i;
	}
	public int delete(Star star) { //删除数据库中stars_id与stars的id相同的纪录
		// 给占位符赋予的值
		Object params[] = {star.getStars_id()};
		// 要执行的sql语句
		String sql = "delete from news where news_id=?";

		// 执行sql语句
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	public int update(Star star) {//依据stars_id修改user_id和news_id的值(或许根本不需要这个方法)
		// 给占位符赋予的值
		Object params [] 
				= {star.getStars_id(),star.getUser_id(),star.getNews_id()};
		// 要执行的sql语句
		String sql = "update news set stars_id=?,user_id=? where news_id=?";
		// 执行sql语句
		
		int i = doUpdate(sql, params);

		// 释放资源
		getClose();
		return i;
	}
	public ArrayList<News> search(int user_id) {  //输入需要搜索的词语，将简介和姓名中包含此词语的所有新闻以Arraylist<News>的形式返回
		Object params[] = {user_id};
		String sql = "select * from star where user_id=?";
		ResultSet rs = doQuery(sql, params);
		ArrayList<News> list = null;
		NewsDao ND=new NewsDao();
		try {
			if (rs.next()) {//判断是否至少存在一条数据记录
				rs.beforeFirst();//将光标移动到第一行数据之前
				list = new ArrayList<News>();
				while (rs.next()) {
					News news=ND.searchNews(rs.getInt(3));
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
	public boolean checkstar(int user_id, int news_id) {
		
			Object params[] = {user_id,news_id};
			String sql = "select * from star where user_id=? AND news_id=?";
			ResultSet rs = doQuery(sql, params);
			try {
				if (rs.next())
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
			
		
	}
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
}
