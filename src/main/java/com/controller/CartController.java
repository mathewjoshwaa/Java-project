// CartController.java
package com.controller;

import com.model.Cart;
import com.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @RequestMapping("/addToCart")
    public String addToCart(
            @RequestParam("productId") String productId,
            @RequestParam("productName") String productName,
            @RequestParam("productPrice") String productPrice,
            HttpSession session) {

        String userName = (String) session.getAttribute("userName");

        if (userName != null) {
            Cart cart = new Cart();
            cart.setUserName(userName);
            cart.setProductId(productId);
            cart.setProductName(productName);
            cart.setProductPrice(productPrice);

            cartService.addToCart(cart);
        }

        return "redirect:/products/list";
    }


    @GetMapping("/details")
    public String viewCart(Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");

        // Ensure the username is not null
        if (userName != null) {
            List<Cart> cartItems = cartService.getCartItems(userName);
           
            // Add the cart items to the model
            model.addAttribute("cartItems", cartItems);
            System.out.println(cartItems);
        } else {
            // If no user is logged in, handle accordingly 
            return "redirect:/login"; // want to change this accrodingly
        }

        return "cart-details";  // Redirect to the cart details JSP page
     }
    
    
    @RequestMapping("/updateQuantity")
    public String updateQuantity(@RequestParam("productId") String productId, 
                                 @RequestParam("userName") String userName,
                                 @RequestParam("action") String action) {
        // Call the service to update the quantity
        cartService.updateCartQuantity(productId, userName, action);
        
        return "redirect:/cart/details";
    }
    
    @RequestMapping("/submitOrder")
    public String submitOrder(@RequestParam("userName") String userName, RedirectAttributes redirectAttributes) {
        try {
            // Delete cart items related to the user
            cartService.deleteCartItems(userName);
            System.out.println(userName);
            
            // Add success message to be displayed on the home page
            redirectAttributes.addFlashAttribute("successMessage", "Successfully purchased!");

            // Redirect to home page
            return "redirect:/products/list"; 
        } catch (Exception e) {
            // Handle any errors that might occur
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while processing your purchase.");
            return "redirect:/cart/details"; 
        }
    }
    
    
    
    
    
    
}
