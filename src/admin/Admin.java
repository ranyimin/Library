package admin;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Admin {
	String id;
	String name;
	String pw;
	String pw1;
	String sex;
	public Admin() {
		super();
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw1() {
		return pw1;
	}
	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public void insertAdmin(Admin admin) throws SQLException
	
	{
		ConnDB connDB=new ConnDB();
		String sql="insert into admin(name,sex,pw) values(?,?,?)";
		PreparedStatement  ps=connDB.conn.prepareStatement(sql);
		//ps.setString(1, admin.getId());
		ps.setString(1, admin.getName());
		ps.setString(2, admin.getSex());
		ps.setString(3, admin.getPw());
		ps.executeUpdate();
		connDB.close();
		ps.close();
		
		
	}	
	@Override
	public String toString() {
		return "admin [id=" + id + ", name=" + name + ", pw=" + pw + ", pw1=" + pw1 + ", sex=" + sex + "]";
	}
	
}
