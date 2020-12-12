package project;
import java.sql.*;

public class ConnectionProvider {
	public static Connection getCon()
	{
		try {
            //loading drivers for mysql
            Class.forName("com.mysql.cj.jdbc.Driver");

            //creating connection with the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","test","star");
            return con;

        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}
