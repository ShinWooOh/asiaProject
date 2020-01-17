package com.company.asiayoga.product.domain;

import java.util.Date;

import com.company.asiayoga.item.domain.ItemVO;

public class ProductVO extends ItemVO {
	
	private int rowNum;
	private int productSeq;							// ��ǰ ��ȣ
	private int storeSeq;							// ���� ��ȣ
	private String productName;						// ��ǰ��
	private String productMemo;						// ��ǰ ����
	private int productPrice;						// ��ǰ ����		
	private int productCount;						// ��ǰ ����(Ƚ������ ��� �ش�)
	private int lockerSeq;							// ��Ŀ ����
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
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductMemo() {
		return productMemo;
	}
	public void setProductMemo(String productMemo) {
		this.productMemo = productMemo;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductCount() {
		return productCount;
	}
	public int getLockerSeq() {
		return lockerSeq;
	}
	public void setLockerSeq(int lockerSeq) {
		this.lockerSeq = lockerSeq;
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
		return "ProductVO [rowNum=" + rowNum + ", productSeq=" + productSeq + ", storeSeq=" + storeSeq
				+ ", productName=" + productName + ", productMemo=" + productMemo + ", productPrice=" + productPrice
				+ ", productCount=" + productCount + ", lockerSeq=" + lockerSeq + ", delYn=" + delYn + ", registerDate="
				+ registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate + ", modifyId=" + modifyId
				+ ", storeName=" + storeName + ", getRowNum()=" + getRowNum() + ", getProductSeq()=" + getProductSeq()
				+ ", getStoreSeq()=" + getStoreSeq() + ", getProductName()=" + getProductName() + ", getProductMemo()="
				+ getProductMemo() + ", getProductPrice()=" + getProductPrice() + ", getProductCount()="
				+ getProductCount() + ", getLockerSeq()=" + getLockerSeq() + ", getDelYn()=" + getDelYn()
				+ ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()=" + getRegisterId()
				+ ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId() + ", getStoreName()="
				+ getStoreName() + ", getItemSeq()=" + getItemSeq() + ", getProductCode()=" + getProductCode()
				+ ", getLargeCategory()=" + getLargeCategory() + ", getItemName()=" + getItemName() + ", toString()="
				+ super.toString() + ", getStoreTel()=" + getStoreTel() + ", getStorePhone()=" + getStorePhone()
				+ ", getStoreAddress()=" + getStoreAddress() + ", getStoreMemo()=" + getStoreMemo() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
