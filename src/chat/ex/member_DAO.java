package chat.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class member_DAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "jongmin";
	private String upw = "tnthd2351";

	public member_DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<member_DTO> memberSelect() {

		ArrayList<member_DTO> dtos = new ArrayList<member_DTO>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from chat");

			while (rs.next()) {
				member_DTO dto = new member_DTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setNick(rs.getString("nick"));
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	public int memberInsert(member_DTO dto) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			result = stmt.executeUpdate("insert into chat values('" + dto.getId() + "','" + dto.getPw() + "','" + dto.getPhone1() + "','"
					+ dto.getPhone2() + "','" + dto.getPhone3() + "','" + dto.getNick() + "')");
			if (result == 1) {
				System.out.println("Insert Complete");
				con.commit();
			} else {
				System.out.println("Insert fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;

	}
}