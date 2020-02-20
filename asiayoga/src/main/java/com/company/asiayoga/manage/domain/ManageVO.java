package com.company.asiayoga.manage.domain;

import java.util.Date;

import com.company.asiayoga.common.domain.PagingVO;

public class ManageVO extends PagingVO {
	
	private int manageSeq;							// ������ ��ȣ
	private String id;								// ���̵�
	private String passwd;							// ��й�ȣ
	private String name;							// �̸�
	private String phone;							// ����ó
	private int manageGroupSeq;						// ���� ��ȣ
	private String authority;						// ����(����)
	private String authorityName;					// ����(�ѱ�)
	private int failreCount;						// �α��� ���� Ƚ��
	private boolean enabled;						// Ȱ��ȭ ����
	private String memo;							// �޸�
	private Date accessDate;						// ���� ����
	private int storeSeq;							// ���� ��ȣ
	private String storeName;						// �����
	private String useYn;							// ���� ����
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
    
    private int rowNum;								// ��ȣ
    private String phone1;							// �޴��� ��ȣ 1
    private String phone2;							// �޴��� ��ȣ 2
    private String phone3;							// �޴��� ��ȣ 3
    private String groupName;						// ���޸�
    
	public int getManageSeq() {
		return manageSeq;
	}
	public void setManageSeq(int manageSeq) {
		this.manageSeq = manageSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	public int getManageGroupSeq() {
		return manageGroupSeq;
	}
	public void setManageGroupSeq(int manageGroupSeq) {
		this.manageGroupSeq = manageGroupSeq;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	public int getFailreCount() {
		return failreCount;
	}
	public void setFailreCount(int failreCount) {
		this.failreCount = failreCount;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
}
