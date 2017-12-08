package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import beans.User;
import javax.servlet.http.HttpSession;

public class RegisterController extends HttpServlet 
{
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                
                User user_of_email = new User();
                String temp_email = request.getParameter("email"); 
                System.out.println(temp_email + " EMAIL INPUT TEST");
                
                user_of_email.GetUserByEmail(temp_email);
                
                String user_email = user_of_email.getEmail();
                
                System.out.println(user_email + " EMAIL of USER TEST");
                
                if(user_email != ""){
                    
                    RequestDispatcher rd = request.getRequestDispatcher("email_exists.jsp");  
                    System.out.println("EMAIL already  EXISTS");
                    rd.forward(request,response);    
                    return;
                
                }                
                
                
                RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
                
                HttpSession sessionUser = request.getSession(); 
              
                Object logged = sessionUser.getAttribute("logged");                   
                
                
                User user = new User();               
     
                user.setFullname(request.getParameter("fullname"));
                user.setDay(request.getParameter("day"));
                user.setUser(request.getParameter("user")); 
                user.setPwd(request.getParameter("pwd")); 
                user.setEmail(request.getParameter("email"));                                
                user.setMonth(request.getParameter("month"));
                user.setYear(request.getParameter("year"));
                user.setGender(request.getParameter("gender"));
                user.setLocation(request.getParameter("location"));
                user.setHobbies(request.getParameter("hobbies"));

                user.RegisterUser();

                out.println("<br>");
                out.println("<br>");
           
                
                //User us2 = new User();
                //us2.setUser(String.valueOf(request.getParameter("user")));
                //us2.GetUser();
                
               // HttpSession sessionUser2 = request.getSession();
                //sessionUser2.setAttribute("user",us2.getUser());
                    
               
                rd.forward(request,response);
            } finally {out.close();}
        }
           
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        public String getServletInfo() 
        {
            return "Short description";
        }
}   