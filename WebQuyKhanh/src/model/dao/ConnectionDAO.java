package model.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			String sql="select top 1 ? from ? order by ? desc";
			PreparedStatement getMAXID=conn.prepareStatement(sql);
			getMAXID.setString(1,colName);
			getMAXID.setString(2,tableName);
			getMAXID.setString(3, colName);
			System.out.println(""+sql);
			ResultSet rs=getMAXID.executeQuery();
			String maxID="";
			while(rs.next()){
				maxID=rs.getString(1);
			}
			String code=maxID.substring(0, 2);
			String data=maxID.substring(2,maxID.length());
			String newID=code+String.format("%08d",Integer.valueOf(data)+1);
			System.out.println("new ID=="+newID);
			return newID;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		ConnectionDAO test= new ConnectionDAO();
		Connection conn=test.openConnection();
		test.closeConnection();
	}
	
}
