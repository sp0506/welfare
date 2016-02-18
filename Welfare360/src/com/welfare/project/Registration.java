package com.welfare.project;



import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Registration {

	
	  @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;
		
	    @Persistent
	    private String name;
		
	    @Persistent
	    private String email;

	    @Persistent
	    private String userName;
		
	    @Persistent
	    private String password;
	    
	    @Persistent
	    private String role;
		
	    @Persistent
	    private String location; 
	    
/*	    
	    @Persistent
	    private String sex; 
	    
*/	    
	    
	    
	    public Key getKey() {
	        return key;
	    }


	    public String getName() {
	        return name;
	    }
	    public void setName(String name) {
	    	this.name = name;
	    }
	    
	    public String getEmail() {
	        return email;
	    }
	    public void setEmail(String email) {
	    	this.email = email;
	    }
	    
	    
	    public String getUserName() {
	        return userName;
	    }
	    public void setUserName(String userName) {
	    	this.userName = userName;
	    }
	    
	    
	    
	    public String getPassword() {
	        return password;
	    }
	    public void setPassword(String password) {
	    	this.password = password;
	    }
	    
	    public String getRole() {
	        return role;
	    }
	    public void setRole(String role) {
	    	this.role = role;
	    }
	    
	    public String getLocation() {
	        return location;
	    }
	    public void setLocation(String location) {
	    	this.location = location;
	    }
/*	    
	    public String getSex() {
	        return sex;
	    }
	    public void setSex(String sex) {
	    	this.sex = sex;
	    }
*/	        
	    //getter and setter methods
	}	
	
	
	
	
