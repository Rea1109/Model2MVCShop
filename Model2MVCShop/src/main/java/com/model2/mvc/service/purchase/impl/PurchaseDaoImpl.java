package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public PurchaseDaoImpl() {
		System.out.println("PurchaseDaoImpl 기본 생성자"+this.getClass());
	}
	
	public Purchase findPurchase(int tranNo) {
		
		return sqlSession.selectOne("PurchaseMapper.getPurchase",tranNo);
	}

	
	public void insertPurchase(Purchase purchase) {
		
		sqlSession.insert("PurchaseMapper.insertPurchase",purchase);

	}

	
	public List<Purchase> getPurchaseList(Search search, String buyerId) {
		
		Map<String, Object>map = new HashMap<String,Object>();
		map.put("endRowNum", search.getEndRowNum());
		map.put("startRowNum", search.getStartRowNum());
		map.put("buyerId", buyerId);
		
		System.out.println(map);
		
		return sqlSession.selectList("PurchaseMapper.getPurchaseList",map);
	}
	
	public List<Purchase> getSaleList(Search search) {
		
		Map<String, Object>map = new HashMap<String,Object>();
		map.put("endRowNum", search.getEndRowNum());
		map.put("startRowNum", search.getStartRowNum());
		
		System.out.println(map);
		return sqlSession.selectList("PurchaseMapper.getSaleList", map);
	}	

	
	public void updatePurchase(Purchase purchase) {
		sqlSession.update("PurchaseMapper.updatePurchase",purchase);
	}

	
	public void updateTranCode(Purchase purchase) {
		sqlSession.update("PurchaseMapper.updateTranCode",purchase);
	}

	
	public int getTotalCount(String buyerId) {
		
		System.out.println(buyerId);
		return sqlSession.selectOne("PurchaseMapper.getTotalCount",buyerId);
	}
	
	public int getSaleCount() {

		return sqlSession.selectOne("PurchaseMapper.getTotalCount");
	}
	
	public void deletePurchase(int prodNo) {
		
		sqlSession.delete("PurchaseMapper.deletePurchase", prodNo);
		sqlSession.delete("ProductMapper.deleteProduct", prodNo);
	}


}
