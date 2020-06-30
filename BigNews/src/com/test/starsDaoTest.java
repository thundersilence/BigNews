package com.test;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.dao.StarDao;
import com.entity.Star;
public class starsDaoTest {
StarDao s=new StarDao();
@Test
public void testCheck(){
	System.out.print(s.checkstar(1, 2));
}
}
