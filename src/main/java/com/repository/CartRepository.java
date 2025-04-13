
package com.repository;

import com.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findByUserName(String userName);
    Optional<Cart> findByProductIdAndUserName(String productId, String userName);
    
    
    void deleteByUserName(String userName);
    
}
