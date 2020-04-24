package com.company.asiayoga.member.domain;

import java.util.Date;

import com.company.asiayoga.store.domain.StoreVO;

public class MemberVO extends StoreVO {
	
	private int rowNum;								// �ε��� ��ȣ
    private int attendanceSeq;
    private int memberSeq;                          // ȸ�� ��ȣ
    private String name;							// ȸ�� �̸�
    private String myMembership;					// ȸ�� ��� ��ȣ(�⼮ �� ���� ��ȣ)
    private String birth;							// �������
    private String year;							// ��
    private String month;							// ��
    private String day;								// ��
    private String phone;							// ����ó
    private String phone1;							// ����ó1
    private String phone2;							// ����ó2
    private String phone3;							// ����ó3
    private String email;							// �̸���
    private String sex;								// ����
    private Date joinDate;	              			// ������
    private String memo;							// �޸�
    private Date attendanceDate;              		// �⼮ ����
    private Date registerDate;                 		// ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                  	 	// ���� ����
    private String modifyId;                        // ������ ���̵�
    private String delYn;                           // ��������
    private String adjournmentState;				// ��ȸ ����
    
    private int productSeq;							// ��ǰ ��ȣ
    private String productName;						// ��ǰ��
    private String productCode;						// ��ǰ�ڵ�
    private Date productEndDay;						// �Ⱓ�� ��ǰ�� ��� ������
    private int orderSeq;							// �ֹ� ��ȣ
    private int itemSeq;							// ǰ�� ��ȣ
    private String itemName;						// ǰ���
    private int productCount;						// ��� Ƚ��
    private int remainingCount;						// �ܿ� Ƚ��
    private String authority;						// ����
    private int totalMember;						// ��üȸ��
    private int newDayMember;						// ���� �ű� ������
    private int newWeekMember;						// ���� �ű� ������
    private int newMonthMember;						// �ݿ� �ű� ������
    private int adjournmentYes;						// ��ȸ ȸ�� ��
    private int adjournmentNo;						// ����ȸ ȸ�� ��
    private int newDayAdjournment;					// ���� ��ȸ ȸ��
    private int newWeekAdjournment;					// ���� ��ȸ ȸ��
    private int newMonthAdjournment;				// �ݿ� ��ȸ ȸ��
    private int thisMonth;							// �̹���
    private Date startDay;							// ������
    private Date expirationDay;						// ������
    private int productPrice;						// ��ǰ ����
    private int customerPrice;						// �� ���� ����
    
	
    public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getAttendanceSeq() {
		return attendanceSeq;
	}
	public void setAttendanceSeq(int attendanceSeq) {
		this.attendanceSeq = attendanceSeq;
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMyMembership() {
		return myMembership;
	}
	public void setMyMembership(String myMembership) {
		this.myMembership = myMembership;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
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
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
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
	public Date getProductEndDay() {
		return productEndDay;
	}
	public void setProductEndDay(Date productEndDay) {
		this.productEndDay = productEndDay;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(int itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getRemainingCount() {
		return remainingCount;
	}
	public void setRemainingCount(int remainingCount) {
		this.remainingCount = remainingCount;
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
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getExpirationDay() {
		return expirationDay;
	}
	public void setExpirationDay(Date expirationDay) {
		this.expirationDay = expirationDay;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getCustomerPrice() {
		return customerPrice;
	}
	public void setCustomerPrice(int customerPrice) {
		this.customerPrice = customerPrice;
	}
	
}
