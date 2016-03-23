package model.dao;
import java.sql.Connection;
import java.sql.DriverManager;
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
	public static void main(String[] args) {
		ConnectionDAO test= new ConnectionDAO();
		Connection conn=test.openConnection();
		test.closeConnection();
	}
}
