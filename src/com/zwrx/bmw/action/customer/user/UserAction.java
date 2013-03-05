package com.zwrx.bmw.action.customer.user;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.models.MailBox;
import com.zwrx.bmw.models.MailInfo;
import com.zwrx.bmw.util.MailUtils;

public class UserAction extends BaseAction<BmwUser> {

	private static final long serialVersionUID = 1L;
	/**
	 * 注册逻辑	
	 * @return
	 */
	public String register(){				
		//System.out.println("注册者信息："+entity);
		//后台数据校验
		//保存用户信息
		baseService.save(this.entity);
		//发送激活邮件		
		MailBox box=new MailBox();
		MailInfo eml=new MailInfo(this.entity.getEmail(),this.entity.getName());
		MailUtils.sendMail(box,eml);
		//返回主页面并登录
		return this.SUCCESS;
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
		String hql="from BmwUser where username=?";		
		try{
			List<BmwUser> userLst=(List<BmwUser>)baseService.find(hql, username);
			if(userLst.size()>0){
				System.out.println("登陆者："+userLst.get(0));
				this.getSession().setAttribute(CommonConst.SESSION_USER, userLst.get(0));
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//验证登录者信息，如果非法返回提示，如果通过则返回登录前页面或主界面
		if(flag) return this.INDEX;
		else return this.LOGIN;
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
}
