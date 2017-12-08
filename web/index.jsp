
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Post"%>
<%@ page import="java.util.*" %>

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
    
	<!-- Fixed navbar -->
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
        
 
	<!-- /.navbar -->

	<!-- Header -->
	<header id = "index-header">
            <section class="text-center">                   
                  <h2 class="title">Welcome</h2>
                  <h3 class="subtitle">Ready to write a story?</h3>
                  <a href ="play.jsp"><button class="btn">Play</button></a>          
                
            </section> 
        </header>
	<!-- /Header -->
        
        <div class="parallax"></div>      
        
        
  <div class="parallax2">
        
    <section class="main-contents">
      <h2 class="text-center sub-texts">recent creations</h2>
      <div class="container">          
          
          
          <div class = "recent-creations">
          
            <p><%  

              Post entries = new Post(); 

              List styles = entries.GetNLastById();
              Iterator it = styles.iterator();

              while(it.hasNext()) {

              out.print("<font color =\"#ff944d\" >Posted on: </font>"
                      //+ "<br>"
                      + it.next() + "<br>"
                      + "<font color =\"#ff944d\" >By user: </font>"
                      //+ "<br>"
                      + it.next() + "<br><br>"
                      //+ "<font color =\"#9999ff\" >Story: </font>" + "<br>"
                      + it.next() + "<br><br><br>");                  

              }            

              %>
              </p>
              
          </div>
              
         </div>
      
      <center><a href ="stories.jsp"><button class="btn">See more</button></a></center>
     
  </section>
              
 </div>

  <section class="how-it-works">
    <div class="text-center">
        <br><br>
      <h2 class="title">How it works</h2>
      <h3 class="subtitle">Write a story using a few random words.</h3>
      <a href ="howtoplay.jsp"><button class="btn">Read the Rules</button></a>
    </div>
  </section> 
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