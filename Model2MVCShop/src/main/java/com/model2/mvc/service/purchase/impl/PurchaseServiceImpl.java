package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}


	public PurchaseServiceImpl() {
		System.out.println("PurchaseServiceImpl 기본생성자"+this.getClass());
	}

	
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.insertPurchase(purchase);
	}

	
	public Purchase getPurchase(int tranNo) throws Exception {
		
		return purchaseDao.findPurchase(tranNo);
	}

	
	public Purchase getPurchase2(int ProdNo) throws Exception {
		
		return null;
	}

	
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		
		List<Purchase> list = purchaseDao.getPurchaseList(search,buyerId);
		int totalCount = purchaseDao.getTotalCount(buyerId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public Map<String, Object> getSaleList(Search search) throws Exception {
		
		List<Purchase> list = purchaseDao.getSaleList(search);
		int totalCount = purchaseDao.getSaleCount();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	
	public void updatePurcahse(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);

	}

	
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);

	}


	@Override
	public void deletePurchase(int prodNo) throws Exception {
		purchaseDao.deletePurchase(prodNo);
		
	}


}
