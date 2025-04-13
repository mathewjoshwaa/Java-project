// CartService.java
package com.service;

import com.model.Cart;
import com.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;
    
 // Method to find the cart item by productId and userName
    public Optional<Cart> findCartItemByProductIdAndUserName(String productId, String userName) {
        return cartRepository.findByProductIdAndUserName(productId, userName);
    }

 // Method to add or update cart item
    public void addToCart(Cart cart) {
        Optional<Cart> existingCartItem = findCartItemByProductIdAndUserName(cart.getProductId(), cart.getUserName());

        if (existingCartItem.isPresent()) {
            // Update the existing cart item if found
            Cart existingCart = existingCartItem.get();
            int currentQuantity = Integer.parseInt(existingCart.getQuantity());
            existingCart.setQuantity(String.valueOf(currentQuantity + 1));
            
            cart.setQuantity(String.valueOf(currentQuantity));
            System.out.println(currentQuantity);
            cartRepository.save(existingCart);
            
            // Saved the updated cart item
        } else {
            // Create a new cart item if not found and set value 1
            cart.setQuantity("1"); 
            cartRepository.save(cart); 
        }
    }

 // Fetch cart items for the user and group them by productId to count their occurrences
    public List<Cart> getCartItems(String userName) {
        List<Cart> cartItems = cartRepository.findByUserName(userName);

        // Create a map to group cart items by productId and count their occurrences
        Map<String, Cart> groupedItems = new HashMap<>();

        for (Cart cart : cartItems) {
            String quantity = cart.getQuantity();
            if (quantity == null || quantity.isEmpty()) {
                //quantity = "1"; // default to "1"
                cart.setQuantity(quantity);  
            }

            Cart existingCart = groupedItems.get(cart.getProductId());
            if (existingCart != null) {
                // Safely parse and increment the quantity
                int currentQuantity = Integer.parseInt(existingCart.getQuantity());
                existingCart.setQuantity(String.valueOf(currentQuantity + 1));
                cart.setQuantity(String.valueOf(currentQuantity + 1));
            } else {
                //cart.setQuantity("1");
                
                groupedItems.put(cart.getProductId(), cart);
            }
        }

        return new ArrayList<>(groupedItems.values());
    }
    
    
    
 // Update the quantity of a product in the cart (either increase or decrease)
    public void updateCartQuantity(String productId, String userName, String action) {
        Optional<Cart> cartItemOpt = cartRepository.findByProductIdAndUserName(productId, userName);
        
        if (cartItemOpt.isPresent()) {
            Cart cartItem = cartItemOpt.get();
            String quantityStr = cartItem.getQuantity();

            // Safely parse the quantity string, default to 0 if it's invalid
            int currentQuantity;
            try {
                currentQuantity = Integer.parseInt(quantityStr);
            } catch (NumberFormatException e) {
                currentQuantity = 0; // Set to default value if quantity is invalid
            }

            // Handle increase 
            if (action.equals("increase")) {
                currentQuantity += 1; // Increase by 1
                cartItem.setQuantity(String.valueOf(currentQuantity));
                System.out.println(String.valueOf(currentQuantity));
           
                cartRepository.save(cartItem);
               //handle decrease actions
            } else if (action.equals("decrease")) {
                if (currentQuantity > 1) {
                    // Decrease by 1 if quantity is greater than 1
                    currentQuantity -= 1;
                    cartItem.setQuantity(String.valueOf(currentQuantity));
                    System.out.println(String.valueOf(currentQuantity));
                    cartRepository.save(cartItem);
                } else {
                    // Remove the item if quantity is 1 and decrement is clicked
                    cartRepository.delete(cartItem);
                }
            }
        } else {
            // If the product doesn't exist in the cart, add it as a new item with default quantity 1
            Cart newCartItem = new Cart();
            newCartItem.setUserName(userName);
            newCartItem.setProductId(productId);
            newCartItem.setQuantity("1"); 

            cartRepository.save(newCartItem);
        }
    }
    @Transactional
    public void deleteCartItems(String userName) {
        cartRepository.deleteByUserName(userName);
    }


    
    
}
