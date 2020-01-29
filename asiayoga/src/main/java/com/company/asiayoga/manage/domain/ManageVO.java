package com.company.asiayoga.manage.domain;

import java.util.Date;

public class ManageVO {
	
	private int manageSeq;							// ������ ��ȣ
	private String id;								// ���̵�
	private String passwd;							// ��й�ȣ
	private String name;							// �̸�
	private String authority;						// ����
	private int failreCount;						// �α��� ���� Ƚ��
	private boolean enabled;						// Ȱ��ȭ ����
	private Date accessDate;						// ���� ����
	private int storeSeq;							// ���� ��ȣ
	private String storeName;						// �����
	private String useYn;							// ���� ����
    private Date registerDate;                      // ��� ����
    private String registerId;                      // ����� ���̵�
    private Date modifyDate;                        // ���� ����
    private String modifyId;                        // ������ ���̵�
    
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
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
	@Override
	public String toString() {
		return "ManageVO [manageSeq=" + manageSeq + ", id=" + id + ", passwd=" + passwd + ", name=" + name
				+ ", authority=" + authority + ", failreCount=" + failreCount + ", enabled=" + enabled + ", accessDate="
				+ accessDate + ", storeSeq=" + storeSeq + ", storeName=" + storeName + ", useYn=" + useYn
				+ ", registerDate=" + registerDate + ", registerId=" + registerId + ", modifyDate=" + modifyDate
				+ ", modifyId=" + modifyId + ", getManageSeq()=" + getManageSeq() + ", getId()=" + getId()
				+ ", getPasswd()=" + getPasswd() + ", getName()=" + getName() + ", getAuthority()=" + getAuthority()
				+ ", getFailreCount()=" + getFailreCount() + ", isEnabled()=" + isEnabled() + ", getAccessDate()="
				+ getAccessDate() + ", getStoreSeq()=" + getStoreSeq() + ", getStoreName()=" + getStoreName()
				+ ", getUseYn()=" + getUseYn() + ", getRegisterDate()=" + getRegisterDate() + ", getRegisterId()="
				+ getRegisterId() + ", getModifyDate()=" + getModifyDate() + ", getModifyId()=" + getModifyId()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}
