package com.company.asiayoga.store.domain;

import java.util.Date;

public class StoreVO {

	private int rowNum;
	private int storeSeq;							// 매장 번호
	private String storeName;						// 매장명
	private String storeTel;						// 매장 전화 번호
	private String storePhone;						// 매장 전화 번호(핸드폰)
	private String storeAddress;					// 매장 주소
	private String storeMemo;						// 매장 설명
	private String delYn;							// 삭제 여부
    private Date registerDate;                      // 등록 일자
    private String registerId;                      // 등록자 아이디
    private Date modifyDate;                        // 수정 일자
    private String modifyId;                        // 수정자 아이디
	
    
    public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
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
	@Override
	public String toString() {
		return "StoreVO [rowNum=" + rowNum + ", storeSeq=" + storeSeq + ", storeName=" + storeName + ", storeTel="
				+ storeTel + ", storePhone=" + storePhone + ", storeAddress=" + storeAddress + ", storeMemo="
				+ storeMemo + ", delYn=" + delYn + ", registerDate=" + registerDate + ", registerId=" + registerId
				+ ", modifyDate=" + modifyDate + ", modifyId=" + modifyId + ", getRowNum()=" + getRowNum()
				+ ", getStoreSeq()=" + getStoreSeq() + ", getStoreName()=" + getStoreName() + ", getStoreTel()="
				+ getStoreTel() + ", getStorePhone()=" + getStorePhone() + ", getStoreAddress()=" + getStoreAddress()
				+ ", getStoreMemo()=" + getStoreMemo() + ", getDelYn()=" + getDelYn() + ", getRegisterDate()="
				+ getRegisterDate() + ", getRegisterId()=" + getRegisterId() + ", getModifyDate()=" + getModifyDate()
				+ ", getModifyId()=" + getModifyId() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
