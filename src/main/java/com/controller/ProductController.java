package com.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Product;
import com.model.Stock;
import com.service.ProductService;
import com.service.StockService;

@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
    private StockService stockService;
	
	public ProductService getProductService() {
		return productService;
	}
	
	public void setProductService(ProductService productService) {
		this.productService=productService;
	}
	
	@RequestMapping("/new")
	public String showNewProductForm(Model model) {
		Product product = new Product();
		model.addAttribute("product",product);
		  
		return "create-product";
	}
	
	@RequestMapping("/save")
	public String saveProduct(@ModelAttribute("product")Product product,
							  @RequestParam("pic1") MultipartFile pic) throws IOException {
		
		if (pic != null && !pic.isEmpty()) {
    		
            System.out.println("Image Name: " + pic.getOriginalFilename());
            System.out.println("Image Size: " + pic.getSize());
            System.out.println("Image Type: " + pic.getContentType());

            product.setPic(pic.getBytes()); // Convert image to byte array
            product.setPicContentType(pic.getContentType());
  
        } else {
            System.out.println("No image uploaded");
        }
		 
		productService.saveProduct(product);
		//stockService.updateStock(product.getId(), product.getQty());
		stockService.updateStock(product.getPid(),product.getQty());
		return "redirect:/products/alter";
	}
	
//	@RequestMapping("/list")
//	public String listProducts(Model model) {
//		List<Product> products=productService.getAllProducts();
//		List<Stock> stocks=stockService.getAllStock();
//		model.addAttribute("products", products);
//		model.addAttribute("stocks", stocks);
//		
//		return "list-products";
//	}
	
	
	@RequestMapping("/list")
	public String listProducts(Model model) {
	    List<Product> products = productService.getAllProducts();
	    List<Stock> stocks = stockService.getAllStock();
	    
	    // Use a Set to filter out duplicate products based on pid
	    Set<String> seenProductIds = new HashSet<>();
	    List<Product> uniqueProducts = new ArrayList<>();
	    
	    for (Product product : products) {
	        if (!seenProductIds.contains(product.getPid())) {
	            seenProductIds.add(product.getPid());
	            uniqueProducts.add(product);
	        }
	    }
	    
	    // Iterate through the unique products and match with the stock using productId
	    for (Product product : uniqueProducts) {
	        for (Stock stock : stocks) {
	            if (product.getPid().equals(stock.getProductId())) {
	                // If the product pid matches the stock productId, add both to the model
	                model.addAttribute("product", product);
	                model.addAttribute("stock", stock);
	                break;
	            }
	        }
	    }

	    // Send the unique products and stock data to the JSP view
	    model.addAttribute("products", uniqueProducts);
	    model.addAttribute("stocks", stocks);
	    
	    return "list-products";
	}

	
	
	@RequestMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }
	
	
	@RequestMapping("/authenticate")
	public String authenticateAdmin(@RequestParam("username") String username, 
	                                @RequestParam("password") String password, 
	                                Model model) {
	    if ("Admin".equals(username) && "Admin123".equals(password)) {
	        return "redirect:/products/alter";
	    } else {
	        model.addAttribute("error", "Invalid username or password");
	        return "login";
	    }
	}
	

	
	@RequestMapping("/alter")
	public String alter(Model model) {
		List<Product> products=productService.getAllProducts();
		
		//Product product = new Product();
       // product.setDate(LocalDate.now().toString());  // Set current date
		model.addAttribute("products", products);
		System.out.println(products);
		return "alter-product";
	}
	
	@RequestMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "edit-product"; // View for editing student
    }

	@RequestMapping("/update/{id}")
	public String updateProduct(@PathVariable("id") Long id,
	                             @ModelAttribute("product") Product product,
	                             @RequestParam("pic1") MultipartFile image) throws IOException {
	    if (image != null && !image.isEmpty()) {
	    	 product.setPic(image.getBytes()); // Convert image to byte array
	    }
	    product.setId(id); 
	    productService.saveProduct(product); 
	    return "redirect:/products/alter"; 
	}
	
	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable("id") Long id) {
	    productService.deleteProduct(id);
	    return "redirect:/products/alter"; 
	}
	
	@RequestMapping("/view/{id}")
	public String viewProduct(@PathVariable("id") Long id, Model model) {
	    Product product = productService.getProductById(id); 
	    model.addAttribute("product", product); 
	    return "view-product"; 
	}

	
}
