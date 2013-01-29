/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "ZipHelper.java is the copyrighted,
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

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

/**
 * *ZipHelper.java
 */
public class ZipHelper {

	/**
	 * 压缩
	 * 
	 * @param srcDir
	 *            来源文件夹
	 * @param zipFilePath
	 *            生成的zip包文件夹
	 */

	public void compress(String srcDir, String zipFilePath, String includeFolder, String excludeFolder) {
		File srcdir = new File(srcDir);
		if (!srcdir.exists())
			throw new RuntimeException(srcDir + "不存在！");
		File zipFile = new File(zipFilePath);
		Project prj = new Project();
		Zip zip = new Zip();
		zip.setProject(prj);
		zip.setDestFile(zipFile);
		FileSet fileSet = new FileSet();
		fileSet.setProject(prj);
		fileSet.setDir(srcdir);
		if (includeFolder != null)
			fileSet.setIncludes(includeFolder); // 包括哪些文件或文件夹
		if (excludeFolder != null)
			fileSet.setExcludes(excludeFolder); // 不包括哪些文件或文件夹
		// eg:zip.setIncludes("*.java");
		// fileSet.setExcludes("");
		// 排除哪些文件或文件夹
		zip.addFileset(fileSet);
		zip.execute();
	}

	/**
	 * 解压缩
	 * 
	 * @param destDir
	 *            生成的目标目录下 c:/a
	 * @param sourceZip
	 *            源zip文件 c:/upload.zip 结果则是 将upload.zip文件解压缩到c:/a目录下
	 */
	public String unZip(String destDir, String sourceZip) {
		try {
			Project prj1 = new Project();
			Expand expand = new Expand();
			expand.setProject(prj1);
			expand.setSrc(new File(sourceZip));
			expand.setOverwrite(false);// 是否覆盖
			File f = new File(destDir);
			expand.setDest(f);
			expand.execute();
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false_" + e.toString();
		}
	}

}
