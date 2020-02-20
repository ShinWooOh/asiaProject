package com.company.asiayoga.store.domain;

import java.util.Date;

import com.company.asiayoga.common.domain.PagingVO;

public class StoreVO extends PagingVO {

	private int rowNum;
	private int storeSeq;							// 매장 번호
	private String storeName;						// 매장명
	private String storeTel;						// 매장 전화 번호
	private String storeTel1;						// 매장 전화 번호1
	private String storeTel2;						// 매장 전화 번호2
	private String storeTel3;						// 매장 전화 번호3
	private String storePhone;						// 매장 전화 번호(핸드폰)
	private String storePhone1;						// 매장 전화 번호1(핸드폰)
	private String storePhone2;						// 매장 전화 번호2(핸드폰)
	private String storePhone3;						// 매장 전화 번호3(핸드폰)
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
				+ storeTel + ", storeTel1=" + storeTel1 + ", storeTel2=" + storeTel2 + ", storeTel3=" + storeTel3
				+ ", storePhone=" + storePhone + ", storePhone1=" + storePhone1 + ", storePhone2=" + storePhone2
				+ ", storePhone3=" + storePhone3 + ", storeAddress=" + storeAddress + ", storeMemo=" + storeMemo
				+ ", delYn=" + delYn + ", registerDate=" + registerDate + ", registerId=" + registerId + ", modifyDate="
				+ modifyDate + ", modifyId=" + modifyId + ", getRowNum()=" + getRowNum() + ", getStoreSeq()="
				+ getStoreSeq() + ", getStoreName()=" + getStoreName() + ", getStoreTel()=" + getStoreTel()
				+ ", getStoreTel1()=" + getStoreTel1() + ", getStoreTel2()=" + getStoreTel2() + ", getStoreTel3()="
				+ getStoreTel3() + ", getStorePhone()=" + getStorePhone() + ", getStorePhone1()=" + getStorePhone1()
				+ ", getStorePhone2()=" + getStorePhone2() + ", getStorePhone3()=" + getStorePhone3()
				+ ", getStoreAddress()=" + getStoreAddress() + ", getStoreMemo()=" + getStoreMemo() + ", getDelYn()="
				+ getDelYn() + ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()=" + getRegisterId()
				+ ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
