<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.net355.models.NetUser"%>
<%@ page import="com.net355.util.GlobalParams"%>
<% 
    //仅做示例用，请自行修改
	String imgStr ="";
	NetUser currentUser= (NetUser)request.getSession().getAttribute(GlobalParams.SESSION_USER);
	
	//String realpath = getRealPath(request,path)+"/"+path;
	//String path="/"+GlobalParams.FILE_UOLOAD_DIR+getRelativeFolder(currentUser.getUserAcc());//20120122old
	String path=GlobalParams.FILE_UOLOAD_DIR+getRelativeFolder(currentUser.getUserAcc());//20120122old
	String realpath1=getRealPath(request);
	//System.out.println(realpath1);
	//System.out.println(GlobalParams.FILE_UOLOAD_DIR);
	//String realpath =getRealPath(request)+path;
	String realpath =path;
	//System.out.println(realpath);
	List<File> files = getFiles(realpath,new ArrayList());
	for(File file :files ){
		//System.out.println(file.getPath());
		//imgStr+=file.getPath().replace(realpath1,"")+"ue_separate_ue";
		imgStr+=file.getPath().replace(GlobalParams.FILE_UOLOAD_DIR.replace("/",File.separator),"")+"ue_separate_ue";
		//System.out.println(imgStr);
	}
	if(imgStr!=""){
		 //System.out.println(imgStr.substring(0,imgStr.lastIndexOf("ue_separate_ue")));
        imgStr = imgStr.substring(0,imgStr.lastIndexOf("ue_separate_ue")).replace(File.separator, "/").trim();
        //System.out.println(imgStr);
    }
	out.print(imgStr);
%>
<%!
public List getFiles(String realpath, List files) {
	
	File realFile = new File(realpath);
	if (realFile.isDirectory()) {
		File[] subfiles = realFile.listFiles();
		for(File file :subfiles ){
			if(file.isDirectory()){
				getFiles(file.getAbsolutePath(),files);
			}else{
				if(!getFileType(file.getName()).equals("")) {
					files.add(file);
				}
			}
		}
	}
	return files;
}

public String getRealPath(HttpServletRequest request){
//ServletContext application = request.getSession().getServletContext();
//	String str = application.getRealPath(request.getServletPath());
//return new File(str).getParent();
	String result=request.getSession().getServletContext().getRealPath("/");
	return result;
	
}

public String getFileType(String fileName){
	String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
	Iterator<String> type = Arrays.asList(fileType).iterator();
	while(type.hasNext()){
		String t = type.next();
		if(fileName.endsWith(t)){
			return t;
		}
	}
	return "";
}

public String getRelativeFolder(String name) {
	StringBuffer uri = new StringBuffer("/");
	char c0 = name.charAt(0);
	uri.append(c0).append("/").append(c0);
	char c = name.charAt(1);
	if (c >= '0' && c < '9')
		uri.append("");
	else if ((c >= 'a' && c < 'f') || (c >= 'A' && c < 'F'))
		uri.append(1);
	else if ((c >= 'f' && c < 'k') || (c >= 'F' && c < 'K'))
		uri.append(2);
	else if ((c >= 'k' && c < 'p') || (c >= 'K' && c < 'P'))
		uri.append(3);
	else if ((c >= 'p' && c < 'u') || (c >= 'P' && c < 'U'))
		uri.append(4);
	else if ((c >= 'u' && c < 'z') || (c >= 'U' && c < 'Z'))
		uri.append(5);
	else
		// 包含下划线的
		uri.append(6);
	uri.append("/").append(name);
	String	savingFolder = uri.toString();
	return savingFolder;
}
%>