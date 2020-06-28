<<<<<<< HEAD
package com.dao;

import java.util.ArrayList;

import com.entity.Comment;

public class ReplyDao {

	public ArrayList<Comment> search(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
=======
package com.dao;

import java.util.ArrayList;

import com.entity.Reply;

public class ReplyDao {

	//参数为回复id，返回所有该回复的回复
	public ArrayList<Reply> selectReplyListByReplyId(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	//参数为评论id，返回所有该评论的回复
	public static ArrayList<Reply> selectReplyListByCommentId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
>>>>>>> 575b217ad7aace29c3c34d4474f0e2cbc9bd8809
