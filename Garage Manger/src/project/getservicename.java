package project;

import java.sql.*;

public class getservicename {
	public static String getsname (String sid  )
	{
		PreparedStatement ps;
		ResultSet rs1;
		String sname=null;
		try {
            //loading drivers for mysql
			Connection con = ConnectionProvider.getCon();
			//-------------------featching uid from uname
			ps = con.prepareStatement("select S_name from Service where S_id=?; ");
			ps.setString(1,sid);
			rs1 = ps.executeQuery(); 
			if(rs1.next()){
				sname = rs1.getString("S_name"); 
			}
			return sname;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}
