package io.renren.entity;

/**
 * APP用户
 * 
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
public class QqMemberEntity {
	private Integer id;//主键
	private String username;//用户名
	private String email;//邮箱
	private String address;//地址
	private String phone;//电话号码
	private String mobile;//手机号码
	private String stepNum;//运动步数
	private String ratingScore;//信用积分
	private String registerDate;//注册时间
	private String updateDate;//更新时间
	private String name;//姓名
	private String identityId;//身份证ID
	private Integer notificationFlag;//是否开启推送
	private String QRCodePath;//二维码路径
	private String portraitPath;//头像路径
	private String remark;//备注

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getStepNum() {
		return stepNum;
	}

	public void setStepNum(String stepNum) {
		this.stepNum = stepNum;
	}

	public String getRatingScore() {
		return ratingScore;
	}

	public void setRatingScore(String ratingScore) {
		this.ratingScore = ratingScore;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdentityId() {
		return identityId;
	}

	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}

	public Integer getNotificationFlag() {
		return notificationFlag;
	}

	public void setNotificationFlag(Integer notificationFlag) {
		this.notificationFlag = notificationFlag;
	}

	public String getQRCodePath() {
		return QRCodePath;
	}

	public void setQRCodePath(String QRCodePath) {
		this.QRCodePath = QRCodePath;
	}

	public String getPortraitPath() {
		return portraitPath;
	}

	public void setPortraitPath(String portraitPath) {
		this.portraitPath = portraitPath;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
