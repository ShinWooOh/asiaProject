package com.company.asiayoga.common.domain;

public class PagingVO {
	
	private int totalRow =10;					// 전체 행 갯수
	private int totalCount;						// 전체 갯수
	private String searchWord;					// 검색어
	private int pageNum = 1;					// 현재페이지번호
	private int pageRow = 0;					// 현재페이지행(5페이지 기준 , 1~5 > 1행 / 6~10 2행)
	private int totalPage;						// 전체페이지  (글이 112개 있으면 10개씩 묶음 기준 전체 페이지는12페이지)
	private int startPage = 1;					// 시작페이지
	private int endPage = 0;					// 마지막페이지
	private int paramPage=0;					// 쿼리에서 offset 에서 쓰임
	
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
