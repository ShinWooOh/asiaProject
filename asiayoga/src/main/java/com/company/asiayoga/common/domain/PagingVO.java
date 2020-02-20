package com.company.asiayoga.common.domain;

public class PagingVO {
	
	private int totalRow =10;					// ��ü �� ����
	private int totalCount;						// ��ü ����
	private String searchWord;					// �˻���
	private int pageNum = 1;					// ������������ȣ
	private int pageRow = 0;					// ������������(5������ ���� , 1~5 > 1�� / 6~10 2��)
	private int totalPage;						// ��ü������  (���� 112�� ������ 10���� ���� ���� ��ü ��������12������)
	private int startPage = 1;					// ����������
	private int endPage = 0;					// ������������
	private int paramPage=0;					// �������� offset ���� ����
	
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getParamPage() {
		return paramPage;
	}
	public void setParamPage(int paramPage) {
		this.paramPage = paramPage;
	}
}
