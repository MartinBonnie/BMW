/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "FtpHelper.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2010-1-29           yixiugg                      initial
 **/

package com.zwrx.bmw.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import net.sf.jftp.config.Settings;
import net.sf.jftp.net.BasicConnection;
import net.sf.jftp.net.ConnectionHandler;
import net.sf.jftp.net.ConnectionListener;
import net.sf.jftp.net.FtpConnection;

/**
 * *FtpHelper.java
 */
public class FtpHelper implements ConnectionListener {
	private String host;
	private int port;
	private String username;
	private String password;
	private String destPath;
	private String destFile;
	private String srcFile;
	private String srcPath;
	private int bufferSize = 16384;
	private ConnectionHandler handler = new ConnectionHandler();

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDestPath() {
		return destPath;
	}

	public void setDestPath(String destPath) {
		this.destPath = destPath;
	}

	public String getDestFile() {
		return destFile;
	}

	public void setDestFile(String destFile) {
		this.destFile = destFile;
	}

	public String getSrcFile() {
		return srcFile;
	}

	public void setSrcFile(String srcFile) {
		this.srcFile = srcFile;
	}

	public String getSrcPath() {
		return srcPath;
	}

	public void setSrcPath(String srcPath) {
		this.srcPath = srcPath;
	}

	/**
	 * 上传
	 */
	public void upload() {
		FtpConnection con = new FtpConnection(host, port, destPath);
		con.addConnectionListener(this);
		con.setConnectionHandler(handler);
		con.login(username, password);
		con.chdir("/");
		String[] dirs = destPath.split("/");
		for (String dir : dirs) {
			con.mkdir(dir);
			con.chdir(dir);
		}
		con.upload(srcFile);
		con.disconnect();
	}

	/**
	 * 下载
	 * 
	 * @throws IOException
	 */
	public void download() throws IOException {
		Settings.bufferSize = bufferSize;
		FtpConnection con = new FtpConnection(host, port, srcPath);
		// set updatelistener, interface methods are below
		con.addConnectionListener(this);
		// set handler
		con.setConnectionHandler(handler);
		// connect and login. this is from where connectionFailed() may be
		// called for example
		con.login(username, password);
		InputStream is = con.getDownloadInputStream(srcFile);
		File f = new File(destFile);
		FileOutputStream fs = new FileOutputStream(f);
		int bit = 0;
		while ((bit = is.read()) != -1) {
			fs.write(bit);
		}
		is.close();
		fs.close();
		con.disconnect();
	}

	@Override
	public void actionFinished(BasicConnection arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void connectionFailed(BasicConnection arg0, String arg1) {
		// TODO Auto-generated method stub

	}

	@Override
	public void connectionInitialized(BasicConnection arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateProgress(String arg0, String arg1, long arg2) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateRemoteDirectory(BasicConnection arg0) {
		// TODO Auto-generated method stub

	}

}
