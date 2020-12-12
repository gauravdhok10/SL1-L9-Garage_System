package project;
import java.sql.*;
public class findNamebyB_id {
	public static String getName (String bid  )
	{
		PreparedStatement ps;
		ResultSet rs1;
		String uname=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching uid from uname
			ps = con.prepareStatement("select U_name from User u inner join  Bill_Main bm on u.U_id=bm.U_id where B_id=?; ");
			ps.setString(1,bid);
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


