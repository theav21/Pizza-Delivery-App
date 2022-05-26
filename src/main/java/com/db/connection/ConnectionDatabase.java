package com.db.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDatabase {
	
	static Connection con;
	
	public static Connection createConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/opds","root","Amanverma@01");
			
		}
		catch(Exception e){
			System.out.print(e);
			return null;
		}
		return con;
	}

}
