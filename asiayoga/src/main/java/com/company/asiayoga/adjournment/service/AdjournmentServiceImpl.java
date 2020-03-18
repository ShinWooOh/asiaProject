package com.company.asiayoga.adjournment.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.executor.ReuseExecutor;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.company.asiayoga.adjournment.dao.AdjournmentDAO;
import com.company.asiayoga.adjournment.domain.AdjournmentVO;
import com.company.asiayoga.member.dao.MemberDAO;
import com.company.asiayoga.member.domain.MemberVO;
import com.company.asiayoga.order.dao.OrderDAO;
import com.company.asiayoga.order.domain.OrderVO;

@Service
public class AdjournmentServiceImpl implements AdjournmentService{

	@Inject
	private AdjournmentDAO adjournmentDAO;
	
	@Inject
	private OrderDAO orderDAO;
	
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public List<AdjournmentVO> adjournmentList(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentList(adjournmentVO);
	}
	
	@Override
	public int adjournmentTotalCount(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentTotalCount(adjournmentVO);
	}
	
	@Override
	public int insertAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		
		// ���� ����
		int paramResult = 0;
		paramResult = adjournmentDAO.insertAdjournment(adjournmentVO);
		
		// ���� ���� �� ���� ���������� ��ȸ ���� update
		if(paramResult > 0){
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(adjournmentVO.getOrderSeq());
			orderVO.setModifyId(adjournmentVO.getModifyId());
			orderVO.setAdjournmentState("Y");
			paramResult = orderDAO.updateAdjournmentState(orderVO);

			// ���ų������� ��ȸ ���� ���� ������ ��� , ȸ������������ ��ȸ ���·� ����
			if(paramResult > 0) {
				MemberVO memberVO = new MemberVO();
				memberVO.setOrderSeq(adjournmentVO.getOrderSeq());
				memberVO.setAdjournmentState(orderVO.getAdjournmentState());
				memberVO.setModifyId(adjournmentVO.getModifyId());
				paramResult = memberDAO.updateAdjournmentState(memberVO);
			} else {
				paramResult = 0;
			}
		} else {
			paramResult = 0;
		}
		
		return paramResult;
	}
	
	@Transactional(rollbackFor =Exception.class)
	@Override
	public int updateAdjournmentState(AdjournmentVO adjournmentVO) throws Exception {
		
		if(adjournmentVO.getAdjournmentState().equals("Y")) {
			adjournmentVO.setAdjournmentState("N");
		}else if(adjournmentVO.getAdjournmentState().equals("N")) {
			adjournmentVO.setAdjournmentState("Y");
		}
		
		// ���� ������Ʈ
		int paramResult = 0;
		paramResult = adjournmentDAO.updateAdjournmentState(adjournmentVO);
		if(paramResult > 0){
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(adjournmentVO.getOrderSeq());
			orderVO.setAdjournmentState(adjournmentVO.getAdjournmentState());
			orderVO.setModifyId(adjournmentVO.getModifyId());
			paramResult = orderDAO.updateAdjournmentState(orderVO);

			// ���ų������� ��ȸ ���� ���� ������ ��� , ȸ������������ ��ȸ ���·� ����
			if(paramResult > 0) {
				MemberVO memberVO = new MemberVO();
				memberVO.setOrderSeq(adjournmentVO.getOrderSeq());
				memberVO.setAdjournmentState(adjournmentVO.getAdjournmentState());
				memberVO.setModifyId(adjournmentVO.getModifyId());
				paramResult = memberDAO.updateAdjournmentState(memberVO);
			} else {
				paramResult = 0;
			}
		} else {
			paramResult = 0;
		}
		
		return paramResult;
	}
	
	@Override
	public AdjournmentVO adjournmentDetail(AdjournmentVO adjournmentVO) throws Exception {
		return adjournmentDAO.adjournmentDetail(adjournmentVO);
	}
	
	@Transactional(rollbackFor =Exception.class)
	@Override
	public int updateAdjournment(AdjournmentVO adjournmentVO) throws Exception {
		
		int paramResult = 0;
		
		paramResult = adjournmentDAO.updateAdjournment(adjournmentVO);
		
		if(paramResult > 0){
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderSeq(adjournmentVO.getOrderSeq());
			orderVO.setAdjournmentState(adjournmentVO.getAdjournmentState());
			orderVO.setModifyId(adjournmentVO.getModifyId());
			paramResult = orderDAO.updateAdjournmentState(orderVO);
		} else {
			paramResult = 0;
		}
		return paramResult;
	}
	
	@Override
	public List<MemberVO> memberSearch(MemberVO memberVO) throws Exception {
		return adjournmentDAO.memberSearch(memberVO);
	}

	@Override
	public SXSSFWorkbook adjournmentExcelDownload(AdjournmentVO adjournmentVO) throws Exception {
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		
		SXSSFSheet sheet = sxssfWorkbook.createSheet("��ȸ ȸ�� ���");
		
		SXSSFRow row = null;
		SXSSFCell cell = null;
		
		List<AdjournmentVO> list = new  ArrayList<AdjournmentVO>();
		list = adjournmentDAO.adjournmentExcelDownload(adjournmentVO);
		
		row = sheet.createRow(0);
		String[] headerKey = {"No","�����","ȸ����","����ó","��ǰ��","��ȸ������","��ȸ������","����"};

		
		for(int i = 0; i < headerKey.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headerKey[i]);
		}
		
		for(int j= 0 ; j < list.size() ; j++) {
			
			row = sheet.createRow(j+1);
			AdjournmentVO vo = list.get(j);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getRowNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getStoreName());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getPhone());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getProductName());
			
			cell = row.createCell(5);
			Date startDate = vo.getAdjournmentStart();
			Timestamp startTs = new Timestamp(startDate.getTime());
			SimpleDateFormat startFormatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(startFormatter.format(startTs));
			
			cell = row.createCell(6);
			Date endDate = vo.getAdjournmentEnd();
			Timestamp endTs = new Timestamp(endDate.getTime());
			SimpleDateFormat endFormatter = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(endFormatter.format(endTs));
			
			cell = row.createCell(7);
			if(vo.getAdjournmentState().equals("Y")) {
				cell.setCellValue("��ȸ");
			} else if(vo.getAdjournmentState().equals("N")) {
				cell.setCellValue("����ȸ");
			} else {
				cell.setCellValue("");
			}
		}
		
		return sxssfWorkbook;
	}





}
