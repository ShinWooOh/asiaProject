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

import com.company.asiayoga.member.dao.MemberDAO;
import com.company.asiayoga.member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;

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
	public int memberInsert(MemberVO memberVO) throws Exception {
		return memberDAO.memberInsert(memberVO);
	}

	@Override
	public int memberDel(MemberVO memberVO) throws Exception {
		return memberDAO.memberDel(memberVO);
	}

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
		String[] headerKey = {"No","회원명","생년웡일","연락처","이메일","성별","휴회여부","가입일"};

		
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
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getBirth());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getEmail());
			
			cell = row.createCell(5);
			if(vo.getSex().equals("M")) {
				cell.setCellValue("남");
			} else if(vo.getSex().equals("W")) {
				cell.setCellValue("여");
			} else {
				cell.setCellValue("");
			}
			
			cell = row.createCell(6);
			if(vo.getAdjournmentState().equals("N")) {
				cell.setCellValue("미휴회");
			} else if(vo.getAdjournmentState().equals("Y")) {
				cell.setCellValue("휴회");
			} else {
				cell.setCellValue("");
			}

			cell = row.createCell(7);
			Date date = vo.getRegisterDate();
			Timestamp ts = new Timestamp(date.getTime());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(formatter.format(ts));
		}
		
		return sxssfWorkbook;
	}
	

}
