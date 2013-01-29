package com.zwrx.bmw.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.util.StringUtil;



/**
 * *ValidateImgAction.java
 */
@SuppressWarnings({ "unchecked", "serial" })
public class ValidateImgAction extends BaseAction<Object> {


	/**
	 * 生成验证图片
	 * 
	 * @return
	 */
	private ByteArrayInputStream inputStream;

	/**
	 * 创建图像
	 */
	public String execute() throws Exception {
		//得到验证码
		String randomString = StringUtil.getRandomChar() + StringUtil.getRandomChar()
				+ StringUtil.getRandomChar() + StringUtil.getRandomChar();
		//将验证码放到session
		this.getSession().setAttribute(CommonConst.VERICODE, randomString);
		int width = 60, height = 20;
		BufferedImage image = new BufferedImage(width, height,
		BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(StringUtil.getRandColor(200, 250));
		g.fillRect(2, 2, width - 2, height - 2);
		g.fillRect(0, 0, width - 2, height - 2);
		Font font = new Font("Times New Roman", Font.PLAIN, 18);
		g.setFont(font);
//      随机产生155条干扰线，使图象中的认证码不易被其它程序探测到   
        g.setColor(StringUtil.getRandColor(160,200));   
        Random random = new Random();   
        for (int i=0;i<155;i++)   
        {   
         int x = random.nextInt(width);   
         int y = random.nextInt(height);   
                int xl = random.nextInt(12);   
                int yl = random.nextInt(12);   
         g.drawLine(x,y,x+xl,y+yl);   
        } 
        g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));   
		g.drawString(randomString.toUpperCase(), 3, 17);
		g.dispose();
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);
		ImageIO.write(image, "JPEG", imageOut);
		imageOut.close();
		ByteArrayInputStream input = new ByteArrayInputStream(output
				.toByteArray());
		this.setInputStream(input);
		return SUCCESS;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

}
