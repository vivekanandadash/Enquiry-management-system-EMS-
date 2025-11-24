package com.ems_mvc_project1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBServiceImplModel implements DBServiceModel {
	Connection con;
	Statement statement;
	@Override
	public void connectDb() {
		// TODO Auto-generated method stub
		//connect to database
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ems_sep_db","root","Pratek29082021");
			 statement = con.createStatement();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	@Override
	public boolean dataValidation(String email, String password) {
		// TODO Auto-generated method stub
		try {
			ResultSet result = statement.executeQuery("select * from login where email='"+email+"' and password='"+password+"' ");
			return result.next();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SQL ERROR OCCURRED");
		}
		return false;
	}

	@Override
	public void saveRegistration(String name, String email, String number, String course) {
		// TODO Auto-generated method stub
       try {
    	   statement.executeUpdate("insert into registration values('"+name+"','"+email+"','"+number+"','"+course+"')");
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}		
	}

	public ResultSet getRegistrationList() {
	   try {
		   ResultSet result = statement.executeQuery("select * from registration");
		   return result;
	} catch (Exception e) {
		// TODO: handle exception
	}
		return null;
	}

	public void deleteRegistration(String DeleteRow) {
		// TODO Auto-generated method stub
	    try {
			statement.executeUpdate("Delete from registration where email='"+DeleteRow+"'");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public boolean updateValidation(String email, String number) {
		// TODO Auto-generated method stub
		try {
			int updateStatus = statement.executeUpdate("update registration set number='"+number+"' where email='"+email+"'");
			return updateStatus > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

}
