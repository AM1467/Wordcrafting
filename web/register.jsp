<%-- 
    Document   : register
    Created on : Oct 30, 2017, 2:11:19 PM
    Author     : Rin
--%>

<%@page import="beans.User"%>

<%@page import="controllers.RegisterController"%>

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
	
        
 
        
    <section class="main-contents">
      
      <div class="container">  
          
          
                  
                  <div class = "content">         
                      
                        <h3 class="subtitle">Make sure to fill fields with a (*), the rest are optional.</h3>                       
                        
                        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
 
                        <form action="Register" method="post">
            
            
                            <br><br><br><br><br><br>
                            <font size="4">Username (*) : </font>
                            <br><br>
                            <input required type="text" name="user" value="<jsp:getProperty name="user" property="user"/>">
                            <br><br>
                            
                            <font size="4">Password (*) : </font>
                            <br><br>
                            <input required type="password" name="pwd" value="<jsp:getProperty name="user" property="pwd"/>">
                            <br><br>
                            
                            <font size="4">Email (*): </font>
                            <br><br>
                            <input required type="text" name="email" value="<jsp:getProperty name="user" property="email"/>">
                            <br><br>
                            
                            <font size="4">Full name : </font>
                            <br><br>
                            <input type="text" name="fullname" value="<jsp:getProperty name="user" property="fullname"/>">
                            <br><br>                          
                            
                            <font size="4">Date of Birth: </font>                            
                            <br><br>   
                           
                            <font size="4">Day : </font>
                            <br><br>
                            <input type="text" name="day" value="<jsp:getProperty name="user" property="day"/>">
                            <br><br>                        
                            <font size="4">Month : </font>
                            <br><br>
                            <input type="text" name="month" value="<jsp:getProperty name="user" property="month"/>">
                            <br><br>   
                            <font size="4">Year : </font>
                            <br><br>
                            <input type="text" name="year" value="<jsp:getProperty name="user" property="year"/>">
                            <br><br>   
                            <font size="4">Gender : </font>
                            <br><br>
                            <input type="text" name="gender" value="<jsp:getProperty name="user" property="gender"/>">
                             <br><br>   
                             <font size="4">Location :</font>
                            <br><br>
                            <input type="text" name="location" value="<jsp:getProperty name="user" property="location"/>">
                            <br><br>   
                            
                            <font size="4">Hobbies (use commas): </font>
                            <br><br>
                            <input type="text" name="hobbies" value="<jsp:getProperty name="user" property="hobbies"/>">
                             <br><br>                                
                             
                            <center><input type="reset" value="Reset" /></center>
                            
                            <br><br>   
                            <center><input type="submit" value="Submit"></center>         
              
            
        </form> 
              
                  </div>          
              
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