package project;
import java.sql.*;
public class getdate{
	public static String getcurdate()
	{
		PreparedStatement ps;
		ResultSet rs1;
		String curdate=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching today date
			ps = con.prepareStatement("SELECT CURRENT_DATE;");
			rs1 = ps.executeQuery(); 
			if(rs1.next()){
				curdate = rs1.getString("CURRENT_DATE"); 
			}
			return curdate;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}


