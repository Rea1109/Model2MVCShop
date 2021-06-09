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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public PurchaseController() {
		System.out.println("PurchaseController 기본생성자 시작....");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping("updatePurchase")
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase,
								@RequestParam("tranNo") int tranNo) throws Exception {
		
		System.out.println("/updatePurchase");
		
		purchase.setTranNo(tranNo);
		
		purchaseService.updatePurcahse(purchase);
		
		return "redirect:/purchase/listPurchase";
	}
	
	@RequestMapping("addPurchase")
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase,
							@RequestParam("prodNo") int prodNo,
							@RequestParam("buyerId") String userId,
							Model model) throws Exception {
		
		System.out.println("/addPurchase");
		
		Product product = new Product();
		User user = new User();
		
		product.setProdNo(prodNo);
		user.setUserId(userId);
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping("updatePurchaseView")
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo
									,Model model) throws Exception {
		
		System.out.println("updatePurchase");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping("getPurchase")
	public String getPurchase(@RequestParam("tranNo") int tranNo,
							Model model) throws Exception {
		
		System.out.println("getPurchase");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping("addPurchaseView")
	public String addPurchaseView(@RequestParam("prodNo") int prodNo,
								HttpSession session, Model model) throws Exception {
		
		System.out.println("addPurchasView");
		Product product = productService.getProduct(prodNo);
		User dbUser = (User)session.getAttribute("user");
		
		model.addAttribute("product", product);
		model.addAttribute("user",dbUser);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	@RequestMapping("updateTranCode")
	public String updateTranCode(@RequestParam("prodNo") int prodNo,
								@RequestParam("tranCode") String tranCode,
								HttpSession session) throws Exception {
		
		System.out.println("updateTranCode");
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		product.setProdNo(prodNo);
		purchase.setTranCode(tranCode);
		purchase.setPurchaseProd(product);
		
		purchaseService.updateTranCode(purchase);
		
		User dbUser = (User)session.getAttribute("user");
		System.out.println(dbUser.getRole());
		
		if(dbUser.getRole().equals("admin")) {
			return "redirect:/product/listProduct?menu=manage";
		}else {
			return "redirect:/purchase/listPurchase";
		}
		
	}
	
	@RequestMapping("listPurchase")
	public String listPurchas(@ModelAttribute("search") Search search,
								HttpSession session, Model model) throws Exception {
		
		System.out.println("listPurchase");
		
		User user = (User)session.getAttribute("user");
		String buyerId = user.getUserId();
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getPurchaseList(search, buyerId);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue()
				,pageUnit,search.getPageSize());
		
		System.out.println("********************"+map.get("list"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping("listSale")
	public String listSale(@ModelAttribute("search") Search search,
								 Model model) throws Exception {
		
		System.out.println("listSale");
		
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getSaleList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue()
				,pageUnit,search.getPageSize());
		
		System.out.println("********************"+map.get("list"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listSale.jsp";
	}
	
	@RequestMapping("deletePurchase")
	public String deletePurchase(@RequestParam("prodNo") int prodNo) throws Exception {
		
		System.out.println("deletePurchase");
		
		purchaseService.deletePurchase(prodNo);
		
		return "redirect:/purchase/listSale";
	}

}
