






















/*package com.welfare.project;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

class HelpSeeker {  //extends Welfare{
	
	
	void requestHelp() throws IOException{
		System.out.println("Logged in as Volunteer");
	//	selectAreaOfHelp(); mthd in welfare class
	try
		{
		
		FileWriter file = new FileWriter("c:\\problems\\problems.txt");
		
		//BufferedWriter bw = new BufferedWriter(file);
	
		PrintWriter pw = new PrintWriter(file);
		
		BufferedReader data = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("Post your Problem to get help from the volunteer ");
		
		String s=data.readLine();
				
		file.write(s);
		pw.println();
		
		

		System.out.println(" Help posted in the site..!");
		}
		catch(IOException e)
		{
			System.out.println(e);
		}
	}
	void receiveHelp(){
		
	}
}*/