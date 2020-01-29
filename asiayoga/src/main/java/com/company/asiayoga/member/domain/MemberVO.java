package com.company.asiayoga.member.domain;

import java.util.Date;

import com.company.asiayoga.store.domain.StoreVO;

public class MemberVO extends StoreVO {
	
	private int rowNum;								// �ε��� ��ȣ
    private int attendanceSeq;
    private int memberSeq;                          // ȸ�� ��ȣ
    private String name;							// ȸ�� �̸�
    private String birth;							// �������
    private String year;							// ��
    private String month;							// ��
    private String day;								// ��
    private String phone;							// ����ó
    private String phone1;							// ����ó1
    private String phone2;							// ����ó2
    private String phone3;							// ����ó3
    private String email;							// �̸���
    private String sex;								// ����
    private String memo;							// �޸�
    private Date attendanceDate;              		// �⼮ ����
    private Date registerDate;                 		// ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                  	 	// ���� ����
    private String modifyId;                        // ������ ���̵�
    private String delYn;                           // ��������
    
    private int productSeq;							// ��ǰ ��ȣ
    private String productName;						// ��ǰ��
    private String productCode;						// ��ǰ�ڵ�
    private Date productEndDay;						// �Ⱓ�� ��ǰ�� ��� ������
    private int orderSeq;							// �ֹ� ��ȣ
    private int itemSeq;							// ǰ�� ��ȣ
    private String itemName;						// ǰ���
    private int productCount;						// ��� Ƚ��
    private int remainingCount;						// �ܿ� Ƚ��
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public Date getProductEndDay() {
		return productEndDay;
	}
	public void setProductEndDay(Date productEndDay) {
		this.productEndDay = productEndDay;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getRemainingCount() {
		return remainingCount;
	}
	public void setRemainingCount(int remainingCount) {
		this.remainingCount = remainingCount;
	}
	@Override
	public String toString() {
		return "MemberVO [rowNum=" + rowNum + ", attendanceSeq=" + attendanceSeq + ", memberSeq=" + memberSeq
				+ ", name=" + name + ", birth=" + birth + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", phone=" + phone + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", email="
				+ email + ", sex=" + sex + ", memo=" + memo + ", attendanceDate=" + attendanceDate + ", registerDate="
				+ registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate + ", modifyId=" + modifyId
				+ ", delYn=" + delYn + ", productSeq=" + productSeq + ", productName=" + productName + ", productCode="
				+ productCode + ", productEndDay=" + productEndDay + ", orderSeq=" + orderSeq + ", itemSeq=" + itemSeq
				+ ", itemName=" + itemName + ", productCount=" + productCount + ", remainingCount=" + remainingCount
				+ ", getRowNum()=" + getRowNum() + ", getAttendanceSeq()=" + getAttendanceSeq() + ", getMemberSeq()="
				+ getMemberSeq() + ", getName()=" + getName() + ", getBirth()=" + getBirth() + ", getYear()="
				+ getYear() + ", getMonth()=" + getMonth() + ", getDay()=" + getDay() + ", getPhone()=" + getPhone()
				+ ", getPhone1()=" + getPhone1() + ", getPhone2()=" + getPhone2() + ", getPhone3()=" + getPhone3()
				+ ", getEmail()=" + getEmail() + ", getSex()=" + getSex() + ", getMemo()=" + getMemo()
				+ ", getAttendanceDate()=" + getAttendanceDate() + ", getRegisterDate()=" + getRegisterDate()
				+ ", getRegisterId()=" + getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()="
				+ getModifyId() + ", getDelYn()=" + getDelYn() + ", getProductSeq()=" + getProductSeq()
				+ ", getProductName()=" + getProductName() + ", getProductCode()=" + getProductCode()
				+ ", getProductEndDay()=" + getProductEndDay() + ", getOrderSeq()=" + getOrderSeq() + ", getItemSeq()="
				+ getItemSeq() + ", getItemName()=" + getItemName() + ", getProductCount()=" + getProductCount()
				+ ", getRemainingCount()=" + getRemainingCount() + ", getStoreSeq()=" + getStoreSeq()
				+ ", getStoreName()=" + getStoreName() + ", getStoreTel()=" + getStoreTel() + ", getStoreTel1()="
				+ getStoreTel1() + ", getStoreTel2()=" + getStoreTel2() + ", getStoreTel3()=" + getStoreTel3()
				+ ", getStorePhone()=" + getStorePhone() + ", getStorePhone1()=" + getStorePhone1()
				+ ", getStorePhone2()=" + getStorePhone2() + ", getStorePhone3()=" + getStorePhone3()
				+ ", getStoreAddress()=" + getStoreAddress() + ", getStoreMemo()=" + getStoreMemo() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
