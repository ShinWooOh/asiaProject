package com.company.asiayoga.statistics.domain;

import com.company.asiayoga.common.domain.PagingVO;

public class StatisticsVO extends PagingVO {
	
	private int rowNum;
	private int storeSeq;							// �����ȣ
    private String authority;						// ����
    private int totalMember;						// ��üȸ��
    private int newDayMember;						// ���� �ű� ������
    private int newWeekMember;						// ���� �ű� ������
    private int newMonthMember;						// �ݿ� �ű� ������
    private int newYearMember;						// �ݳ� �ű� ������
    private int adjournmentYes;						// ��ȸ ȸ�� ��
    private int adjournmentNo;						// ����ȸ ȸ�� ��
    private int newDayAdjournment;					// ���� ��ȸ ȸ��
    private int newWeekAdjournment;					// ���� ��ȸ ȸ��
    private int newMonthAdjournment;				// �ݿ� ��ȸ ȸ��
    private int thisMonth;							// �̹��� 
    private int thisYear;							// ����
    private int attendanceYesCount;					// ���� �⼮ ��
    private int attendanceNoCount;					// ���� ���⼮ ��
    
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getTotalMember() {
		return totalMember;
	}
	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}
	public int getNewDayMember() {
		return newDayMember;
	}
	public void setNewDayMember(int newDayMember) {
		this.newDayMember = newDayMember;
	}
	public int getNewWeekMember() {
		return newWeekMember;
	}
	public void setNewWeekMember(int newWeekMember) {
		this.newWeekMember = newWeekMember;
	}
	public int getNewMonthMember() {
		return newMonthMember;
	}
	public void setNewMonthMember(int newMonthMember) {
		this.newMonthMember = newMonthMember;
	}
	public int getNewYearMember() {
		return newYearMember;
	}
	public void setNewYearMember(int newYearMember) {
		this.newYearMember = newYearMember;
	}
	public int getAdjournmentYes() {
		return adjournmentYes;
	}
	public void setAdjournmentYes(int adjournmentYes) {
		this.adjournmentYes = adjournmentYes;
	}
	public int getAdjournmentNo() {
		return adjournmentNo;
	}
	public void setAdjournmentNo(int adjournmentNo) {
		this.adjournmentNo = adjournmentNo;
	}
	public int getNewDayAdjournment() {
		return newDayAdjournment;
	}
	public void setNewDayAdjournment(int newDayAdjournment) {
		this.newDayAdjournment = newDayAdjournment;
	}
	public int getNewWeekAdjournment() {
		return newWeekAdjournment;
	}
	public void setNewWeekAdjournment(int newWeekAdjournment) {
		this.newWeekAdjournment = newWeekAdjournment;
	}
	public int getNewMonthAdjournment() {
		return newMonthAdjournment;
	}
	public void setNewMonthAdjournment(int newMonthAdjournment) {
		this.newMonthAdjournment = newMonthAdjournment;
	}
	public int getThisMonth() {
		return thisMonth;
	}
	public void setThisMonth(int thisMonth) {
		this.thisMonth = thisMonth;
	}
	public int getThisYear() {
		return thisYear;
	}
	public void setThisYear(int thisYear) {
		this.thisYear = thisYear;
	}
	public int getAttendanceYesCount() {
		return attendanceYesCount;
	}
	public void setAttendanceYesCount(int attendanceYesCount) {
		this.attendanceYesCount = attendanceYesCount;
	}
	public int getAttendanceNoCount() {
		return attendanceNoCount;
	}
	public void setAttendanceNoCount(int attendanceNoCount) {
		this.attendanceNoCount = attendanceNoCount;
	}
}
