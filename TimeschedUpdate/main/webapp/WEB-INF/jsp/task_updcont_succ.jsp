<!-- project : Time Schedule, author : Ingrid Farkas, 2019 -->
<!-- included in task_upd_succ.jsp -->

<script type="text/javascript">
		var home_URL="http://localhost:8080"; // global variable
		
		// shows the web page ( URL: home_URL ) in the browser
		function show_homepg() {
			window.location.href = home_URL;
		}
</script>

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
	        </div>
	
			<!-- "w3-third" class uses 66% of the parent container -->
	        <div class="w3-twothird w3-container">
	            <br/>
	            <br/>
	            <!--  w3-text-theme-m1 CSS rule which sets the color of the text ( file colors.css ) -->
	            <div class="w3-container  w3-light-grey w3-padding-32 w3-padding-large" id="show_sched_info"> 
	              	<div class="w3-content w3-text" style="max-width:600px">
	              		<!--  w3-center centers the text -->
		                <h2 class="w3-center"><b>Update Task</b></h2>
		                <br />
		                <br />		                
		                <br />
		                <br />
		                <br />
		                <%
		                	// String.valueOf: converts the variable update_succ to the String
		                	// I have added update_succ to the model in the MainController.java
    						String upd_succ = String.valueOf(request.getAttribute("update_succ"));
    						// if the update was successful - show the message
		                	if(upd_succ.equals("true")) {
  						%>			
      							<h5 class="w3-center"><b>The task was updated successfully !</b></h5>
      							<br/>
  						<%
  								// if the update wasn't successful - show the message
    							}  else {
  						%>
      							<h5 class="w3-center w3-text-red"><b>ERROR! The task wasn't updated successfully - an error occurred while updating the task !</b></h5>
  						<%
    							}
  						%>
  						
		                <div class="w3-container w3-center">
		                	<!-- add the button to the page -->
		                	<button class="w3-btn w3-center w3-tiny w3-padding-small w3-camo-grey" onclick="show_homepg();">Home</button>
		                </div>
		                <br />
		                <br />
		                <br />
		                <br />
		                <br />
	              	</div>
	            </div>
	            <br />
	        </div>  <!-- end of class="w3-twothird w3-container" -->
	    </div> <!-- end of class="w3-row w3-margin" --> 
    </div> <!-- end of the contact section -->
</div> <!-- end of class="content" -->
