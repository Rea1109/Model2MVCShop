package com.model2.mvc.web.product;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println("ProductController 기본생성자 시작...");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping("/addProduct")
	public String addProduct(@ModelAttribute("product") Product product, MultipartFile file,
												HttpServletRequest request,Model model) throws Exception {
		
		System.out.println("addProduct");
		
		String originalFilename = file.getOriginalFilename();
		
//		request.getServletContext().getRealPath("/images/uploadFiles"+"/"+originalFilename);
		
//		file.transferTo(new File("C:\\workspace\\Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\"+originalFilename));
		file.transferTo(new File(request.getServletContext().getRealPath("/images/uploadFiles"+"/"+originalFilename)));
		
		product.setFileName(originalFilename);
		
		productService.addProduct(product);
		System.out.println(product);
		
		model.addAttribute("product", product);
		
		return "forward:/product/addProduct.jsp";
	}
	
//	@RequestMapping("/listProduct.do")
	@RequestMapping(value ="listProduct")
	public String listProduct(@ModelAttribute("search") Search search,
							@RequestParam("menu") String menu,
							 Model model ) throws Exception {
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = productService.getProductList(search);
		
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue()
								,pageUnit,search.getPageSize());
		
		System.out.println("****************"+map.get("list"));
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("menu",menu);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value="getProduct")
	public String getProduct(@RequestParam("menu") String menu
							,@RequestParam("prodNo") int prodNo, Model model
							, HttpServletResponse response
							, HttpServletRequest request) throws Exception {
		
		System.out.println("/getProduct");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		model.addAttribute("menu",menu);
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null ) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if(cookie.getName().equals("history")) {
					Cookie cookie2 = new Cookie("history",cookie.getValue()+","+Integer.toString(prodNo));
					cookie2.setPath("/");
					response.addCookie(cookie2);
				}else {
					Cookie cookie2 = new Cookie("history",Integer.toString(prodNo));
					cookie2.setPath("/");
					response.addCookie(cookie2);
				}
			}
			
		}
	
		if(menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp";
		}else {
			return "forward:/product/getProduct.jsp";
		}
		
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product, MultipartFile file, 
								HttpServletRequest request,Model model) throws Exception {
		
		System.out.println("/updateProduct");
		
		String originalFilename = file.getOriginalFilename();
		
		file.transferTo(new File(request.getServletContext().getRealPath("/images/uploadFiles"+"/"+originalFilename)));
		
		product.setFileName(originalFilename);
		
		productService.updateProduct(product);
		
		Product resultProduct = productService.getProduct(product.getProdNo());
		
		model.addAttribute("product", resultProduct);
		model.addAttribute("menu","manage");
		
		return "forward:/product/getProduct.jsp";
	}
	
}
