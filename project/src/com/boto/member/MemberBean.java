package com.boto.member;

import java.sql.Date;

public class MemberBean {
	
	// 멤버변수
	private String id;
	private String pass;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String address;
	private int postcode;
	private String detailAddress;
	private String extraAddress;
	private String phone;
	private String mobile;
	private Date reg_date;
	
	
	
	// set get
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", gender=" + gender + ", address=" + address + ", postcode=" + postcode + ", detailAddress="
				+ detailAddress + ", extraAddress=" + extraAddress + ", phone=" + phone + ", mobile=" + mobile
				+ ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	

	

	
	
	
	

}
