package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.model.User;
import com.service.UserService;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Show the registration page
    @RequestMapping("/register")
    public String showRegistrationForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "cust-regist";
    }

    // Handle user registration
    @RequestMapping("/save")
    public String registerUser(@ModelAttribute("user") User user) {
        userService.registerUser(user);  
        return "redirect:/users/login";
    }

    // Show the login page
    @RequestMapping("/login")
    public String showLoginPage() {
        return "cust-login";
    }

     //Handle user login
    @RequestMapping("/authenticate")
    public String authenticateUser(@RequestParam("username") String username, 
                                   @RequestParam("password") String password, 
                                   Model model,HttpSession session) {
        boolean isValid = userService.verifyUser(username, password);
        
        if (isValid) {
            // Redirect to the user dashboard or home page upon successful login
        	session.setAttribute("userName", username);
            return "redirect:/products/list";
        } else {
            // Add an error message if authentication fails
            model.addAttribute("error", "Invalid username or password");
            return "cust-login";
        }
    }

    @RequestMapping("/cust-login")
    public String showCustLoginPage() {
        return "cust-login"; 
    }

    // Show the user dashboard
    @RequestMapping("/dashboard")
    public String showUserDashboard(Model model) {
        // Logic to display user-specific content on the dashboard
        return "user-dashboard";
    }
}
