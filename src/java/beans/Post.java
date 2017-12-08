package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;

import database.Db_Connection;
import static java.lang.System.*;
import java.util.Date;
import java.util.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Post
{
    private String entry, user, date;
    private int id;
    
    
    public Post()   {
       
        user="";  
        entry = "";
        date = "";
        id = 0;        
    }        
 
    //----------------------------------//
    
    public String getUser() 
    {
        return user;
    }

    public String getEntry() 
    {
        return entry;
    }
    
     public String getDate() 
    {
        return date;
    }
    
    
    public int getId() 
    {
        return id;
    }   
    
    //----------------------------------//
    
   
    public void setUser(String user) 
    {
        this.user=user;
    }

     public void setEntry(String entry) 
    {
        this.entry=entry;
    }
     
    public void setDate(String date) 
    {
        this.date=date;
    }
    
    public void setId(int id) 
    {
        this.id =id;
    }

   
    //----------------------------------// 
    //----------------------------------//  
    //----------------------------------//
    
    public List GetPostByUser()
    {
            try 
            {        
                
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT * FROM entries WHERE user = '"+user+"'";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);               
                
                List entries = new ArrayList();                
                

                while(rs.next())           {    
                    
                   date= rs.getString("date");
                   entries.add(date); 
                   
                   entry = rs.getString("entry");
                   entries.add(entry);                                                 
                   
                } 
                
                 myStatement.close();
                myconnection.close();
                
                return(entries);                        
                
            } catch (SQLException ex) {return(null);}            
    }
    
   
    
    public void AddPost(String S, String user, int id)
    {
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();          
            
           DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	   //get current date time with Date()
	   Date date_tmp = new Date();
           
           String date2 = dateFormat.format(date_tmp);
           
	   System.out.println(date2);

            String sqlString="INSERT INTO entries (entry, user, id, date) VALUES ('"+S+"','"+user+"','"+id+"','"+date2+"')";
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);                
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {}
        } catch (SQLException ex) {}  
    }
    
    
    public List GetNLastById()
    {
            try 
            {        
                
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                
                String sqlString = "SELECT * FROM entries ORDER BY date DESC LIMIT 2;";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);               
                
                List entries = new ArrayList();               

                while(rs.next())           {    
                    
                   date= rs.getString("date");
                   entries.add(date); 
                   
                   user = rs.getString("user");
                   entries.add(user);
                   
                   entry = rs.getString("entry");
                   entries.add(entry);                                                 
                   
                } 
                
                 myStatement.close();
                 myconnection.close();
                
                return(entries);                        
                
            } catch (SQLException ex) {return(null);}            
    }
    
     public List GetAllPosts()
    {
            try 
            {        
                
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "(SELECT * FROM entries) ORDER BY date ASC;";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);               
                
                List entries = new ArrayList();               

                while(rs.next())  {    
                    
                   date= rs.getString("date");
                   entries.add(date); 
                   
                   user = rs.getString("user");
                   entries.add(user);
                   
                   entry = rs.getString("entry");
                   entries.add(entry);                                                 
                   
                } 
                
                 myStatement.close();
                myconnection.close();
                
                return(entries);                        
                
            } catch (SQLException ex) {return(null);}            
    }
   
    
   
    
    
    
    //----------------------------------//

}