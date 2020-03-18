package com.company.asiayoga.product.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.company.asiayoga.item.domain.ItemVO;
import com.company.asiayoga.product.domain.ProductVO;
import com.company.asiayoga.store.domain.StoreVO;

public interface ProductService {
	
	// ��ǰ ���
	List<ProductVO> productList(ProductVO productVO)throws Exception;
	
	// ��ǰ ��� ����
	int productTotalCount(ProductVO productVO) throws Exception;
	
	// ��ǰ ���
	int insertProduct(ProductVO productVO) throws Exception;
	
	// ��ǰ ����
	int productDelete(ProductVO productVO) throws Exception;
	
	// ��ǰ ��
	ProductVO productDetail(ProductVO productVO)throws Exception;
	
	// ��ǰ ������Ʈ
	int updateProduct(ProductVO productVO) throws Exception;
	
	// ��ǰ ��� ���� �ٿ�ε�
	SXSSFWorkbook productExcelDownload(ProductVO productVO) throws Exception;
	
	// ���� ���(������ ����)
	List<StoreVO> storeSearchList(StoreVO storeVO) throws Exception;
	
	// ǰ�� ã��(������ ����, ���� ���� �� ����)
	List<ItemVO> searchItemList(ItemVO itemVO) throws Exception;
}
