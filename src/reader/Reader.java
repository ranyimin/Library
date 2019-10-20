package reader;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import admin.Admin;
import admin.ConnDB;

public class Reader {
	String id;
	String name;
	String pw;
	String pw1;
	String sex;
	String tel;

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Reader() {

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


	public void insertReader(Reader reader) throws SQLException {
		ReaderDB readerDB=new ReaderDB();
		String sql = "insert into reader(name,sex,pw,tel) values(?,?,?,?)";
		PreparedStatement ps = readerDB.conn.prepareStatement(sql);
		// ps.setString(1, admin.getId());
		ps.setString(1, reader.getName());
		ps.setString(2, reader.getSex());
		ps.setString(3, reader.getPw());
		ps.setString(4, reader.getTel());
		ps.executeUpdate();
		
		ps.close();

	}

	@Override
	public String toString() {
		return "Reader [id=" + id + ", name=" + name + ", pw=" + pw + ", pw1=" + pw1 + ", sex=" + sex + ", tel=" + tel
				+ "]";
	}

	
}
