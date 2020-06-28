<<<<<<< HEAD
package com.entity;

public class Reply {

}
=======
package com.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private int comment_id;
	private int id;
	private int user_id;
	private int target_user_id;
	private int target_reply_id;
	private int type;
	private String time;
	private String content;
	private User user;
	private User target_user;

	public Reply() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); // 构造对象时将时间设置为当前时间，在新闻发布后立刻创建一个Reply对象，将各种信息储存在Reply对象中，自动设置时间为当前时间
		setTime(df.format(new Date()));
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getTarget_reply_id() {
		return target_reply_id;
	}

	public void setTarget_reply_id(int target_reply_id) {
		this.target_reply_id = target_reply_id;
	}

	public int getTarget_user_id() {
		return target_user_id;
	}

	public void setTarget_user_id(int target_user_id) {
		this.target_user_id = target_user_id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getTarget_user() {
		return target_user;
	}

	public void setTarget_user(User target_user) {
		this.target_user = target_user;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
<<<<<<< HEAD
>>>>>>> 575b217ad7aace29c3c34d4474f0e2cbc9bd8809
=======

>>>>>>> 6016d550701b942afb9938f62df9dbb8536c6ea5
