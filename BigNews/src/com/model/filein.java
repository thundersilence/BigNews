package com.model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class filein {

	
	
	
	public static void put(String dir, String url, BufferedImage bi) throws IOException {

		File file = new File(dir);
        if (!file.exists()) {
            file.mkdirs();
        }
        FileOutputStream fos = new FileOutputStream(url);
        ImageIO.write(bi,"JPG", fos);
        fos.close();
	}
	
	public static void putnew(String dir, String url, BufferedImage bi) throws IOException {

		File file = new File(dir);
        if (!file.exists()) {
            file.mkdirs();
        }else {
        	file.delete();
        	file.mkdirs();
        	System.out.println("ssssssssssssssssssss");
        }
        System.out.println("==================================");
        FileOutputStream fos = new FileOutputStream(url);
        ImageIO.write(bi,"JPG", fos);
        fos.close();
	}
}
