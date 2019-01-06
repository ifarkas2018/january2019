<!-- DELETE THIS file later -->
<!-- during DEVELOPMENT pay attention to this file  -->
<!-- PROBLEM : when doing Add Task pay attention to this script. I developed first this script, then I changed it to what is in the show_schedule.jsp, and
	 named the file show_sched_rcont.jsp. PROBLEM: it wouldn't return anything. When I renamed the file to show_schedule.jsp then it WORKED  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello</title>
<body>
	<!--   Hello ${name} -->
	<% 
	// for(String item : items){
	//	System.out.println(item);
	//}
	%>
	Employee Id is ${enter_emp_id}
	First Name is ${enter_f_name}
	Last Name is ${enter_l_name}
	Date is ${enter_date}
	<div>
      <table border="1">
        <tr>
          <th>Task Name</th>
          <th>Date</th>
		  <th>Start Time</th>
		  <th>End Time</th>
          <!-- <th>Last Name</th> -->
        </tr>
        <c:forEach items="${empSchedTaskInfos}" var ="schedinfo"> <!-- accountInfos is the attribute from the MainController.java -->
        <tr>
          <td>${schedinfo.taskName}</td>
          <td>${schedinfo.taskDate}</td>
          <td>${schedinfo.taskStartTime}</td>
          <td>${schedinfo.taskEndTime}</td>
          <!-- <td>${person.lastName}</td> -->
        </tr>
        </c:forEach>
      </table>
    </div>
</body>
</html>