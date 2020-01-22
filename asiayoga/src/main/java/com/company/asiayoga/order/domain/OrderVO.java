package com.company.asiayoga.order.domain;

import java.util.Date;

import com.company.asiayoga.member.domain.MemberVO;

public class OrderVO extends MemberVO {
	
	private int orderSeq;							// �ֹ� ��ȣ
	private int storeSeq;							// ���� ��ȣ
	private int memberSeq;							// ȸ�� ��ȣ
	private int productSeq;							// ��ǰ ��ȣ
	private String productName;						// ��ǰ��
	private String productCode;						// ��ǰ�ڵ�
	private String itemName;						// ǰ���
	private Date startDay;							// ������
	private Date expirationDay;						// ������
	private int productCount;						// ��ǰ Ƚ��
	private int remainingCount;						// Ƚ���� ��ǰ�� ��� ���� Ƚ��
	private int productPrice;						// ��ǰ ����
	private int customerPrice;						// �� ����(���� ������ ����)
	private String expirationYn;					// ���Ῡ��		
	private int lockerSeq;							// �繰��(��Ŀ) ��ȣ
	private String orderMemo;						// �޸�
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
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getExpirationDay() {
		return expirationDay;
	}
	public void setExpirationDay(Date expirationDay) {
		this.expirationDay = expirationDay;
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
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getCustomerPrice() {
		return customerPrice;
	}
	public void setCustomerPrice(int customerPrice) {
		this.customerPrice = customerPrice;
	}
	public String getExpirationYn() {
		return expirationYn;
	}
	public void setExpirationYn(String expirationYn) {
		this.expirationYn = expirationYn;
	}
	public int getLockerSeq() {
		return lockerSeq;
	}
	public void setLockerSeq(int lockerSeq) {
		this.lockerSeq = lockerSeq;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
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
				+ productSeq + ", productName=" + productName + ", productCode=" + productCode + ", itemName="
				+ itemName + ", startDay=" + startDay + ", expirationDay=" + expirationDay + ", productCount="
				+ productCount + ", remainingCount=" + remainingCount + ", productPrice=" + productPrice
				+ ", customerPrice=" + customerPrice + ", expirationYn=" + expirationYn + ", lockerSeq=" + lockerSeq
				+ ", orderMemo=" + orderMemo + ", delYn=" + delYn + ", registerDate=" + registerDate + ", registerId="
				+ registerId + ", modifyDate=" + modifyDate + ", modifyId=" + modifyId + ", getOrderSeq()="
				+ getOrderSeq() + ", getStoreSeq()=" + getStoreSeq() + ", getMemberSeq()=" + getMemberSeq()
				+ ", getProductSeq()=" + getProductSeq() + ", getProductName()=" + getProductName()
				+ ", getProductCode()=" + getProductCode() + ", getItemName()=" + getItemName() + ", getStartDay()="
				+ getStartDay() + ", getExpirationDay()=" + getExpirationDay() + ", getProductCount()="
				+ getProductCount() + ", getRemainingCount()=" + getRemainingCount() + ", getProductPrice()="
				+ getProductPrice() + ", getCustomerPrice()=" + getCustomerPrice() + ", getExpirationYn()="
				+ getExpirationYn() + ", getLockerSeq()=" + getLockerSeq() + ", getOrderMemo()=" + getOrderMemo()
				+ ", getDelYn()=" + getDelYn() + ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()="
				+ getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId()
				+ ", getRowNum()=" + getRowNum() + ", getAttendanceSeq()=" + getAttendanceSeq() + ", getName()="
				+ getName() + ", getBirth()=" + getBirth() + ", getYear()=" + getYear() + ", getMonth()=" + getMonth()
				+ ", getDay()=" + getDay() + ", getPhone()=" + getPhone() + ", getPhone1()=" + getPhone1()
				+ ", getPhone2()=" + getPhone2() + ", getPhone3()=" + getPhone3() + ", getEmail()=" + getEmail()
				+ ", getSex()=" + getSex() + ", getMemo()=" + getMemo() + ", getAttendanceDate()=" + getAttendanceDate()
				+ ", getProductEndDay()=" + getProductEndDay() + ", toString()=" + super.toString()
				+ ", getStoreName()=" + getStoreName() + ", getStoreTel()=" + getStoreTel() + ", getStoreTel1()="
				+ getStoreTel1() + ", getStoreTel2()=" + getStoreTel2() + ", getStoreTel3()=" + getStoreTel3()
				+ ", getStorePhone()=" + getStorePhone() + ", getStorePhone1()=" + getStorePhone1()
				+ ", getStorePhone2()=" + getStorePhone2() + ", getStorePhone3()=" + getStorePhone3()
				+ ", getStoreAddress()=" + getStoreAddress() + ", getStoreMemo()=" + getStoreMemo() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
