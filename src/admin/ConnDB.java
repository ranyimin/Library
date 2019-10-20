package admin;

import java.*;

import java.sql.*;

public class ConnDB {
	ResultSet rs = null;
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement ps = null;

	public ConnDB() {
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

	/**
	 * 用于执行数据库查询操作
	 * 
	 * @param sql
	 * @return
	 */
	public boolean isadmin(String id) {// 检测管理员是否存在
		int count = 0; // 计数
		String sql = "select count(*) from admin where id=?";
		try {
			count++;
			ps = conn.prepareStatement(sql);// 建立与数据库的连接
			ps.setString(1, id);

			rs = ps.executeQuery();// 执行查询命令
			while (rs.next()) {
				count = rs.getInt(1);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}

	}

	public ResultSet myExcuteQuery(String sql) {

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			System.out.println("sql=" + sql);

		} catch (Exception e) {
			System.out.println("-----------");
			System.out.println("数据查询出错");
			System.out.println("-----------");
			e.printStackTrace();

		}
		return rs;

	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			System.out.println("数据库关闭报错");

		}
	}

	public ResultSet myExcuteQuary(String sql) {
		try {
			// System.out.println(sql);
			stmt = conn.createStatement();
			System.out.println("sql=*********************" + sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				rs.getString("State");
			}

		} catch (SQLException e) {
			System.out.println("-----------");
			System.out.println("数据查询出错");
			System.out.println("-----------");
			e.printStackTrace();
		}

		return rs;
	}

	public int addadmin(String sql) {
		int count = 0;
		try {
			count++;
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(count + "---------------");
		return count;

	}
	public int alter(String sql) {//修改用户信息
		int count=0;
		try {
			count++;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return count;

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
}
