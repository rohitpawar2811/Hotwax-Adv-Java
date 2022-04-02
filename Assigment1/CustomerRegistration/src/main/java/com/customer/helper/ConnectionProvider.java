package com.customer.helper;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;




public class ConnectionProvider {
    public static Connection con;
    public static Statement st;

    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3307/hotwax";
            String name="root";
            String pass="@Rohit12";
            con= DriverManager.getConnection(url,name,pass);
            st=con.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
             ex.printStackTrace();
        }

    }

    public static Connection getConnection(){
        return con;
    }
    public static Statement getStatement(){
        return st;
    }

}


