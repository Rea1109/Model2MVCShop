package com.model2.mvc.service.purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public interface PurchaseDao {
	
	
	public Purchase findPurchase(int tranNo);
	
	public void insertPurchase(Purchase purchase);
	
	public List<Purchase> getPurchaseList(Search search, String BuyerId);
	
	public List<Purchase> getSaleList(Search search);
	
	public void updatePurchase(Purchase purchase);
	
	public void updateTranCode(Purchase purchase);

	public int getTotalCount(String buyerId);

	public int getSaleCount();
	
	public void deletePurchase(int prodNo);
}
