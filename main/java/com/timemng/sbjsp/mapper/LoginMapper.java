// project : Time Schedule, author : Ingrid Farkas, 2019 
package com.timemng.sbjsp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

//import com.timemng.sbjsp.model.EmpSchedTaskInfo;
import com.timemng.sbjsp.model.LoginInfo;
import org.springframework.jdbc.core.RowMapper;

// LoginMapper - a mapper class (used for mapping corresponding to 1-1 between 1 column in the result of the query statement and 1 field in 
// the model class LoginInfo.java )
public class LoginMapper implements RowMapper<LoginInfo> {
	
	// ADD WHERE user_name equals to the entered value
	// SQL_LOGIN is a SQL query used to select the user name and the password
	public static String SQL_LOGIN // 
	= "select user_name, password from login ";  

	@Override
	public LoginInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
		// mapping 1 column in the result of the query statement and 1 field in the model class EmpSchedTaskInfo.java 
		//Long taskId = rs.getLong("task_id");
		String userName = rs.getString("user_name");
		String userPassw = rs.getString("password");
			        
		// create and return an object of the class LoginInfo ( which is the model )
		return new LoginInfo( userName, userPassw );
	}
	
	// resetSQL_LOGIN sets the string SQL_LOGIN to its original value
	public static void resetSQL_LOGIN() {
		SQL_LOGIN = "select user_name, password from login ";
	}
		
	// updating the query string to the new query string formed in the class LoginDAO, method addToQueryStr
	public static void updateSQL(String sql) {
		SQL_LOGIN = sql; // sql - new query string
	}

}
