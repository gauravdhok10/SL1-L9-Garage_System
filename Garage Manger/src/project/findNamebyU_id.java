package project;
import java.sql.*;
public class findNamebyU_id {
	public static String getName (String uid  )
	{
		PreparedStatement ps;
		ResultSet rs1;
		String uname=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching uid from uname
			ps = con.prepareStatement("select U_name from User where U_id=?; ");
			ps.setString(1,uid);
			rs1 = ps.executeQuery(); 
			if(rs1.next()){
				uname = rs1.getString("U_name"); 
			}
			return uname;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}


