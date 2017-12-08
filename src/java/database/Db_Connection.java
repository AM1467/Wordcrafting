package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection 
{
    public Connection Connection()
    {
        try 
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            //String techworld3g = "jdbc:mysql://localhost:3306/profile?user=rin&password=6982908949";
            String techworld3g = "jdbc:mysql://eu-cdbr-west-01.cleardb.com:3306/heroku_331d927ee2d7245?user=bb55ba4cd71745&password=865821b3";
            Connection myConnection = DriverManager.getConnection(techworld3g);          
            return myConnection;
            
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
}
