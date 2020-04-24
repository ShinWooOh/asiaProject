package com.company.asiayoga.member.domain;

import java.util.Date;

import com.company.asiayoga.store.domain.StoreVO;

public class MemberVO extends StoreVO {
	
	private int rowNum;								// 인덱스 번호
    private int attendanceSeq;
    private int memberSeq;                          // 회원 번호
    private String name;							// 회원 이름
    private String myMembership;					// 회원 등록 번호(출석 시 쓰는 번호)
    private String birth;							// 생년월일
    private String year;							// 년
    private String month;							// 월
    private String day;								// 일
    private String phone;							// 연락처
    private String phone1;							// 연락처1
    private String phone2;							// 연락처2
    private String phone3;							// 연락처3
    private String email;							// 이메일
    private String sex;								// 성별
    private Date joinDate;	              			// 가입일
    private String memo;							// 메모
    private Date attendanceDate;              		// 출석 일자
    private Date registerDate;                 		// 등록 일자
    private String registerId;                      // 등록자 아이디
    private Date modifyDate;                  	 	// 수정 일자
    private String modifyId;                        // 수정자 아이디
    private String delYn;                           // 삭제여부
    private String adjournmentState;				// 휴회 여부
    
    private int productSeq;							// 상품 번호
    private String productName;						// 상품명
    private String productCode;						// 상품코드
    private Date productEndDay;						// 기간제 상품일 경우 종료일
    private int orderSeq;							// 주문 번호
    private int itemSeq;							// 품목 번호
    private String itemName;						// 품목명
    private int productCount;						// 등록 횟수
    private int remainingCount;						// 잔여 횟수
    private String authority;						// 권한
    private int totalMember;						// 전체회원
    private int newDayMember;						// 금일 신규 가입자
    private int newWeekMember;						// 금주 신규 가입자
    private int newMonthMember;						// 금월 신규 가입자
    private int adjournmentYes;						// 휴회 회원 수
    private int adjournmentNo;						// 미휴회 회원 수
    private int newDayAdjournment;					// 금일 휴회 회원
    private int newWeekAdjournment;					// 금주 휴회 회원
    private int newMonthAdjournment;				// 금월 휴회 회원
    private int thisMonth;							// 이번달
    private Date startDay;							// 시작일
    private Date expirationDay;						// 만료일
    private int productPrice;						// 상품 가격
    private int customerPrice;						// 고객 구매 가격
    
	
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
