package com.springmvc.model;
import jakarta.persistence.*;

@Entity
@Table(name = "customer")
public class Customer {

    @Id 
    @Column(name = "email")
    private String email;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "phone", length = 10)
    private String phone;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "pic")
    private String pic;
    
    // Default constructor
    public Customer() {
        super();
    }

	public Customer(String email, String name, String phone, String password, String pic) {
		super();
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.password = password;
		this.pic = pic;
	}



	// Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}
