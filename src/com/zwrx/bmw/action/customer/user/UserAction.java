package com.zwrx.bmw.action.customer.user;

import java.util.List;

import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.models.BmwUser;

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
		//返回主页面并登录
		return SUCCESS;
	}
	/**
	 * 登录逻辑
	 * @return
	 */
	public String login(){
		//baseService.save(this.entity);
		System.out.println("登录信息："+entity); 
		String username=entity.getUsername();
		String hql="from BmwUser where username=?";		
		try{
			List<BmwUser> userLst=(List<BmwUser>)baseService.find(hql, username);
			if(userLst.size()>0){
				System.out.println("登陆者："+userLst.get(0));
				this.getSession().setAttribute("user", userLst.get(0));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//验证登录者信息，如果非法返回提示，如果通过则返回登录前页面或主界面
		return SUCCESS;
	}
	/**
	 * 编辑个人信息
	 * @return
	 */
	public String editMyInfo(){
		return SUCCESS;
	}
	/**
	 * 找回密码
	 * @return
	 */
	public String findPwd(){
		return SUCCESS;
	}
}
