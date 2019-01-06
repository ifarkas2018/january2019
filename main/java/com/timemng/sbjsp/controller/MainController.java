// project : Time Schedule, author : Ingrid Farkas, 2019 
package com.timemng.sbjsp.controller;

// importing the packages
import java.util.ArrayList;
import java.util.List;

import com.timemng.sbjsp.dao.EmpSchedTaskDAO;
import com.timemng.sbjsp.model.EmpSchedTaskInfo;
import com.timemng.sbjsp.model.LoginInfo;
import com.timemng.sbjsp.dao.LoginDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
@Controller
public class MainController {
 
    // if the requested URL is localhost:8080, method is GET do 
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String index(Model model) { 
        return "index"; // return the index.jsp
    }
    
    // if the requested URL is localhost:8080/add_schedule, method is GET do 
    @RequestMapping(value = { "add_schedule" }, method = RequestMethod.GET)
    public String add_schedule(Model model) {
        return "add_schedule"; // return the add_schedule.jsp
    }
        
    @Autowired
    private EmpSchedTaskDAO empSchedTaskDAO;
    @Autowired
    private LoginDAO empLoginDAO;
    
    // if the requested URL is localhost:8080/login_form, method is GET 
    @RequestMapping(value = { "login_form" }, method = RequestMethod.GET)
    public String login_form(Model model) {
    	return "login_form"; // return the show_sched_form.jsp
    }
    
 // if the requested URL is localhost:8080/login_result, method is POST
   // @RequestMapping(value = { "login_result" }, method = RequestMethod.POST)
   // public String login_result(Model model, @RequestParam(value="user_name", required=true ) String user_name, // 
    //	@RequestParam(value="user_passw", required=true) String user_passw) {
    //	try {
    //		// add the rest of the query to the query
    		// empSchedTaskDAO.addToQueryStr("abc", "def", "gthj", "wert" );
    		// empSchedTaskDAO.addToQueryStr1( user_name, user_passw );
	    		// list is a list of objects of type LoginInfo ( user name, password ) that match the entered values of user name and password
		//    	List<LoginInfo> list = empLoginDAO.getLogin();
		    	// in the database there is a user name with the password entered in the form
		//    	if (list.isEmpty()) {
		//    		model.addAttribute("logged_in", "true"); 
		    		// return "logged_in";
		//    		return "index"; // ????????????? show whole navabar
		//    	}
		//    	else {
		//    		model.addAttribute("logged_in", "false");
		//    		return "not_loggedin";
		//    	}
    		//} else {
    			//return "not_entered";
    		//}
    	//} catch ( Exception e ) {
    	//	e.printStackTrace();
    	//	return "error_DB";
    	//}
    //}
    
 // if the requested URL is localhost:8080/show_sched_results, method is POST
    @RequestMapping(value = "login_result", method = RequestMethod.POST)
    // employee_id is an input element in show_sched_fcont.jsp. The user entered the id, name of the employee whose schedule he wants to see
    // ( and the date of the schedule )
	public String login_result(Model model, @RequestParam(value="user_name", required=true ) String user_name, // 
		@RequestParam(value="user_passw", required=true) String user_passw) {
    	try {
	    	// add the rest of the query to the query - // method returns FALSE - if the user didn't enter user name or password ( in the form ) 
			if (empLoginDAO.addToQueryStr( user_name, user_passw )) {
				// list is a list of objects of type LoginInfo ( user name, password ) that match the entered values of user name and password
				List<LoginInfo> list = empLoginDAO.getLogin();
				// LoginInfo myObject = list.get(0);
				int size1 = list.size();
				model.addAttribute("size", size1);
				// in the database there is a user name with the password entered in the form
				if (!(list.isEmpty())) {
				    model.addAttribute("logged_in", "true"); 
				    //return "logged_in";
				    return "index"; // ????????????? show whole navabar
				} else {
					// set the attribute logged_in to false - the user didn't log in
					model.addAttribute("logged_in", "false");
					model.addAttribute("message_shown", "The user with the user name " + user_name + " and the entered password doesn't exist!");
					model.addAttribute("is_red", "true");
					//return "not_loggedin";
					return "result";
			    }
				    
			} else {
				model.addAttribute("message_shown", "You didn't enter the user name and the password!");
				model.addAttribute("is_red", "true");
				//return "not_entered";
				return "result";
			}
    	} catch  ( Exception e ) {
        	e.printStackTrace();
        	model.addAttribute("message_shown", "A problem occured while accessing the database!");
        	model.addAttribute("is_red", "true");
        	//return "error_db";
        	return "result";
        }
		// retrieve the schedule ( with tasks ) for the requested employee on the requested date
		// List<EmpSchedTaskInfo> list = empSchedTaskDAO.getSchedules();
		 
		// add the schedule of the employee as the attribute to the model 
		// model.addAttribute("empSchedTaskInfos", list);
		// add the first name as the attribute to the model
		// model.addAttribute("enter_f_name", enter_f_name ); 
		// add the last name to the model
		// model.addAttribute("enter_l_name", enter_l_name );
		// add the date ( of the schedule ) to the model
		// model.addAttribute("enter_date", enter_date ); 
		 
		//return "not_loggedin"; // show the show_sched_results.jsp
	}
 
    
    
    // if the requested URL is localhost:8080/show_sched_form, method is GET 
    @RequestMapping(value = { "show_sched_form" }, method = RequestMethod.GET)
    public String show_sched_form(Model model) {
    	return "show_sched_form"; // return the show_sched_form.jsp
    }
    
    
    // if the requested URL is localhost:8080/show_sched_results, method is POST
    @RequestMapping(value = "show_sched_results", method = RequestMethod.POST)
    // employee_id is an input element in show_sched_fcont.jsp. The user entered the id, name of the employee whose schedule he wants to see
    // ( and the date of the schedule )
	public String show_sched_results(Model model, @RequestParam(value="employee_id", required=true ) String enter_emp_id, // 
		@RequestParam(value="first_name", required=true) String enter_f_name, @RequestParam(value="last_name", required=true) String enter_l_name, //
		@RequestParam(value="date", required=true) String enter_date) {
    	 
    	// add the rest of the query to the query
		empSchedTaskDAO.addToQueryStr(enter_emp_id, enter_f_name, enter_l_name, enter_date );
		// retrieve the schedule ( with tasks ) for the requested employee on the requested date
		List<EmpSchedTaskInfo> list = empSchedTaskDAO.getSchedules();
		 
		// add the schedule of the employee as the attribute to the model 
		model.addAttribute("empSchedTaskInfos", list);
		// add the first name as the attribute to the model
		model.addAttribute("enter_f_name", enter_f_name ); 
		// add the last name to the model
		model.addAttribute("enter_l_name", enter_l_name );
		// add the date ( of the schedule ) to the model
		model.addAttribute("enter_date", enter_date ); 
		 
		return "show_sched_results"; // show the show_sched_results.jsp
	}
        
    // if the requested URL is localhost:8080/task_update/{id} and method is GET
    @RequestMapping(value = { "/task_update/{id}" }, method = RequestMethod.GET )
    public String task_update(Model model, @PathVariable("id") Long id) { // 
    	// find the task whose task_id is the argument id
    	EmpSchedTaskInfo task_info = empSchedTaskDAO.findTask(id);
    	// add the object task_info as the attribute to the model
    	model.addAttribute("task_info", task_info);
    	return "show_task_info"; // show the show_task_info.jsp
    }
    
    // if the requested URL is localhost:8080/task_update/{id} and method is POST
    @RequestMapping(value = { "/show_update_results/{id}" }, method = RequestMethod.POST )
    public String show_update_results( Model model, @PathVariable("id") Long id, @RequestParam(value="task_name", required=true ) String enter_tname, // 
        @RequestParam(value="task_date", required=true ) String enter_tdate, @RequestParam(value="start_time", required=true ) String enter_stime, //
        @RequestParam(value="end_time", required=true ) String enter_etime ) {
    	
    	// update_succ : is the update to the DB successful
    	boolean update_succ = true;
    	try {
    		// update of the task in the DB
    		empSchedTaskDAO.updateTask(id, enter_tname, enter_tdate, enter_stime, enter_etime);
    	} catch (Exception e) {
    		// if an exception occurred during the update set the update_succ
    		update_succ = false;
    	}
    	
    	// @@@@@@@@@ DO NOT DELETE
    	// add the variable update_succ as the attribute to the model
    	//model.addAttribute("update_succ", update_succ);
    	if (update_succ) {
    		model.addAttribute("message_shown", "The task was updated successfully !");
    		model.addAttribute("is_red", "false");
    	}
    	else {
    		model.addAttribute("message_shown", "The task wasn't updated successfully - an error occurred while updating the task !");
    		model.addAttribute("is_red", "true");
    	}
    	// return "task_upd_succ"; // show the task_upd_succ.jsp
    	return "result";
    }
    
    
    @RequestMapping(value = { "/test1" }, method = RequestMethod.GET)
    public String test(Model model) {
    	return "test1";
    }
    
    @RequestMapping(value = { "/accounts1" }, method = RequestMethod.GET)
    public String accounts1(Model model) {
    	return "accounts1";
    }
    
    // if the requested URL is localhost:8080/task_list, method is GET do 
    @RequestMapping(value = { "task_list" }, method = RequestMethod.GET)
    public String task_list(Model model) {
 
        String message = "Task List";
        model.addAttribute("message", message);
        return "task_list"; // return the task_list.jsp
    }
    
    // if the requested URL is localhost:8080/task_add, method is GET do 
    @RequestMapping(value = { "task_add" }, method = RequestMethod.GET)
    public String task_add(Model model) {
 
        String message = "Task Add";
        model.addAttribute("message", message);
        return "task_add"; // return the task_add.jsp
    }
    
    // if the requested URL is localhost:8080/task_delete, method is GET do 
    @RequestMapping(value = { "task_delete" }, method = RequestMethod.GET)
    public String task_delete(Model model) {
 
        String message = "Task Delete";
        model.addAttribute("message", message);
        return "task_delete"; // return the task_delete.jsp
    }
 
    // if the requested URL is localhost:8080/contact_us, method is GET do 
    @RequestMapping(value = { "contact_us" }, method = RequestMethod.GET)
    public String contact_us(Model model) {
 
        String message = "Contact Us";
        model.addAttribute("message", message);
        return "contact_us"; // return the contact_us.jsp
    }
    
    // if the requested URL is localhost:8080/log_in, method is GET do 
    @RequestMapping(value = { "log_in" }, method = RequestMethod.GET)
    public String log_in(Model model) {
 
        String message = "Log In";
        model.addAttribute("message", message);
        return "log_in"; // return the log_in.jsp
    }
    
 // if the requested URL is localhost:8080/log_out, method is GET do 
    @RequestMapping(value = { "log_out" }, method = RequestMethod.GET)
    public String log_out(Model model) {
 
        String message = "Log Out";
        model.addAttribute("message", message);
        return "log_out"; // return the log_out.jsp
    }
}
