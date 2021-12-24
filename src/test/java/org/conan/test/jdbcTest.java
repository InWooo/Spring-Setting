package org.conan.test;

import static org.junit.Assert.fail;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.junit.Test;
import lombok.extern.log4j.Log4j;

@Log4j
public class jdbcTest {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.getMessage();
		}
	}
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scottdb?useSSl=false","scott","tiger")){log.info(con);} 
		catch (SQLException e) {
			fail(e.getMessage());		
		}
	}
}
