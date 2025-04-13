package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.model.Stock;


@Repository
@Component
public interface StockRepository extends JpaRepository<Stock, String> {
    Stock findByProductId(String productId);
}