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

public class LoginController extends HttpServlet 
{  
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
               User user = new User();               
               HttpSession sessionUser = request.getSession();
                 

               if(User.LoginUser(request.getParameter("user"),request.getParameter("pwd")))
               
                {
                    User us = new User();
                    
                    us.setUser(String.valueOf(request.getParameter("user")));
                    
                    sessionUser.setAttribute("user",us.getUser());
                    sessionUser.setAttribute("logged",1); 
                    
                    String name = (String) sessionUser.getAttribute("user");
                    System.out.println(name + "TEST");                     
                    
                    
                    int logged = (int) sessionUser.getAttribute("logged");
                    System.out.println(logged + "TEST");                     

                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request,response);
                }  
                else
                {                  
                                     
                    RequestDispatcher rd1 = request.getRequestDispatcher("wrong_login.jsp");
                    rd1.forward(request,response);
                    
                }    
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
            return "";
        }
}   