package com.company.asiayoga.mobile.member.domain;

import com.company.asiayoga.member.domain.MemberVO;

public class MobileMemberVO extends MemberVO {
	
	private int rowNum;								// �ε��� ��ȣ
	private String phone;							// �ڵ��� ��ȣ
	private int storeSeq;							// ���� ��ȣ
	
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
