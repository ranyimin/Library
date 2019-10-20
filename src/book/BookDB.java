package book;

import java.sql.*;

public class BookDB {
	Connection conn = null; // 接口 建立与特定数据库的连接（会话）。
	Statement stmt = null;// Statement 对象表示基本语句，其中将单个方法应用于某一目标和一组参数，以返回结果，
	ResultSet rs = null;// 结果集
	PreparedStatement ps = null; // 预处理命令 SQL 语句被预编译并存储在 PreparedStatement 对象中。然后可以使用此对象多次高效地执行该语句。

	public BookDB() {

		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";// 加载驱动包
		String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=library";
		String user = "sa";
		String password = "123456";
		try {
			Class.forName(driver); // 加载驱动包
		} catch (ClassNotFoundException e) {
			System.out.println("未找到加载的相关驱动");// 抛出异常
		}
		try {
			conn = DriverManager.getConnection(url, user, password);//// 连接数据库
			/**
			 * DriverManager：管理一组 JDBC 驱动程序的基本服务 getConnection（） 试图建立到给定数据库 URL 的连接
			 */
		} catch (SQLException e) {
			System.out.println("连接到数据库出现错误，请仔细检查url,user，password的相关值");
			e.printStackTrace();
		}

	}

	public ResultSet bookmessage(String sql) {
		try {
			stmt = conn.createStatement();
			System.out.println(sql + "--------------------");

			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

}
