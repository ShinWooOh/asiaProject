package com.company.asiayoga.adjournment.domain;

import java.util.Date;

import com.company.asiayoga.common.domain.PagingVO;

public class AdjournmentVO extends PagingVO {
	
	private int adjournmentSeq; 							// 휴회번호
	private int memberSeq;									// 회원번호
	private int storeSeq;									// 매장번호
	private int orderSeq;									// 주문번호
	private Date adjournmentStart;							// 휴회 시작일
	private Date adjournmentEnd;							// 휴회 종료일
	private String adjournmentMemo;							// 휴회 시 메모
	private String delYn;									// 삭제여부 
	private String adjournmentState;						// 휴회 상태 (Y : 휴회회원 , N : 미휴회 회원)
	private Date registerDate;                      		// 등록 일자
    private String registerId;                     			// 등록자 아이디
    private Date modifyDate;                        		// 수정 일자
    private String modifyId;                        		// 수정자 아이디
    
    private int rowNum;										// 번호
    private String name;									// 회원명
    private String phone;									// 고객 연락처
    private String email;									// 이메일
    private String birth;									// 생년월일
    private String sex;
    private String storeName;								// 매장명
    private String productName;								// 상품명
    private String itemName;								// 품목명
    private int remainingCount;								// 상품 남은 횟수
    private int productCount;								// 상품 횟수
	
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
