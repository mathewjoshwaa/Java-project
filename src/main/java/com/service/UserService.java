package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.User;
import com.repository.UserRepository;

import java.security.SecureRandom;
import java.util.Random;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final Random RANDOM = new SecureRandom();

    // Method to generate a 6-character alphanumeric user_id
    private String generateUserId() {
        StringBuilder builder = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            builder.append(ALPHA_NUMERIC_STRING.charAt(RANDOM.nextInt(ALPHA_NUMERIC_STRING.length())));
        }
        return builder.toString();
    }
    
    

    public User registerUser(User user) {
        String generatedId;
        
        do {
            generatedId = generateUserId();
        } while (userRepository.findByUser_id(generatedId) != null);
        
        user.setUser_id(generatedId);  // Set generated unique user_id
        return userRepository.save(user);
    }

    public boolean verifyUser(String username, String password) {
        User user = userRepository.findByUsr_name(username);
        return user != null && user.getUsr_pass().equals(password);
    }
}
