package com.company.asiayoga.mobile.domain;

import java.util.Date;

import com.company.asiayoga.member.domain.MemberVO;

public class MobileVO extends MemberVO {
	
	private int rowNum;								// �ε��� ��ȣ
	private String phone;							// �ڵ��� ��ȣ
	private int storeSeq;							// ���� ��ȣ
	private String storeName;						// �����
	private String storeTel;						// ���� ��ȭ ��ȣ
	private String storeTel1;						// ���� ��ȭ ��ȣ1
	private String storeTel2;						// ���� ��ȭ ��ȣ2
	private String storeTel3;						// ���� ��ȭ ��ȣ3
	private String storePhone;						// ���� ��ȭ ��ȣ(�ڵ���)
	private String storePhone1;						// ���� ��ȭ ��ȣ1(�ڵ���)
	private String storePhone2;						// ���� ��ȭ ��ȣ2(�ڵ���)
	private String storePhone3;						// ���� ��ȭ ��ȣ3(�ڵ���)
	private String storeAddress;					// ���� �ּ�
	private String storeMemo;						// ���� ����
	private String delYn;							// ���� ����
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
    private String mobileAppFlag;						// ����� �� �÷���
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreTel() {
		return storeTel;
	}
	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}
	public String getStoreTel1() {
		return storeTel1;
	}
	public void setStoreTel1(String storeTel1) {
		this.storeTel1 = storeTel1;
	}
	public String getStoreTel2() {
		return storeTel2;
	}
	public void setStoreTel2(String storeTel2) {
		this.storeTel2 = storeTel2;
	}
	public String getStoreTel3() {
		return storeTel3;
	}
	public void setStoreTel3(String storeTel3) {
		this.storeTel3 = storeTel3;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public String getStorePhone1() {
		return storePhone1;
	}
	public void setStorePhone1(String storePhone1) {
		this.storePhone1 = storePhone1;
	}
	public String getStorePhone2() {
		return storePhone2;
	}
	public void setStorePhone2(String storePhone2) {
		this.storePhone2 = storePhone2;
	}
	public String getStorePhone3() {
		return storePhone3;
	}
	public void setStorePhone3(String storePhone3) {
		this.storePhone3 = storePhone3;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreMemo() {
		return storeMemo;
	}
	public void setStoreMemo(String storeMemo) {
		this.storeMemo = storeMemo;
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
	public String getMobileAppFlag() {
		return mobileAppFlag;
	}
	public void setMobileAppFlag(String mobileAppFlag) {
		this.mobileAppFlag = mobileAppFlag;
	}
}