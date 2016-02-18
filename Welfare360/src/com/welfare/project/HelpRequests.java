package com.welfare.project;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class HelpRequests {

	
	  @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;
		

	    @Persistent
	    private String hsname;
	  
	    @Persistent
	    private String helpRequest;
		
	    @Persistent
	    private String mobile;

	    @Persistent
	    private String address;
		
	   
	    
	    
	    
	    
	    public Key getKey() {
	        return key;
	    }

	    public String getHSName() {
	        return hsname;
	    }
	    public void setHSName(String hsname) {
	    	this.hsname = hsname;
	    }
	    
	    public String getHelpRequest() {
	        return helpRequest;
	    }
	    public void setHelpRequest(String helpRequest) {
	    	this.helpRequest = helpRequest;
	    }
	    
	    public String getMobile() {
	        return mobile;
	    }
	    public void setMobile(String mobile) {
	    	this.mobile = mobile;
	    }
	    
	    
	    public String getAddress() {
	        return address;
	    }
	    public void setAddress(String address) {
	    	this.address = address;
	    }
	    
	    
	    	}	
	