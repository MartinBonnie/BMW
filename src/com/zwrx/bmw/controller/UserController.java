/**
 * Copyright (c) 2011 Jadsoft CO.LTD
 * Floor 4, Building 4,Eastern HiTech Park, NO 30 Wantan RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "UserController.java is the copyrighted,
 * proprietary property of Ray which retain all right, 
 * title and interest therein."
 * 
 * Create by yixiugg at 2012-2-22 下午04:37:05.
 * yixiugg [email:yixiugg@126.com]
 * 
 * Revision History
 *
 * Date            Programmer                   Notes
 * ---------    ---------------------  -----------------------------------
 * 2012-2-22            yixiugg                       initial
 **/

/**
 * 
 */
package com.zwrx.bmw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zwrx.bmw.models.BmwUser;


/**
 * @author Administrator
 *
 */
@Controller
public class UserController extends BaseController {
	
	@RequestMapping("/admin/login")
	public @ResponseBody
	String login(@RequestParam("username") String username, @RequestParam("password") String password) {
		BmwUser  currentUser=new BmwUser();
		currentUser.setPassword(password+"333");
		currentUser.setUsername(username+"222");
		baseService.save(currentUser);
		return "1234";
	}
	
	
	
	
	
	
}
