package com.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class News {
	public News() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");  //构造对象时将时间设置为当前时间，在新闻发布后立刻创建一个News对象，将各种信息储存在News对象中，自动设置时间为当前时间
		setTime(df.format(new Date()));
	}
private int id;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getCommentNum() {
	return commentNum;
}
public void setCommentNum(int commentNum) {
	this.commentNum = commentNum;
}
public int getStars() {
	return stars;
}
public void setStars(int stars) {
	this.stars = stars;
}
public String getPictureURL() {
	return pictureURL;
}
public void setPictureURL(String pictureURL) {
	this.pictureURL = pictureURL;
}
public String getSimple() {
	return simple;
}
public void setSimple(String simple) {
	this.simple = simple;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
private String name;
private String time;
private String source;
private String content;
private int commentNum;
private int stars;
private String pictureURL;
private String simple;
private String author;
private String type;
}
