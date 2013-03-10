package com.zwrx.bmw.action.customer.user;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.models.MailBox;
import com.zwrx.bmw.models.MailInfo;
import com.zwrx.bmw.util.MailUtils;

public class UserAction extends BaseAction<BmwUser> {	
	private static final long serialVersionUID = 1L;
	public UserAction(){		
	}
	/**
	 * 注册逻辑	
	 * @return
	 */
	public String register(){		
		String realPath=ServletActionContext.getRequest().getServletContext().getRealPath(ServletActionContext
				.getRequest().getRequestURI());
		String proPath=ServletActionContext.getRequest().getContextPath();
		realPath=realPath.replace("\\", "/");
		proPath=proPath.replace("\\","/");
		String basePath=realPath.substring(0, realPath.indexOf(proPath));		
		
		//System.out.println("注册者信息："+entity);
		String username=entity.getUsername();
		String password=entity.getPassword();
		String name=entity.getName();
		//后台数据校验
		if(validateUser(entity)){
			//保存用户信息
			baseService.save(entity);
			//发送激活邮件				
			MailInfo eml=new MailInfo(this.entity.getEmail(),this.entity.getName());
			//设置附件基础路径
			MailUtils.basePath=basePath;
			MailUtils.imgPath=CommonConst.UPLOAD_FILE_DIR;
			MailUtils.sendMail(eml);
			log.info(username+"("+name+"),注册成功！");
			//返回注册成功页面
			return SUCCESS;
		}else{
			//返回注册页面<原请求页面>
			return REG;
		}		
	}
	/**
	 * 登录逻辑
	 * @return
	 */
	public String login(){
		boolean flag=false;
		//baseService.save(this.entity);
		System.out.println("登录信息："+entity);
		String username=entity.getUsername();
		String password=entity.getPassword();
		String hql="from BmwUser where username=? and password=?";	
		//验证登录者信息，如果非法返回登陆页面并提示，如果通过则返回登录前页面或主界面
		if(validateUser(entity)){
			try{
				List<BmwUser> userLst=(List<BmwUser>)baseService.find(hql, new String[]{username,password});
				if(userLst.size()>0){
					System.out.println("登陆者："+userLst.get(0));
					getSession().setAttribute(CommonConst.SESSION_USER, userLst.get(0));
					flag=true;
					log.info("["+username+"]成功登陆系统！");
				}else{
					this.result=CommonConst.LOGIN_ERROR;
					log.info("["+username+"]登陆系统失败！");
				}
			}catch(Exception e){
				this.result=this.ERR_Desc;
				log.info(this.ERR_Desc+":["+e.getMessage()+"]");
				//e.printStackTrace();	
				return LOGIN;							
			}
			return INDEX;
		}else{
			return LOGIN;
		}	
		
	}
	/**
	 * 编辑个人信息
	 * @return
	 */
	public String edit(){
		BmwUser bmwUser=(BmwUser)this.getSession().getAttribute(CommonConst.SESSION_USER);
		JSONObject json=JSONObject.fromObject(bmwUser);
		return this.JSON;
	}
	public String doEdit(){
		System.out.println("修改后的用户信息："+entity);
		baseService.saveOrUpdate(entity);
		return this.EDIT;
	}
	/**
	 * 找回密码
	 * @return
	 */
	public String findPwd(){
		return SUCCESS;
	}
	public String logout(){
		HttpSession session=this.getSession();		
		BmwUser user=(BmwUser)session.getAttribute(CommonConst.SESSION_USER);
		session.invalidate();
		if(user!=null){
			System.out.println("用户："+user.getUsername()+"登出系统！");
		}
		return this.INDEX;
	}
	/**
	 * 对于登陆/注册的用户信息合法性验证（true表示验证通过）
	 * @param user
	 * @return
	 */
	public boolean validateUser(BmwUser user){
		boolean flag=true;
		if(user!=null){
			String username=user.getUsername();
			String password=user.getPassword();
			String vericode=user.getVericode();
			HttpSession session=this.getSession();	
			String veri=(String)session.getAttribute(CommonConst.VERICODE);
			if(username==null||"".equals(username.trim())||password==null||"".equals(password.trim())){
				this.result=CommonConst.USERNAME_PASSWORD_NULL_ERROR;
				flag=false;
			}else if(vericode!=null&&veri!=null){							
				System.out.println(vericode+","+veri);
				if(!vericode.toLowerCase().equals(veri.toLowerCase())){
					this.result=CommonConst.VERIFY_CODE_ERROR;
					flag=false;
				}
			}
		}else{
			flag=false;
		}
		return flag;
	}
}
