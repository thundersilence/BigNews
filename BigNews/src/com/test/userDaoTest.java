package com.test;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.Test;

import com.dao.UserDao;
import com.entity.User;
public class userDaoTest {
UserDao d=new UserDao();

//@Test
public void testInsert() {
	User user=new User();
	user.setId(1);
	user.setImg("img");
	user.setName("name");
	user.setPassword("password");
	d.insert(user);
}
//@Test
public void testDelete() {
	d.delete(1);
}

@Test
public void testUpdate() {
	User user=new User();
	user.setId(2);
	user.setImg("change");
	user.setName("change");
	user.setPassword("change");
	d.update(user);
}

@Test
public void testSelectAll() {
	ArrayList<User> n=d.selectAll();
	show(n);
}

public void show(ArrayList<User> user) {
	for(int i=0;i<user.size();i++) {
		System.out.println(user.get(i).getId());
		System.out.println(user.get(i).getImg());
		System.out.println(user.get(i).getName());
		System.out.println(user.get(i).getPassword());
	}
}

@Test
public void Testsearch() {
	User user=d.search(2);
	System.out.println(user.getId());
	System.out.println(user.getImg());
	System.out.println(user.getName());
	System.out.println(user.getPassword());
}
}
