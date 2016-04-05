package model.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class ConnectionDAO {
	
	private Connection conn;
	private Statement st;
	private String hostName="localhost";
	private String dbName="webquykhanh";
	private String userName="root";
	private String password="nguyetnguyen2611";
	
	
	public Connection openConnection(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL="jdbc:mysql://"+hostName+":3306/"+dbName+"?useUnicode=true&characterEncoding=UTF-8";
			conn= DriverManager.getConnection(connectionURL,userName,password);
			System.out.println("Kết nối thành công");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void closeConnection(){
		try {
			conn.close();
			System.out.println("Đóng kết nối thành công");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public static String increateID(String tableName, String colName, Connection conn){
		try {			
			String sql="select "+colName+" from "+tableName+" order by "+colName+" desc "+" limit 1";
			Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//			System.out.println(""+sql);
			ResultSet rs=stmt.executeQuery(sql);		
			if(!rs.next()){
				String code=tableName.substring(0,3);
				String newID=code+String.format("%08d",1);
				return newID;
			}
			else{
				rs.beforeFirst();
				String maxID="";
				while(rs.next()){
					maxID=rs.getString(1);
				}
				String code=maxID.substring(0,3);
				String data=maxID.substring(3,maxID.length());
				String newID=code+String.format("%08d",Integer.valueOf(data)+1);
				System.out.println("new ID=="+newID);
				return newID;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		ConnectionDAO test= new ConnectionDAO();
		Connection conn=test.openConnection();
		System.out.println("ID="+ConnectionDAO.increateID("post", "post_id", conn));
		test.closeConnection();
	}
	
}
