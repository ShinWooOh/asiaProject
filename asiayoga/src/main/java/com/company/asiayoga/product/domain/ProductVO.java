package com.company.asiayoga.product.domain;

import java.util.Date;

public class ProductVO {
	
	private int rowNum;
	private int productSeq;							// ��ǰ ��ȣ
	private int storeCode;							// ���� ��ȣ
	private String productName;						// ��ǰ��
	private String productCode;						// ��ǰ �ڵ� (001 : �Ⱓ�� , 002 : Ƚ����)
	private int productTerm;						// ��ǰ �Ⱓ(�Ⱓ���� ��� �ش�)		
	private int productCount;						// ��ǰ ����(Ƚ������ ��� �ش�)
	private String delYn;							// ���� ����
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
    private String storeName;						// �����
	
    public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public int getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
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
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	@Override
	public String toString() {
		return "ProductVO [rowNum=" + rowNum + ", productSeq=" + productSeq + ", storeCode=" + storeCode
				+ ", productName=" + productName + ", productCode=" + productCode + ", productTerm=" + productTerm
				+ ", productCount=" + productCount + ", delYn=" + delYn + ", registerDate=" + registerDate
				+ ", registerId=" + registerId + ", modifyDate=" + modifyDate + ", modifyId=" + modifyId
				+ ", storeName=" + storeName + ", getRowNum()=" + getRowNum() + ", getProductSeq()=" + getProductSeq()
				+ ", getStoreCode()=" + getStoreCode() + ", getProductName()=" + getProductName()
				+ ", getProductCode()=" + getProductCode() + ", getProductTerm()=" + getProductTerm()
				+ ", getProductCount()=" + getProductCount() + ", getDelYn()=" + getDelYn() + ", getRegisterDate()="
				+ getRegisterDate() + ", getRegisterId()=" + getRegisterId() + ", getModifyDate()=" + getModifyDate()
				+ ", getModifyId()=" + getModifyId() + ", getStoreName()=" + getStoreName() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
