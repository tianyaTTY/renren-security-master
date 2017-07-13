package io.renren.entity;


import org.hibernate.validator.constraints.NotBlank;

/**
 * 科室信息
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public class YlDepartmentEntity {
	private Integer id;//主键
	@NotBlank(message="参数名不能为空")
	private String name;//科室名
	@NotBlank(message="参数值不能为空")
	private Integer hospitalId;//医院ID
	private String remark;//备注
	private String hosName;//医院名
	private Integer orgId;//医疗机构ID
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

	public Integer getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getHosName() {
		return hosName;
	}

	public void setHosName(String hosName) {
		this.hosName = hosName;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
