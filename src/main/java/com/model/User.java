package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long usr_id; // Auto-incremented ID for internal use

    private String user_id; // Unique 6-character alphanumeric identifier
    private String usr_name;
    private String usr_pass;
    private String usr_email;
    private String usr_num;
    private String usr_address;

    // Getters and Setters
    public Long getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(Long usr_id) {
        this.usr_id = usr_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

	public String getUsr_name() {
		return usr_name;
	}

	public void setUsr_name(String usr_name) {
		this.usr_name = usr_name;
	}

	public String getUsr_pass() {
		return usr_pass;
	}

	public void setUsr_pass(String usr_pass) {
		this.usr_pass = usr_pass;
	}

	public String getUsr_email() {
		return usr_email;
	}

	public void setUsr_email(String usr_email) {
		this.usr_email = usr_email;
	}

	public String getUsr_num() {
		return usr_num;
	}

	public void setUsr_num(String usr_num) {
		this.usr_num = usr_num;
	}

	public String getUsr_address() {
		return usr_address;
	}

	public void setUsr_address(String usr_address) {
		this.usr_address = usr_address;
	}

    
    // Other getters and setters
}
