package reader;

import java.sql.*;

public class ReaderDB {
	Connection conn = null; // 接口 建立与特定数据库的连接（会话）。
	Statement stmt = null;// Statement 对象表示基本语句，其中将单个方法应用于某一目标和一组参数，以返回结果，
	ResultSet rs = null;// 结果集
	PreparedStatement ps = null; // 预处理命令 SQL 语句被预编译并存储在 PreparedStatement 对象中。然后可以使用此对象多次高效地执行该语句。

	public ReaderDB() {
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

	public boolean isUser(String id) {// 检测用户是否存在
		int count = 0; // 计数
		String sql = "select count(*) from reader where id=?";
		try {
			ps = conn.prepareStatement(sql);// 建立与数据库的连接
			ps.setString(1, id);
			rs = ps.executeQuery();// 执行查询命令

			if (rs.next()) {// 遍历结果集
				count = rs.getInt(1);// 以 Java 编程语言中 int 的形式获取此 ResultSet 对象的当前行中指定列的值。

			}
			System.out.println(count + "-------------");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}

	}

	public boolean isUsername(String name) {// 检测用户是否存在
		int count = 0; // 计数
		String sql = "select count(*) from reader where name=?";
		try {
			ps = conn.prepareStatement(sql);// 建立与数据库的连接
			ps.setString(1, name);
			rs = ps.executeQuery();// 执行查询命令

			if (rs.next()) {// 遍历结果集
				count = rs.getInt(1);// 以 Java 编程语言中 int 的形式获取此 ResultSet 对象的当前行中指定列的值。

			}
			System.out.println(count + "-------------");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}

	}

	public ResultSet find(String sql) {

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(sql + "--------------");
//			while (rs.next()) {
//				rs.getString("id");
//				rs.getString("name");
//				rs.getString("pw");
//			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public void altermypw(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}

	public ResultSet selectbook(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();

			}
			if (conn != null) {
				conn.close();

			}
			if (stmt != null) {
				stmt.close();

			}
			if (ps != null) {
				ps.close();

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public int del(String sql) {
		int count = 0;
		try {
			count++;
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;

	}


}
