package io.renren.entity;


import org.hibernate.validator.constraints.NotBlank;

/**
 * 医院信息
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public class YlHospitalEntity {
	private Integer id;//主键
	@NotBlank(message="参数名不能为空")
	private String name;//医院名
	@NotBlank(message="参数值不能为空")
	private String principal;//医院负责人
	private String address;//医院地址
	private String businessScope;//业务范围
	private String phone;//电话
	private String mobile;//手机号
	private Integer orgId;//组织编号
	private String remark;//备注
	private String orgName;//医疗组织名称

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
