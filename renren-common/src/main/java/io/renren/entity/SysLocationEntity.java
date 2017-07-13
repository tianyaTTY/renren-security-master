package io.renren.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 位置
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-08 10:40:56
 */
public class SysLocationEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	//名称
	private String name;
	//地址
	private String address;
	//联系电话
	private String contact;
	//联系手机
	private String phone;
	//链接地址
	private String link;
	//内容
	private String content;
	//作者
	private String author;
	//创建时间
	private Date createDate;
	//跟新时间
	private Date updateDate;
	//类目
	private int catelogy;
	//经度
	private String longitude;
	//维度
	private String latitude;
	//备注
	private String remark;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 获取：名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：联系电话
	 */
	public String getContact() {
		return contact;
	}
	/**
	 * 设置：联系电话
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	 * 获取：联系手机
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * 设置：联系手机
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 获取：链接地址
	 */
	public String getLink() {
		return link;
	}
	/**
	 * 设置：链接地址
	 */
	public void setLink(String link) {
		this.link = link;
	}
	/**
	 * 获取：内容
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：作者
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * 设置：作者
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：跟新时间
	 */
	public Date getUpdateDate() {
		return updateDate;
	}
	/**
	 * 设置：跟新时间
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	/**
	 * 获取：类目
	 */
	public int getCatelogy() {
		return catelogy;
	}
	/**
	 * 设置：类目
	 */
	public void setCatelogy(int catelogy) {
		this.catelogy = catelogy;
	}
	/**
	 * 获取：经度
	 */
	public String getLongitude() {
		return longitude;
	}
	/**
	 * 设置：经度
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	/**
	 * 获取：纬度
	 */
	public String getLatitude() {
		return latitude;
	}
	/**
	 * 设置：纬度
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
