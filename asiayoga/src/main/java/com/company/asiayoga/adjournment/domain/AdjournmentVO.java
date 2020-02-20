package com.company.asiayoga.adjournment.domain;

import java.util.Date;

import com.company.asiayoga.common.domain.PagingVO;

public class AdjournmentVO extends PagingVO {
	
	private int adjournmentSeq; 							// ��ȸ��ȣ
	private int memberSeq;									// ȸ����ȣ
	private int storeSeq;									// �����ȣ
	private int orderSeq;									// �ֹ���ȣ
	private Date adjournmentStart;							// ��ȸ ������
	private Date adjournmentEnd;							// ��ȸ ������
	private String adjournmentMemo;							// ��ȸ �� �޸�
	private String delYn;									// �������� 
	private String adjournmentState;						// ��ȸ ���� (Y : ��ȸȸ�� , N : ����ȸ ȸ��)
	private Date registerDate;                      		// ��� ����
    private String registerId;                     			// ����� ���̵�
    private Date modifyDate;                        		// ���� ����
    private String modifyId;                        		// ������ ���̵�
    
    private int rowNum;										// ��ȣ
    private String name;									// ȸ����
    private String phone;									// �� ����ó
    private String email;									// �̸���
    private String birth;									// �������
    private String sex;
    private String storeName;								// �����
    private String productName;								// ��ǰ��
    private String itemName;								// ǰ���
    private int remainingCount;								// ��ǰ ���� Ƚ��
    private int productCount;								// ��ǰ Ƚ��
	
    public int getAdjournmentSeq() {
		return adjournmentSeq;
	}
	public void setAdjournmentSeq(int adjournmentSeq) {
		this.adjournmentSeq = adjournmentSeq;
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
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
	public Date getAdjournmentStart() {
		return adjournmentStart;
	}
	public void setAdjournmentStart(Date adjournmentStart) {
		this.adjournmentStart = adjournmentStart;
	}
	public Date getAdjournmentEnd() {
		return adjournmentEnd;
	}
	public void setAdjournmentEnd(Date adjournmentEnd) {
		this.adjournmentEnd = adjournmentEnd;
	}
	public String getAdjournmentMemo() {
		return adjournmentMemo;
	}
	public void setAdjournmentMemo(String adjournmentMemo) {
		this.adjournmentMemo = adjournmentMemo;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getAdjournmentState() {
		return adjournmentState;
	}
	public void setAdjournmentState(String adjournmentState) {
		this.adjournmentState = adjournmentState;
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
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getRemainingCount() {
		return remainingCount;
	}
	public void setRemainingCount(int remainingCount) {
		this.remainingCount = remainingCount;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
	
}
