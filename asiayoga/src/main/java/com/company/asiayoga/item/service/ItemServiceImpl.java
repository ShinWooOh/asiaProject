package com.company.asiayoga.item.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.asiayoga.item.dao.ItemDAO;
import com.company.asiayoga.item.domain.ItemVO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ItemDAO itemDAO;
	
	@Override
	public List<ItemVO> itemList(ItemVO itemVO) throws Exception {
		return itemDAO.itemList(itemVO);
	}

	@Override
	public int insertItem(ItemVO itemVO) throws Exception {
		return itemDAO.insertItem(itemVO);
	}

	@Override
	public int itemDelete(ItemVO itemVO) throws Exception {
		return itemDAO.itemDelete(itemVO);
	}

	@Override
	public ItemVO itemDetail(ItemVO itemVO) throws Exception {
		return itemDAO.itemDetail(itemVO);
	}

	@Override
	public int updateItem(ItemVO itemVO) throws Exception {
		return itemDAO.updateItem(itemVO);
	}

}
