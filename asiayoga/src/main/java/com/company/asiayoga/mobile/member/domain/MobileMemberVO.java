package com.company.asiayoga.mobile.member.domain;

import com.company.asiayoga.member.domain.MemberVO;

public class MobileMemberVO extends MemberVO {
	
	private int rowNum;								// 인덱스 번호
	private String phone;							// 핸드폰 번호
	private int storeSeq;							// 매장 번호
	
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
	
	

}
