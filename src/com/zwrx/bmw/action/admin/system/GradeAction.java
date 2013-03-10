package com.zwrx.bmw.action.admin.system;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import net.sf.json.JSONObject;

import com.zwrx.bmw.action.BaseAction;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BmwSyscode;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.util.ExecuteResult;
import com.zwrx.bmw.util.ScoreCompartorASC;
import com.zwrx.bmw.util.StringUtil;

import edu.emory.mathcs.backport.java.util.Collections;
/**
 * 本GradeAction类主要负责对用户等级进行设置
 * @author zhaozhiyang
 *
 */
public class GradeAction extends BaseAction<BmwSyscode> {
	private String smallGrade;
	private String largeGrade;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 所有的买家用户等级列表
	 */
	public String listBuyer(){
		ExecuteResult eResult;
		try {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BmwSyscode.class);
			detachedCriteria.add(Restrictions.eq("state", CommonConst.STATE_NORMAL));
			detachedCriteria.add(Restrictions.eq("type", CommonConst.SYSCODE_TYPE_USER_GRADE));
			if (StringUtil.isNotBlank(this.entity.getName())) {
				detachedCriteria.add(Restrictions.like("name", this.entity.getName()));
			}
			if (StringUtil.isNotBlank(this.entity.getSdesc())) {
				detachedCriteria.add(Restrictions.like("sdesc", this.entity.getSdesc()));
			}
			pageList = baseService.findPageByCriteria(detachedCriteria, pageSize,startIndex);
			List<BmwSyscode> curGrades=pageList.getItems();
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			List<GradeObject> curParams=new ArrayList<GradeObject>();
			if(curGrades!=null){
				for(BmwSyscode e:curGrades){
					GradeObject curP=new GradeObject();
					curP.setId(e.getSyscodeId());
					curP.setDesc(e.getSdesc());
					curP.setSmallScore(e.getContent().split("-")[0]);
					curP.setLargeScore(e.getContent().split("-")[1]);
					curP.setName(e.getName());
					curParams.add(curP);
				}
			}
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC, curParams);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	/**
	 * 所有的卖家用户等级列表
	 */
	public String listSeller(){
		ExecuteResult eResult;
		try {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(BmwSyscode.class);
			detachedCriteria.add(Restrictions.eq("state", CommonConst.STATE_NORMAL));
			detachedCriteria.add(Restrictions.eq("type", CommonConst.SYSCODE_TYPE_SELLER_USER_GRADE));
			if (StringUtil.isNotBlank(this.entity.getName())) {
				detachedCriteria.add(Restrictions.like("name", this.entity.getName()));
			}
			if (StringUtil.isNotBlank(this.entity.getSdesc())) {
				detachedCriteria.add(Restrictions.like("sdesc", this.entity.getSdesc()));
			}
			pageList = baseService.findPageByCriteria(detachedCriteria, pageSize,startIndex);
			List<BmwSyscode> curGrades=pageList.getItems();
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			List<GradeObject> curParams=new ArrayList<GradeObject>();
			if(curGrades!=null){
				for(BmwSyscode e:curGrades){
					GradeObject curP=new GradeObject();
					curP.setId(e.getSyscodeId());
					curP.setDesc(e.getSdesc());
					curP.setSmallScore(e.getContent().split("-")[0]);
					curP.setLargeScore(e.getContent().split("-")[1]);
					curP.setName(e.getName());
					curParams.add(curP);
				}
			}
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC, curParams);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 新增买家等级
	 * @return
	 */
	public String addBuyer(){
		ExecuteResult eResult;
		try {
			double curSmallGrade=Double.valueOf(this.smallGrade);
			double curLargeGrade=Double.valueOf(this.largeGrade);
			if(curSmallGrade>curLargeGrade){
				eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_NORMAL);
				this.result = JSONObject.fromObject(eResult).toString();
				return JSON;
			}
			List<BmwSyscode> curGrades=(List<BmwSyscode>) baseService.find("from BmwSyscode where state=? and type=?", CommonConst.STATE_NORMAL,CommonConst.SYSCODE_TYPE_USER_GRADE);
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			BmwSyscode lastSys=null;
			BmwSyscode curSys=new BmwSyscode();
			curSys.setName(this.entity.getName());
			curSys.setState(CommonConst.STATE_NORMAL);
			curSys.setType(CommonConst.SYSCODE_TYPE_USER_GRADE);
			curSys.setSdesc(this.entity.getSdesc());
			if(curGrades!=null && curGrades.size()>0){
				lastSys=curGrades.get(curGrades.size()-1);
				String lastSysContent=lastSys.getContent().split("-")[1];;
				double curSmallScore=Double.parseDouble(this.smallGrade);
				double lastLargeScore=Double.parseDouble(lastSysContent);
				if(curSmallScore>=lastLargeScore){
					curSys.setContent(this.smallGrade+"-"+this.largeGrade);
				}else{
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_SMALL);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}else{
				curSys.setContent(this.smallGrade+"-"+this.largeGrade);
			}
			baseService.save(curSys);
			GradeObject curP=new GradeObject();
			curP.setId(curSys.getSyscodeId());
			curP.setDesc(curSys.getSdesc());
			curP.setSmallScore(curSys.getContent().split("-")[0]);
			curP.setLargeScore(curSys.getContent().split("-")[1]);
			curP.setName(curSys.getName());
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC,curP);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 新增卖家等级
	 * @return
	 */
	public String addSeller(){
		ExecuteResult eResult;
		try {
			double curSmallGrade=Double.valueOf(this.smallGrade);
			double curLargeGrade=Double.valueOf(this.largeGrade);
			if(curSmallGrade>curLargeGrade){
				eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_NORMAL);
				this.result = JSONObject.fromObject(eResult).toString();
				return JSON;
			}
			List<BmwSyscode> curGrades=(List<BmwSyscode>) baseService.find("from BmwSyscode where state=? and type=?", CommonConst.STATE_NORMAL,CommonConst.SYSCODE_TYPE_SELLER_USER_GRADE);
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			BmwSyscode lastSys=null;
			BmwSyscode curSys=new BmwSyscode();
			curSys.setName(this.entity.getName());
			curSys.setState(CommonConst.STATE_NORMAL);
			curSys.setType(CommonConst.SYSCODE_TYPE_SELLER_USER_GRADE);
			curSys.setSdesc(this.entity.getSdesc());
			if(curGrades!=null && curGrades.size()>0){
				lastSys=curGrades.get(curGrades.size()-1);
				String lastSysContent=lastSys.getContent().split("-")[1];;
				double curSmallScore=Double.parseDouble(this.smallGrade);
				double lastLargeScore=Double.parseDouble(lastSysContent);
				if(curSmallScore>=lastLargeScore){
					curSys.setContent(this.smallGrade+"-"+this.largeGrade);
				}else{
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_SMALL);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}else{
				curSys.setContent(this.smallGrade+"-"+this.largeGrade);
			}
			baseService.save(curSys);
			GradeObject curP=new GradeObject();
			curP.setId(curSys.getSyscodeId());
			curP.setDesc(curSys.getSdesc());
			curP.setSmallScore(curSys.getContent().split("-")[0]);
			curP.setLargeScore(curSys.getContent().split("-")[1]);
			curP.setName(curSys.getName());
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC,curP);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 编辑买家等级
	 * @return
	 */
	public String editBuyer(){
		ExecuteResult eResult;
		try {
			double curSmallGrade=Double.valueOf(this.smallGrade);
			double curLargeGrade=Double.valueOf(this.largeGrade);
			if(curSmallGrade>curLargeGrade){
				eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_NORMAL);
				this.result = JSONObject.fromObject(eResult).toString();
				return JSON;
			}
			BmwSyscode curSys=(BmwSyscode) baseService.findById(BmwSyscode.class,this.entity.getSyscodeId());
			List<BmwSyscode> curGrades=(List<BmwSyscode>) baseService.find("from BmwSyscode where state=? and type=?", CommonConst.STATE_NORMAL,CommonConst.SYSCODE_TYPE_USER_GRADE);
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			BmwSyscode beforeSys=null;
			BmwSyscode afterSys=null;
			for(int i=0;i<curGrades.size();i++){
				if(curGrades.get(i).getSyscodeId().equals(this.entity.getSyscodeId())){
					if(i>0){
						beforeSys=curGrades.get(i-1);
						if(i+1<curGrades.size()){
							afterSys=curGrades.get(i+1);
						}
					}
				}
			}
			if(beforeSys!=null){
				String smallGradeParam=beforeSys.getContent().split("-")[0];
				double smallGradeDouble = Double.valueOf(smallGradeParam);
				if(curSmallGrade!=smallGradeDouble){
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_SMALL);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}
			if(afterSys!=null){
				String largeGradeParam=afterSys.getContent().split("-")[0];
				double largeGradeDouble = Double.valueOf(largeGradeParam);
				if(curLargeGrade!=largeGradeDouble){
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_LARGE);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}
			curSys.setContent(this.smallGrade+"-"+this.largeGrade);
			curSys.setSdesc(this.entity.getSdesc());
			curSys.setName(this.entity.getName());
			baseService.update(curSys);
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC,curSys);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 编辑卖家等级
	 * @return
	 */
	public String editSeller(){
		ExecuteResult eResult;
		try {
			double curSmallGrade=Double.valueOf(this.smallGrade);
			double curLargeGrade=Double.valueOf(this.largeGrade);
			if(curSmallGrade>curLargeGrade){
				eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_NORMAL);
				this.result = JSONObject.fromObject(eResult).toString();
				return JSON;
			}
			BmwSyscode curSys=(BmwSyscode) baseService.findById(BmwSyscode.class,this.entity.getSyscodeId());
			List<BmwSyscode> curGrades=(List<BmwSyscode>) baseService.find("from BmwSyscode where state=? and type=?", CommonConst.STATE_NORMAL,CommonConst.SYSCODE_TYPE_SELLER_USER_GRADE);
			ScoreCompartorASC curCompare=new ScoreCompartorASC();
			Collections.sort(curGrades, curCompare);
			BmwSyscode beforeSys=null;
			BmwSyscode afterSys=null;
			for(int i=0;i<curGrades.size();i++){
				if(curGrades.get(i).getSyscodeId().equals(this.entity.getSyscodeId())){
					if(i>0){
						beforeSys=curGrades.get(i-1);
						if(i+1<curGrades.size()){
							afterSys=curGrades.get(i+1);
						}
					}
				}
			}
			if(beforeSys!=null){
				String smallGradeParam=beforeSys.getContent().split("-")[0];
				double smallGradeDouble = Double.valueOf(smallGradeParam);
				if(curSmallGrade!=smallGradeDouble){
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_SMALL);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}
			if(afterSys!=null){
				String largeGradeParam=afterSys.getContent().split("-")[0];
				double largeGradeDouble = Double.valueOf(largeGradeParam);
				if(curLargeGrade!=largeGradeDouble){
					eResult = new ExecuteResult(false, CommonConst.GRADE_ERROR_LARGE);
					this.result = JSONObject.fromObject(eResult).toString();
					return JSON;
				}
			}
			curSys.setContent(this.smallGrade+"-"+this.largeGrade);
			curSys.setSdesc(this.entity.getSdesc());
			curSys.setName(this.entity.getName());
			baseService.update(curSys);
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DESC,curSys);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	
	/**
	 * 删除等级
	 * @return
	 */
	public String delete(){
		ExecuteResult eResult;
		try {
			BmwSyscode curSys=(BmwSyscode) baseService.findById(BmwSyscode.class,this.entity.getSyscodeId());
			curSys.setState(CommonConst.STATE_DEL);
			baseService.update(curSys);
			eResult = new ExecuteResult(true, CommonConst.SUCCESS_DELETE,curSys);
		} catch (Exception e) {
			e.printStackTrace();
			eResult = new ExecuteResult(false, ERR_Desc);
		}
		this.result = JSONObject.fromObject(eResult).toString();
		return JSON;
	}
	

	public String getSmallGrade() {
		return smallGrade;
	}

	public void setSmallGrade(String smallGrade) {
		this.smallGrade = smallGrade;
	}

	public String getLargeGrade() {
		return largeGrade;
	}

	public void setLargeGrade(String largeGrade) {
		this.largeGrade = largeGrade;
	}
}
