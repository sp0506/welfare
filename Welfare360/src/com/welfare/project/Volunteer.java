package com.welfare.project;



import java.util.Scanner;

class Volunteer { //extends Welfare{

	
	void selectVolunteerType(){
		System.out.println("Logged in as Volunteer");
		 System.out.println("You are an..?");
		   System.out.println("1 - NGO \t 2 - Individual volunteer");
		   //System.out.println("2- To volunteer individually");
		   Scanner scanType = new Scanner(System.in);
		   Integer volunteerType=scanType.nextInt();
	       
		  
	       
		   if(volunteerType==1){
	         System.out.println("You chose to be an NGO volunteer");
	      //   selectAreaOfHelp();  method in welfare class
	         respondToHelp();
	       }
	       else if(volunteerType==2){
	    	   System.out.println("You chose to be an individual volunteer");
	   
	    	//   selectAreaOfHelp();
	    	   respondToHelp();
	       }
	       else{
	    	   System.out.println("please select proper type");
	    	   selectVolunteerType();
	       } scanType.close();
		
	}
	void respondToHelp(){
		
	}
}
