package project;
import java.sql.*;
public class findcostbybid {
	public static String getcost (String bid  )
	{
		PreparedStatement ps;
		ResultSet rs1;
		String cost=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching cost
			ps = con.prepareStatement("select Cost from Bill_Main where B_id=?; ");
			ps.setString(1,bid);
			rs1 = ps.executeQuery(); 
			if(rs1.next()){
				cost = rs1.getString("Cost"); 
			}
			return cost;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}
