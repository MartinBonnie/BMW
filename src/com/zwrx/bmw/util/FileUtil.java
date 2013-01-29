package com.zwrx.bmw.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class FileUtil {

	/**
	 * 不存在则创建，存在则覆盖
	 * 
	 * @param path
	 * @param fileName
	 * @param content
	 * @throws IOException
	 */
	public static void write(String path, String fileName, String content)
			throws IOException {
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		File file = new File(path + "/" + fileName);
		if (!file.exists())
			file.createNewFile();

		BufferedWriter output = new BufferedWriter(new FileWriter(file));
		output.write(content);
		output.close();
	}

	/**
	 * read to string
	 * 
	 * @param file
	 * @return
	 */
	public static String readToString(File file) {
		try {
			FileInputStream fr = new FileInputStream(file);
			InputStreamReader is = new InputStreamReader(fr, "UTF-8");
			StringBuilder sb = new StringBuilder();
			BufferedReader br = new BufferedReader(is);
			while (br.ready()) {
				String line = br.readLine();
				sb.append(line);
				sb.append("\n");
			}
			br.close();
			fr.close();
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
			// TODO: handle exception
		}
	}

	public static boolean copy(File src, File dst) {
		FileInputStream fin = null;
		FileOutputStream fout = null;
		FileChannel fcin = null;
		FileChannel fcout = null;
		try {
			fin = new FileInputStream(src);
			fout = new FileOutputStream(dst);
			fcin = fin.getChannel();
			fcout = fout.getChannel();
			ByteBuffer buffer = ByteBuffer.allocate(1024);
			while (true) {
				buffer.clear();
				int r = fcin.read(buffer);
				if (r == -1) {
					break;
				}
				buffer.flip();
				fcout.write(buffer);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fcin != null) {
					fcin.close();
				}
				if (fcin != null) {
					fcin.close();
				}
				if (fin != null) {
					fin.close();
				}
				if (fout != null) {
					fout.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * 不存在则创建，存在则覆盖
	 * 
	 * @param path
	 * @param fileName
	 * @param content
	 * @throws IOException
	 */
	public static void writeFileWithUTF8(String path, String fileName, String content)
			throws IOException {
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();
		String filePath = path + "/" + fileName;
		File file = new File(filePath);
		if (!file.exists())
			file.createNewFile();
		// 写入 utf-8 文件,使用 FileOutputStream 类
		FileOutputStream fos = new FileOutputStream(filePath);
		OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
		osw.write(content);
		osw.flush();
		osw.close();
	}
}
