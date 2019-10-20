package admin;
import java.*;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conndb111 {
	private ResultSet rs=null;
	private java.sql.Connection conn=null;
	private  java.sql.Statement stmt=null;
	public Conndb111(){
		String user="sa";
		String databaseName="tsgdb";
		String url="jdbc:sqlserver://localhost:1433;"+databaseName;
		String password="";
		//System.out.println(url);
		String driverClas="com.microsoft.sqlserver.jdbc.SQLServerDriver";
				try {
					Class.forName(driverClas);
					conn=DriverManager.getConnection(url, user, password);
					conn.setAutoCommit(true);
					
				} catch (Exception e) {
					System.out.println("-----------");
					System.out.println("数据库连接错误");
					System.out.println("-----------");
					e.printStackTrace();
					
				}
		}
	/**
	 * 用于执行数据库查询操作
	 * @param sql
	 * @return 
	 */
	public ResultSet myExcuteQuary(String sql){
		try {
			//System.out.println(sql);
			stmt=conn.createStatement();
			System.out.println("sql=+sql");
			rs= stmt.executeQuery(sql);
			while(rs.next()){rs.getString("State");}
			
		} catch (SQLException e) {
			System.out.println("-----------");
			System.out.println("数据查询出错");
			System.out.println("-----------");
			e.printStackTrace();
			
		
		}
		
		return rs;
	}
	public int myExcuteUpdate(String sql){
		//System.out.println(sql);
		try {
			stmt=conn.createStatement();
			System.out.println("sql=+sql");
			
		} catch (Exception e) {
			System.out.println("-----------");
			System.out.println("数据查询出错");
			System.out.println("-----------");
			//e.printStackTrace();
			
			
		}
		return 0;
	}
	public void close(){
		try {
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(conn!=null){
				conn.close();
			}
			
		} catch (Exception e) {
			System.out.println("数据库关闭报错");
		
		}
	}
	
	
}
