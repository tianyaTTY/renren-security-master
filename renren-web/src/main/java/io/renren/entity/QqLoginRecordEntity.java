package io.renren.entity;

/**
 * APP用户登录记录
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
public class QqLoginRecordEntity {
	private Integer id;//主键
	private Integer memberId;//用户ID
	private String memberName;//用户名
	private String unitType;//设备型号
	private String recordDate;//登录日期
	private String remark;//备注

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
