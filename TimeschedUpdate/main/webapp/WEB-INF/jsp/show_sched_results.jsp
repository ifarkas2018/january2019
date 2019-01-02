<!-- author: Ingrid Farkas; project: Time Management -->
<!-- show_sched_results is shown when the URL is localhost:8080/show_sched_results  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- include the meta tags, the links to the external style sheets -->	  
	<%@ include file="header.jsp"%>
</head>
<body>   
    <div class="content"> 
      	<!-- Top menu on small screens -->
      	<header class="w3-container w3-white w3-xlarge w3-padding-16"> 
        	<span class="w3-left">Time Management</span> 
      	</header> <!-- end of header -->
	  	<!-- include the navigation -->
      	<%@ include file="navigation.jsp"%>   
      	<!-- include the content of the web page -->
      	<%@ include file="show_schedule.jsp"%> <!-- shows the table of tasks for the certain employee on the certain date -->
      	<br />
      	<!-- include the footer -->
      	<%@ include file="footer.jsp"%>
	</div> 
</body> 