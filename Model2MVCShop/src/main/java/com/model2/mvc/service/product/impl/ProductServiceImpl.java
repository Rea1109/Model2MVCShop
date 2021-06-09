package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public ProductServiceImpl() {
		System.out.println("ProductServiceImpl 기본생성자"+this.getClass());
	}
	
	public void addProduct(Product product) throws Exception {
		//productDao.insertProudct(product);
		productDao.insertProudct(product);
	}

	
	public Product getProduct(int prodNo) throws Exception {
		Product product = productDao.findProduct(prodNo);
		return product;
	}

	
	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	
	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}



}
