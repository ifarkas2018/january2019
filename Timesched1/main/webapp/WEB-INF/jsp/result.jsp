<!-- project : Time Schedule, author : Ingrid Farkas, 2019 -->
<!-- task_upd_succ is shown when the URL is localhost:8080//show_update_results/{id} -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- including the meta tags, the links to the external style sheets -->	  
	<%@ include file="header.jsp"%>
</head>

<body>   
    <div class="content"> 
      	<!-- Top menu on small screens -->
      	<header class="w3-container w3-white w3-xlarge w3-padding-16"> 
        	<span class="w3-left">Time Management</span> 
      	</header> <!-- end of header -->
      	
	  	<!-- including the navigation - if the user successfully LOGGED IN the nav_max.jsp is shown otherwise nav_min.jsp is shown -->
	  	<!-- to do that I use the variable logged_in from the model -->
	  	<!-- this variable set in the procedure login_result ( MainController.java ) -->
      	
      	<% 
				// String.valueOf: converts the variable logged_in to the String
		    	// I have added logged_in to the model in the MainController.java
    			String is_logged = String.valueOf(request.getAttribute("logged_in"));
    			// if the user is logged in then show the whole navigation bar
		    	if(is_logged.equals("true")) {
  		%>			
      				<!-- add: the navigation to the web page. nav_max shows the whole navigation bar   -->
      				<%@ include file="nav_max.jsp"%>
      	<%
      					
					// if the user is not logged in then show the navigation with Home and Contact Us
				}  else {
		%>
					<!-- add: the navigation to the web page. nav_min shows the Home and the Contact Us   -->
      				<%@ include file="nav_min.jsp"%>
		<%
				}
      		
		%>	
			   
      	<!-- including the content ( of the web page ) -->
      	<%@ include file="result_content.jsp"%> <!-- shows whether the update was successful -->
      	<br />
      	<!-- including the footer -->
      	<%@ include file="footer.jsp"%>
      	
	</div> 
</body> 