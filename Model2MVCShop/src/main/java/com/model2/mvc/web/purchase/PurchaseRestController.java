package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public PurchaseRestController() {
		System.out.println("PurchaseController 기본생성자 시작....");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
//	@RequestMapping("updatePurchase")
//	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase,
//								@RequestParam("tranNo") int tranNo) throws Exception {
//		
//		System.out.println("/updatePurchase");
//		
//		purchase.setTranNo(tranNo);
//		
//		purchaseService.updatePurcahse(purchase);
//		
//		return "redirect:/purchase/listPurchase";
//	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}",method=RequestMethod.GET)
	public Purchase addPurchase( @PathVariable int tranNo) throws Exception {
		
		System.out.println("/product/json/getPurchase : GET");
		
		return purchaseService.getPurchase(tranNo);
	}
	

	
//	@RequestMapping("getPurchase")
//	public String getPurchase(@RequestParam("tranNo") int tranNo,
//							Model model) throws Exception {
//		
//		System.out.println("getPurchase");
//		
//		Purchase purchase = purchaseService.getPurchase(tranNo);
//		
//		model.addAttribute("purchase", purchase);
//		
//		return "forward:/purchase/getPurchase.jsp";
//	}
	
	
//	@RequestMapping("updateTranCode")
//	public String updateTranCode(@RequestParam("prodNo") int prodNo,
//								@RequestParam("tranCode") String tranCode,
//								HttpSession session) throws Exception {
//		
//		System.out.println("updateTranCode");
//		
//		Purchase purchase = new Purchase();
//		Product product = new Product();
//		product.setProdNo(prodNo);
//		purchase.setTranCode(tranCode);
//		purchase.setPurchaseProd(product);
//		
//		purchaseService.updateTranCode(purchase);
//		
//		User dbUser = (User)session.getAttribute("user");
//		System.out.println(dbUser.getRole());
//		
//		if(dbUser.getRole().equals("admin")) {
//			return "redirect:/product/listProduct?menu=manage";
//		}else {
//			return "redirect:/purchase/listPurchase";
//		}
//		
//	}

}
