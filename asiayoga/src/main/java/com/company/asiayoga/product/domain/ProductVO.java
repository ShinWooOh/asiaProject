package com.company.asiayoga.product.domain;

import java.util.Date;

import com.company.asiayoga.item.domain.ItemVO;

public class ProductVO extends ItemVO {
	
	private int rowNum;
	private int productSeq;							// 제품 번호
	private int storeSeq;							// 매장 번호
	private String productName;						// 제품명
	private String productMemo;						// 상품 설명
	private int productPrice;						// 상품 가격		
	private int productCount;						// 상품 개수(횟수제인 경우 해당)
	private int lockerSeq;							// 락커 갯수
	private String delYn;							// 삭제 여부
    private Date registerDate;                      // 등록 일자
    private String registerId;                      // 등록자 아이디
    private Date modifyDate;                        // 수정 일자
    private String modifyId;                        // 수정자 아이디
    private String storeName;						// 매장명
	
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
