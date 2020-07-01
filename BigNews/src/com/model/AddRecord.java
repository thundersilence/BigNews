package com.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AddRecord {
	private static final String URL = "store/record.txt";
	
	public static void print(String record) throws IOException {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"); 
		String time = dateTime.format(formatter) + "\t";
		
		File file = new File(URL);
		if(!file.exists()){
            file.createNewFile();
        }
		
		FileOutputStream fos = new FileOutputStream(file,true);
		fos.write(time.getBytes());
		fos.write(record.getBytes());
		fos.write("\r\n".getBytes());

		fos.close();
	}
}
