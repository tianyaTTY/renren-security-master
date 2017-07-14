package io.renren.vo;


import org.hibernate.validator.constraints.NotBlank;

/**
 * 医疗数对象
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
public class YlTreeEntity {
	private Integer id;//主键
	@NotBlank(message="参数名不能为空")
	private String name;//医疗名
	private Integer parentId;//父ID
	private boolean open;//树是否打开
	private String parentName;//父名
	private Integer newId;//新的排序号

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

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getNewId() {
		return newId;
	}

	public void setNewId(Integer newId) {
		this.newId = newId;
	}
}
