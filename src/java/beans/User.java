package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import com.uthldap.Uthldap;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class User 
{
    private String user,pwd,email, fullname,day,month,year,gender,location,story,hobbies;
    private boolean logged;
    
    public User()
    {
       
        user="";
        pwd="";
        email="";
        story ="";
        fullname="";
        day="";       
        month="";
        year="";
        gender="";
        location="";
        hobbies="";
        logged = false;
             
        
    }        
 
    //----------------------------------//
    
    public String getUser() 
    {
        return user;
    }
    
    public String getEmail() 
    {
        return email;
    }

    public String getPwd() 
    {
        return pwd;
    }
    
     public String getFullname() 
    {
        return fullname;
    }
    
    
    public String getDay() 
    {
        return day;
    }

    public String getMonth() 
    {
        return month;
    }

    public String getYear() 
    {
        return year;
    }
    
    
    public String getStory() 
    {
        return story;
    }
    
    public String getGender() 
    {
        return gender;
    }
    
    public String getLocation() 
    {
        return location;
    }
    
    public String getHobbies() 
    {
        return hobbies;
    }
    
     public boolean getLogged() 
    {
        return logged;
    }
    
    //----------------------------------//
    
   
    public void setUser(String user) 
    {
        this.user=user;
    }
    
    public void setEmail(String email) 
    {
        this.email=email;
    }
    
     public void setStory(String story) 
    {
        this.story=story;
    }
     
    public void setPwd(String pwd) 
    {
        this.pwd=pwd;
    }
    
    public void setFullname(String fullname) 
    {
        this.fullname =fullname;
    }

    public void setDay(String day) 
    {
        this.day =day;
    } 

    public void setMonth(String month) 
    {
        this.month=month;
    }
    
    public void setYear(String year) 
    {
        this.year=year;
    }
    
    public void setGender(String gender) 
    {
        this.gender=gender;
    }
    
    public void setLocation(String loc) 
    {
        this.location=loc;
    }
    
    public void setHobbies(String hob) 
    {
        this.hobbies=hob;
    }
    
      public void setLoggedTrue() 
    {
        this.logged = true;
    }
      
        public void getLoggedFalse() 
    {
        this.logged = false;
    }
    
    //----------------------------------//
    
    public void RegisterUser()
    {
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();

            String sqlString="INSERT INTO users (user,pwd,email,fullname,day,month,year,gender,location,hobbies) VALUES ('"+user+"','"+pwd+"','"+email+"','"+fullname+"','"+day+"','"+month+"', '"+year+"', '"+gender+"', '"+location+"', '"+hobbies+"')";
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
               
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}  
    }
      
   
    
    //----------------------------------//
    
 public static boolean LoginUser(String user,String pwd) 
    {
            boolean check =false;
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                PreparedStatement ps1 =myconnection.prepareStatement("select * from users where user=? and pwd=?");

                ps1.setString(1, user);
                ps1.setString(2, pwd);
                ResultSet rs1 =ps1.executeQuery();
                check = rs1.next();

                myconnection.close();        
            }catch(Exception e){e.printStackTrace();}
            
            return check;    
    }
    
    //----------------------------------//
    
    public void GetUser()
    {
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT * FROM users WHERE user = '"+user+"'";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                while(rs.next())
                {
                    fullname= rs.getString("fullname");
                    pwd= rs.getString("pwd");
                    email= rs.getString("email");
                    day = rs.getString("day");
                    user= rs.getString("user");
                    month = rs.getString("month");
                    year = rs.getString("year");
                    gender = rs.getString("gender");
                    location = rs.getString("location");
                    hobbies = rs.getString("hobbies");
                }
                
                myStatement.close();
                myconnection.close();
                
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
            
    }
    
    
     public void GetUserByEmail(String email_input)
    {
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT * FROM users WHERE email = '"+email_input+"'";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                while(rs.next())
                {
                    fullname= rs.getString("fullname");
                    pwd= rs.getString("pwd");
                    email= rs.getString("email");
                    day = rs.getString("day");
                    user= rs.getString("user");
                    month = rs.getString("month");
                    year = rs.getString("year");
                    gender = rs.getString("gender");
                    location = rs.getString("location");
                    hobbies = rs.getString("hobbies");
                }
                
                myStatement.close();
                myconnection.close();
                
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
            
    }
    
    public String getDifficulty()
    {
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String t = new String();
                
                String sqlString =  "SELECT * FROM `words` ORDER BY RAND() LIMIT 0,1";

                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                while(rs.next())
                {
                    t = rs.getString("word");
                                        
                }                 
                
                myStatement.close();
                myconnection.close();
                return t;                  
                
            } catch (SQLException ex) {
                
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return "";
            } 
            
    }
    
   /* public void AddPost(String S, String user, int id)
    {
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            
           DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	   //get current date time with Date()
	   Date date = new Date();
           
           String date2 = dateFormat.format(date);
           
	   System.out.println(date2);

            String sqlString="INSERT INTO entries (entry, user, id, date) VALUES ('"+S+"','"+user+"','"+id+"','"+date2+"')";
            //String sqlString2 = "UPDATE users SET (fullname='"+fullname+"',day='"+day+"', month='"+month+"',year='"+year+"', gender='"+gender+"',location='"+location+"',hobbies='"+hobbies+"' WHERE user='"+user+"')";
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                //myStatement.executeUpdate(sqlString2);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}  
    } */
    
    
    //----------------------------------//

}