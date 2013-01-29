/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "fgh.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2009-12-5           Wangjin                      initial
 */

package com.zwrx.bmw.util;

import java.awt.Dimension;
import java.awt.Image;
import java.awt.Rectangle;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.ConfConst;

import magick.CompositeOperator;
import magick.DrawInfo;
import magick.ImageInfo;
import magick.MagickException;
import magick.MagickImage;
import magick.PixelPacket;

/**
 * *ImageMagickHelper.java
 */
public class ImageMagickHelper {
	private Log log = LogFactory.getLog(this.getClass());
	static {
		System.setProperty("jmagick.systemclassloader", "no");
	}

	/**
	 * 压缩图片
	 * 
	 * @param filePath
	 *            源文件路径
	 * @param toPath
	 *            缩略图路径 *
	 * @param size
	 *            设定生成图片大小，如果宽度超过size执行压缩
	 * 
	 */
	public static void createThumbnail(String filePath, String toPath, int size)
			throws MagickException {
		filePath = CommonConst.REALPATH + StringUtil.pathReplace(filePath);
		toPath = CommonConst.REALPATH + StringUtil.pathReplace(toPath);
		ImageInfo info = null;
		MagickImage image = null;
		Dimension imageDim = null;
		MagickImage scaled = null;
		try {
			info = new ImageInfo(filePath);
			image = new MagickImage(info);
			imageDim = image.getDimension();
			int wideth = imageDim.width;
			int height = imageDim.height;
			// if (wideth > height) {
			if (wideth > size) {
				height = size * height / wideth;
				wideth = size;
			}
			if(height>wideth){
				height=(wideth/height)*size;
				height=size;
			}
			scaled = image.scaleImage(wideth, height);// 小图片文件的大小.
			scaled.setFileName(toPath);
			scaled.writeImage(info);
		} finally {
			if (scaled != null) {
				scaled.destroyImages();
			}
		}
	}

	/**
	 * 调用命令行压缩图片
	 * 
	 * @param filePath
	 * @param toPath
	 * @param size
	 * @throws MagickException
	 * @throws Exception
	 */
	public static void createThumbnailByCMD(String filePath, String toPath,
			int size) throws MagickException, Exception {
		filePath = StringUtil.pathReplace(filePath);
		toPath = StringUtil.pathReplace(toPath);
		/*
		 * ImageInfo info = null; MagickImage image = null; Dimension imageDim =
		 * null; MagickImage scaled = null; info = new ImageInfo(filePath);
		 * image = new MagickImage(info); imageDim = image.getDimension(); int
		 * wideth = imageDim.width; int height = imageDim.height; // if (wideth
		 * > height) { if (wideth < size) { size = wideth; }
		 */
		File _file = new File(filePath); // 读入文件
		Image src = javax.imageio.ImageIO.read(_file); // 构造Image对象
		int wideth = src.getWidth(null); // 得到源图宽
		int height = src.getHeight(null); // 得到源图长
		if (wideth > size || height > size) {
			wideth = height = size;
		}
		// double length = ((double) size) * 1.5;
		
		String cmd = ConfConst.OS_PRFIX +" "+ConfConst.IMAGEMAGICK_CONVERT +" -resize " + wideth + "x"
				+ height + " " + ConfConst.IMAGEMAGICK_PARAM + " " + filePath
				+ " " + toPath;
		int lastFlag=filePath.lastIndexOf(".");
		String fileLastName=filePath.substring(lastFlag);
		
//		if(fileLastName.equals(".gif")){
//			cmd = ConfConst.OS_PRFIX +" "+ConfConst.IMAGEMAGICK_CONVERT +" -resize " + wideth + "x"
//			+ height + " " + ConfConst.IMAGEMAGICK_PARAM + " "+"-background white -flatten -alpha off"+" "+ filePath
//			+ " " + toPath;
//		}
		if(fileLastName.equals(".gif")){
			cmd = ConfConst.OS_PRFIX +" "+ConfConst.IMAGEMAGICK_CONVERT +" -resize " + wideth + "x"
			+ height + " " + ConfConst.IMAGEMAGICK_PARAM+" "+ filePath+"[0]"+ " "+"-background white -flatten -alpha off"+" "+ toPath;
		}
		String ls_1;
		System.out.println(cmd);
		Process p = Runtime.getRuntime().exec(cmd);
		BufferedReader bufferedReader = new BufferedReader(
				new InputStreamReader(p.getInputStream()));
		while ((ls_1 = bufferedReader.readLine()) != null)
			System.out.println(ls_1);
		System.out.println("p.waitFor()----------->" + p.waitFor());
	}

	/**
	 * 水印(图片logo)
	 * 
	 * @param filePath
	 *            源文件路径
	 * @param toImg
	 *            修改图路径
	 * @param logoPath
	 *            logo图路径
	 * @throws MagickException
	 */
	public static void initLogoImg(String filePath, String toImg,
			String logoPath) throws MagickException {
		filePath = CommonConst.REALPATH + StringUtil.pathReplace(filePath);
		toImg = CommonConst.REALPATH + StringUtil.pathReplace(toImg);
		logoPath = CommonConst.REALPATH + StringUtil.pathReplace(logoPath);
		ImageInfo info = new ImageInfo();
		MagickImage fImage = null;
		MagickImage sImage = null;
		MagickImage fLogo = null;
		MagickImage sLogo = null;
		Dimension imageDim = null;
		Dimension logoDim = null;
		try {
			fImage = new MagickImage(new ImageInfo(filePath));
			imageDim = fImage.getDimension();
			int width = imageDim.width;
			int height = imageDim.height;
			if (width > 660) {
				height = 660 * height / width;
				width = 660;
			}
			sImage = fImage.scaleImage(width, height);

			fLogo = new MagickImage(new ImageInfo(logoPath));
			logoDim = fLogo.getDimension();
			int lw = logoDim.width;
			int lh = logoDim.height;
			sLogo = fLogo.scaleImage(lw, lh);

			sImage.compositeImage(CompositeOperator.AtopCompositeOp, sLogo,
					(width - lw) / 2, height / 2);
			sImage.setFileName(toImg);
			sImage.writeImage(info);
		} finally {
			if (sImage != null) {
				sImage.destroyImages();
			}
		}
	}

	/**
	 * 水印文字
	 * 
	 * @param filePath
	 * @param text
	 * @param opacity
	 *            透明度 0 - 100, 0 为不透明
	 * @return
	 */
	public static void addTextToPicture(String picFrom, String picTo,
			String text, int opacity, boolean isEnt) {
		picFrom = CommonConst.REALPATH + StringUtil.pathReplace(picFrom);
		picTo = CommonConst.REALPATH + StringUtil.pathReplace(picTo);
		MagickImage fImage = null;
		Dimension imageDim = null;
		int poxY = 0;
		try {
			// Resize
			fImage = new MagickImage(new ImageInfo(picFrom));
			imageDim = fImage.getDimension();
			int width = imageDim.width;
			int height = imageDim.height;
			ImageInfo info = new ImageInfo(picFrom);
			MagickImage aImage = new MagickImage(info)
					.scaleImage(width, height);
			DrawInfo aInfo = new DrawInfo(info);
			aInfo.setFill(PixelPacket.queryColorDatabase("red"));
			// aInfo.setUnderColor(PixelPacket.queryColorDatabase("black"));
			aInfo.setOpacity(opacity);
			if (width > 400)
				aInfo.setPointsize(40);
			else
				aInfo.setPointsize(20);

			// 注意这里解决中文字体问题，有以下两行才可正常显示
			String fontPath = ConfConst.FONT_PATH;
			aInfo.setFont(fontPath);
			// aInfo.setPointsize(40);
			aInfo.setTextAntialias(true);
			// Step 3: Writing The Text
			aInfo.setText(text);
			int textSize = text.length();
			int poxX = (width - (textSize * (width > 400 ? 40 : 20))) / 2;
			if (isEnt) {
				poxY = height / 2;
			} else {
				poxY = height;
			}

			aInfo.setGeometry("+" + poxX + "+" + poxY + "");
			// Step 4: Annotating
			aImage.annotateImage(aInfo);
			// Step 5: Writing the new file
			aImage.setFileName(picTo);
			aImage.writeImage(info);
			aImage.destroyImages();
			aImage = null;
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	/**
	 * 切图
	 * 
	 * @param imgPath
	 *            源图路径
	 * @param toPath
	 *            修改图路径
	 * @param w
	 * @param h
	 * @param x
	 * @param y
	 * @throws MagickException
	 */
	public static void cutImg(String imgPath, String toPath, int w, int h,
			int x, int y) throws MagickException {
		ImageInfo infoS = null;
		MagickImage image = null;
		MagickImage cropped = null;
		Rectangle rect = null;
		try {
			infoS = new ImageInfo(imgPath);
			image = new MagickImage(infoS);
			rect = new Rectangle(x, y, w, h);
			cropped = image.cropImage(rect);
			cropped.setFileName(toPath);
			cropped.writeImage(infoS);

		} finally {
			if (cropped != null) {
				cropped.destroyImages();
			}
		}
	}

	/**
	 * 调用命令行统统生成缩略图
	 * 
	 * @param srcPath
	 * @throws Exception
	 * @throws MagickException
	 */
	public static void createAllThumbnailByCMD(String srcPath) throws Exception {
		System.out.println("调用命令行统统生成缩略图");
		String extension="jpg";
//		if(srcPath.substring(srcPath.lastIndexOf(".")+1,srcPath.length()).equalsIgnoreCase("gif"))
//			extension="gif";
		//to5主要用于相册显示图片
		for(Integer size:CommonConst.IMG_SIZES){
			String to = srcPath.substring(0, srcPath.lastIndexOf(".")) + "_"+size+"."+extension;
			createThumbnailByCMD(srcPath, to, size);
		}
	}

	/**
	 * 调用jmagick生成缩略图
	 * 
	 * @param srcPath
	 * @throws MagickException
	 * @throws Exception
	 */
	public static void createAllThumbnailByJmagick(String srcPath)
			throws Exception {
		System.out.println("用imagick生成");
		String extension="jpg";
//		if(srcPath.substring(srcPath.lastIndexOf(".")+1,srcPath.length()).equalsIgnoreCase("gif"))
//			extension="gif";
		for(Integer size:CommonConst.IMG_SIZES){
			String to = srcPath.substring(0, srcPath.lastIndexOf(".")) + "_"+size+"."+extension;
			createThumbnail(srcPath, to, size);
		}
	}

	/**
	 * 生成缩略图
	 * 
	 * @param srcPath
	 * @throws Exception
	 */
	public static void createAllThumbnail(String srcPath) throws Exception {
		if (ConfConst.USE_JMAGICK)
			createAllThumbnailByJmagick(srcPath);
		else
			createAllThumbnailByCMD(srcPath);
	}

	public static void createSpecificThumbnail(String filePath, String toPath,
			int size) throws Exception {
		if (ConfConst.USE_JMAGICK)
			createThumbnail(filePath, toPath, size);
		else
			createThumbnailByCMD(filePath, toPath, size);
	}
}
