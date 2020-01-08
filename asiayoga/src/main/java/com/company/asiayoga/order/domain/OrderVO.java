package com.company.asiayoga.order.domain;

import java.util.Date;

import com.company.asiayoga.member.domain.MemberVO;

public class OrderVO extends MemberVO {
	
	private int orderSeq;							// �ֹ� ��ȣ
	private int storeSeq;							// ���� ��ȣ
	private int memberSeq;							// ȸ�� ��ȣ
	private int productSeq;							// ��ǰ ��ȣ
	private String productName;						// ��ǰ��
	private String productCode;						// ��ǰ�ڵ� (001 : �Ⱓ�� , 002 : Ƚ����)
	private Date productStartDay;					// �Ⱓ�� ��ǰ�� ��� ������
	private Date productEndDay;						// �Ⱓ�� ��ǰ�� ��� ������
	private int productTerm;						// �Ⱓ�� ��ǰ�� ��� ��ǰ �Ⱓ(ex: 60�� ��ǰ)
	private int productCount;						// Ƚ���� ��ǰ�� ��� Ƚ��
	private int remainingCount;						// Ƚ���� ��ǰ�� ��� ���� Ƚ��
	private String delYn;                           // ��������
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
    
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
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
	public Date getProductStartDay() {
		return productStartDay;
	}
	public void setProductStartDay(Date productStartDay) {
		this.productStartDay = productStartDay;
	}
	public Date getProductEndDay() {
		return productEndDay;
	}
	public void setProductEndDay(Date productEndDay) {
		this.productEndDay = productEndDay;
	}
	public int getProductTerm() {
		return productTerm;
	}
	public void setProductTerm(int productTerm) {
		this.productTerm = productTerm;
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
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
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
	@Override
	public String toString() {
		return "OrderVO [orderSeq=" + orderSeq + ", storeSeq=" + storeSeq + ", memberSeq=" + memberSeq + ", productSeq="
				+ productSeq + ", productName=" + productName + ", productCode=" + productCode + ", productStartDay="
				+ productStartDay + ", productEndDay=" + productEndDay + ", productTerm=" + productTerm
				+ ", productCount=" + productCount + ", remainingCount=" + remainingCount + ", delYn=" + delYn
				+ ", registerDate=" + registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate
				+ ", modifyId=" + modifyId + ", getOrderSeq()=" + getOrderSeq() + ", getStoreSeq()=" + getStoreSeq()
				+ ", getMemberSeq()=" + getMemberSeq() + ", getProductSeq()=" + getProductSeq() + ", getProductName()="
				+ getProductName() + ", getProductCode()=" + getProductCode() + ", getProductStartDay()="
				+ getProductStartDay() + ", getProductEndDay()=" + getProductEndDay() + ", getProductTerm()="
				+ getProductTerm() + ", getProductCount()=" + getProductCount() + ", getRemainingCount()="
				+ getRemainingCount() + ", getDelYn()=" + getDelYn() + ", getRegisterDate()=" + getRegisterDate()
				+ ", getRegisterId()=" + getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()="
				+ getModifyId() + ", getRowNum()=" + getRowNum() + ", getAttendanceSeq()=" + getAttendanceSeq()
				+ ", getName()=" + getName() + ", getBirth()=" + getBirth() + ", getYear()=" + getYear()
				+ ", getMonth()=" + getMonth() + ", getDay()=" + getDay() + ", getPhone()=" + getPhone()
				+ ", getPhone1()=" + getPhone1() + ", getPhone2()=" + getPhone2() + ", getPhone3()=" + getPhone3()
				+ ", getEmail()=" + getEmail() + ", getSex()=" + getSex() + ", getMemo()=" + getMemo()
				+ ", getAttendanceDate()=" + getAttendanceDate() + ", toString()=" + super.toString()
				+ ", getStoreName()=" + getStoreName() + ", getStoreTel()=" + getStoreTel() + ", getStorePhone()="
				+ getStorePhone() + ", getStoreAddress()=" + getStoreAddress() + ", getStoreMemo()=" + getStoreMemo()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
