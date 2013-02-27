package com.zwrx.bmw.action.admin.user;

import java.util.Calendar;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import net.sf.json.JSONObject;
import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.util.ExecuteResult;
import com.zwrx.bmw.util.StringUtil;
/**
 * 本AdminAction类主要负责对管理员的登陆、注销、修改账号、密码等操作
 * @author zhaozhiyang
 *
 */
public class SellerAction extends BaseAction<BmwUser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	/**
	 * 新增卖家用户
	 * @return
	 */
	public String add(){
		ExecuteResult eResult;
		try {
			List<?> allSellers=baseService.find("from BmwUser where username=?",this.entity.getUsername());
			if(allSellers.size()>0){
				eResult = new ExecuteResult(false, CommonConst.USERNAME_EXISTED_EROOR);
			}
			this.entity.setAddTime(Calendar.getInstance().getTime());
			this.entity.setState(CommonConst.STATE_NORMAL);
			baseService.save(entity);
			eResult = new ExecuteResult(true,CommonConst.SUCCESS_ADD,this.entity);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 根据卖家用户名、姓名、用户类型和手机号码进行检索
	 * @return
	 */
	public String list(){
		ExecuteResult eResult;
		try {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BmwUser.class);
			detachedCriteria.add(Restrictions.eq("state", CommonConst.STATE_NORMAL));
			if (StringUtil.isNotBlank(this.entity.getUsername())) {
				detachedCriteria.add(Restrictions.like("username", this.entity.getUsername()));
			}
			if (StringUtil.isNotBlank(this.entity.getName())) {
				detachedCriteria.add(Restrictions.like("name", this.entity.getName()));
			}
			if (StringUtil.isNotBlank(this.entity.getCellphone())) {
				detachedCriteria.add(Restrictions.eq("cellphone", this.entity.getCellphone()));
			}
			if (StringUtil.isNotBlank(this.entity.getType())) {
				detachedCriteria.add(Restrictions.eq("type", this.entity.getType()));
			}else{
				detachedCriteria.add(Restrictions.ne("type", CommonConst.USER_TYPE_BUYER));
			}
			
			detachedCriteria.addOrder(Order.desc("addTime"));
			pageList = baseService.findPageByCriteria(detachedCriteria, pageSize,startIndex);
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC, pageList);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 编辑卖家用户
	 * @return
	 */
	public String edit(){
		ExecuteResult eResult;
		try {
			BmwUser curUser=(BmwUser) baseService.findById(BmwUser.class,this.entity.getUserId());
			curUser.setLastTime(Calendar.getInstance().getTime());
			curUser.setLastIp(this.getRequest().getLocalAddr());
			if(StringUtil.isNotBlank(this.entity.getName())){
				curUser.setName(this.entity.getName());
			}
			if(StringUtil.isNotBlank(this.entity.getQq())){
				curUser.setQq(this.entity.getQq());
			}
			if(StringUtil.isNotBlank(this.entity.getEmail())){
				curUser.setEmail(this.entity.getEmail());
			}
			if(StringUtil.isNotBlank(this.entity.getType())){
				curUser.setType(this.entity.getType());
			}
			if(StringUtil.isNotBlank(this.entity.getPhone())){
				curUser.setPhone(this.entity.getPhone());
			}
			if(StringUtil.isNotBlank(this.entity.getCellphone())){
				curUser.setCellphone(this.entity.getCellphone());
			}
			baseService.update(curUser);
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_ADD,this.entity);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 根据用户的ID查找对应的卖家用户
	 * @return
	 */
	public String findSellerById(){
		ExecuteResult eResult;
		try {
			BmwUser curUser=(BmwUser)baseService.findById(BmwUser.class,this.entity.getUserId());
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC,curUser);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
}
