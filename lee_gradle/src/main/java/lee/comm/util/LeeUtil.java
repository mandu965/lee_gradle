package lee.comm.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.io.FilenameUtils;

public class LeeUtil {
	static public long StringToLong(String str) {
		long var = 0;
		try {
			var = Long.parseLong(str);
		}catch(NumberFormatException e) {
			System.out.println("error : " + e);
		}
		return var;
	}
	
	static public Double StringToDouble(String str) {
		double var = 0;
		try {
			var = Double.parseDouble(str);
		}catch(NumberFormatException e) {
			System.out.println("error : " + e);
		}
		return var;
	}
	
	static public String getTodayData() {
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyyMMdd");
		String today =  formatter.format(new Date());
		return today;
	}
	
	//파일 복사
	static public void copyFile(File file, File mfile) throws IOException{
	  InputStream inStream = null;
	  OutputStream outStream = null;
	  FileChannel fcin = null;
	  FileChannel fcout= null;
	  try{
	      inStream = new FileInputStream(file); //원본파일
	      outStream = new FileOutputStream(mfile); //이동시킬 위치

	      byte[] buffer = new byte[1024];
	      int length;
	      
	      
	      fcin =  ((FileInputStream) inStream).getChannel();
	      fcout = ((FileOutputStream) outStream).getChannel();
	      long size = fcin.size();
	      fcin.transferTo(0, size, fcout);
	 
	      /*while ((length = inStream.read(buffer)) > 0){
	    	  outStream.write(buffer, 0, length);
	      }*/
	  }catch(IOException e){
	      e.printStackTrace();
	  }finally{
		  fcout.close();
		  fcin.close();
		  inStream.close();
	      outStream.close();
	  }
	}
	
	static public String getFileExtension(String fileName){
		int idx = fileName.lastIndexOf(".");
		if(idx>-1)
			return fileName.substring(idx+1);
		else return "";
	}
	
	static public String getNumericName(String path, String fileName){
		Random random = new Random();
		String newName = "";
		String ext = getFileExtension(fileName);
		File file = null;
		do {
			newName = ""+random.nextInt(99999999);
			newName = "".equals(ext) ? newName : newName +"."+ext;
			file = new File(FilenameUtils.getFullPath(path)+FilenameUtils.getName(path)+"/"+FilenameUtils.getFullPath(newName)+FilenameUtils.getName(newName));
		} while(file.exists());
		return newName;
	}
}
