package com.company.asiayoga.item.domain;

import java.util.Date;

import com.company.asiayoga.store.domain.StoreVO;

public class ItemVO extends StoreVO {
	
	private int itemSeq;							// ǰ���ȣ
	private int storeSeq;							// �����ȣ
	private String productCode;						// ��ǰ�ڵ�
	private String largeCategory;					// ��з�
	private String itemName;						// ǰ���
	private String delYn;							// ��������
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
	
    public int getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getLargeCategory() {
		return largeCategory;
	}
	public void setLargeCategory(String largeCategory) {
		this.largeCategory = largeCategory;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
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
		return "ItemVO [itemSeq=" + itemSeq + ", storeSeq=" + storeSeq + ", productCode=" + productCode
				+ ", largeCategory=" + largeCategory + ", itemName=" + itemName + ", delYn=" + delYn + ", registerDate="
				+ registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate + ", modifyId=" + modifyId
				+ ", getItemSeq()=" + getItemSeq() + ", getStoreSeq()=" + getStoreSeq() + ", getProductCode()="
				+ getProductCode() + ", getLargeCategory()=" + getLargeCategory() + ", getItemName()=" + getItemName()
				+ ", getDelYn()=" + getDelYn() + ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()="
				+ getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId()
				+ ", getRowNum()=" + getRowNum() + ", getStoreName()=" + getStoreName() + ", getStoreTel()="
				+ getStoreTel() + ", getStorePhone()=" + getStorePhone() + ", getStoreAddress()=" + getStoreAddress()
				+ ", getStoreMemo()=" + getStoreMemo() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}