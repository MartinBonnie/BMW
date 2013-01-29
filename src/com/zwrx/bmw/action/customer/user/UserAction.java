package com.zwrx.bmw.action.customer.user;

import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.models.BmwUser;

public class UserAction extends BaseAction<BmwUser> {

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public String login(){
			baseService.save(this.entity);
			return SUCCESS;
		}
	
}
