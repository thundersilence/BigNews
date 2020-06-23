package com.test;
import static org.junit.Assert.assertEquals;

import java.security.Timestamp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.dao.NewsDao;
import com.entity.News;

public class newsDaoTest {
NewsDao a=new NewsDao();


//@Test
public void InsertTest() {
	News n=new News();
	n.setAuthor("author");
	n.setCommentNum(0);
	n.setContent("content");
	n.setId(5);
	n.setName("name");
	n.setPictureURL("pictureURL");
	n.setSimple("simple");
	n.setSource("source");
	n.setStars(0);
	n.setType("type");
	int i=a.insert(n);
	assertEquals(1, i);
}

@Test
public void deleteTest() {
	   News n=new News();
	   n.setId(1);
	   int i=a.delete(n);
	   assertEquals(1, i);
}

@Test
public void updateTest() {
	News n=new News();
	n.setAuthor("a");
	n.setCommentNum(1);
	n.setContent("a");
	n.setId(5);
	n.setName("a");
	n.setPictureURL("a");
	n.setSimple("a");
	n.setSource("a");
	n.setStars(0);
	n.setType("a");
	int i=a.update(n);
	assertEquals(1,i);
}

@Test 
public void selectAll() {
	ArrayList<News> n=a.selectAll();
	News n1=new News();
    n1=n.get(1);
    int i=n1.getId();
    System.out.println(n1.getId());
    assertEquals(3,i);
}
}
