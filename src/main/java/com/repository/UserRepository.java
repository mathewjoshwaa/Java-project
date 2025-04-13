package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    // Custom query for finding user by usr_name across the entire table
    @Query("SELECT u FROM User u WHERE u.usr_name = ?1")
    User findByUsr_name(String usr_name);

    // Custom query for finding user by user_id across the entire table
    @Query("SELECT u FROM User u WHERE u.user_id = ?1")
    User findByUser_id(String userId);
}
