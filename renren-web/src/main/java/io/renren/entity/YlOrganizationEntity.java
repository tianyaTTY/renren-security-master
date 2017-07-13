package io.renren.entity;


import org.hibernate.validator.constraints.NotBlank;

/**
 * 医疗组织信息
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public class YlOrganizationEntity {
	private Integer id;
	@NotBlank(message="参数名不能为空")
	private String name;
	private String remark;

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
