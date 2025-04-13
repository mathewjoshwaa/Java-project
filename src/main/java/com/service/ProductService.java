package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repository.ProductRepository;
import com.model.Product;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public ProductRepository getProductRepository() {
		return productRepository;
	}
	
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository=productRepository;
	}
	
	public List<Product> getAllProducts(){
		return productRepository.findAll();
	}
	public void saveProduct(Product product) {
		productRepository.save(product);
	}
	public Product getProductById(Long id) {
		return productRepository.findById(id).orElse(null);
	}
	public void deleteProduct(Long id) {
		productRepository.deleteById(id);
	}

}
