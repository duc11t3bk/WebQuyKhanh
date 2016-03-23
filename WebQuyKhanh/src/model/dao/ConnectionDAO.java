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
	public void getData(){
		try {
			st=conn.createStatement();
			String sql="select * from document";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				System.out.println(""+rs.getString(1)+":"
									 +rs.getString(2)+":"
									 +rs.getString(3)+":"
									 +rs.getString(4)
									  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		ConnectionDAO test= new ConnectionDAO();
		Connection conn=test.openConnection();
		test.getData();
		test.closeConnection();
	}
}
