package com.company.asiayoga.member.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.asiayoga.member.dao.MemberDAO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<MemberVO> memberList(MemberVO memberVO) throws Exception {
		return memberDAO.memberList(memberVO);
	}
	
	@Override
	public int memberTotalCount(MemberVO memberVO) throws Exception {
		return memberDAO.memberTotalCount(memberVO);
	}

	@Override
	public MemberVO memberDetail(MemberVO memberVO) throws Exception {
		return memberDAO.memberDetail(memberVO);
	}

	@Override
	public int memberInsert(MemberVO memberVO){
		
		int memberSeq = 0;
		int result = 0;
		OrderVO orderVO = new OrderVO();

		// 회원 등록
		memberSeq = memberDAO.memberInsert(memberVO);
		
		// 신규 회원 등록 시 회원 등록 후 상품 등록 
		if(memberSeq != 0) {
			orderVO.setStoreSeq(memberVO.getStoreSeq());
			orderVO.setProductSeq(memberVO.getProductSeq());
			orderVO.setMemberSeq(memberVO.getMemberSeq());
			orderVO.setStartDay(memberVO.getStartDay());
			orderVO.setExpirationDay(memberVO.getExpirationDay());
			orderVO.setProductCount(0);
			orderVO.setProductPrice(memberVO.getProductPrice());
			orderVO.setCustomerPrice(memberVO.getCustomerPrice());
			orderVO.setOrderMemo(memberVO.getMemo());
			orderVO.setLockerSeq(0);
			orderVO.setRegisterId(memberVO.getRegisterId());
			result = orderDAO.insertOrder(orderVO);
		}
		
		return result;
	}

	@Transactional
	@Override
	public int memberDel(MemberVO memberVO) throws Exception {
		return memberDAO.memberDel(memberVO);
	}

	@Transactional
	@Override
	public int memberEdit(MemberVO memberVO) throws Exception {
		return memberDAO.memberEdit(memberVO);
	}

	@Override
	public List<MemberVO> searchMemberList(MemberVO memberVO) throws Exception {
		return memberDAO.searchMemberList(memberVO);
	}
	
	@Override
	public SXSSFWorkbook memberExcelDownload(MemberVO memberVO) throws Exception{
		
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("회원 목록");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<MemberVO> list = new  ArrayList<MemberVO>();
		list = memberDAO.memberExcelDown(memberVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","회원번호","매장명","회원명","생년웡일","연락처","이메일","성별","휴회여부","가입일"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			MemberVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getMyMembership());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getBirth());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getEmail());
			
			cell = row.createCell(7);
			if(vo.getSex().equals("M")) {
				cell.setCellValue("남");
			} else if(vo.getSex().equals("W")) {
				cell.setCellValue("여");
			} else {
				cell.setCellValue("");
			}
			
			cell = row.createCell(8);
			if(vo.getAdjournmentState().equals("N")) {
				cell.setCellValue("미휴회");
			} else if(vo.getAdjournmentState().equals("Y")) {
				cell.setCellValue("휴회");
			} else {
				cell.setCellValue("");
			}

			cell = row.createCell(9);
			Date date = vo.getJoinDate();
			Timestamp ts = new Timestamp(date.getTime());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(formatter.format(ts));
		}
		
		return sxssfWorkbook;
	}

	@Override
	public List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception {
		return memberDAO.storeSearchList(storeVO);
	}

	@Override
	public List<ProductVO> searchProductList(ProductVO productVO) throws Exception {
		return memberDAO.searchProductList(productVO);
	}
	
	@Transactional
	@Override
	public int updateAdjournmentState(MemberVO memberVO) throws Exception {
		return memberDAO.updateAdjournmentState(memberVO);
	}

	@Override
	public MemberVO memberStatistics(MemberVO memberVO) throws Exception {
		return memberDAO.memberStatistics(memberVO);
	}

	@Override
	public int myMembershipDupCheck(MemberVO memberVO) throws Exception {
		return memberDAO.myMembershipDupCheck(memberVO);
	}

	
	
	

}
