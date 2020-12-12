package project;
import java.sql.*;
public class findNamebyV_id {
	public static String getName (String bid  )
	{
		PreparedStatement ps;
		ResultSet rs1;
		String uname=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching uid from uname
			ps = con.prepareStatement("select U_name from User u inner join  Vehical v on u.U_id=v.U_id where V_id=?; ");
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


