<%-- 
    Document   : play_post
    Created on : Oct 29, 2017, 7:06:32 PM
    Author     : Rin
--%>

<%@page import="controllers.LoginController"%>
<%@page import="beans.User"%>
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
    
    <%
                
                                        HttpSession sessionUser = request.getSession(); 
                                        int timer = (int) request.getAttribute("timer");
              
                                        Object logged = sessionUser.getAttribute("logged");
                
                                        
                                                 %>
    
	
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
                    
                    <h3>Scribble scribble scribble...</h3>
                    
                    <center><font size="4">Your difficulty | </font></center>
        
        <font size="4" font color="#ff944d"><center><% String diff = (String) request.getAttribute("diff");
        out.print(diff); %> </center></font>
           
           <br>
           
           <center><font size="4">Use the words | </font></center>           
        
           <font size="4" font color="#ff944d"><center><%
            List styles = (List) request.getAttribute("words");
            sessionUser.setAttribute("words", styles);
            Iterator it = styles.iterator();
            while(it.hasNext()) {
            out.print("'");
            out.print(it.next()+ "'  ");
            }
            %></center></font>
            
            <br>
        
        <center><font size="4">Your time limit | </font></center>
        
         <font size="4" font color="#ff944d"><center><% 
           out.print(timer + " minutes."); %></center></font>    
           
           <br>
           
           <script>
               
    function startTimer(duration, display) {
                         var start = Date.now(),
                         diff,
                         minutes,
                         seconds;
                     function timer() {
                         // get the number of seconds that have elapsed since 
                         // startTimer() was called
                    diff = duration - (((Date.now() - start) / 1000) | 0);

                         // does the same job as parseInt truncates the float
                     minutes = (diff / 60) | 0;
                     seconds = (diff % 60) | 0;

                     minutes = minutes < 10 ? "0" + minutes : minutes;
                     seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds; 

                     if (diff <= 0) {
                        // add one second so that the count down starts at the full duration
                        // example 05:00 not 04:59
                                start = Date.now() + 1000;
                      }
                     };
                     // we don't want to wait a full second before the timer starts
                    timer();
                    setInterval(timer, 1000);
                    
                    }

                        window.onload = function () {
                        var Minutes = 60 * "<%=timer%>";
                        display = document.querySelector('#time');
                        startTimer(Minutes, display);
                        setTimeout(function(){ window.location='timeout.jsp';}, 60*1000*"<%=timer%>");
                                                  
                        };   
           
           </script>
           
          
           
           <center><font size="5">Countdown: <span id="time"></span>  </font></center>         
           
           
           <br>                   
           
           <center><font size="4">Write a short story ( with at least 50 words ), containing <strong>all</strong> of the words given above. Good luck!  </font></center>
           
           <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
 
           <form action="PostEntry" method="post" id = "storyform"><center>           
            
                            <br><br>
                            <font size="4">Your story: </font>
                            <br><br>                                                     
                            <center><textarea form ="storyform" name="story" onkeyup="wordcount(this.value)" value="<jsp:getProperty name="user" property="story"/>" id="taid" style="width: 600px; height: 200px;" wrap="soft"></textarea></center>
                            <center><font size="4">Word count:  </font></center>
                            <script type="text/javascript">
                                      var cnt;
                                      function wordcount(count) {
                                      var words = count.split(/\s/);
                                      cnt = words.length -1 ;
                                      var ele = document.getElementById('w_count');
                                      ele.value = cnt;
                                }
                            document.write("<input type=text id=w_count size=4 readonly>"); </script>
                                
                                <br><br>
               
               
                                <h4><input type="submit" value="Post"></h4>   
                            
                            <br>
                            
            
           </center></form>  
      
              
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