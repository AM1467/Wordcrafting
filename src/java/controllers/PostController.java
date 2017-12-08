package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import beans.Post;

import java.util.*;
import javax.servlet.http.HttpSession;


public class PostController extends HttpServlet 
{
    
    private static int id = 50; 
    
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {                
                HttpSession sessionUser = request.getSession(); 
              
                Object logged = sessionUser.getAttribute("logged");
                
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                
                if(logged == null){
                    
                    rd = request.getRequestDispatcher("notlogged.jsp");
                    rd.forward(request,response);    
                    return;
                }
                                        
                Post post = new Post();
                
                int flag = 1;           
                
                String S = request.getParameter("story");
                System.out.println(S);
                int num =  new StringTokenizer(S).countTokens();
                System.out.println(num);
                String S2 = S.toLowerCase();
                
                if (num<45){rd = request.getRequestDispatcher("few_words.jsp");
            
                                rd.forward(request,response);
                                return;
                
                }
                else if (num>300){rd = request.getRequestDispatcher("many_words.jsp");          
            
                            rd.forward(request,response); 
                            return;
                
                }
                                 
                               
                 List wordlist = (List) sessionUser.getAttribute("words");
                 Iterator it = wordlist.iterator();
                                
                 
                while(it.hasNext()) {
                    
                String str = (String) it.next();        
                
                
                if(!S2.contains(str)){         
                    
                                    
                                    flag = 0;
                                    rd = request.getRequestDispatcher("post_error.jsp");
                                    rd.forward(request,response);
                                    return;
                                    
                }                
                } 
                
                
                   if(flag==1) {     
                    id ++;                    
                    String name = (String)sessionUser.getAttribute("user");                    
                    post.AddPost(S, name, id);
                    System.out.println(id);
                    rd = request.getRequestDispatcher("success.jsp");
                    rd.forward(request,response);
                    return;
                   }       
                
                
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
