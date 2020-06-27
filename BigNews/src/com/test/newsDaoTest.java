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
	n.setId(6);
	n.setName("name");
	n.setPictureURL("pictureURL");
	n.setSimple("simple");
	n.setSource("source");
	n.setStars(0);
	n.setType("science");
	int i=a.insert(n);
	assertEquals(1, i);
}

//@Test
public void deleteTest() {
	   News n=new News();
	   n.setId(1);
	   int i=a.delete(n);
	   assertEquals(1, i);
}

//@Test
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
	n.setType("science");
	int i=a.update(n);
	assertEquals(1,i);
}

//@Test 
public void TestselectAll() {
	ArrayList<News> n=a.selectAll();
	News n1=new News();
    n1=n.get(1);
    int i=n1.getId();
    System.out.println(n1.getId());
    assertEquals(3,i);
}

//@Test
public void Testclassified() {
	ArrayList<News> n=a.classified("science");
	show(n);
}

public void show(ArrayList<News> n) {
	News nn=new News();
	for(int i=0;i<n.size();i++) {
		nn=n.get(i);
		System.out.println(nn.getAuthor());
		System.out.println(nn.getCommentNum());
		System.out.println(nn.getContent());
		System.out.println(nn.getId());
		System.out.println(nn.getName());
		System.out.println(nn.getPictureURL());
		System.out.println(nn.getSimple());
		System.out.println(nn.getSource());
		System.out.println(nn.getStars());
		System.out.println(nn.getTime());
		System.out.println(nn.getType());
		}
}

//@Test
public void TestcheckId() {
	boolean flag=a.checkID(1);
	System.out.println(flag);
}

@Test
public void Testsearch() {
	ArrayList<News> n=a.search("sdkfjslf");
	show(n);
}

@Test
public void TestsearchNews() {
	News news=a.searchNews(1);
	System.out.println(news.getName());
}
}
