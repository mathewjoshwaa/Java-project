package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Product;
import com.model.Stock;
import com.repository.StockRepository;

@Service
public class StockService {

    @Autowired
    private StockRepository stockRepository;

    public void updateStock(String productId, String qty) {
        Stock stock = stockRepository.findByProductId(productId);
        
        if (stock == null) {
           
            stock = new Stock();
            stock.setProductId(productId);
            stock.setQuantity(qty);
        } else {
            // If stock entry exists, update the quantity
            stock.setQuantity(String.valueOf(Integer.parseInt(stock.getQuantity()) +Integer.parseInt( qty)));  
        }
        
        stockRepository.save(stock);
    }
    
    public List<Stock> getAllStock(){
		return stockRepository.findAll();
	}
}