package com.zwrx.bmw.action.admin.user;

import net.sf.json.JSONObject;
import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.models.BmwAdmin;
import com.zwrx.bmw.util.ExecuteResult;
/**
 * 本AdminAction类主要负责对管理员的登陆、注销、修改账号、密码等操作
 * @author zhaozhiyang
 *
 */
public class AdminAction extends BaseAction<BmwAdmin> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 处理admin的登陆
	 * @return
	 */
	public String login(){
		ExecuteResult eResult;
		try {
//			List<?> admins = baseService.find("from BmwAdmin where state=? and username=? and password = ?",
//					CommonConst.STATE_NORMAL, this.entity.getUsername(), MD5EncryptUtil.md5Encry(this.entity.getPassword()));
//			if (admins.size() > 0) {
//				BmwAdmin nowAdmin = (BmwAdmin) admins.get(0);
////				nowAdmin.setLastTime(Calendar.getInstance().getTime());
////				nowAdmin.setLastIp(this.getRequest().getLocalAddr());
////				baseService.update(nowAdmin);
//				this.getSession().setAttribute(CommonConst.SESSION_ADMIN, nowAdmin);
//				eResult = new ExecuteResult(true, "登录成功");
//			} else {
//				eResult = new ExecuteResult(false, "用户名密码输入有误！");
//			}
			eResult = new ExecuteResult(true, "登录成功");
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
}
