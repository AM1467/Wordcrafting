package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import beans.User;
import java.util.*;
import javax.servlet.http.HttpSession;

public class DifficultyController extends HttpServlet 
{
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                
                RequestDispatcher rd = request.getRequestDispatcher("play_post.jsp");
                
                HttpSession sessionUser = request.getSession(); 
              
                Object logged = sessionUser.getAttribute("logged");     
               
                
                if(logged == null){
                    
                    rd = request.getRequestDispatcher("notlogged.jsp");
                    rd.forward(request,response);      
                    
                }
                
                User user = new User();               
     
                String c = request.getParameter("type"); 
                String temp = "";
                
                int N;
                int i=0;
                int iter=0;
                
                
                List types = new ArrayList();  
                
                 if (c.equals("easy")) {   
                     
                     iter=3;
                     N = 15; // minutes                   
                     
                }
                 
                else if (c.equals("normal")) {   
                     
                     iter=5;
                     N = 10; // minutes                   
                     
                }
                 
                else if (c.equals("hard")) {   
                     
                     iter=7;
                     N = 5; // minutes                   
                     
                }
                 
                 else  {   
                     
                     iter=0;
                     N = 0; // minutes                  
                     
                }
                 
                 
                 while(i<=(iter-1)){
                     
                         
                         temp = user.getDifficulty();
                         System.out.println("selection " + temp); // testing
                         if(!types.contains(temp)){
                         
                             types.add(temp);
                             i++;                         
                         }                         
                         else{                             
                         continue;                         
                         }                          
                     }
                 
                 Iterator it = types.iterator(); // for testing
                 while(it.hasNext()) {
                 System.out.println("List " + it.next());
                }    
                 
                request.setAttribute("words", types);
                request.setAttribute("timer", N);
                request.setAttribute("diff", c);  
                
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