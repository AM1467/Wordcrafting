<%-- 
    Document   : profile_view
    Created on : Oct 29, 2017, 7:47:10 PM
    Author     : Rin
--%>

<%@page import="beans.User"%>
<%@page import="beans.Post"%>
<%@ page import="java.util.*" %>


<%@page import="controllers.LoginController"%>

<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<meta name="author" content="Eirini Papadopoulou https://github.com/AM1467">
	<title>Wordcrafting</title>
	<link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Questrial" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Special+Elite" rel="stylesheet"> 
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="assets/css/style.css">
    
	
</head>
<body>  
    
	
  <div class = "logo">
    <a href="index.jsp">Wordcrafting</a>    
  </div>
   
        
        
        <div class="wordcrafting-nav">
    <nav class="navbar navbar-default" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav" id="myul">
          <li><a href="index.jsp">Home</a></li>
                                        <li><a href="play.jsp">Play</a></li>
					<li><a href="stories.jsp">Stories</a></li>
					<li><a href="howtoplay.jsp">How to Play</a></li>
                                        <li><a href="<%                
              
              HttpSession sessionUser = request.getSession();               
              Object logged =sessionUser.getAttribute("logged");
                
                                        if ((logged == null)){ 
                    
                                        out.print("login_form.jsp");
                                
                                        }   
                                        
                                        else {      
                                            
                                            
                                        out.print("logout.jsp");                                        
                                        
                                        }
          
                                        %>">
                                                
                                                <%                                                         
                
                                        if (logged == null){ 
                    
                                        out.print("Login");
                                
                                        }  
                                        
                                        else {
                                            
                                        out.print("Logout");
                                        
                                        }
          
                                        %> </a></li>                                      
                                        
                                        
                                        <li><a href="profile.jsp">Profile</a></li>          
            </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </nav>


 </div>                                 
        
                                        
  <header></header>                                      
 
	<!-- /.navbar -->
	
        
  <div class="parallax2">
        
    <section class="main-contents">
      
      <div class="container">  
          
          
                  
                  <div class = "content">         
                      
                        <h3 class="subtitle">Profile</h3>                       
                        
                        <%                
           
            String name = (String)sessionUser.getAttribute("user");
            if(name==null) {name = "";}
                    
            User user_of_profile = new User();
            user_of_profile.setUser(name);
            user_of_profile.GetUser();   %>
            
            <br><br><br><br>
            <font size="4">Full name | </font>
            <font color="#ff944d"><% out.print(user_of_profile.getFullname()); %></font>
            <br><br>
            
            <font size="4">Username | </font>
            <font color="#ff944d"><% 
                System.out.println(user_of_profile.getUser());
                out.print(user_of_profile.getUser()); %></font>
            <br><br>
            
            <font size="4">Date of birth:</font>
            
            <br><br>
            <font size="4">Day  </font>
            <font color="#ff944d"><% out.print(user_of_profile.getDay()); %></font>
            <font size="4"> of month  </font>
            <font color="#ff944d"><% out.print(user_of_profile.getMonth()); %></font>
            <font size="4"> in year </font>
            <font color="#ff944d"><% out.print(user_of_profile.getYear()); %></font>
            <font size="4">.</font>
            <br><br>
            
            <font size="4">Gender | </font>
            <font color="#ff944d"><% out.print(user_of_profile.getGender()); %></font>
            <br><br>
            
            <font size="4">Location | </font>
            <font color="#ff944d"><% out.print(user_of_profile.getLocation()); %></font>
            <br><br>
            
            <font size="4">Hobbies | </font>
            <font color ="#ff944d" ><% out.print(user_of_profile.getHobbies()); %></font>
            <br><br>          
            
            <font size="5">Your posts:</font>
            
            <br><br>
            
            <p> <font size="4"><%  
            
            Post profile_entries = new Post();
            profile_entries.setUser(name);
            
            List styles = profile_entries.GetPostByUser();
            Iterator it = styles.iterator();
            
            while(it.hasNext()) {
            
            out.print("<font color =\"#ff944d\" >Posted on: </font>"
                    + "<br>"
                    + it.next() + "<br><br>"
                    + "<font color =\"#ff944d\" >Story: </font>" + "<br>"
                    + it.next() + "<br><br><br>" );                  
            
            }            
            
            %> </font></p>
              
                  </div>          
              
         </div>      
     
  </section>
              
 </div>

  
  <footer>
    <div class="footer-section ">
      <div class="container">
        
        <div class="navigation">
          <ul class="pull-left">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="play.jsp">Play</a></li>
            <li><a href="stories.jsp">Stories</a></li>
            <li><a href="howtoplay.jsp">How to Play</a></li>
            <li><a href="register.jsp">Register</a></li>
          </ul>
        </div> 
      </div>
    </div>
      
    <div class="footer-bottom">
      <div class="container">
        
          <p>&copy; Wordcrafting, 2017. </p>
          <p> Developed by <a href="https://github.com/AM1467">Irene Papadopoulou</a></p>           <p> Pictures by <a href="https://unsplash.com/@omgitsyeshi">Yeshi Kangrang</a> on <a href="https://unsplash.com/">Unsplash</a> </p>
             
      </div>
    </div>     
  </footer>

	
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    
</body>
</html>