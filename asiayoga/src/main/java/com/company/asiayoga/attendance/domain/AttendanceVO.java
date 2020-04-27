package com.company.asiayoga.attendance.domain;

import java.util.Date;

import com.company.asiayoga.member.domain.MemberVO;

public class AttendanceVO extends MemberVO {

	private int rowNum;								// 인덱스 번호
    private int attendanceSeq;
    private int attendanceHstSeq;
    private int memberSeq;                          // 회원 번호
    private String name;							// 회원 이름
    private String phone;							// 연락처
    private String sex;								// 성별
    private Date attendanceDate;                    // 출석 일자
    private Date registerDate;                      // 등록 일자
    private String registerId;                      // 등록자 아이디
    private Date modifyDate;                        // 수정 일자
    private String modifyId;                        // 수정자 아이디
    private String delYn;                           // 삭제여부
    private int storeSeq;	                    	// 매장번호
    private int orderSeq;							// 주문번호
    private String productCode;						// 상품 구분
	
    public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getAttendanceSeq() {
		return attendanceSeq;
	}
	public void setAttendanceSeq(int attendanceSeq) {
		this.attendanceSeq = attendanceSeq;
	}
	public int getAttendanceHstSeq() {
		return attendanceHstSeq;
	}
	public void setAttendanceHstSeq(int attendanceHstSeq) {
		this.attendanceHstSeq = attendanceHstSeq;
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getModifyId() {
		return modifyId;
	}
	public void setModifyId(String modifyId) {
		this.modifyId = modifyId;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	@Override
	public String toString() {
		return "AttendanceVO [rowNum=" + rowNum + ", attendanceSeq=" + attendanceSeq + ", memberSeq=" + memberSeq
				+ ", name=" + name + ", phone=" + phone + ", sex=" + sex + ", attendanceDate=" + attendanceDate
				+ ", registerDate=" + registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate
				+ ", modifyId=" + modifyId + ", delYn=" + delYn + ", storeSeq=" + storeSeq + ", orderSeq=" + orderSeq
				+ ", productCode=" + productCode + ", getRowNum()=" + getRowNum() + ", getAttendanceSeq()="
				+ getAttendanceSeq() + ", getMemberSeq()=" + getMemberSeq() + ", getName()=" + getName()
				+ ", getPhone()=" + getPhone() + ", getSex()=" + getSex() + ", getAttendanceDate()="
				+ getAttendanceDate() + ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()="
				+ getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId()
				+ ", getDelYn()=" + getDelYn() + ", getStoreSeq()=" + getStoreSeq() + ", getOrderSeq()=" + getOrderSeq()
				+ ", getProductCode()=" + getProductCode() + ", getBirth()=" + getBirth() + ", getYear()=" + getYear()
				+ ", getMonth()=" + getMonth() + ", getDay()=" + getDay() + ", getPhone1()=" + getPhone1()
				+ ", getPhone2()=" + getPhone2() + ", getPhone3()=" + getPhone3() + ", getEmail()=" + getEmail()
				+ ", getMemo()=" + getMemo() + ", getProductSeq()=" + getProductSeq() + ", getProductName()="
				+ getProductName() + ", getProductEndDay()=" + getProductEndDay() + ", getRemainingCount()="
				+ getRemainingCount() + ", toString()=" + super.toString() + ", getStoreName()=" + getStoreName()
				+ ", getStoreTel()=" + getStoreTel() + ", getStoreTel1()=" + getStoreTel1() + ", getStoreTel2()="
				+ getStoreTel2() + ", getStoreTel3()=" + getStoreTel3() + ", getStorePhone()=" + getStorePhone()
				+ ", getStorePhone1()=" + getStorePhone1() + ", getStorePhone2()=" + getStorePhone2()
				+ ", getStorePhone3()=" + getStorePhone3() + ", getStoreAddress()=" + getStoreAddress()
				+ ", getStoreMemo()=" + getStoreMemo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
}
