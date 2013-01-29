package com.zwrx.bmw.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import net.sf.json.JSONObject;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.ConfConst;
import com.zwrx.bmw.models.BmwAdmin;
import com.zwrx.bmw.models.BmwAttachment;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.util.IDUtil;
import com.zwrx.bmw.util.ImageMagickHelper;
import com.zwrx.bmw.util.StringUtil;

/**
 * 处理文件上传的Action类
 * 
 * @author
 * @version1.0
 */
@SuppressWarnings("serial")
public class FileUploadAction<T> extends BaseAction<T> {
	/**
	 * 缓存大小
	 */
	private static final int BUFFER_SIZE = 16 * 1024;

	/**
	 * 模块名
	 */
	protected String module = CommonConst.FOLDER_PICTURE;// 缺省值

	protected int maximumSize = 1024 * 1024;// 缺省值

	protected int minimumSize;

	/**
	 * 上传文件，将文件上传到FILE_UPLOAD_DIR下生成的不会重复的文件中
	 * 
	 * @return
	 */
	public String doUpload() {
		String name = getName();
		if (uploadList == null || !checkUploadFile() || name == null) {
			return SUCCESS;
		}
		String dstDir = generateDir(name);
		String newFilename;
		for (int i = 0; i < uploadList.size(); i++) {
			if (uploadList.get(i) == null)
				continue;
			newFilename = getUUIDFilename(this.getUploadFileName().get(i));
			String dstPath = dstDir + CommonConst.SEP + newFilename;
			File dstFile = new File(dstPath);
			copy(uploadList.get(i), dstFile);
			uploadFilePath = savingFolder + "/" + newFilename;
		}

		return SUCCESS;
	}

	/**
	 * 图片保存列表
	 */
	protected List<BmwAttachment> tempAttachments;

	/**
	 * FileUploadAction 上传图片操作
	 */
	@SuppressWarnings("unchecked")
	public String uploadImage() {
		tempAttachments = (List<BmwAttachment>) this.getRequest().getAttribute(
				CommonConst.SESSIONATTACHMENTS);
		if (tempAttachments == null) {
			tempAttachments = new ArrayList();
			getRequest().setAttribute(CommonConst.SESSIONATTACHMENTS,
					tempAttachments);
		}
		String name = getName();
		if (uploadList == null || !checkUploadFile() || name == null) {
			if (uploadList == null) {
				this.result = "请选择要上传的文件！";
			}
			if (name == null) {
				this.result = "请先登陆！";
			}
			if (errorFileMsgList != null) {
				for (String s : errorFileMsgList) {
					this.result += s;
				}
			}
			return SUCCESS;
		}

		String dstDir = generateDir(name);
		try{
			for (int i = 0; i < uploadList.size(); i++) {
				File file = uploadList.get(i);
				if(file == null){
					continue;
				}
				uploadSingleImage(file, getUploadFileName().get(i), dstDir);
			}
		} catch (Exception e){
			log.info("图片压缩失败！" + e.getMessage());
			this.result+= "图片上传失败！" ;
		}
		return SUCCESS;
	}
	
	public void uploadSingleImage(File file, String filename, String dstDir) throws Exception {
		BmwAttachment attachment = new BmwAttachment();
		String newFilename = getUUIDFilename(filename);
		attachment.setState(CommonConst.STATE_INIT);
		attachment.setUploadTime(new Date());
		attachment.setBmwUserId(getCurrentUser().getUserId());
		attachment.setFilename(filename);
		String dstPath = dstDir + CommonConst.SEP + newFilename;
		File dstFile = new File(dstPath);
		copy(file, dstFile);
		attachment.setFileSize(new BigDecimal(dstFile.length()));
		ImageMagickHelper.createAllThumbnail(dstPath);
		uploadFilePath = savingFolder + "/" + newFilename;
		attachment.setServerPath(uploadFilePath);
		prepareAttach(attachment);
		baseService.save(attachment);
		tempAttachments.add(attachment);
	}
	
	@SuppressWarnings("unchecked")
	public List<BmwAttachment> getAttachmentList(){
		tempAttachments = (List<BmwAttachment>) this.getRequest().getAttribute(CommonConst.SESSIONATTACHMENTS);
		if (tempAttachments == null) {
			tempAttachments = new ArrayList();
			getRequest().setAttribute(CommonConst.SESSIONATTACHMENTS, tempAttachments);
		}
		return tempAttachments;
	}
	
	public void uploadImageNoCheck(List<File> fileList) {
		tempAttachments = getAttachmentList();
		String name = getName();
		String dstDir = generateDir(name);
		for (int i = 0; i < fileList.size(); i++) {
			if (fileList.get(i) == null)
				continue;
			BmwAttachment attachment = new BmwAttachment();
			String newFilename = getUUIDFilename(fileList.get(i).getName());
			attachment.setState(CommonConst.STATE_INIT);
			attachment.setUploadTime(new Date());
			attachment.setBmwUserId(getCurrentUser().getUserId());
			attachment.setFilename(fileList.get(i).getName());
			String dstPath = dstDir + CommonConst.SEP + newFilename;
			File dstFile = new File(dstPath);
			attachment.setFileSize(new BigDecimal(dstFile.length()));
			copy(fileList.get(i), dstFile);
			try {
				ImageMagickHelper.createAllThumbnail(dstPath);
			} catch (Exception e) {
				log.info("图片压缩失败！" + e.toString());
				this.result+= "图片压缩失败！" + e.toString();
			}
			uploadFilePath = savingFolder + "/" + newFilename;
			attachment.setServerPath(uploadFilePath);
			prepareAttach(attachment);
			baseService.save(attachment);
			tempAttachments.add(attachment);
		}
	}

	// TODO
	public String uploadByJson() throws IOException {
		String name = getName();
		if (name == null) {
			uploadByJsonCallBackMsg("请登陆后再上传!", "");
		} else {
			String dstDir = generateDir(name);
			for (int i = 0; i < filedata.size(); i++) {
				String newFilename = getUUIDFilename(filedataFileName.get(i));
				String dstPath = dstDir + CommonConst.SEP + newFilename;
				File dstFile = new File(dstPath);
				copy(filedata.get(i), dstFile);
				try {
					ImageMagickHelper.createAllThumbnail(dstPath);
				} catch (Exception e) {
					log.info(e);
					this.result = "图片压缩失败！" + e.toString();
				}

				InetAddress localhost = InetAddress.getLocalHost();
				String ip = localhost.getHostAddress();
				// 修改attachment表里
				BmwAttachment att = new BmwAttachment();
				att.setBmwUserId(getCurrentUser().getUserId());
				att.setBelongType("相册类型");//注意修改
//				att.setBelongId(returnAlbumId());
				att.setType(CommonConst.PICTURE);
				att.setServerPath(savingFolder + "/" + newFilename);
				att.setUploadTime(new Date());
				att.setFilename(filedataFileName.get(i));
				att.setServerIp(ip);
				att.setFiledesc("xheditor");
				att.setFileSize(new BigDecimal(dstFile.length()));
				
				att.setState(CommonConst.STATE_INIT);
				baseService.saveOrUpdate(att);

				try {
					uploadByJsonCallBackMsg("", ConfConst.FILE_SVR
							+ att.getServerPath());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		return NONE;
	}

	public boolean checkUpLoadSize() {
		if (CommonConst.ISCONTROL) {
			if (getSession().getAttribute("addState").equals(
					CommonConst.STATE_INIT)) {
				DetachedCriteria dc = DetachedCriteria
						.forClass(BmwAttachment.class);
				dc.add(
						Restrictions.eq("userId", this.getCurrentUser()
								.getUserId())).add(
						Restrictions.eq("belongType", "附件类型")).add(//需要修改奥
						Restrictions.eq("type", CommonConst.PICTURE))
						.setProjection(Projections.count("attId"));
				if (baseService.getCountByCriteria(dc) >= CommonConst.PICCOUNT) {
					addFieldError("addState", "免费用户现在只能上传"
							+ CommonConst.PICCOUNT
							+ "张!<a href=\"/user/upgrade/show\">升级后不受限制</a>");
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 保存attachment前设置附件属性，供子类重写使用
	 * 
	 * @param attach
	 */
	protected void prepareAttach(BmwAttachment attach) {
	}

	/**
	 * 获取新的文件名
	 * 
	 * @param filename
	 * @return uuid.xxx
	 */
	public String getUUIDFilename(String filename) {
		return IDUtil.getUUID() + "." + getLastFileName(filename);
	}

	/**
	 * 产生一个不会重复的文件夹名称, 并将结果保存在savingFolder
	 * 
	 * @param name
	 */
	public String generateFolder(String name) {
		StringBuffer uri = new StringBuffer(ConfConst.FOLDER_UPLOAD)
				.append('/');

		char c0 = name.charAt(0);
		uri.append(c0).append('/').append(c0);
		char c = name.charAt(1);
		if (c >= '0' && c < '9')
			uri.append("");
		else if ((c >= 'a' && c < 'f')||(c >= 'A' && c < 'F'))
			uri.append(1);
		else if ((c >= 'f' && c < 'k')||(c >= 'F' && c < 'K'))
			uri.append(2);
		else if ((c >= 'k' && c < 'p')||(c >= 'K' && c < 'P'))
			uri.append(3);
		else if ((c >= 'p' && c < 'u')||(c >= 'P' && c < 'U'))
			uri.append(4);
		else if ((c >= 'u' && c < 'z')||(c >= 'U' && c < 'Z'))
			uri.append(5);
		else//包含下划线的
			uri.append(6);

		uri.append('/').append(name).append('/').append(module);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(new Date());
		for (String d : date.split("-"))
			uri.append('/').append(d);
		savingFolder = uri.toString();
		return savingFolder.replaceAll("/", CommonConst.SEP + CommonConst.SEP);
	}

	public static String getUserfolder(String name) {
		StringBuffer uri = new StringBuffer("");
		char c0 = name.charAt(0);
		uri.append(c0).append(CommonConst.SEP).append(c0);
		char c = name.charAt(1);
		if (c >= 'a' && c < 'f')
			uri.append(1);
		else if (c >= 'f' && c < 'k')
			uri.append(2);
		else if (c >= 'k' && c < 'p')
			uri.append(3);
		else if (c >= 'p' && c < 'u')
			uri.append(4);
		else if (c >= 'u' && c < 'z')
			uri.append(5);
		else
			uri.append(6);
		return uri.toString();
	}

	public static String getUserPersonalfolder(String name) {
		StringBuffer uri = new StringBuffer("");
		char c0 = name.charAt(0);
		uri.append(c0).append("/").append(c0);
		char c = name.charAt(1);
		if (c >= 'a' && c < 'f')
			uri.append(1);
		else if (c >= 'f' && c < 'k')
			uri.append(2);
		else if (c >= 'k' && c < 'p')
			uri.append(3);
		else if (c >= 'p' && c < 'u')
			uri.append(4);
		else if (c >= 'u' && c < 'z')
			uri.append(5);
		else
			uri.append(6);
		uri.append("/");
		uri.append(name);
		return uri.toString();
	}

	public static String getUserfolderWithDate(String name) {
		StringBuffer uri = new StringBuffer(getUserfolder(name));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(new Date());
		for (String d : date.split("-"))
			uri.append('/').append(d);
		return uri.toString();
	}

	protected void uploadByJsonCallBackMsg(String err, String msg)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("err", err);
		map.put("msg", msg == "" ? "" : ("!" + msg));
		result = JSONObject.fromObject(map).toString();
		output(result);
	}

//	@SuppressWarnings("unchecked")
//	protected String returnAlbumId() {
//		if (getCurrentAdmin() != null)
//			return "";
//		NgbAlbum aa = new NgbAlbum();
//		aa.setName("默认相册");
//		aa.setBelongType(AlbumType.AP);
//		aa.setBelongId(this.getCurrentUser().getNgbEnterprise().getEntId());
//		aa.setState(CommonConst.STATENORMAL);
//		aa.setNgbUser(getCurrentUser());
//		List<NgbAlbum> list = baseService.findByExample(aa);
//		if (list.size() != 0)
//			return list.get(0).getAlbumId();
//		else
//			return "没有默认相册";
//
//	}

	/*--------------------------- private method ----------------------------*/
	/**
	 * 获取最后一个"."后面的文件名，如果找不到"."则返回""
	 */
	public String getLastFileName(String path) {
		if (StringUtil.isBlank(path)) {
			return "";
		}
		int begin = path.lastIndexOf(".");
		if (begin == -1) {
			return "";
		}
		return path.substring(begin + 1, path.length());
	}

	/**
	 * FILE_UPLOAD_DIR + 根据用户名生成的不重复的文件夹
	 * 
	 * @param name
	 * @return
	 */
	public String generateDir(String name) {
		String dstDir = ConfConst.FILE_UPLOAD_DIR + generateFolder(name);
		File dirFile = new File(dstDir);
		if (!dirFile.exists())
			dirFile.mkdirs();
		return dstDir;
	}

	/**
	 * 复制文件
	 * 
	 * @param src
	 * @param dst
	 */
	private void copy(File src, File dst) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),
					BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 检查上传文件是否合法
	 * 
	 * @return
	 */
	private boolean checkUploadFile() {
		return checkUploadFile(extensionSet);
	}

	/**
	 * 检查上传文件是否合法
	 * 
	 * @param extensionSet
	 *            合法文件后缀名集合
	 * @return
	 */
	private boolean checkUploadFile(Set<?> extensionSet) {
		errorFileMsgList = new ArrayList<String>(uploadList.size());
		for (int i = 0; i < uploadList.size(); i++) {
			if (uploadList.get(i) == null) {
				errorFileMsgList.add("");
				continue;
			}
			String post = getLastFileName(uploadFilePathList.get(i));
			if (extensionSet != null
					&& !extensionSet.contains(post.toLowerCase())) {
				errorFileMsgList.add("上传文件格式不对");
				return false;
			}
			if (uploadList.get(i).length() <= minimumSize) {
				errorFileMsgList.add("上传文件应大于" + minimumSize + "字节");
				return false;
			}
			if (uploadList.get(i).length() > maximumSize) {
				errorFileMsgList.add("上传文件不得超出" + maximumSize + "字节");
				return false;
			}
			errorFileMsgList.add("");
		}
		return true;
	}

	/**
	 * 获取用户名
	 * 
	 * @return
	 */
	public String getName() {
		BmwUser user = (BmwUser) this.getSession().getAttribute(
				CommonConst.SESSION_USER);
		String name = null;
		if (user != null) {
			name = user.getUsername().toLowerCase();
		} else if (getCurrentAdmin() != null) {
			BmwAdmin admin = (BmwAdmin) getCurrentAdmin();
			name = "admin_" + admin.getUsername().toLowerCase();
		} else if (uploadType != null) {
			name = uploadType;
		} else {
			errorFileMsgList.add("请先登陆再上传文件");
		}
		return name;
	}

	/*------------------------ seter/geter method ----------------------------*/
	public List<String> getNewFileNameList() {
		return newFileNameList;
	}

	public void setNewFileNameList(List<String> newFileNameList) {
		this.newFileNameList = newFileNameList;
	}

	public List<String> getFiledataFileName() {
		return filedataFileName;
	}

	public void setFiledataFileName(List<String> filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	public List<File> getFiledata() {
		return filedata;
	}

	public void setFiledata(List<File> filedata) {
		this.filedata = filedata;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<File> getUpload() {
		return uploadList;
	}

	public void setUpload(List<File> upload) {
		this.uploadList = upload;
	}

	public List<File> getFile() {
		return uploadList;
	}

	public void setFile(List<File> upload) {
		this.uploadList = upload;
	}

	public List<String> getFileFileName() {
		return uploadFilePathList;
	}

	public void setFileFileName(List<String> uploadFileName) {
		this.uploadFilePathList = uploadFileName;
	}

	public List<String> getUploadFileName() {
		return uploadFilePathList;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFilePathList = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public List<String> getFeedback() {
		return errorFileMsgList;
	}

	public void setFeedback(List<String> feedback) {
		this.errorFileMsgList = feedback;
	}

	public int getMaximumSize() {
		return maximumSize;
	}

	public void setMaximumSize(int maximumSize) {
		this.maximumSize = maximumSize;
	}

	public int getminimumSize() {
		return minimumSize;
	}

	public void setminimumSize(int minimumSize) {
		this.minimumSize = minimumSize;
	}

	public Set<String> getExtensionSet() {
		return extensionSet;
	}

	public void setAllowedExtension(String allowedExtension) {
		extensionSet = new HashSet<String>();
		for (String s : allowedExtension.replaceAll("\\s", "").split(","))
			extensionSet.add(s.toLowerCase());
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	@Autowired
	protected List<File> filedata;

	protected List<String> filedataFileName;

	protected List<String> uploadContentType;

	protected String uploadType;

	protected String title;

	/**
	 * 上传文件列表
	 */
	protected List<File> uploadList;

	/**
	 * 上传文件路径列表
	 */
	protected List<String> uploadFilePathList;

	protected List<String> newFileNameList;

	// /**
	// * 上传文件类型列表
	// */
	// protected List<String> upContTypeList;

	/**
	 * 文件上传的路径
	 */
	protected String uploadFilePath;

	/**
	 * 允许的文件扩展名集合
	 */
	protected Set<String> extensionSet;

	/**
	 * 文件格式不对或大小不对的回馈信息 列表
	 */
	protected List<String> errorFileMsgList;

	/**
	 * 保存附件的文件夹
	 */
	protected String savingFolder;

	private String newFilenames = "";
}
