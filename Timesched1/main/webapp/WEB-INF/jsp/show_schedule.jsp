<!--  project : Time Schedule, author : Ingrid Farkas, 2019 -->
<!--  show_schedule.jsp shows the results of the request for listing the schedule for the certain EMPLOYEE on the certain DAY ( show_sched_form.jsp ) -->
<!--  show_schedule.jsp is included in show_sched_results.jsp -->

<!--  include the JSTL Core library -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>

	table tr:not(:first-child){
    	cursor: pointer;transition: all .25s ease-in-out;
    }
    
    /* when the user hovers the mouse over the row ( table ) set the background color */
    table tr:not(:first-child):hover{background-color: #ddd;}

</style>

<script>
	var row_selected = false; // did the user selected the row 
    var table = document.getElementById('table'); // get the element with ID table   
	
    // loop through the rows of the table
    for (var i = 1; i < table.rows.length; i++)
    {
        table.rows[i].onclick = function()
        {
            document.getElementById("taskId").value = this.cells[0].innerHTML; // put the value for the task id from the table ( of the sel. row ) into the input box 
            row_selected = true; // the user selected the row from the tatble
        };
    }
    
    // after clicking on the button, if the user clicked on the table first the new web page is shown otherwise the modal box is shown
    function sel_row_msg(){
    	// if the user clicked on the row of the table first
    	if (!row_selected){
    		modal.style.display = "block"; // display the modal box
    		return false; // false - the new web page doesn't need to be shown
    	} else { 
    		return true; // true - the new web page does need to be shown
    	} 
    }
    
</script>
</head>

<body>

<!-- Contact section -->
	<div class="w3-content">
	    <div class="w3-row w3-margin">
	    	<!-- "w3-third" class uses 33% of the parent container -->
	    	<div class="w3-third">
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <br />
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <!-- first image on the left hand side from the form -->
	            <img src="../../images/woman_on_phone.jpg" style="width:100%">
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <!-- second image on the left hand side from the form -->
	            <img src="../../images/woman_with_laptop.jpg" style="width:100%"> 
	            <br/>
	            <br/>
	            <br/>
	            <br/>
	        </div>
	        
	        <!-- "w3-twothird" class uses 66% of the parent container -->
	        <div class="w3-twothird w3-container"> 
	            <!--  Contact section -->
	            <br/>
	            <br/>
	            <!--  w3-light-grey sets the background colour of the container -->
	            <div class="w3-container w3-light-grey w3-padding-32 w3-padding-large" id="show_sched_info"> 
	              	<div class="w3-content w3-text" style="max-width:600px">
	              		<!-- black_test CSS rule from the colors.css -->
	                    <h2 class="w3-center"><b>Schedule</b></h2> 
	 					<h6>Employee Name: ${enter_f_name} ${enter_l_name}</h6> <!-- showing the employee name -->
	 					<h6>Date of the Schedule: ${enter_date}</h6> <!-- showing the date of the schedule -->
	 					<!-- show the page http://localhost:8080/task_update, using method POST -->
	 					<form action="/task_update" method="POST">  
							<div>
								<!-- !!!!!!!!!!!!!!!!!!!11 HIDE THE next line -->
								Id:<input type="text" name="taskId" id="taskId"><br><br>
								<br/>
								Please click on the table fist to select the task!
								<br/>
								<!-- creating the table with the tasks -->
								<table class="w3-table w3-bordered w3-centered" id="table">
									<!-- creating the table row with the headings -->
									<tr>
						            	<th>Task Id</th>
						            	<th>Task Name</th>
						            	<th>Start Time</th>
						           		<th>End Time</th>
						           		<!-- <th>Action</th> -->
		       						</tr>
		       						<!-- for each element of the list empSchedTaskInfos, show the id of the task, the name of the task, the start time and the end time of the task -->
		       						<!-- empSchedTaskInfos is the attribute from the MainController.java, which was added to the model -->
		       						<c:forEach items="${empSchedTaskInfos}" var="schedinfo"> 
		       	   						<tr class="w3--cell-bottom">
		               						<td>${schedinfo.taskId}</td> <!-- show the id of the task -->
			       							<td>${schedinfo.taskName}</td>	<!-- show the name of the task -->
			       							<td>${schedinfo.taskStartTime}</td> <!-- show the start time of the task -->
			       							<td>${schedinfo.taskEndTime}</td> <!-- show the end time of the task -->  
			       							<!-- Update link : when clicked /task_update is shown -->
	     		       						<!-- mapping for the /task_update is done in the MainController.java -->
			   							</tr>
		       						</c:forEach> <!-- end of the forEach -->
		   						</table>
		    				
		    					<br />
		    					<br />
								<!-- w3-camo-grey is a CSS rule in the colors.css -->
								<button class="w3-btn w3-camo-grey" id="theBtn" onclick="return sel_row_msg();">Update Schedule</button> 
						
								<!-- the modal box - shown if the user didn't choose from the table the task first -->
								<div id="myModal" class="modal">
	  								<!-- content of the modal box -->
	  								<div class="modal-content">
	  									<!-- header of the modal box -->
	    								<div class="modal-header w3-theme-m1">
	      									<span class="close">&times;</span>
	      									<h2>Schedule</h2>
	    								</div>
	    								<!-- the body of the modal box -->
	    								<div class="modal-body">
	      									<p>You haven't selected a row!</p>
	    								</div>
	    								<!-- the footer of the modal box --> 
								    	<div class="modal-footer  w3-theme-m1">
								      		<h3>&nbsp; &nbsp;</h3>
								    	</div>
									</div>
								</div>
	    					</div>
	    				</form>
					</div> <!-- end of the class="w3-content w3-text" -->
				</div> <!-- end of the class="w3-container w3-light-grey w3-padding-32 w3-padding-large" -->
			</div> <!-- end of the class="w3-row w3-margin" -->
		</div> <!-- end of the class="w3-content" -->
	</div> <!-- end of class="w3-content" -->


	<script>
	// get the modal
	var modal = document.getElementById('myModal');
	
	// get the button that opens the modal
	var btn = document.getElementById("theBtn");
	
	// get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// when the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	// when the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	// get the table element with the id 'table'
	var table = document.getElementById('table');         
	for(var i = 1; i < table.rows.length; i++) // go through all the rows in the table
		{
	    	table.rows[i].onclick = function()
	        {
	    		row_selected = true; // the user clicked on the row of the table before clicking on the button
	            document.getElementById("taskId").value = this.cells[0].innerHTML; // put the value for the task id from the table ( of the sel. row ) in the the input box         
			};
		}
	
	</script>

</body>
